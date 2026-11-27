## Çiftçi Ekin ve Bereket Adası (web v343ciftlik + eski tarla kodu: plots, farmPrompt, farmAct, tickFarm, drawField; belge ACT 1 › Çiftçi Ekin).
## Ekin'in durumu: cayir (Çayır'da, EK1) → gone (EK1 bitip vedalaşınca) → atB (Barbaros'un L4'ü teslim edilmişse yanına gidince sahne) → home (adasında).
## Ada haritada hazırdır (web onu açılışta denize oyar; Godot'un haritası o halinden alındı); yalnızca Barbaros'un kayığıyla gidilir.
## Adada canavar yaşamaz, mor ışık inmez. Tarla: tırmıkla hazırla → tohum ek → sulama kabıyla sula → olgunlaşınca tırpanla biç (aletler elde).
extends Node2D

var oyun
var kapali := false       # ikinci adada bu adanın şeyleri yoktur (web v76); durumu kayıtta olduğu gibi kalır
var ham = null
var env
var D: Dictionary
const RX := 20
const RY := 14
var cx := 0
var cy := 0
var st := "cayir"
var got := {}
var sap: Array = [null, null, null, null, null, null]
var vis := false
var plots: Array = []         # {st: soil|raked|planted, crop, t, wet}
var tavuk: Array = []
var is_ := {}                 # süren tarla işi: {f, ad, sure, t, tool}
var sahne := false
var gecis := false
var fade: ColorRect
var fade_yazi: Label
var tarla: Node2D
var dugumler := {}            # yer adı → Node2D
var ev_sprite: Sprite2D
var ekin_n = null
var dz_n = null
var temiz_t := 0.0
const SATIR := ["Toprağa iyi bakarsan o da sana bakar.", "Kirpi yine geldi; elmasını yedi, korkuluğa selam verdi.", "Tavuklar bugün üç yumurta verdi! Birini sana saklarım.", "Barbaros her uğradığında ekmek kokusu sorar."]

func kur(o) -> void:
	oyun = o
	env = o.env
	D = o._json("res://data/ciftlik.json")
	cx = int(D.ada.cx); cy = int(D.ada.cy)
	for k in 24: plots.append({st = "soil", crop = "", t = 0.0, wet = false})
	if o.ada == 2:
		kapali = true
		set_process(false)
		for n in D.resim:
			if not env.ikon.has(n): env.ikon[n] = load(D.resim[n])
		for n in D.aletler:
			if not env.G.tools.has(n): env.G.tools[n] = D.aletler[n]
		return
	# yeni eşyaların resimleri, tarla aletleri
	for n in D.resim:
		if not env.ikon.has(n): env.ikon[n] = load(D.resim[n])
	for n in D.aletler:
		if not env.G.tools.has(n): env.G.tools[n] = D.aletler[n]
	for n in oyun.kisiler:
		if n.K.k == "k_ekin": ekin_n = n
		if n.K.k == "denizci": dz_n = n
	tarla = Node2D.new()
	tarla.z_index = -5
	tarla.draw.connect(_tarla_ciz)
	oyun.add_child(tarla)
	ev_sprite = Sprite2D.new()
	ev_sprite.texture = load("res://art/yapilar/yapi_kerpic_ev.png")
	ev_sprite.centered = false
	var evn := _yer("ev", ev() + Vector2(0, 40), func(n): pass)
	ev_sprite.position = Vector2(-8, -48)
	ev_sprite.scale = Vector2(48.0 / 48.0, 48.0 / 48.0)
	evn.add_child(ev_sprite)
	_yer("ambar", ambar() + Vector2(0, 18), _ambar_ciz)
	_yer("kuyu", kuyu() + Vector2(0, 2), _kuyu_ciz)
	_yer("iskele", iskele() + Vector2(0, -8), _iskele_ciz)
	_yer("korkuluk", P(8, -7), _korkuluk_ciz)
	_yer("kayik", kayik(), _kayik_ciz)
	for i in 6: _yer("fidan%d" % i, fidan_yeri(i), _fidan_ciz.bind(i))
	for i in 3:
		var h := {p = ambar() + Vector2(12 + i * 6, 30), a = i * 2.1}
		tavuk.append(h)
		h.n = _yer("tavuk%d" % i, h.p, _tavuk_ciz.bind(h))
	var kat := CanvasLayer.new()
	kat.layer = 5
	oyun.add_child(kat)
	fade = ColorRect.new()
	fade.color = Color("#0a0e12")
	fade.set_anchors_preset(Control.PRESET_FULL_RECT)
	fade.modulate.a = 0.0
	fade.mouse_filter = Control.MOUSE_FILTER_IGNORE
	kat.add_child(fade)
	fade_yazi = Label.new()
	fade_yazi.set_anchors_preset(Control.PRESET_FULL_RECT)
	fade_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	fade_yazi.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fade_yazi.add_theme_font_size_override("font_size", 18)
	fade_yazi.add_theme_color_override("font_color", Color("#e8f0d8"))
	fade.add_child(fade_yazi)

func _yer(ad: String, p: Vector2, ciz: Callable) -> Node2D:
	var n := Node2D.new()
	n.position = p
	n.draw.connect(func(): ciz.call(n))
	oyun.nesneler.add_child(n)
	dugumler[ad] = n
	return n

# ------------------------------------------------------------------ yerler
func P(dx: float, dy: float) -> Vector2:
	return Vector2((cx + dx) * 16 + 8, (cy + dy) * 16 + 8)
func ev() -> Vector2: return P(-12, -9)
func ambar() -> Vector2: return P(-5, -8)
func kuyu() -> Vector2: return P(-4, -2)
func iskele() -> Vector2: return P(0, RY)
func varis() -> Vector2: return P(0, RY - 3)
func ekin_ev() -> Vector2: return P(-9, -4)
func fidan_yeri(i: int) -> Vector2: return P(-15 + i * 3, 4)
func kayik() -> Vector2:
	return dz_n.position + Vector2(-30, 18) if dz_n != null else Vector2(-1e5, -1e5)
func tarh(k: int) -> Vector2:
	return Vector2((cx + 2 + k % 4) * 16 + 8, (cy - 6 + k / 4) * 16 + 8)
func tarh_acik(k: int) -> bool:
	return k / 4 < 3 or oyun.gorev.bitti("EK6")

func adada(p: Vector2) -> bool:
	if kapali: return false
	var dx := (p.x / 16.0 - cx) / (RX + 2)
	var dy := (p.y / 16.0 - cy) / (RY + 2)
	return dx * dx + dy * dy <= 1.0

## ev, ambar ve kuyu geçilmez (web blocked)
func engel(p: Vector2, h: float) -> bool:
	if kapali: return false
	if not adada(p): return false
	var E := ev(); var A := ambar(); var K := kuyu()
	if p.x > E.x - 8 - h and p.x < E.x + 40 + h and p.y > E.y - 6 and p.y < E.y + 40 + h - 4: return true
	if p.x > A.x - 8 - h and p.x < A.x + 24 + h and p.y > A.y - 2 and p.y < A.y + 18 + h - 4: return true
	if absf(K.x - p.x) < h + 6 and absf(K.y - p.y) < h + 4: return true
	return false

func _simdi() -> float:   # web nowM: günler boyunca akan dakika
	var z = oyun.zaman
	return float(z.gun) * 1440.0 + z.dk + (1440.0 if z.dk < 360.0 else 0.0)

# ------------------------------------------------------------------ Ekin
func ekin_gorunur() -> bool:
	return st == "cayir" or st == "atB" or st == "home"

func ekin_konus(n) -> void:
	var ku = oyun.kuzen
	if not ku.tanis.has("k_ekin"):
		ku.tanis["k_ekin"] = true
		_soyle(n, "Merhaba! Ben [b]Ekin[/b]. Buralı değilim; bir fırtınada salımla bu adaya düştüm. Şimdilik şu köşeyi ekip biçiyorum, toprağı güzel.", [{t = "Merhaba Ekin", pri = true, kapat = true}])
		return
	if st == "cayir" and oyun.gorev.bitti("EK1"):
		_soyle(n, "Ben… adama dönmeliyim. Annem bekler, tarlam kurur. Bir sal yaparım, olmazsa yüzerim! Hoşça kal, iyi ki tanıştık.", [{t = "Kendine iyi bak", pri = true, f = func():
			st = "gone"
			env.mesaj("Ekin Çayır'dan ayrıldı.")}])
		return
	if st == "home":
		_soyle(n, SATIR[randi() % SATIR.size()], [{t = "Tohum ve fidan", f = _dukkan}, {t = "Hoşça kal", pri = true, kapat = true}])
		return
	_soyle(n, "Korkuluğum yine yerinde değil… Rüzgâr mı, cin mi?", [{t = "Hoşça kal", pri = true, kapat = true}])

func _soyle(n, metin: String, secs: Array) -> void:
	oyun.konusma.ac(n.K.ad, load(n.K.portre) if n.K.get("portre", null) != null else null, metin, secs)

## "Tohum ve fidan": 4'lü tohum paketleri; EK4'ten sonra fidanlar
func _dukkan() -> void:
	var L := []
	for n in D.tohum: L.append(_al_secenek(n, 4, int(D.tohum[n]) * 4))
	if oyun.gorev.bitti("EK4"):
		for n in D.fidan: L.append(_al_secenek(n, 1, int(D.fidan[n][1])))
	L.append({t = "Tamam", pri = true, kapat = true})
	_soyle(ekin_n, "Tohumlarım temiz, fidanlarım sağlam. Ne istersin?", L)

func _al_secenek(n: String, q: int, pr: int) -> Dictionary:
	return {t = "%s ×%d · %d Vio" % [n, q, pr], f = func():
		if env.vio < pr:
			env.mesaj("%d Vio eksik" % (pr - env.vio), true)
		else:
			env.vio_ekle(-pr)
			env.ekle(n, q)
			env.mesaj("%d %s aldın." % [q, n])
		_dukkan.call_deferred()}

## Barbaros'un 4. görevi teslim edilince (EK1 de bitmişse) Ekin enkazın yanında belirir; Barbaros onu adasına götürür
func _sahne() -> void:
	sahne = true
	st = "atB"
	var L := [[dz_n, "Evlat, bak kimi buldum! Kıyıya bir sal vurmuş, salın üstünde bu inatçı kız."],
		[ekin_n, "Akıntı beni buraya attı! Adamı bulamadım… Haftalardır denizdeyim sandım, meğer üç gün olmuş."],
		[dz_n, "Kızım Meltem kadar inatçı… Gemi daha bitmedi ama kayığım yüzer. Seni adana bırakırım, kızım."],
		[ekin_n, "Gerçekten mi? Bereket Adası'na? Annemin bahçesine?"],
		[dz_n, "Ne zaman istersen yanıma gel; kayıkla seni de götürürüm, evlat. Ekin'in tarlası bizim de ambarımız olur."]]
	_sahne_satir(L, 0)

func _sahne_satir(L: Array, i: int) -> void:
	if i >= L.size():
		st = "home"
		sahne = false
		oyun.env.mesaj("Bereket Adası: Barbaros'un kayığıyla gidebilirsin")
		return
	_soyle(L[i][0], L[i][1], [{t = "Tamam" if i == L.size() - 1 else "Devam", pri = true, f = _sahne_satir.bind(L, i + 1)}])

## kayıkla geçiş: kısa bir karartma, sonra öbür kıyı
func _git(to: Vector2, yazi: String) -> void:
	if gecis: return
	gecis = true
	fade_yazi.text = yazi
	fade.mouse_filter = Control.MOUSE_FILTER_STOP
	var tw := create_tween()
	tw.tween_property(fade, "modulate:a", 1.0, 0.45)
	tw.tween_callback(func():
		oyun.oyuncu.position = to
		oyun.oyuncu.bak(Vector2(0, -1))
		if oyun.evcil != null and oyun.evcil.has_method("yanina"): oyun.evcil.yanina()
		if to == varis(): vis = true)
	tw.tween_interval(0.35)
	tw.tween_property(fade, "modulate:a", 0.0, 0.45)
	tw.tween_callback(func():
		fade.mouse_filter = Control.MOUSE_FILTER_IGNORE
		gecis = false)

# ------------------------------------------------------------------ F
func etkiles() -> bool:
	if kapali: return false
	var P0: Vector2 = oyun.oyuncu.position
	if st == "home" and P0.distance_to(kayik()) < 26.0:
		_git(varis(), "Barbaros kürek çekiyor… Bereket Adası")
		return true
	if not adada(P0): return false
	if P0.distance_to(iskele() + Vector2(0, -10)) < 30.0:
		var b := kayik()
		_git(Vector2(b.x + 10, b.y - 30), "Barbaros kürek çekiyor… Mor Kristal kıyısı")
		return true
	if P0.distance_to(kuyu() + Vector2(0, 8)) < 22.0:
		env.ekle("Su")
		oyun.yazi(kuyu() + Vector2(0, -14), "+1 Su", Color("#9fd8ff"), 8)
		return true
	for i in 6:
		if sap[i] == null and P0.distance_to(fidan_yeri(i)) < 20.0:
			for n in D.fidan:
				if env.adet(n) > 0:
					env.eksilt(n)
					sap[i] = {k = str(D.fidan[n][0]), t = _simdi(), g = false}
					env.mesaj("%s dikildi; üç günde ağaç olur." % n)
					return true
	var f = _tarh_yakin()
	if f >= 0:
		_tarla_is(f)
		return true
	return false

func _tarh_yakin() -> int:
	var P0: Vector2 = oyun.oyuncu.position
	var en := -1
	var bd := 16.0
	for k in 24:
		if not tarh_acik(k): continue
		var d := tarh(k).distance_to(P0)
		if d < bd:
			bd = d
			en = k
	return en

func _tohum() -> String:
	for c in D.crop:
		var s: String = D.crop[c].seed
		if env.adet(s) > 0: return s
	return ""

func _ipucu(kind: String, ad: String, yok: String) -> String:
	for n in env.inv:
		if env.adet(n) > 0 and env.G.tools.has(n) and env.G.tools[n].kind == kind:
			return "%s eline al (1–5 ile seç)" % n
	return yok

## web farmPrompt: ne yapılabilir ya da neden yapılamaz
func _tarla_ne(k: int) -> Array:
	var f: Dictionary = plots[k]
	var tur: String = env.elde_tur()
	if f.st == "soil":
		return ["rake", "Toprak hazırlanıyor", 1.4] if tur == "rake" else [null, _ipucu("rake", "Tırmık", "Toprağı hazırlamak için tırmık gerekli")]
	if f.st == "raked":
		var s := _tohum()
		return ["", "Ekiliyor", 0.6] if s != "" else [null, "Tohum gerekli · Ekin satar"]
	var c: Dictionary = D.crop[f.crop]
	if not f.wet:
		return ["can", "Sulanıyor", 1.0] if tur == "can" else [null, _ipucu("can", "Sulama kabı", "Sulamak için sulama kabı gerekli")]
	if f.t < float(c.grow):
		return [null, "%s büyüyor · %%%d" % [f.crop, int(f.t / float(c.grow) * 100.0)]]
	return ["scythe", "Biçiliyor", 1.0] if tur == "scythe" else [null, _ipucu("scythe", "Tırpan", "%s hazır · biçmek için tırpan gerekli" % f.crop)]

func _tarla_is(k: int) -> void:
	var w := _tarla_ne(k)
	if w[0] == null:
		env.mesaj(str(w[1]), true)
		return
	var tool: String = env.elde() if str(w[0]) != "" else ""
	if tool != "" and int(env.dayan.get(tool, env.G.tools[tool].dur)) <= 0:
		env.mesaj("%s köreldi!" % tool, true)
		return
	is_ = {f = k, ad = str(w[1]), sure = float(w[2]), t = 0.0, tool = tool}

func _tarla_bitir() -> void:
	var g := is_
	is_ = {}
	env.ilerleme_goster("", -1.0)
	if g.tool != "" and not env.alet_kullan(g.tool): return
	var f: Dictionary = plots[g.f]
	var p := tarh(g.f)
	if f.st == "soil":
		f.st = "raked"
	elif f.st == "raked":
		var s := _tohum()
		if s == "": return
		env.eksilt(s)
		for c in D.crop:
			if D.crop[c].seed == s: f.crop = c
		f.st = "planted"; f.t = 0.0; f.wet = false
	elif not f.wet:
		f.wet = true
	else:
		var c: Dictionary = D.crop[f.crop]
		var n := randi_range(int(c.y[0]), int(c.y[1]))
		env.ekle(f.crop, n)
		oyun.yazi(p + Vector2(0, -12), "+%d %s" % [n, f.crop], Color("#f2b84b"), 8)
		if randf() < 0.45:
			env.ekle(str(c.seed))
			env.mesaj("Hasattan 1 %s çıktı" % c.seed)
		env.xp_ekle(3)
		f.st = "soil"; f.crop = ""; f.t = 0.0; f.wet = false
		return
	env.xp_ekle(1)

# ------------------------------------------------------------------ her an
func _process(dt: float) -> void:
	if oyun.basta: return
	var o = oyun.oyuncu
	# Ekin nerede
	if ekin_n != null:
		if st == "atB" and dz_n != null: ekin_n.position = dz_n.position + Vector2(26, 6)
		elif st == "home": ekin_n.position = ekin_ev()
	if st == "gone" and not sahne and oyun.gorev.bitti("L4") and oyun.gorev.bitti("EK1") and dz_n != null and dz_n.visible \
			and not oyun.konusma.visible and o.position.distance_to(dz_n.position) < 110.0:
		_sahne()
	# Ekin'in ödülleri (web G: görev bitince bir kez)
	for id in ["EK2", "EK3", "EK4", "EK6"]:
		if oyun.gorev.bitti(id) and not got.has(id):
			got[id] = true
			match id:
				"EK2": env.ekle("Buğday tohumu", 6)
				"EK3": env.ekle("Havuç tohumu", 4); env.ekle("Patates tohumu", 4); env.ekle("Kabak tohumu", 2)
				"EK4": env.ekle("Elma fidanı")
				"EK6": env.mesaj("Tarla genişledi: 12 yeni tarh.")
	var dur: bool = oyun.zaman.durdu()
	if not dur:
		for k in 24:
			var f: Dictionary = plots[k]
			if f.st != "planted":
				f.erase("gub"); f.erase("gt")
			elif f.wet and not f.has("gt") and tarh(k).distance_to(o.position) < 70.0:
				f.gt = 1
				if env.adet("Gübre") > 0:
					env.eksilt("Gübre")
					f.gub = 1
					oyun.yazi(tarh(k) + Vector2(0, -12), "Gübrelendi", Color("#c8a060"), 8)
			if f.st == "planted" and f.wet and f.t < float(D.crop[f.crop].grow):
				f.t += dt * (1.5 if f.has("gub") else 1.0)   # Gübre: %50 hızlı büyür
				if f.t >= float(D.crop[f.crop].grow) and tarh(k).distance_to(o.position) < 200.0:
					oyun.yazi(tarh(k) + Vector2(0, -12), "Hazır!", Color("#8fd46b"), 8)
		var sm := _simdi()
		for i in 6:
			var s = sap[i]
			if s != null and not s.g and sm - float(s.t) >= 3.0 * 1440.0:
				s.g = true
				_agac(i)
				if adada(o.position): env.mesaj("%s fidanı ağaç oldu!" % s.k)
	# süren tarla işi
	if not is_.is_empty():
		if o.yuruyor:
			is_ = {}
			env.ilerleme_goster("", -1.0)
		else:
			is_.t += dt
			env.ilerleme_goster(is_.ad, is_.t / is_.sure)
			if is_.t >= is_.sure: _tarla_bitir()
	# adada canavar yaşamaz
	temiz_t -= dt
	if temiz_t <= 0.0:
		temiz_t = 0.5
		for c in oyun.canlilari_ver():
			if adada(c.position) and not c.boss: c.queue_free()
	# tavuklar
	for h in tavuk:
		h.a += 0.01 * (sin(oyun.balik.saat * 0.7 + h.p.x) + 0.3)
		var np: Vector2 = h.p + Vector2(cos(h.a) * 0.25, sin(h.a) * 0.18)
		if adada(np) and not oyun.engel(np, 3.0): h.p = np
		else: h.a += 1.3
		h.n.position = h.p
	var yakin: bool = o.position.distance_to(P(0, 0)) < 900.0
	for k in dugumler:
		var n: Node2D = dugumler[k]
		if k == "kayik": n.position = kayik(); n.visible = st == "home"
		elif k == "korkuluk": n.visible = oyun.gorev.bitti("EK4")
		if yakin or k == "kayik": n.queue_redraw()
	if yakin: tarla.queue_redraw()

func fidan_buyudu() -> int:
	var c := 0
	for s in sap:
		if s != null and s.g: c += 1
	return c

func _agac(i: int) -> void:
	var s = sap[i]
	var p := fidan_yeri(i)
	for ag in oyun.agaclar:
		if ag.position == p: return
	var key := "%s_0" % s.k
	var resim: Dictionary = oyun.dunya.agacResimleri
	if not resim.has(key): return
	var R: Dictionary = resim[key]
	var n := preload("res://scripts/agac.gd").new()
	n.position = p
	n.kur(load(R.file), int(R.bot), 9000 + i)
	n.oyun = oyun
	n.tur = s.k
	oyun.nesneler.add_child(n)
	oyun.agaclar.append(n)
	var k := Vector2i(int(floor(p.x / 32.0)), int(floor(p.y / 32.0)))
	if not oyun.agac_izgara.has(k): oyun.agac_izgara[k] = []
	oyun.agac_izgara[k].append(p)

# ------------------------------------------------------------------ çizim (web drawField, barnSprite, drawWell, drawDock, drawSap, drawHen)
func _r(n: CanvasItem, x: float, y: float, w: float, h: float, c) -> void:
	n.draw_rect(Rect2(x, y, w, h), Color(c))

func _tarla_ciz() -> void:
	if tarla.position != Vector2.ZERO: tarla.position = Vector2.ZERO
	var tm: float = oyun.balik.saat
	for k in 24:
		if not tarh_acik(k): continue
		var f: Dictionary = plots[k]
		var q := tarh(k)
		var x := q.x; var y := q.y
		_r(tarla, x - 8, y - 8, 16, 16, "#7a5a38" if f.st == "soil" else ("#4a3220" if f.wet else "#6a4a2a"))
		if f.st != "soil":
			for r in range(-6, 8, 4): _r(tarla, x - 7, y + r, 14, 1, "#3a2618" if f.wet else "#5a3d22")
		if f.st == "raked":
			for r in range(-5, 8, 4): _r(tarla, x - 6, y + r, 12, 1, "#8a6a48")
		if f.st == "soil":
			_r(tarla, x - 6, y - 5, 2, 1, "#5d8a3a"); _r(tarla, x + 3, y + 2, 2, 1, "#5d8a3a")
		if f.st == "planted":
			var c: Dictionary = D.crop[f.crop]
			var kk: float = minf(1.0, f.t / float(c.grow))
			if kk < 0.34:
				_r(tarla, x - 1, y + 1, 2, 3, "#5aa040")
			elif kk < 1.0:
				_r(tarla, x - 1, y - 2, 2, 6, "#4c8d3c"); _r(tarla, x - 4, y - 1, 3, 2, "#62a64c"); _r(tarla, x + 1, y - 3, 3, 2, "#62a64c")
			else:
				var sw: float = round(sin(tm * 2.0 + x) * 1.0)
				_r(tarla, x - 1, y - 4, 2, 8, "#3a722f")
				if f.crop == "Buğday":
					for dx in [-4, 0, 3]: _r(tarla, x + dx + sw, y - 7, 2, 5, c.c)
				elif f.crop == "Ayçiçeği":
					_r(tarla, x - 1, y - 9, 2, 6, "#3a722f"); _r(tarla, x - 3 + sw, y - 12, 6, 5, c.c); _r(tarla, x - 1 + sw, y - 11, 2, 3, "#6a3a1a")
				elif f.crop == "Kabak":
					_r(tarla, x - 5, y, 10, 6, c.c); _r(tarla, x - 5, y, 10, 1, "#f2b84b"); _r(tarla, x - 1, y - 2, 2, 2, "#3a722f")
				else:
					_r(tarla, x - 4, y - 5, 3, 3, "#62a64c"); _r(tarla, x + 1, y - 6, 3, 3, "#62a64c"); _r(tarla, x - 2, y + 2, 4, 3, c.c)
				if int(floor(tm * 2.0)) % 2: _r(tarla, x + 5, y - 8, 1, 1, "#ffffff")
			if not f.wet and int(floor(tm * 2.0)) % 2:
				_r(tarla, x + 4, y - 10, 3, 4, "#7fc0f0"); _r(tarla, x + 5, y - 11, 1, 1, "#7fc0f0")

func _ambar_ciz(n: Node2D) -> void:
	var o := Vector2(-8, -26)
	var p := func(x, y, w, h, c): _r(n, o.x + x, o.y + y, w, h, c)
	p.call(2, 10, 30, 16, "#a8503a"); p.call(2, 10, 30, 2, "#c8684a")
	for x in range(4, 32, 4): p.call(x, 12, 1, 14, "#8a3a28")
	p.call(0, 4, 34, 7, "#6a3a28")
	for i in 8: p.call(4 + i * 3, 1 + int(absf(i - 3.5)), 4, 3, "#5a2e20")
	p.call(12, 15, 10, 11, "#5a2e1e"); p.call(12, 15, 10, 1, "#e8d8c0"); p.call(16, 15, 1, 11, "#e8d8c0"); p.call(12, 20, 10, 1, "#e8d8c0"); p.call(1, 25, 32, 2, Color(0, 0, 0, 0.25))

func _kuyu_ciz(n: Node2D) -> void:
	var o := Vector2(0, -2)
	var p := func(x, y, w, h, c): _r(n, o.x + x, o.y + y, w, h, c)
	p.call(-8, 2, 16, 3, Color(0, 0, 0, 0.22)); p.call(-7, -6, 14, 8, "#8a8a90"); p.call(-7, -6, 14, 2, "#a8a8b0"); p.call(-5, -5, 10, 3, "#2a4a6a")
	p.call(-8, -16, 2, 10, "#6a4424"); p.call(6, -16, 2, 10, "#6a4424"); p.call(-9, -18, 18, 3, "#8a3a28"); p.call(-1, -15, 2, 6, "#c8b890"); p.call(-2, -10, 4, 3, "#7a5a3a")

func _iskele_ciz(n: Node2D) -> void:
	var o := Vector2(0, 8)
	var p := func(x, y, w, h, c): _r(n, o.x + x, o.y + y, w, h, c)
	for i in 5: p.call(-10, -6 + i * 5, 20, 4, "#8a6040" if i % 2 else "#9a7048")
	p.call(-11, -6, 2, 26, "#6a4424"); p.call(9, -6, 2, 26, "#6a4424")
	p.call(-14, 22, 28, 6, "#6a4426"); p.call(-12, 21, 24, 2, "#8a5a30"); p.call(-15, 22, 2, 3, "#6a4426"); p.call(13, 22, 2, 3, "#6a4426")

func _kayik_ciz(n: Node2D) -> void:
	_r(n, -14, -3, 28, 6, "#6a4426"); _r(n, -12, -4, 24, 2, "#8a5a30"); _r(n, -15, -3, 2, 3, "#6a4426"); _r(n, 13, -3, 2, 3, "#6a4426")
	_r(n, -2, -14, 1, 11, "#4a3018"); _r(n, 6, -6, 10, 1, "#8a6a3a")

func _korkuluk_ciz(n: Node2D) -> void:
	_r(n, -1, -16, 2, 17, "#8a6a3a"); _r(n, -7, -12, 14, 2, "#8a6a3a"); _r(n, -4, -11, 8, 7, "#c84a3a"); _r(n, -3, -19, 6, 5, "#e8d070")
	_r(n, -5, -20, 10, 2, "#a8843a"); _r(n, -2, -17, 1, 1, "#2a1a10"); _r(n, 1, -17, 1, 1, "#2a1a10")

func _fidan_ciz(n: Node2D, i: int) -> void:
	var s = sap[i]
	if s != null and s.g: return
	_r(n, -5, 1, 10, 2, Color(0, 0, 0, 0.18)); _r(n, -4, -1, 8, 3, "#6a4a2a")
	if s == null:
		_r(n, -1, -2, 2, 1, "#8a6a3a")
		return
	var k: float = minf(1.0, (_simdi() - float(s.t)) / (3.0 * 1440.0))
	var h := 3 + int(round(k * 8.0))
	_r(n, 0, -h, 1, h, "#6a4a2a"); _r(n, -2, -h - 1, 5, 2, "#5aa040"); _r(n, -3, -h + 2, 2, 2, "#4c8d3c"); _r(n, 2, -h + 1, 2, 2, "#4c8d3c")

func _tavuk_ciz(n: Node2D, h: Dictionary) -> void:
	var f := 1 if cos(h.a) > 0 else -1
	_r(n, -3, 1, 6, 1, Color(0, 0, 0, 0.2)); _r(n, -3, -4, 6, 4, "#f4f0e8")
	_r(n, 2 if f > 0 else -4, -6, 2, 3, "#f4f0e8"); _r(n, 3 if f > 0 else -4, -7, 1, 1, "#d83a2a"); _r(n, 4 if f > 0 else -5, -5, 1, 1, "#e8a040"); _r(n, -4 if f > 0 else 3, -3, 1, 2, "#d8d0c0")

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	if kapali and ham != null: return ham
	var pl := []
	for f in plots: pl.append([f.st, f.crop, f.t, f.wet])
	return {st = st, got = got.keys(), sap = sap, vis = vis, tarla = pl}

func yukle(d: Dictionary, ekin_gitti_eski: bool) -> void:
	if kapali:
		ham = d
		st = str(d.get("st", "cayir"))
		return
	st = str(d.get("st", "gone" if ekin_gitti_eski else "cayir"))
	if st == "atB": st = "home"
	got = {}
	for k in d.get("got", []): got[k] = true
	sap = d.get("sap", [null, null, null, null, null, null])
	vis = bool(d.get("vis", false))
	var pl: Array = d.get("tarla", [])
	for k in mini(pl.size(), 24):
		plots[k] = {st = str(pl[k][0]), crop = str(pl[k][1]), t = float(pl[k][2]), wet = bool(pl[k][3])}
	for i in 6:
		if sap[i] != null and sap[i].g: _agac(i)
