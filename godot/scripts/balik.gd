## Balık tutma, tuzaklar ve balık kapanı, gece buluntuları (web: 1 · fishing startFish/tickFish/fishPress, 6 · traps setTrap/tickTraps/
## trapCatch/useTrap, 3 · night finds tickNight/spawnNight/nightPlantLit; belge Sistemler › Balık tutma, Tuzaklar ve balık kapanı, Gece buluntuları).
## F: önce yerdeki eşya, sonra yakındaki tuzak/kapan, sonra elde olta varken önündeki su (balık), elde kapan varken yandaki su, elde Tuzak varken çimen.
## Balık tutarken E, Boşluk ya da F: şamandıra dalınca bas, sonra ibre yeşildeyken bir daha bas.
extends Node2D

var oyun
var env
const FISHT := {
	0: {"sea": [["Tatlısu kefali", 30], ["Çapak", 26], ["Sazan", 22], ["Kızılkanat", 12], ["Mersin balığı", 3]],
		"river": [["Alabalık", 28], ["Kızılkanat", 20], ["Tatlısu levreği", 20], ["Çapak", 16], ["Sazan", 14], ["Tatlısu kefali", 12]]},
	1: {"any": [["Yayın", 24], ["Turna balığı", 18], ["Kadife balığı", 24], ["Kerevit eti", 22], ["Sazan", 10]]},
	2: {"any": [["Mersin balığı", 22], ["Yayın", 30], ["Turna balığı", 22], ["Kadife balığı", 14]]}}
const FISH_HARD := {"Mersin balığı": 1.7, "Turna balığı": 1.35, "Yayın": 1.25, "Alabalık": 1.15, "Tatlısu levreği": 1.1}
const FISH_W := {"Ağ": 0.31, "Olta": 0.27, "Kemik zıpkın": 0.23, "Deniz oltası": 0.29, "Makaralı olta": 0.31, "Derin su oltası": 0.33, "Fırtına oltası": 0.35, "Yıldız oltası": 0.37}
const BALIKLAR := ["Tatlısu kefali", "Çapak", "Sazan", "Kızılkanat", "Mersin balığı", "Alabalık", "Tatlısu levreği", "Yayın", "Turna balığı", "Kadife balığı", "Kerevit eti"]
const TRAP_MAX := 6

var fish := {}            # st: wait|bite|reel, t, need, p, tool, from, catch, miss, pos, dir, z0, z1, spd
var tuzaklar: Array = []  # {p, k, t, got, tur, dur, node}
var ipucu := {}
var son_isirik := -100.0
var saat := 0.0
var gece_t := 0.0
var gece_dugum: Array = []
var bocek: Array = []
var parilti: Node2D       # ışığın etkilemediği katman: şamandıra, misina, ateşböcekleri
var ui: CanvasLayer
var ui_kutu: PanelContainer
var ui_yazi: Label
var ui_alt: Label
var ui_bar: Control
var doku := {}
var oto := false          # yalnız test kancası (?baliktest): kendi kendine tutar, konsola yazar

func kur(o) -> void:
	oyun = o
	env = o.env
	for n in [["Gece sefası", 1], ["Mor kıymık", 2]]:
		oyun.toplama_veri.nodes[n[0]] = {respawn = 1e9, time = n[1], mine = false, ad = n[0], tier = 1, hurt = null, bush = false}
	var kat := CanvasLayer.new()
	kat.layer = 0
	kat.follow_viewport_enabled = true
	oyun.add_child(kat)
	parilti = Node2D.new()
	parilti.draw.connect(_parilti_ciz)
	kat.add_child(parilti)
	ui = CanvasLayer.new()
	ui.layer = 2
	oyun.add_child(ui)
	ui_kutu = PanelContainer.new()
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.08, 0.1, 0.14, 0.88); sb.border_color = Color("#9fd0f0"); sb.set_border_width_all(1); sb.set_corner_radius_all(6)
	sb.content_margin_left = 12; sb.content_margin_right = 12; sb.content_margin_top = 6; sb.content_margin_bottom = 6
	ui_kutu.add_theme_stylebox_override("panel", sb)
	ui_kutu.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	ui_kutu.custom_minimum_size = Vector2(260, 0)
	ui_kutu.position = Vector2(-130, -150)
	ui_kutu.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var v := VBoxContainer.new()
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ui_kutu.add_child(v)
	ui_yazi = Label.new(); ui_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; ui_yazi.add_theme_font_size_override("font_size", 14)
	v.add_child(ui_yazi)
	ui_bar = Control.new(); ui_bar.custom_minimum_size = Vector2(236, 14); ui_bar.draw.connect(_bar_ciz); ui_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(ui_bar)
	ui_alt = Label.new(); ui_alt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; ui_alt.add_theme_font_size_override("font_size", 11); ui_alt.add_theme_color_override("font_color", Color("#b8c8d8"))
	v.add_child(ui_alt)
	ui.add_child(ui_kutu)
	ui_kutu.visible = false
	doku["Gece sefası"] = _bitki_doku(true)
	doku["Mor kıymık"] = _bitki_doku(false)

# ------------------------------------------------------------------ yardımcılar
func bolge(p: Vector2) -> int:
	var b: int = oyun.bio_at(p)
	return 0 if b <= 1 else (1 if b <= 3 else 2)

func _islak(t: int) -> bool:
	return t == 3 or t == 4

func aktif() -> bool:
	return not fish.is_empty()

## E (savuşturma tuşu) olta elindeyken suya dönük durursan oltayı atar (dersteki gibi); balık tutarken de basma tuşudur
func e_tutar() -> bool:
	if aktif(): return true
	return env.elde_tur() == "fish" and env.elde() != "Balık kapanı" and su_onde() != null

func isirik() -> void:
	son_isirik = saat

## web underAttack: son 3 sn'de ısırıldıysan ya da 170 px içinde seni kovalayan bir şey varsa
func saldiri_altinda() -> bool:
	if saat - son_isirik < 3.0: return true
	var P: Vector2 = oyun.oyuncu.position
	for c in oyun.canlilari_ver():
		if c.st == "chase" and c.position.distance_to(P) < 170.0: return true
	return false

func _ipucu(k: String, t: String) -> void:
	if ipucu.has(k): return
	ipucu[k] = true
	env.mesaj(t)

## web waterAhead: önündeki su (26/20/14/10 px), yoksa dört yanında 16 px
func su_onde():
	if oyun.magara.icinde: return null
	var o = oyun.oyuncu
	var f: Vector2 = o.bakis.normalized()
	for r in [26.0, 20.0, 14.0, 10.0]:
		var p: Vector2 = o.position + f * r
		if _islak(oyun.tile_at(p)): return p
	for d in [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)]:
		var p: Vector2 = o.position + d * 16.0
		if _islak(oyun.tile_at(p)): return p
	return null

func _yan_su():
	var w = su_onde()
	if w != null: return w
	var o = oyun.oyuncu
	for r in [14.0, 20.0]:
		for d in [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)]:
			var p: Vector2 = o.position + d * r
			if _islak(oyun.tile_at(p)): return p
	return null

func _tuzak_yakin():
	var P: Vector2 = oyun.oyuncu.position
	var en = null
	var bd := 1e9
	for t in tuzaklar:
		var d: float = t.p.distance_to(P)
		if d < (34.0 if t.k == "Balık kapanı" else 18.0) and d < bd:
			bd = d
			en = t
	return en

## F'ye basınca (yerdeki eşyalardan sonra): tuzak, balık, kapan, tuzak kurma
func etkiles() -> bool:
	if oyun.magara.icinde: return false
	var t = _tuzak_yakin()
	if t != null:
		_tuzak_kullan(t)
		return true
	var h: String = env.elde()
	var tur: String = env.elde_tur()
	if tur == "fish":
		if h == "Balık kapanı":
			var w = _yan_su()
			if w != null:
				_tuzak_kur(h, w)
				return true
		else:
			var w = su_onde()
			if w != null:
				_basla(w)
				return true
	if h == "Tuzak" and oyun.tile_at(oyun.oyuncu.position) <= 1:
		for q in tuzaklar:
			if q.p.distance_to(oyun.oyuncu.position) < 34.0: return false
		_tuzak_kur(h, null)
		return true
	return false

# ------------------------------------------------------------------ balık tutma
## Olta yemi (belge Tarifler › İşe yarayan eşyalar): Yıldız tozu yemi üç, Sülük yemi iki çekilişin en nadirini verir; her atışta bir yem
const YEM := [["Yıldız tozu yemi", 3], ["Sülük yemi", 2]]
func _roll(w: Vector2) -> String:
	for b in YEM:
		if env.adet(str(b[0])) <= 0: continue
		env.eksilt(str(b[0]))
		var z := bolge(w)
		var T_: Dictionary = FISHT.get(z, FISHT[0])
		var L: Array = T_["any"] if T_.has("any") else (T_["sea"] if oyun.tile_at(w) == 4 else T_["river"])
		var agir := func(n: String) -> float:
			if n == "Mor kıymık": return 0.0
			for a in L:
				if str(a[0]) == n: return float(a[1])
			return 1e9
		var en := ""
		for i in int(b[1]):
			var c := _roll0(w)
			if en == "" or agir.call(c) < agir.call(en): en = c
		if env.adet(str(b[0])) <= 0: env.mesaj("%s bitti" % b[0])
		return en
	return _roll0(w)

func _roll0(w: Vector2) -> String:
	var z := bolge(w)
	var T_: Dictionary = FISHT.get(z, FISHT[0])
	var L: Array = T_["any"] if T_.has("any") else (T_["sea"] if oyun.tile_at(w) == 4 else T_["river"])
	if oyun.zaman.gece_mi() and randf() < 0.05: return "Mor kıymık"
	if randf() < 0.05: return ["Dal", "Yosun", "Kemik"][randi() % 3]
	var s := 0.0
	for a in L: s += float(a[1]) * oyun.hava.balik_agirlik(str(a[0]))
	var r := randf() * s
	for a in L:
		r -= float(a[1]) * oyun.hava.balik_agirlik(str(a[0]))
		if r <= 0.0: return str(a[0])
	return str(L[0][0])

func _basla(w: Vector2) -> void:
	if aktif() or not oyun.toplama.is_.is_empty(): return
	var tool: String = env.elde()
	if not env.dayan.has(tool): env.dayan[tool] = int(env.G.tools[tool].dur)
	if int(env.dayan[tool]) <= 0:
		env.mesaj("%s köreldi! Demirci Dursun'da bilet." % tool, true)
		return
	if saldiri_altinda():
		env.mesaj("Saldırı altındasın: önce kurtul!", true)
		return
	if oyun.tile_at(w) == 4:
		env.mesaj("Bu derin suda kıyıdan balık tutulmaz. Poyraz'ın teknesiyle denize açıl." if oyun.poyraz.ph >= 2 else "Kıyıdan açık denize olta yetmez; nehirleri ve gölleri dene.", true)
		return
	fish = {st = "wait", t = 0.0, need = (2.0 + randf() * 4.0) * (1.15 if oyun.zaman.gece_mi() else 1.0) * oyun.hava.balik_kat(), p = w, tool = tool, from = oyun.oyuncu.position, catch = _roll(w), miss = 0, pos = 0.0, dir = 1.0, z0 = 0.0, z1 = 0.0, spd = 0.0}
	for k in 6: oyun.parca(w, Vector2(randf_range(-20, 20), -15 - randf() * 15), 0.4, Color("#cfe8ff"))
	if oyun.gizli != null: oyun.gizli.olta(w)
	_ipucu("fish1", "Şamandıra dalınca hemen E (ya da Boşluk) bas; sonra ibre yeşil alandayken bir daha bas.")
	_ui()

func _dur(neden: String) -> void:
	fish = {}
	ui_kutu.visible = false
	if neden != "": env.mesaj(neden, true)

func bas() -> void:
	if not aktif(): return
	if fish.st == "wait":
		env.mesaj("Daha vurmadı; şamandırayı izle.", true)
		return
	if fish.st == "bite":
		if oyun.ses != null: oyun.ses.cal("splash", 0.7)
		var hard: float = float(FISH_HARD.get(fish.catch, 1.0))
		var w: float = float(FISH_W.get(fish.tool, 0.26)) * (1.1 if oyun.sk("H4") else 1.0) / hard * (1.08 if oyun.kesif.usta("Yiyecek") else 1.0)
		var z0 := 0.08 + randf() * (0.84 - w)
		fish.st = "reel"; fish.t = 0.0; fish.z0 = z0; fish.z1 = z0 + w
		fish.pos = 0.0 if randf() < 0.5 else 1.0
		fish.dir = -1.0 if fish.pos > 0.5 else 1.0
		fish.spd = 0.85 * hard
		_ui()
		return
	# reel
	var ok_: bool = fish.pos >= fish.z0 - 0.015 and fish.pos <= fish.z1 + 0.015
	var n: String = fish.catch
	var tool: String = fish.tool
	var p: Vector2 = fish.p
	_dur("")
	if not ok_:
		env.mesaj("Kaçırdın! Balık suya geri daldı.", true)
		return
	env.alet_kullan(tool)
	env.ekle(n)
	for k in 12:
		oyun.parca(p, Vector2(randf_range(-20, 20), -30 - randf() * 30), 0.6, Color("#cfe8ff") if k % 2 else Color.WHITE)
	var balik_mi := BALIKLAR.has(n)
	oyun.gorev.qc_ekle("fish:" + n)
	if balik_mi and oyun.almanak != null: oyun.almanak.balik_tutuldu(n)
	if oto: print("BALIK tuttu ", n, " qc ", oyun.gorev.cval("fish:"), " ", oyun.gorev.satir(["c", "fish:", 2, "balık"]), " aktif ", oyun.gorev.aktif.id if oyun.gorev.aktif != null else "-")
	env.xp_ekle(3 + int(round(oyun.pazar.fiyat(n) / 2.0)) if balik_mi else 2)
	oyun.yazi(p + Vector2(0, -10), (n + "!") if balik_mi else (n + " takıldı"), Color("#9fd0f0"), 9)
	if balik_mi: _ipucu("fishCook", "Çiğ balık az doyurur. Kamp ateşinde közle ya da kazanda balık tarifleri öğren.")

func _balik_tik(dt: float) -> void:
	var o = oyun.oyuncu
	if o.position.distance_to(fish.from) > 3.0 or o.bayildi:
		_dur("")
		return
	if saldiri_altinda():
		_dur("Bir şey saldırdı; olta suya düştü!")
		return
	if Input.is_action_just_pressed("savus") or Input.is_action_just_pressed("atil"):
		bas()
		if not aktif(): return
	fish.t += dt
	if oto and (fish.st == "bite" and fish.t > 0.3 or fish.st == "reel" and fish.pos > fish.z0 + 0.02 and fish.pos < fish.z1 - 0.02):
		print("BALIK bas ", fish.st, " ", fish.catch)
		bas()
		if not aktif(): return
	if fish.st == "wait" and fish.t >= fish.need:
		fish.st = "bite"; fish.t = 0.0
		for k in 8: oyun.parca(fish.p, Vector2(randf_range(-15, 15), -20 - randf() * 20), 0.5, Color("#cfe8ff"))
	elif fish.st == "bite" and fish.t > 1.05:
		fish.miss += 1
		if fish.miss >= 2:
			_dur("Balık yemi alıp kaçtı…")
			return
		env.mesaj("Kaçırdın! Şamandırayı izle…", true)
		fish.st = "wait"; fish.t = 0.0; fish.need = 1.5 + randf() * 3.0
	elif fish.st == "reel":
		fish.pos += fish.dir * fish.spd * dt
		if fish.pos > 1.0: fish.pos = 1.0; fish.dir = -1.0
		if fish.pos < 0.0: fish.pos = 0.0; fish.dir = 1.0
		if fish.t > 6.0:
			_dur("Misina koptu, balık gitti.")
			return
	_ui()

func _ui() -> void:
	ui_kutu.visible = aktif()
	if not aktif(): return
	ui_yazi.text = "Şamandıra suda… bekle" if fish.st == "wait" else ("Vurdu! Hemen E / Boşluk!" if fish.st == "bite" else "İbre yeşildeyken E / Boşluk!")
	ui_yazi.add_theme_color_override("font_color", Color("#ffd84a") if fish.st == "bite" else Color("#eaf4ff"))
	ui_bar.visible = fish.st == "reel"
	ui_alt.text = ("%s · yürürsen olta çekilir" % fish.tool) if fish.st == "wait" else ("Kaçırırsan balık gider" if fish.st == "reel" else "")
	ui_alt.visible = ui_alt.text != ""
	ui_bar.queue_redraw()

func _bar_ciz() -> void:
	if not aktif() or fish.st != "reel": return
	var w := ui_bar.size.x
	var h := ui_bar.size.y
	ui_bar.draw_rect(Rect2(0, 2, w, h - 4), Color("#1d2a36"))
	ui_bar.draw_rect(Rect2(w * float(fish.z0), 2, w * (float(fish.z1) - float(fish.z0)), h - 4), Color("#5ab860"))
	ui_bar.draw_rect(Rect2(w * float(fish.pos) - 1.5, 0, 3, h), Color("#fff2b0"))

# ------------------------------------------------------------------ tuzaklar ve balık kapanı
func _sure(k: String) -> float:
	return (110.0 if k == "Tuzak" else 130.0) + randf() * 120.0

func _tuzak_kur(k: String, at) -> void:
	if tuzaklar.size() >= TRAP_MAX:
		env.mesaj("En fazla %d tuzak kurabilirsin. Birini topla." % TRAP_MAX, true)
		return
	if env.adet(k) <= 0: return
	var d: int = int(env.dayan.get(k, env.G.tools[k].dur))
	if d <= 0:
		env.mesaj("%s köreldi; önce Dursun'da yenile." % k, true)
		return
	var o = oyun.oyuncu
	var p: Vector2 = o.position + Vector2(o.bakis.x * 10.0, o.bakis.y * 8.0 + 4.0)
	if at != null: p = at
	if k == "Balık kapanı":
		# web v1.57: kapan suyun hemen kıyısına girer, kolay erişilsin
		var fa: float = atan2(p.y - o.position.y, p.x - o.position.x)
		var bp = null
		for r in range(4, 35):
			if bp != null: break
			for j in 24:
				var an: float = fa + (1.0 if j % 2 else -1.0) * ceil(j / 2.0) * PI / 12.0
				var q: Vector2 = o.position + Vector2(cos(an), sin(an)) * float(r)
				if _islak(oyun.tile_at(q)):
					bp = q + Vector2(cos(an), sin(an)) * 3.0
					break
		if bp != null: p = bp
	var t := {p = p.round(), k = k, t = _sure(k), got = [], tur = "", dur = d, node = null}
	_tuzak_dugum(t)
	tuzaklar.append(t)
	env.eksilt(k)
	if env.adet(k) <= 0: env.dayan.erase(k)
	env.kemer_ciz()
	env.mesaj("Tuzak kuruldu. Bir süre sonra gel bak; tavşan, keklik ya da sincap düşebilir." if k == "Tuzak" else "Balık kapanı suya bırakıldı. Arada bir gelip içine bak.")

func _tuzak_dugum(t: Dictionary) -> void:
	var n := Node2D.new()
	n.position = t.p
	n.set_meta("tuzak", t)
	n.draw.connect(_tuzak_ciz.bind(n))
	oyun.nesneler.add_child(n)
	t.node = n

func _yakala(t: Dictionary) -> void:
	var z := bolge(t.p)
	if t.k == "Balık kapanı":
		var T_: Dictionary = FISHT.get(z, FISHT[0])
		var L: Array = T_["any"] if T_.has("any") else T_["river"]
		var a: String = str(L[randi() % L.size()][0])
		var b: String = str(L[randi() % L.size()][0])
		t.got = [[a, 2]] if a == b else [[a, 1], [b, 1]]
		t.tur = ""
		return
	var pool: Array = ["Ördek", "Keklik", "Tavşan"] if z == 1 else (["Tavşan"] if z == 2 else (["Sincap", "Tavşan"] if oyun.bio_at(t.p) == 1 else ["Tavşan", "Tavşan", "Keklik", "Bıldırcın"]))
	var k: String = pool[randi() % pool.size()]
	var D: Dictionary = oyun.canlilar.get(k, {})
	var got := []
	for dr in D.get("drops", []):
		if randf() < float(dr.p): got.append([str(dr.n), randi_range(int(dr.min), int(dr.max))])
	if got.is_empty() and not D.get("drops", []).is_empty(): got.append([str(D.drops[0].n), 1])
	t.got = got
	t.tur = k

func _tuzak_tik(dt: float) -> void:
	for t in tuzaklar:
		if t.node != null: t.node.queue_redraw()
		if not t.got.is_empty(): continue
		t.t -= dt
		if t.t <= 0.0:
			_yakala(t)
			if t.p.distance_to(oyun.oyuncu.position) < 260.0:
				oyun.yazi(t.p + Vector2(0, -16), "!", Color("#f2b84b"), 10)

func _tuzak_kullan(t: Dictionary) -> void:
	if not t.got.is_empty():
		var s := []
		for g in t.got:
			env.ekle(str(g[0]), int(g[1]))
			oyun.gorev.qc_ekle("trap:" + str(g[0]), int(g[1]))
			s.append("%d %s" % [int(g[1]), g[0]])
		t.got = []
		t.dur = int(t.dur) - 1
		env.xp_ekle(4)
		if int(t.dur) <= 0:
			_tuzak_sil(t)
			env.ekle(t.k)
			env.dayan[t.k] = 0
			env.kemer_ciz()
			env.mesaj("Aldın: %s. %s yıprandı; geri aldın, Dursun'da yenile." % [", ".join(s), t.k], true)
			return
		t.t = _sure(t.k)
		env.mesaj("Tuzaktan aldın: %s. Tuzak yeniden kuruldu." % ", ".join(s))
		return
	var metin := "Tuzak kurulu, henüz bir şey düşmedi. Sabırlı ol; hayvanlar sessiz yerleri sever." if t.k == "Tuzak" else "Kapan suyun içinde sallanıyor; şimdilik boş."
	oyun.konusma.ac(t.k, env.ikon_al(t.k), metin, [{t = "Bekle", pri = true, kapat = true}, {t = "Tuzağı topla", f = _tuzak_topla.bind(t)}])

func _tuzak_topla(t: Dictionary) -> void:
	if not tuzaklar.has(t): return
	_tuzak_sil(t)
	env.ekle(t.k)
	env.dayan[t.k] = int(t.dur)
	env.kemer_ciz()
	env.mesaj("%s geri alındı." % t.k)

func _tuzak_sil(t: Dictionary) -> void:
	tuzaklar.erase(t)
	if t.node != null: t.node.queue_free()

func _px(n: CanvasItem, x: float, y: float, w: float, h: float, c) -> void:
	n.draw_rect(Rect2(x, y, w, h), Color(c))

func _tuzak_ciz(n: Node2D) -> void:
	var t: Dictionary = n.get_meta("tuzak")
	var tm := saat
	if t.k == "Balık kapanı":
		var b: float = round(sin(tm * 2.0 + t.p.x) * 1.0)
		_px(n, -5, -3 + b, 10, 5, "#8a6a3a")
		for i in range(-4, 5, 2): _px(n, i, -3 + b, 1, 5, "#5a4020")
		_px(n, -6, 1 + b, 12, 1, Color(0.78, 0.9, 1.0, 0.6))
		_px(n, 5, -6 + b, 2, 2, "#e84a3a")
		if not t.got.is_empty():
			if sin(tm * 8.0) > 0.3: _px(n, -2, -6 + b, 4, 2, "#cfe8ff")
			_unlem(n, 0, -12)
		return
	_px(n, -6, 1, 12, 3, Color(0, 0, 0, 0.25))
	_px(n, -5, -1, 10, 2, "#8a5a2e")
	_px(n, -5, -6, 1, 6, "#6a4426"); _px(n, 4, -6, 1, 6, "#6a4426")
	_px(n, -5, -6, 10, 1, "#b7a06a")
	if not t.got.is_empty():
		_px(n, -3, -4, 6, 4, "#a88a5a" if t.tur == "Keklik" else ("#6a8a5a" if t.tur == "Ördek" else "#c8b8a0"))
		_px(n, 2, -5, 2, 2, "#e8e0d0")
		_unlem(n, 0, -14)
	else:
		_px(n, -1, -3, 2, 2, "#c84a3a")

func _unlem(n: Node2D, x: float, y: float) -> void:
	var b: float = round(sin(saat * 5.0) * 2.0)
	_px(n, x - 3, y - 6 + b, 6, 9, "#232d1f")
	_px(n, x - 1, y - 5 + b, 2, 5, "#f2b84b")
	_px(n, x - 1, y + 1 + b, 2, 1, "#f2b84b")

# ------------------------------------------------------------------ gece buluntuları ve ateşböcekleri
func gece_acik() -> bool:
	return oyun.zaman.gece_mi() and oyun.zaman.karanlik() >= 0.45 and not oyun.magara.icinde

func _r(n) -> float:
	return 40.0 if n.ad == "Mor kıymık" else 36.0

## web nightPlantLit: parlayan gece bitkisi durdukça çevresine mor ışık inmez
func koruyor(p: Vector2) -> bool:
	if not gece_acik(): return false
	for n in gece_dugum:
		if n.canli and n.position.distance_to(p) < _r(n) * 0.85: return true
	return false

func _bitki_doku(sefa: bool) -> ImageTexture:
	var im := Image.create(8, 15, false, Image.FORMAT_RGBA8)
	var px = func(x: int, y: int, w: int, h: int, c: String) -> void:
		im.fill_rect(Rect2i(x + 3, y + 12, w, h), Color(c))
	if sefa:
		px.call(0, -6, 1, 8, "#3f7a3a"); px.call(1, -2, 2, 1, "#5aa04a"); px.call(-2, -3, 2, 1, "#5aa04a")
		px.call(-2, -10, 5, 3, "#eaf6ff"); px.call(-1, -11, 3, 5, "#eaf6ff"); px.call(0, -9, 1, 1, "#fff7c0")
	else:
		px.call(-2, -2, 5, 3, "#3a1a5a"); px.call(-1, -9, 3, 8, "#a050e0"); px.call(0, -11, 2, 3, "#c080ff"); px.call(0, -8, 1, 5, "#e0b8ff")
	return ImageTexture.create_from_image(im)

func _gece_koy(k: String) -> void:
	var P: Vector2 = oyun.oyuncu.position
	for tr in 30:
		var a := randf() * TAU
		var d := 150.0 + randf() * 300.0
		var p := P + Vector2(cos(a), sin(a)) * d
		if oyun.bio_at(p) < 0 or oyun.tile_at(p) > 1 or oyun.engel(p): continue
		if oyun.zaman.kampta(p) or oyun.insa.fener_isiginda(p): continue
		var dolu := false
		for n in oyun.dugumler:
			if n.canli and n.position.distance_to(p) < 14.0:
				dolu = true
				break
		if dolu: continue
		var hc := Vector2i(int(floor(p.x / 32.0)), int(floor(p.y / 32.0)))
		for dx in [-1, 0, 1]:
			for dy in [-1, 0, 1]:
				for ag in oyun.agac_izgara.get(hc + Vector2i(dx, dy), []):
					if ag.distance_to(p) < 10.0: dolu = true
		if dolu: continue
		var s := preload("res://scripts/dugum.gd").new()
		s.ad = k
		s.texture = doku[k]
		s.centered = false
		s.offset = Vector2(-3, -12)
		s.position = p
		s.set_meta("v", randf())
		var l := PointLight2D.new()
		l.texture = oyun.mesale.isik.texture
		l.texture_scale = _r(s) / 128.0
		l.color = Color(0.75, 0.85, 1.0) if k == "Gece sefası" else Color(0.85, 0.6, 1.0)
		l.energy = 0.9
		l.position = Vector2(0, -6)
		s.add_child(l)
		oyun.dugumler.append(s)
		oyun.nesneler.add_child(s)
		gece_dugum.append(s)
		return

func _gece_sil(n) -> void:
	gece_dugum.erase(n)
	oyun.dugumler.erase(n)
	n.queue_free()

func _gece_tik(dt: float) -> void:
	gece_t -= dt
	if not gece_acik():
		for n in gece_dugum.duplicate(): _gece_sil(n)
		bocek.clear()
		return
	var P: Vector2 = oyun.oyuncu.position
	if gece_t <= 0.0:
		gece_t = 6.0
		for n in gece_dugum.duplicate():
			if not n.canli or n.position.distance_to(P) > 1100.0: _gece_sil(n)
		var want := [["Gece sefası", 0 if bolge(P) == 2 else 3], ["Mor kıymık", 1 + (1 if oyun.zaman.gun > 3 else 0)]]
		for w in want:
			var c := 0
			for n in gece_dugum:
				if n.ad == w[0] and n.position.distance_to(P) < 560.0: c += 1
			if c < int(w[1]): _gece_koy(w[0])
	for n in gece_dugum:
		var ph := 0.5 + 0.5 * sin(saat * 2.4 + float(n.get_meta("v")) * 9.0)
		n.modulate = Color(1, 1, 1) if ph > 0.5 else Color(0.82, 0.9, 1.0)
	# ateşböcekleri çayırların üstünde gezinir, gece sefalarının çevresinde toplanır
	if bolge(P) != 2:
		while bocek.size() < 14:
			var fl := []
			for n in gece_dugum:
				if n.ad == "Gece sefası" and n.canli and n.position.distance_to(P) < 260.0: fl.append(n)
			var o: Vector2 = P
			var ben := true
			if not fl.is_empty() and randf() < 0.6:
				o = fl[randi() % fl.size()].position
				ben = false
			var a := randf() * TAU
			var d := (60.0 + randf() * 180.0) if ben else (6.0 + randf() * 26.0)
			bocek.append({p = o + Vector2(cos(a), sin(a)) * d + Vector2(0, -8), ph = randf() * TAU, v = Vector2.ZERO, life = 6.0 + randf() * 10.0})
	for f in bocek.duplicate():
		f.life -= dt; f.ph += dt
		f.v += Vector2(randf() - 0.5, randf() - 0.5) * 40.0 * dt
		f.v *= 0.96
		f.p += f.v * dt
		if f.life <= 0.0 or f.p.distance_to(P) > 420.0: bocek.erase(f)

func _parilti_ciz() -> void:
	for f in bocek:
		var r := 1.5 + 0.6 * sin(f.ph * 3.0)
		parilti.draw_circle(f.p, r + 2.0, Color(0.9, 1.0, 0.5, 0.18))
		parilti.draw_rect(Rect2(f.p.round(), Vector2(1, 1)), Color(1.0, 1.0, 0.7, 0.6 + 0.4 * sin(f.ph * 3.0)))
	if aktif():
		var o = oyun.oyuncu
		var p: Vector2 = fish.p
		var b := 0.0
		if fish.st == "wait": b = round(sin(saat * 4.0) * 1.0)
		elif fish.st == "bite": b = 2.0 + round(sin(saat * 20.0) * 1.0)
		var uc: Vector2 = o.position + Vector2(o.bakis.normalized().x * 8.0, -14.0)
		parilti.draw_line(uc, p + Vector2(0, -2 + b), Color(0.9, 0.9, 0.85, 0.7), 1.0)
		parilti.draw_circle(p + Vector2(0, b), 6.0, Color(0.8, 0.9, 1.0, 0.12))
		parilti.draw_rect(Rect2(p.x - 1, p.y - 3 + b, 3, 2), Color("#e84a3a"))
		parilti.draw_rect(Rect2(p.x - 1, p.y - 1 + b, 3, 2), Color("#f4f4f4"))
		if fish.st == "bite":
			parilti.draw_arc(p, 4.0 + fmod(saat * 12.0, 6.0), 0, TAU, 16, Color(0.8, 0.9, 1.0, 0.6), 1.0)

# ------------------------------------------------------------------ her an
func _process(dt: float) -> void:
	saat += dt
	if oyun.basta: return
	var dur: bool = oyun.zaman.durdu() or oyun.ev.acik
	if not dur:
		if aktif(): _balik_tik(dt)
		elif Input.is_action_just_pressed("savus") and not oyun.pencere_acik() and not oyun.oyuncu.kilit and e_tutar():
			var w = su_onde()
			if w != null: _basla(w)
		elif oto and fmod(saat, 3.0) < dt: etkiles()
		_tuzak_tik(dt)
		_gece_tik(dt)
	parilti.queue_redraw()
	if parilti.get_parent().visible == oyun.magara.icinde: parilti.get_parent().visible = not oyun.magara.icinde

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	var T := []
	for t in tuzaklar: T.append([t.p.x, t.p.y, t.k, t.t, t.got, t.tur, t.dur])
	return {tuzak = T, ipucu = ipucu.keys()}

func yukle(d: Dictionary) -> void:
	for t in tuzaklar.duplicate(): _tuzak_sil(t)
	for a in d.get("tuzak", []):
		var t := {p = Vector2(float(a[0]), float(a[1])), k = str(a[2]), t = float(a[3]), got = a[4], tur = str(a[5]), dur = int(a[6]), node = null}
		_tuzak_dugum(t)
		tuzaklar.append(t)
	ipucu = {}
	for k in d.get("ipucu", []): ipucu[k] = true
