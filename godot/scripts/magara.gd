## Yankı Mağarası (web v2.32 mağaralar; belge: Mağaralar › Genel kurallar ve › 1 · Yankı Mağarası).
## Dışarıda Çayır'da kaya tepesi, tabela ve ağzında sarı halka; F ile şart penceresi (Sv 5, elinde yanan meşale). İçerisi web'in kendi
## çizimi ve ızgarası (Godot'da adanın dışında, kendi yerinde durur); zifiri karanlık, meşale iki kat uzağı aydınlatır, ağızdan soluk ışık,
## Yankı mantarları küçük ışık halkaları. Meşale sönerse 1,5–3 sn sonra dışarı atılırsın. Çıkışta ÇIKIŞ tabelası ve sarı halka.
extends Node

const OFS := Vector2(20000, 0)     # mağaranın içi adanın dışında: web koordinatı + OFS
const KARANLIK := Color(0.035, 0.035, 0.045)

var oyun
var M: Dictionary
var G: PackedByteArray
var N := 0
var T := 16
var PX := 0.0
var PY := 0.0
var icinde := false
var gorulen := false
var acilan: PackedByteArray      # haritada açılan hücreler
var karanlik := 0.0
var karanlik_t := 0.0
var ic_dugumler: Array = []
var isiklar: Array = []

var kapi: Node2D
var ic: Sprite2D
var cikis: Node2D
var yukleme: ColorRect
var yukleme_ad: Label
var yukleme_alt: Label
var kh_ada: Texture2D
var kh_img: Image
var kh_tex: ImageTexture
var son_hucre := Vector2i(-99, -99)
var CD := {}              # mağara canlılarının verisi (canli.gd'nin beklediği biçimde)
var dogum_t := 0.0
var kaya: Node2D
var kaya_durum := 0       # 0 tanışılmadı · 1 mantar getir · 2 boss · 3 dön · 4 bitti
var kaya_denedi := false  # boss'la karşılaşıp bayıldıysa ikinci gelişte doğrudan "Çağır"
var boss_yenildi := false
var yan_kart: PanelContainer
var yan_yazi: RichTextLabel

func kur(o) -> void:
	oyun = o
	M = o._json("res://data/magara.json")
	G = Marshalls.base64_to_raw(M.G)
	N = int(M.N); T = int(M.T); PX = float(M.PX); PY = float(M.PY)
	acilan = PackedByteArray(); acilan.resize(N * N)
	# dışarıdaki giriş: kaya tepesi, ağızda nefes alan mavi ışık, tabela
	kapi = Node2D.new()
	kapi.position = Vector2(M.kapi.x, M.kapi.y)
	var sp := Sprite2D.new()
	sp.texture = load(M.tepe.png)
	sp.centered = false
	sp.offset = Vector2(-float(M.tepe.ax), -float(M.tepe.ay))
	kapi.add_child(sp)
	kapi.draw.connect(_kapi_ciz)
	var tb := Label.new()
	tb.text = "%s\nSv %d · meşale" % [M.ad, int(M.lv)]
	tb.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	tb.add_theme_font_size_override("font_size", 5)
	tb.add_theme_color_override("font_color", Color("#2a1a0c"))
	tb.add_theme_constant_override("line_spacing", -2)
	tb.position = Vector2(34 - 24, 10 - 30)
	tb.size = Vector2(50, 14)
	kapi.add_child(tb)
	oyun.nesneler.add_child(kapi)
	# içerisi: web'in çizimi
	ic = Sprite2D.new()
	ic.texture = load(M.ic)
	ic.centered = false
	ic.position = Vector2(PX, PY) + OFS
	ic.z_index = -8
	ic.visible = false
	oyun.add_child(ic)
	cikis = Node2D.new()
	cikis.position = Vector2(M.baslangic.x, M.baslangic.y) + OFS
	cikis.z_index = -7
	cikis.draw.connect(_cikis_ciz)
	cikis.visible = false
	oyun.add_child(cikis)
	# yükleme ekranı
	yukleme = ColorRect.new(); yukleme.color = Color("#050405"); yukleme.visible = false
	yukleme.mouse_filter = Control.MOUSE_FILTER_STOP
	var v := VBoxContainer.new(); v.alignment = BoxContainer.ALIGNMENT_CENTER
	yukleme_ad = Label.new(); yukleme_ad.add_theme_font_size_override("font_size", 26); yukleme_ad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	yukleme_ad.add_theme_color_override("font_color", Color("#e8e0d0"))
	yukleme_alt = Label.new(); yukleme_alt.add_theme_font_size_override("font_size", 14); yukleme_alt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	yukleme_alt.add_theme_color_override("font_color", Color("#a89c8a"))
	v.add_child(yukleme_ad); v.add_child(yukleme_alt)
	yukleme.add_child(v)
	oyun.hud.add_child(yukleme)
	yukleme.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	v.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	# canlılar
	for k in M.canlilar:
		var A: Dictionary = M.canlilar[k].duplicate(true)
		A.file = A.png
		A.ox = int(A.fw) / 2
		A.shadow = 24.0 if A.kind == "w" and float(A.fh) > 40.0 else (12.0 if A.kind == "w" else (float(A.r) + 2.0) * 2.0)
		if A.kind == "w": A.top = float(A.fh) + 8.0
		else: A.top = float(A.fh) * 0.72
		A.cs = null
		CD[k] = A
	# mağaranın ağzında Sarkıt ve Yarasa gübresi (adada başka yerde yoktur)
	for a in M.agiz:
		var R: Dictionary = M.agizResim[a.n]
		if not R.has("png"): continue
		oyun.toplama_veri.nodes[a.n] = {respawn = float(R.respawn), time = float(R.time), mine = false, ad = a.n, tier = 1, hurt = null, bush = false}
		var d := preload("res://scripts/dugum.gd").new()
		d.ad = a.n
		d.texture = load(R.png)
		d.centered = false
		d.offset = Vector2(-float(R.ox), -float(R.oy))
		d.scale = Vector2.ONE / float(R.k)
		d.position = Vector2(a.x, a.y)
		oyun.nesneler.add_child(d)
		oyun.dugumler.append(d)
	_kaya_kur()
	# mağarada toplananlar toplama tablosuna (web RES: bir kez çıkar, içerideyken yeniden çıkmaz)
	for n in M.toplanir:
		oyun.toplama_veri.nodes[n] = {respawn = 1e9, time = float(M.toplanir[n].time), mine = false, ad = n, tier = 1, hurt = null, bush = false}

# ------------------------------------------------------------------ ızgara
func hucre(p: Vector2) -> Vector2i:
	var q := p - OFS - Vector2(PX, PY)
	return Vector2i(int(floor(q.x / T)), int(floor(q.y / T)))

func zemin(p: Vector2) -> bool:
	var c := hucre(p)
	if c.x < 0 or c.y < 0 or c.x >= N or c.y >= N: return false
	return G[c.y * N + c.x] != 0

func engel(p: Vector2, half: float) -> bool:
	for d in [Vector2(-half, -half), Vector2(half, -half), Vector2(-half, half), Vector2(half, half)]:
		if not zemin(p + d): return true
	return false

## dışarıda kaya tepesi geçilmez (web: kapının çevresinde elips)
func kapi_engel(p: Vector2) -> bool:
	var dx := (p.x - float(M.kapi.x)) / 54.0
	var dy := (p.y - (float(M.kapi.y) - 34.0)) / 40.0
	return dx * dx + dy * dy < 1.0

# ------------------------------------------------------------------ F: giriş ve çıkış
func etkiles() -> bool:
	var p: Vector2 = oyun.oyuncu.position
	if not icinde and p.distance_to(Vector2(M.kapi.x, float(M.kapi.y) + 14.0)) < 40.0:
		_sor_gir()
		return true
	if kaya_yakin():
		kaya_konus()
		return true
	if icinde and p.distance_to(cikis.position) < 56.0:
		oyun.konusma.ac(M.ad, null, "Mağaradan çıkıp gün ışığına dönmek ister misin?", [{t = "Vazgeç", kapat = true}, {t = "Mağaradan çık", pri = true, f = func(): _yukle("Gün ışığı", "Mağaradan çıkılıyor…", _cik)}])
		return true
	return false

func _sor_gir() -> void:
	var lv: int = oyun.env.sv
	var ok_l := lv >= int(M.lv)
	var ok_t: bool = oyun.mesale.elde() != null
	var t := "Mağaraya girmek ister misin?\n"
	t += "[color=%s]%s En az %d. seviye (sen %d)[/color]\n" % ["#9fe07a" if ok_l else "#ff9a8a", "✓" if ok_l else "✗", int(M.lv), lv]
	if ok_t: t += "[color=#9fe07a]✓ Elinde yanan bir meşale var[/color]"
	elif oyun.mesale.var_mi(): t += "[color=#ff9a8a]✗ Meşalen yanmıyor: meşale yuvasından \" tuşuyla yak[/color]"
	else: t += "[color=#ff9a8a]✗ Meşalen yok[/color]"
	var secs := [{t = "Vazgeç", kapat = true}]
	if ok_l and ok_t:
		secs.append({t = "Mağaraya gir", pri = true, f = func(): _yukle(M.ad, "Mağaraya giriliyor…", _gir)})
	oyun.konusma.ac(M.ad, null, t, secs)

func _yukle(a: String, b: String, f: Callable) -> void:
	yukleme_ad.text = a
	yukleme_alt.text = b
	yukleme.visible = true
	yukleme.modulate.a = 1.0
	oyun.oyuncu.kilit = true
	await get_tree().create_timer(0.82).timeout
	f.call()
	await get_tree().create_timer(0.12).timeout
	var tw := create_tween()
	tw.tween_property(yukleme, "modulate:a", 0.0, 0.25)
	tw.tween_callback(func(): yukleme.visible = false)
	oyun.oyuncu.kilit = false

func _gir() -> void:
	icinde = true
	karanlik = 0.0
	# dışarının canlıları silinir (web doEnter)
	for c in oyun.canlilari_ver():
		c.queue_free()
	ic.visible = true
	cikis.visible = true
	oyun.oyuncu.position = Vector2(M.baslangic.x, M.baslangic.y) + OFS
	oyun.oyuncu.bak(Vector2(0, -1))
	var k: Camera2D = oyun.kamera
	k.limit_left = int(PX + OFS.x); k.limit_top = int(PY); k.limit_right = int(PX + OFS.x + N * T); k.limit_bottom = int(PY + N * T)
	k.reset_smoothing()
	oyun.taban_renk = KARANLIK
	oyun.renk_guncelle()
	_isik(Vector2(M.baslangic.x, float(M.baslangic.y) + 30.0) + OFS, 90.0, Color(0.85, 0.9, 1.0), 0.9)
	_toplanirlar()
	_harita_ac()
	kaya.visible = true
	_isik(kaya.position + Vector2(0, -8), 70.0, Color(1.0, 0.85, 0.55), 1.0)
	var ilk := not gorulen
	gorulen = true
	oyun.env.mesaj("%s · %s" % [M.ad, "Mağaraya ilk kez girdin" if ilk else "Mağaradasın"])

func _cik(sessiz: bool = false, yerinde: bool = false) -> void:
	if not icinde: return
	icinde = false
	karanlik = 0.0
	for c in oyun.canlilari_ver():
		c.queue_free()
	for d in ic_dugumler:
		oyun.dugumler.erase(d)
		d.queue_free()
	ic_dugumler = []
	for l in isiklar: l.queue_free()
	isiklar = []
	ic.visible = false
	cikis.visible = false
	kaya.visible = false
	oyun.kamera_sinir()
	oyun.taban_renk = Color.WHITE
	oyun.renk_guncelle()
	if not yerinde:
		oyun.oyuncu.position = Vector2(M.kapi.x, float(M.kapi.y) + 24.0)
		oyun.oyuncu.bak(Vector2(0, 1))
	oyun.kamera.reset_smoothing()
	_harita_kapa()
	if not sessiz:
		oyun.env.mesaj("%s'ndan çıktın." % M.ad)

func _isik(p: Vector2, r: float, c: Color, e: float) -> PointLight2D:
	var l := PointLight2D.new()
	l.texture = oyun.mesale.isik.texture
	l.texture_scale = r / 128.0
	l.color = c
	l.energy = e
	l.position = p
	oyun.add_child(l)
	isiklar.append(l)
	return l

# ------------------------------------------------------------------ mağarada toplananlar: duvar diplerinde, her girişte yeniden dizilir
func _toplanirlar() -> void:
	var FL := []
	for i in N * N:
		if G[i] != 0: FL.append(i)
	var e := Vector2(M.ag.x, M.ag.y)
	var d := Vector2(M.en_dip.x, M.en_dip.y)
	for n in M.toplanir:
		var k := 0
		for g in 4000:
			if k >= 16: break
			var i: int = FL[randi() % FL.size()]
			var x := i % N
			var y := i / N
			if Vector2(x, y).distance_to(e) < 9.0 or Vector2(x, y).distance_to(d) < 7.0: continue
			var duvar: bool = G[i - 1] == 0 or G[i + 1] == 0 or G[i - N] == 0 or G[i + N] == 0
			if not duvar and randf() < 0.75: continue
			var p := Vector2(PX + x * T + 8, PY + y * T + 8) + OFS + Vector2(randf_range(-3, 3), randf_range(-3, 3))
			var yakin := false
			for o in ic_dugumler:
				if o.position.distance_to(p) < 40.0: yakin = true
			if yakin: continue
			var s := preload("res://scripts/dugum.gd").new()
			s.ad = n
			s.texture = _dugum_resmi(n)
			s.centered = false
			s.offset = Vector2(-8, -16)
			s.position = p
			oyun.nesneler.add_child(s)
			oyun.dugumler.append(s)
			ic_dugumler.append(s)
			if bool(M.toplanir[n].glow):
				var l := PointLight2D.new()
				l.texture = oyun.mesale.isik.texture
				l.texture_scale = 24.0 / 128.0
				l.color = Color(M.renk.glow)
				l.energy = 0.9
				l.position = Vector2(8, 12)
				s.add_child(l)
			k += 1

## web drawNode (mağara): Yankı mantarı mavi şapkalı, Damla taşı gri damla taşı; 16×18 px
var _resimler := {}
func _dugum_resmi(n: String) -> Texture2D:
	if _resimler.has(n): return _resimler[n]
	var im := Image.create(16, 18, false, Image.FORMAT_RGBA8)
	var px := func(x: int, y: int, w: int, h: int, c: Color):
		for j in h:
			for i in w:
				var X := 8 + x + i
				var Y := 16 + y + j
				if X >= 0 and Y >= 0 and X < 16 and Y < 18: im.set_pixel(X, Y, c)
	if n == "Yankı mantarı":
		var cap := Color("#7fd0ff"); var st := Color("#c8e8f8")
		px.call(-4, 1, 9, 2, Color(0, 0, 0, 0.25)); px.call(-1, -4, 2, 5, st); px.call(-4, -7, 8, 3, cap); px.call(-3, -8, 6, 1, cap)
		px.call(3, -3, 1, 3, st); px.call(2, -5, 4, 2, cap); px.call(-3, -7, 2, 1, Color.WHITE)
	else:
		px.call(-5, 1, 10, 2, Color(0, 0, 0, 0.25)); px.call(-3, -8, 6, 9, Color("#a8acb4")); px.call(-2, -11, 4, 3, Color("#bcc0c8"))
		px.call(-1, -13, 2, 2, Color("#d0d4dc")); px.call(-3, -8, 1, 9, Color("#8a8e96"))
	_resimler[n] = ImageTexture.create_from_image(im)
	return _resimler[n]

# ------------------------------------------------------------------ her an: karanlıkta kalınca dışarı, bayılınca dışarı, harita açılır
func _process(dt: float) -> void:
	kapi.queue_redraw()
	_yan_kart()
	if not icinde: return
	kaya.queue_redraw()
	dogum_t -= dt
	if dogum_t <= 0.0:
		dogum_t = 1.5
		_dogur()
	cikis.queue_redraw()
	if oyun.oyuncu.bayildi:
		if kaya_durum == 2:
			kaya_denedi = true
			kaya_durum = 1
			oyun.env.mesaj("Yan görev bitti sayılmadı: Kaya yine bekliyor.", true)
		_cik(true, true)
		return
	if oyun.mesale.elde() != null:
		karanlik = 0.0
	elif not yukleme.visible:
		if karanlik <= 0.0:
			var var_: bool = oyun.mesale.var_mi()
			karanlik = 3.0 if var_ else 1.5
			karanlik_t = 0.0
			oyun.env.mesaj("Mağara zifiri karanlık: meşaleni hemen yak!" if var_ else "Meşalem bitti! Hiçbir şey göremiyorum…", true)
		else:
			karanlik_t += dt
			if karanlik_t >= karanlik:
				karanlik = 0.0
				_yukle("Gün ışığı", "El yordamıyla dışarı çıktın…", _cik)
	_harita_isle()

# ------------------------------------------------------------------ çizimler
func _kapi_ciz() -> void:
	var t := Time.get_ticks_msec() / 1000.0
	var pl := 0.5 + 0.5 * sin(t * 1.3)
	var g := Color(M.renk.glow); g.a = 0.05 + 0.05 * pl
	kapi.draw_set_transform(Vector2(0, -19), 0, Vector2(17, 19))
	kapi.draw_circle(Vector2.ZERO, 1.0, g)
	kapi.draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)
	# tabela
	var sx := 34.0; var sy := 10.0
	kapi.draw_rect(Rect2(sx - 1, sy - 16, 3, 16), Color("#5a3a1e"))
	kapi.draw_rect(Rect2(sx - 24, sy - 30, 50, 15), Color("#3a2414"))
	kapi.draw_rect(Rect2(sx - 23, sy - 29, 48, 13), Color("#a8783e"))
	kapi.draw_rect(Rect2(sx - 23, sy - 29, 48, 2), Color("#c89a5a"))
	# ağızda sarı halka (giriş sarı parlar)
	var a := 0.35 + 0.25 * sin(t * 4.0)
	kapi.draw_arc(Vector2(0, 8), 14.0 + 3.0 * sin(t * 4.0), 0, TAU, 28, Color(1, 0.85, 0.25, a), 1.5)

func _cikis_ciz() -> void:
	var t := Time.get_ticks_msec() / 1000.0
	var a := 0.4 + 0.3 * sin(t * 4.0)
	cikis.draw_arc(Vector2(0, 4), 16.0 + 3.0 * sin(t * 4.0), 0, TAU, 28, Color(1, 0.85, 0.25, a), 2.0)
	cikis.draw_rect(Rect2(-18, 14, 36, 11), Color("#3a2414"))
	cikis.draw_rect(Rect2(-17, 15, 34, 9), Color("#ffd27a"))
	cikis.draw_string(ThemeDB.fallback_font, Vector2(-14, 22), "ÇIKIŞ", HORIZONTAL_ALIGNMENT_LEFT, -1, 7, Color("#3a2414"))
	cikis.draw_colored_polygon(PackedVector2Array([Vector2(-4, 28), Vector2(4, 28), Vector2(0, 33)]), Color("#ffd27a"))

# ------------------------------------------------------------------ mağaranın kendi haritası (yürüdükçe açılır)
func _harita_ac() -> void:
	var kh: TextureRect = oyun.kh_resim
	kh_ada = kh.texture
	kh_img = Image.create(N, N, false, Image.FORMAT_RGBA8)
	kh_img.fill(Color("#060507"))
	for i in N * N:
		if acilan[i]: kh_img.set_pixel(i % N, i / N, Color8(156, 142, 120) if G[i] else Color8(58, 50, 44))
	kh_tex = ImageTexture.create_from_image(kh_img)
	kh.texture = kh_tex
	kh.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	son_hucre = Vector2i(-99, -99)

func _harita_kapa() -> void:
	var kh: TextureRect = oyun.kh_resim
	kh.texture = kh_ada
	kh.stretch_mode = TextureRect.STRETCH_SCALE

func _harita_isle() -> void:
	var c := hucre(oyun.oyuncu.position)
	if c != son_hucre:
		son_hucre = c
		var r := 7
		for j in range(-r, r + 1):
			for i in range(-r, r + 1):
				if i * i + j * j > r * r: continue
				var X := c.x + i; var Y := c.y + j
				if X < 0 or Y < 0 or X >= N or Y >= N: continue
				var k := Y * N + X
				if not acilan[k]:
					acilan[k] = 1
					kh_img.set_pixel(X, Y, Color8(156, 142, 120) if G[k] else Color8(58, 50, 44))
		kh_tex.update(kh_img)

## küçük haritada oyuncunun noktası (mağarada)
func harita_nokta() -> Vector2:
	var kh: TextureRect = oyun.kh_resim
	var s := minf(kh.size.x, kh.size.y) / float(N)
	var o := (kh.size - Vector2(N, N) * s) / 2.0
	var q: Vector2 = (oyun.oyuncu.position - OFS - Vector2(PX, PY)) / float(T)
	return o + q * s

# ------------------------------------------------------------------ mağara canlıları (web caveSpawn): her türden en çok 2 (sürü), toplam 9; 220–440 px uzakta doğar
func _dogur() -> void:
	var P: Vector2 = oyun.oyuncu.position
	var hepsi: Array = oyun.canlilari_ver()
	var say := 0
	for c in hepsi:
		if c.position.distance_to(P) > 820.0 and not c.boss:
			c.queue_free()
		elif not c.boss:
			say += 1
	if say >= 9: return
	var e := Vector2(M.ag.x, M.ag.y)
	var d := Vector2(M.en_dip.x, M.en_dip.y)
	for k in M.turler:
		var A: Dictionary = CD[k]
		var paket := {}
		var tek := 0
		for c in hepsi:
			if c.tur == k and is_instance_valid(c) and c.olu < 0.0:
				tek += 1
				paket[c.get_meta("pk", c.get_instance_id())] = true
		if (paket.size() if A.pack != null else tek) >= 2: continue
		for g in 30:
			var i := randi() % (N * N)
			if G[i] == 0: continue
			var cx := i % N
			var cy := i / N
			var p := Vector2(PX + cx * T + 8, PY + cy * T + 8) + OFS
			var dd := p.distance_to(P)
			if dd < 220.0 or dd > 440.0 or Vector2(cx, cy).distance_to(e) < 10.0 or Vector2(cx, cy).distance_to(d) < 9.0: continue
			var n := 1
			if A.pack != null: n = randi_range(int(A.pack[0]), int(A.pack[1]))
			var pk := randi()
			for m in n:
				var q := p if m == 0 else p + Vector2(randf_range(-20, 20), randf_range(-20, 20))
				if m > 0 and engel(q, 5.0): continue
				var c = _canli(k, q)
				c.set_meta("pk", pk)
			break

func _canli(k: String, p: Vector2):
	var c := preload("res://scripts/canli.gd").new()
	c.oyun = oyun
	c.tur = k
	c.D = CD[k]
	c.position = p
	oyun.nesneler.add_child(c)
	return c

# ------------------------------------------------------------------ Madenci Kaya (en dipteki oda) ve Yankı Kraliçesi
func _kaya_kur() -> void:
	var K: Dictionary = M.kaya
	kaya = Node2D.new()
	kaya.position = Vector2(float(M.dip.x) - 10.0, float(M.dip.y) - 12.0) + OFS
	var sp := Sprite2D.new()
	sp.texture = load(K.png)
	sp.centered = false
	sp.offset = Vector2(-float(K.ox), -float(K.oy))
	kaya.add_child(sp)
	kaya.draw.connect(_kaya_ciz)
	oyun.nesneler.add_child(kaya)
	kaya.visible = false
	yan_kart = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.04, 0.06, 0.09, 0.82); st.border_color = Color("#7fc8ff"); st.set_border_width_all(1)
	st.set_content_margin_all(8)
	yan_kart.add_theme_stylebox_override("panel", st)
	yan_yazi = RichTextLabel.new(); yan_yazi.bbcode_enabled = true; yan_yazi.fit_content = true; yan_yazi.scroll_active = false
	yan_yazi.custom_minimum_size = Vector2(284, 0)
	yan_kart.add_child(yan_yazi)
	oyun.hud.add_child(yan_kart)
	yan_kart.anchor_left = 1.0; yan_kart.anchor_right = 1.0
	yan_kart.offset_left = -310.0; yan_kart.offset_right = -10.0
	yan_kart.visible = false

func _kaya_ciz() -> void:
	# fenerin ışığı ve başında mavi "?" (görev alınabilirken)
	if kaya_durum == 0 or (kaya_durum == 1 and kaya_denedi) or kaya_durum == 3:
		var y := -44.0 + roundf(sin(Time.get_ticks_msec() / 250.0) * 2.0)
		kaya.draw_circle(Vector2(0, y + 4), 7.0, Color("#9fd8ff"))
		kaya.draw_string(ThemeDB.fallback_font, Vector2(-3, y + 8), "?", HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color("#14324a"))

func _yan_kart() -> void:
	if kaya_durum == 0 or kaya_durum == 4 or oyun.sahne.acik:
		yan_kart.visible = false
		return
	yan_kart.visible = true
	var k: Control = oyun.gorev.kart
	yan_kart.offset_top = (k.offset_top + k.size.y + 6.0) if k.visible else 34.0
	var Y: Dictionary = M.kaya.yan
	var sat := ""
	match kaya_durum:
		1: sat = "Yankı Kraliçesi'ni çağır (Kaya ile konuş)" if kaya_denedi else "%d/4 Yankı mantarı · Kaya'ya götür" % mini(4, oyun.env.adet("Yankı mantarı"))
		2: sat = "Yankı Kraliçesi'ni yen"
		3: sat = "Kaya ile konuş"
	yan_yazi.text = "[color=#7fc8ff][font_size=11]%s · Yan görev[/font_size][/color]\n[b]%s[/b]\n%s" % [Y.name, Y.title, sat]

func kaya_yakin() -> bool:
	return icinde and kaya.position.distance_to(oyun.oyuncu.position) < 34.0

func kaya_konus() -> void:
	var Y: Dictionary = M.kaya.yan
	var por = load(M.kaya.portre)
	match kaya_durum:
		0:
			_satirlar(Y.intro, 0, func():
				kaya_durum = 1
				oyun.env.mesaj("Yan görev: " + str(Y.title)))
		1:
			if kaya_denedi:
				oyun.konusma.ac(Y.name, por, Y.again, [{t = Y.againBtn, pri = true, f = func(): _boss_cagir()}, {t = "Sonra", kapat = true}])
			elif oyun.env.adet("Yankı mantarı") >= 4:
				oyun.env.eksilt("Yankı mantarı", 4)
				_satirlar(Y.steps[0].on, 0, func(): _boss_cagir())
			else:
				oyun.konusma.ac(Y.name, por, Y.remind)
		2:
			oyun.konusma.ac(Y.name, por, "Kraliçe burada evlat! Önce onu yen.")
		3:
			_satirlar(Y.steps[2].on, 0, func():
				kaya_durum = 4
				oyun.env.vio_ekle(int(Y.c))
				oyun.env.xp_ekle(int(Y.x))
				oyun.env.mesaj("Yan görev tamamlandı: %s · +%d Vio, +%d XP" % [Y.title, int(Y.c), int(Y.x)]))
		4:
			oyun.konusma.ac(Y.name, por, Y.after[0])

func _satirlar(L: Array, i: int, son: Callable) -> void:
	if i >= L.size():
		son.call()
		return
	var l: Array = L[i]
	var kim: String = M.kaya.yan.name if l[0] == "n" else ""
	var por = load(M.kaya.portre) if l[0] == "n" else null
	var t: String = oyun.gorev._bb(str(l[1]))
	if l[0] == "x": t = "[i]%s[/i]" % t
	oyun.konusma.ac(kim, por, t, [{t = "Devam" if i < L.size() - 1 else "Tamam", pri = true, kapat = true, f = func(): _satirlar(L, i + 1, son)}])

func _boss_cagir() -> void:
	kaya_durum = 2
	var k: String = M.boss
	for c in oyun.canlilari_ver():
		if c.tur == k: return
	var p := Vector2(M.dip.x, float(M.dip.y) + 56.0) + OFS
	if not zemin(p): p = Vector2(M.dip.x, float(M.dip.y) + 24.0) + OFS
	var c = _canli(k, p)
	c.cvb = true
	c.mad = true
	c.st = "chase"
	c.scale = Vector2(2.4, 2.4)
	for i in 26:
		oyun.parca(p + Vector2(0, -10), Vector2(randf_range(-45, 45), -20 - randf() * 60), 0.8, Color("#b44aff") if i % 2 else Color.WHITE)
	oyun.env.mesaj("%s · Mağaranın boss'u!" % k, true)

func boss_oldu() -> void:
	boss_yenildi = true
	if kaya_durum == 2:
		kaya_durum = 3
	# boss ödülü: kendi XP'si (canlı verir) ve görev ödülü kadar Vio (belge: Mağaralar kural 10)
	oyun.env.vio_ekle(int(M.kaya.yan.c))
	oyun.env.mesaj("Yankı Kraliçesi yenildi! +%d Vio · Kaya'ya dön" % int(M.kaya.yan.c))
