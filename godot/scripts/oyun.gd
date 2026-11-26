## Adım 0 · Deneme: Çayır'ın oyuncunun başladığı 80×60 karelik parçası.
## Bütün sayılar ve resimler web oyunundan otomatik dökülür (godot/tools/disa_aktar.js → data/*.json, art/*.png).
extends Node2D

const SURUM := "Godot · Adım 1f-3b"

var harita: Dictionary
var dunya: Dictionary
var canlilar: Dictionary
var oyuncu_veri: Dictionary

var T := 16
var bx0 := 0  # bölgenin dünya karesi cinsinden sol üstü
var by0 := 0
var bw := 0
var bh := 0
var tiles: PackedByteArray
var tvar: PackedByteArray
var shore: PackedByteArray
var agac_izgara := {}  # 32 px'lik hücre → o hücredeki ağaçlar (web: TGRID)
var agaclar: Array = []
var dugumler: Array = []
var env
var el_yapimi
var istasyon
var konusma
var kisiler: Array = []
var gorev
var sahne
var pazar
var zaman
var kayit
var basta := false
var gorunus := {}            # oyuncunun görünüşü (karakter yaratma)
var sevgili := {}
var zorluk := "normal"
var ad_kahraman := ""
var ad_sevgili := ""
var cine
var uyanis
var mezarlar: Array = []   # bayılınca kalan çantalar: {p, inv, vio, dugum}
var balon_yazi: Label
var balon_t := 0.0
var magara
var mesale
var ortam: CanvasModulate
var taban_renk := Color.WHITE
var sahne_renk := Color.WHITE
var bio_arr: PackedByteArray
var kh_resim: TextureRect
var toplama_veri: Dictionary
var toplama

var nesneler: Node2D  # y sıralı: ağaçlar, düğümler, canlılar, oyuncu
var efekt: Node2D
var oyuncu: Node2D
var kamera: Camera2D
var hud: CanvasLayer
var can_cubugu: ProgressBar
var silah_yazi: Label
var parlama_shader: Shader
var rng := RandomNumberGenerator.new()
var canli_sayac := {}

func _ready() -> void:
	Girdi.kur()
	harita = _json("res://data/harita.json")
	dunya = _json("res://data/dunya.json")
	canlilar = _json("res://data/canlilar.json").canlilar
	oyuncu_veri = _json("res://data/oyuncu.json")
	T = int(harita.T)
	bx0 = int(harita.region.x0); by0 = int(harita.region.y0)
	bw = int(harita.region.w); bh = int(harita.region.h)
	tiles = Marshalls.base64_to_raw(harita.tiles)
	tvar = Marshalls.base64_to_raw(harita.tvar)
	shore = Marshalls.base64_to_raw(harita.shore)
	parlama_shader = load("res://scripts/parlama.gdshader")
	# yazı tipine yedek: ✓ ✗ ▸ gibi işaretler DejaVu'dan, sahnedeki duygu işaretleri (💧 💡 💢 ✨) küçük bir Noto Emoji parçasından
	var yf: Font = ThemeDB.fallback_font
	yf.fallbacks = [load("res://fonts/DejaVuSans.ttf"), load("res://fonts/emoji.ttf")]
	_hud()
	_zemin()
	_kucuk_harita()
	nesneler = Node2D.new()
	nesneler.y_sort_enabled = true
	add_child(nesneler)
	toplama_veri = _json("res://data/toplama.json")
	_agaclar()
	_dugumler()
	oyuncu = preload("res://scripts/oyuncu.gd").new()
	oyuncu.oyun = self
	oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	nesneler.add_child(oyuncu)
	env = preload("res://scripts/envanter.gd").new()
	add_child(env)
	env.kur(self)
	el_yapimi = preload("res://scripts/el_yapimi.gd").new()
	add_child(el_yapimi)
	el_yapimi.kur(self)
	pazar = preload("res://scripts/pazar.gd").new()
	add_child(pazar)
	istasyon = preload("res://scripts/istasyon.gd").new()
	add_child(istasyon)
	istasyon.kur(self)
	pazar.kur(self)
	konusma = preload("res://scripts/konusma.gd").new()
	hud.add_child(konusma)
	konusma.kur(self)
	_kisiler()
	sahne = preload("res://scripts/sahne.gd").new()
	hud.add_child(sahne)
	hud.move_child(sahne, konusma.get_index())
	sahne.kur(self)
	gorev = preload("res://scripts/gorev.gd").new()
	add_child(gorev)
	gorev.kur(self)
	ortam = CanvasModulate.new()
	add_child(ortam)
	mesale = preload("res://scripts/mesale.gd").new()
	add_child(mesale)
	magara = preload("res://scripts/magara.gd").new()
	add_child(magara)
	magara.kur(self)
	mesale.kur(self, magara.M.mesale)
	zaman = preload("res://scripts/zaman.gd").new()
	add_child(zaman)
	zaman.kur(self)
	balon_yazi = Label.new()
	balon_yazi.add_theme_font_size_override("font_size", 14)
	balon_yazi.add_theme_color_override("font_color", Color("#2a1e14"))
	var bst := StyleBoxFlat.new(); bst.bg_color = Color("#fffcf0"); bst.border_color = Color("#3a2a1a"); bst.set_border_width_all(2); bst.set_content_margin_all(5)
	balon_yazi.add_theme_stylebox_override("normal", bst)
	balon_yazi.visible = false
	hud.add_child(balon_yazi)
	toplama = preload("res://scripts/toplama.gd").new()
	toplama.oyun = self
	toplama.env = env
	toplama.G = toplama_veri
	add_child(toplama)
	efekt = preload("res://scripts/efekt.gd").new()
	efekt.z_index = 50
	add_child(efekt)
	kamera = Camera2D.new()
	kamera_sinir()
	oyuncu.add_child(kamera)
	kamera.make_current()
	# canlılar: Tavşanlar dolaşır, kaçar; Kurt oyuncuyu görünce saldırır (web'de Kurt gece çıkar; denemede gündüz de var)
	for i in 3:
		_canli_koy("Tavşan", 10.0)
	_canli_koy("Kurt", 14.0)
	# web derlemesinde adrese ?kurt ya da ?tavsan yazılırsa (denetim için) o canlı oyuncunun 5–7 kare yakınına konur
	if OS.has_feature("web"):
		var q := str(JavaScriptBridge.eval("location.search"))
		if q.contains("kurt"):
			_canli_koy_yakin("Kurt", 6.0)
		if q.contains("tavsan"):
			_canli_koy_yakin("Tavşan", 4.0)
		if q.contains("kemal"):
			oyuncu.position = Vector2(toplama_veri.kisiler[0].x + 20, toplama_veri.kisiler[0].y + 6)
		if q.contains("e1"):
			env.ekle("Dal", 6)
			env.ekle("Kuru ot", 2)
		if q.contains("ders"):
			gorev.ders_goster("chop", 0)
		if q.contains("magara"):
			oyuncu.position = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 30.0)
			env.ekle("Kaba meşale", 2)
			while env.sv < 5:
				env.xp_ekle(200)
			mesale.degistir()
		if q.contains("kayatest"):
			env.ekle("Kaba meşale", 2)
			env.ekle("Yankı mantarı", 4)
			env.ekle("Taş kılıç")
			while env.sv < 10:
				env.xp_ekle(400)
			mesale.degistir()
			magara._gir()
			oyuncu.position = magara.kaya.position + Vector2(18, 10)
		if q.contains("magdogum"):
			env.ekle("Kaba meşale", 2)
			mesale.degistir()
			magara._gir()
		if q.contains("gece"):
			zaman.dk = 1270.0
			zaman.gun = 2
			zaman.mesale_verildi = true
			if q.contains("gece2"): oyuncu.position = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 60.0)
			env.ekle("Dal", 5)
			env.vio_ekle(50)
		if q.contains("pazar"):
			var nz: Dictionary = toplama_veri.kisiler[4]
			oyuncu.position = Vector2(nz.x + 20, nz.y + 8)
			for e in [["Dal", 12], ["Taş", 9], ["Böğürtlen", 4], ["Keskin taş", 3], ["Lif", 5]]:
				env.ekle(e[0], e[1])
		if q.contains("ors"):
			oyuncu.position = Vector2(toplama_veri.istasyon.ors.x - 14, toplama_veri.istasyon.ors.y + 4)
			for e in [["Taş", 6], ["Sopa", 2], ["İp", 4], ["Dal", 2], ["Keskin taş", 4]]:
				env.ekle(e[0], e[1])
			env.vio_ekle(50)
			el_yapimi.bilinen["Mızrak"] = true
		if q.contains("kazan"):
			oyuncu.position = Vector2(toplama_veri.istasyon.kazan.x - 26, toplama_veri.istasyon.kazan.y + 6)
			for e in [["Taş", 6], ["Sopa", 2], ["İp", 4], ["Dal", 2], ["Keskin taş", 4]]:
				env.ekle(e[0], e[1])
			env.vio_ekle(50)
	get_viewport().size_changed.connect(_yakinlik)
	_yakinlik()
	gorunus_uygula(Karakter.gorunus(Karakter.varsayilan("e")))
	sevgili = Karakter.gorunus(Karakter.varsayilan("k"))
	uyanis = preload("res://scripts/uyanis.gd").new()
	hud.add_child(uyanis)
	uyanis.kur(self)
	cine = preload("res://scripts/cine.gd").new()
	hud.add_child(cine)
	cine.kur(self)
	kayit = preload("res://scripts/kayit.gd").new()
	hud.add_child(kayit)
	kayit.kur(self)
	var test := OS.has_feature("web") and str(JavaScriptBridge.eval("location.search")).length() > 1
	var yeni := false
	if not Kayit.bekleyen.is_empty():
		yeni = bool(Kayit.bekleyen.get("yeni", false))
		durum_yukle(Kayit.bekleyen)
		Kayit.bekleyen = {}
	if Kayit.dogrudan or test:
		Kayit.dogrudan = false
		kayit.ana_gizle()
		if yeni or (test and str(JavaScriptBridge.eval("location.search")).contains("giris")):
			cine.oyna(zorluk == "zor", func(): uyanis.basla())
	else:
		kayit.ana_goster()

func _json(p: String) -> Dictionary:
	var f := FileAccess.open(p, FileAccess.READ)
	return JSON.parse_string(f.get_as_text())

## web: S = max(2, round(min(ekran) / 260)); dünya pikseli başına ekran pikseli
func _yakinlik() -> void:
	var v := get_viewport().get_visible_rect().size
	var s := maxf(2.0, roundf(minf(v.x, v.y) / 260.0))
	kamera.zoom = Vector2(s, s)

# ------------------------------------------------------------------ zemin
## web v425karo: Çayır çimi, orman zemini, kum ve suların karoları ComfyUI'de çizilmiş 128 px dikişsiz dokulardan gelir;
## bir karo dokunun dünyadaki yerine düşen parçasını alır (x mod 8, y mod 8), yan yana karolar kesintisiz birleşir.
## Dokusu olmayan türler (öbür biyomlar) web'in eski karo setinden (TILEC, tvar) çizilir.
func _zemin() -> void:
	var ts := TileSet.new()
	ts.tile_size = Vector2i(T, T)
	var eski := TileSetAtlasSource.new()
	eski.texture = load("res://art/karolar.png")
	eski.texture_region_size = Vector2i(T, T)
	for k in 21:
		for v in 8:
			eski.create_tile(Vector2i(v, k))
	ts.add_source(eski, 0)
	var doku := {}
	for k in 6:
		var yol := "res://art/zemin_%d.png" % k
		if not ResourceLoader.exists(yol):
			continue
		var src := TileSetAtlasSource.new()
		src.texture = load(yol)
		src.texture_region_size = Vector2i(T, T)
		var n := int(src.texture.get_width() / T)
		for y in n:
			for x in n:
				src.create_tile(Vector2i(x, y))
		ts.add_source(src, 1 + k)
		doku[k] = n
	var tm := TileMapLayer.new()
	tm.tile_set = ts
	tm.z_index = -10
	add_child(tm)
	for y in bh:
		for x in bw:
			var kv := int(tvar[y * bw + x])
			var k := kv >> 3
			if doku.has(k):
				var n: int = doku[k]
				tm.set_cell(Vector2i(bx0 + x, by0 + y), 1 + k, Vector2i((bx0 + x) % n, (by0 + y) % n))
			else:
				tm.set_cell(Vector2i(bx0 + x, by0 + y), 0, Vector2i(kv % 8, kv / 8))
	var su := preload("res://scripts/su.gd").new()
	su.oyun = self
	su.z_index = -9
	add_child(su)

func bio_at(p: Vector2) -> int:
	var x := int(p.x / T) - bx0
	var y := int(p.y / T) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh or bio_arr.is_empty():
		return -1
	return int(bio_arr[y * bw + x])

func tile_at(p: Vector2) -> int:
	if magara != null and magara.icinde:
		return 1
	var x := int(floor(p.x / T)) - bx0
	var y := int(floor(p.y / T)) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh:
		return 4
	return tiles[y * bw + x]

static func su_mu(t: int) -> bool:
	return t >= 3

## web blocked(): kutunun dört köşesinden biri sudaysa ya da bir ağaç gövdesine değiyorsa geçilmez
func engel(p: Vector2, half: float = 5.0) -> bool:
	if magara != null:
		if magara.icinde:
			return magara.engel(p, half)
		if magara.kapi_engel(p):
			return true
	for d in [Vector2(-half, -half), Vector2(half, -half), Vector2(-half, half), Vector2(half, half)]:
		if su_mu(tile_at(p + d)):
			return true
	var cx := int(floor(p.x / 32.0))
	var cy := int(floor(p.y / 32.0))
	for gy in range(cy - 1, cy + 2):
		for gx in range(cx - 1, cx + 2):
			var L = agac_izgara.get(Vector2i(gx, gy))
			if L == null:
				continue
			for t in L:
				if absf(t.x - p.x) < half + 4.0 and absf(t.y + 2.0 - p.y) < half + 3.0:
					return true
	return false

# ------------------------------------------------------------------ ağaçlar (ComfyUI resimleri, web v424dunya)
func _agaclar() -> void:
	var resim: Dictionary = dunya.agacResimleri
	for a in dunya.agaclar:
		var R: Dictionary = resim[a.key]
		var n := preload("res://scripts/agac.gd").new()
		n.position = Vector2(a.x, a.y)
		n.kur(load(R.file), int(R.bot), a.seed if a.has("seed") else int(a.x * 7 + a.y))
		n.oyun = self
		n.tur = a.k
		nesneler.add_child(n)
		agaclar.append(n)
		var k := Vector2i(int(floor(a.x / 32.0)), int(floor(a.y / 32.0)))
		if not agac_izgara.has(k):
			agac_izgara[k] = []
		agac_izgara[k].append(Vector2(a.x, a.y))

# ------------------------------------------------------------------ yerdeki toplanabilirler (bu adımda yalnız görünür)
func _dugumler() -> void:
	var resim: Dictionary = dunya.dugumResimleri
	for d in dunya.dugumler:
		if not resim.has(d.n):
			continue
		var R: Dictionary = resim[d.n]
		# v > 0.5: web draws these kinds in their second look (mirrored or the other picture), captured as "b"
		if float(d.v) > 0.5 and R.has("b"):
			R = R.b
		var k := float(resim[d.n].get("k", 1))
		var s := preload("res://scripts/dugum.gd").new()
		s.ad = d.n
		s.texture = load(R.file)
		s.centered = false
		s.offset = Vector2(-float(R.ox), -float(R.oy))
		# captured k times finer than the world: same size in the world, the web's detail on screen
		s.scale = Vector2(1.0 / k, 1.0 / k)
		s.position = Vector2(d.x, d.y)
		# maden kayası web'de birkaç kazmada tükenir (left); böğürtlen çalısı 3 kez toplanır
		s.bas_kalan = 3 if (d.mine or (toplama_veri.nodes.has(d.n) and toplama_veri.nodes[d.n].bush)) else 1
		s.kalan = s.bas_kalan
		dugumler.append(s)
		nesneler.add_child(s)

# ------------------------------------------------------------------ canlılar
func _canli_koy_yakin(k: String, min_kare: float) -> void:
	_canli_koy(k, min_kare, 2.0)

func _canli_koy(k: String, min_kare: float, aralik: float = 14.0) -> void:
	var D: Dictionary = canlilar[k]
	var land: Array = D.landTiles
	for deneme in 300:
		var p := oyuncu.position + Vector2.from_angle(rng.randf() * TAU) * rng.randf_range(min_kare, min_kare + aralik) * T
		if not land.has(float(tile_at(p))) or engel(p, 6.0):
			continue
		var d := p.distance_to(oyuncu.position)
		if d < min_kare * T or d > (min_kare + aralik) * T:
			continue
		var c := preload("res://scripts/canli.gd").new()
		c.oyun = self
		c.tur = k
		c.D = D
		c.position = p
		nesneler.add_child(c)
		return

func canli_oldu(k: String, c = null) -> void:
	if gorev: gorev.av(k)
	if magara != null and c != null and c.cvb:
		magara.boss_oldu()
	if magara != null and magara.icinde:
		return
	# yerine bir süre sonra yenisi gelir (deneme kolaylığı için)
	await get_tree().create_timer(12.0).timeout
	_canli_koy(k, 12.0)

func canlilari_ver() -> Array:
	var out := []
	for c in nesneler.get_children():
		if c.has_method("vuruldu") and c.hp > 0:
			out.append(c)
	return out

# ------------------------------------------------------------------ ekrandaki yazılar ve göstergeler
func _hud() -> void:
	hud = CanvasLayer.new()
	add_child(hud)
	var kutu := VBoxContainer.new()
	kutu.position = Vector2(12, 10)
	hud.add_child(kutu)
	can_cubugu = ProgressBar.new()
	can_cubugu.custom_minimum_size = Vector2(180, 14)
	can_cubugu.show_percentage = false
	can_cubugu.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	can_cubugu.max_value = float(oyuncu_veri.hp)
	can_cubugu.value = float(oyuncu_veri.hp)
	var bg := StyleBoxFlat.new(); bg.bg_color = Color("#5a2a26"); bg.border_color = Color("#0b0f0a"); bg.set_border_width_all(2)
	var fg := StyleBoxFlat.new(); fg.bg_color = Color("#8fd46b")
	can_cubugu.add_theme_stylebox_override("background", bg)
	can_cubugu.add_theme_stylebox_override("fill", fg)
	kutu.add_child(can_cubugu)
	silah_yazi = Label.new()
	_golge(silah_yazi)
	kutu.add_child(silah_yazi)
	var yardim := Label.new()
	yardim.text = "WASD / oklar: yürü · Shift: koş · Q ya da sol tık: vur · Boşluk: atıl · F: topla · X: ye · I: çanta · Tab: el yapımı · K: tarif kitabı · 1–5: kemer · G: deneme (aletler ve 100 Vio)\nKol: sol çubuk yürü · L3 koş · X ya da RT vur · B atıl · A topla · LB ye · Y kemer · Back çanta · Start el yapımı"
	yardim.add_theme_font_size_override("font_size", 12)
	_golge(yardim)
	yardim.add_theme_font_size_override("font_size", 11)
	kutu.add_child(yardim)
	yardim.position.y -= 4
	var ver := Label.new()
	ver.text = SURUM + " · veri: " + str(harita.meta.surum)
	ver.add_theme_font_size_override("font_size", 12)
	_golge(ver)
	hud.add_child(ver)
	ver.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT, Control.PRESET_MODE_MINSIZE, 10)
	ver.grow_horizontal = Control.GROW_DIRECTION_BEGIN

func _golge(l: Label) -> void:
	l.add_theme_color_override("font_color", Color("#fff6dc"))
	l.add_theme_color_override("font_outline_color", Color("#14100c"))
	l.add_theme_constant_override("outline_size", 4)

func can_guncelle(hp: float, mx: float) -> void:
	can_cubugu.max_value = mx
	can_cubugu.value = hp
	var k := hp / mx
	var fg := can_cubugu.get_theme_stylebox("fill") as StyleBoxFlat
	fg.bg_color = Color("#8fd46b") if k > 0.5 else (Color("#f2b84b") if k > 0.25 else Color("#e8775a"))

func yazi(p: Vector2, metin: String, renk: Color, boy: int = 8) -> void:
	efekt.yazi(p, metin, renk, boy)

func parca(p: Vector2, v: Vector2, omur: float, renk: Color) -> void:
	efekt.parca(p, v, omur, renk)

# ------------------------------------------------------------------ küçük harita (sağ alt): ada, biyom renkleri, oyuncunun yeri
var kh_nokta: ColorRect
var kh_olcek := 0.0
func _kucuk_harita() -> void:
	var bio := Marshalls.base64_to_raw(harita.bio)
	bio_arr = bio
	var BR := [Color("#7fb04a"), Color("#3f7a3a"), Color("#6b7440"), Color("#8a8580"), Color("#5a3a36"), Color("#7a5aa8")]
	var img := Image.create(bw, bh, false, Image.FORMAT_RGBA8)
	for y in bh:
		for x in bw:
			var i := y * bw + x
			var k := tiles[i]
			var c: Color
			if k == 4: c = Color("#2a6db0")
			elif k == 3 or k == 5: c = Color("#4a9ad8")
			elif k == 2: c = Color("#e6d39a")
			else: c = BR[mini(int(bio[i]), 5)]
			img.set_pixel(x, y, c)
	var tr := TextureRect.new()
	kh_resim = tr
	tr.texture = ImageTexture.create_from_image(img)
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kh_olcek = 220.0 / float(bw)
	tr.custom_minimum_size = Vector2(bw, bh) * kh_olcek
	tr.size = tr.custom_minimum_size
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	var cer := PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.05, 0.07, 0.05, 0.85); st.border_color = Color("#0b0f0a"); st.set_border_width_all(2)
	cer.add_theme_stylebox_override("panel", st)
	cer.add_child(tr)
	hud.add_child(cer)
	cer.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_RIGHT, Control.PRESET_MODE_MINSIZE, 10)
	kh_nokta = ColorRect.new()
	kh_nokta.color = Color("#ffd84a")
	kh_nokta.size = Vector2(4, 4)
	tr.add_child(kh_nokta)

func _process(_d: float) -> void:
	if kh_nokta and oyuncu:
		if magara != null and magara.icinde:
			kh_nokta.position = magara.harita_nokta() - Vector2(2, 2)
		else:
			kh_nokta.position = oyuncu.position / float(T) * kh_olcek - Vector2(2, 2)

## web treeChopped (v65): üç kesimde ağaç devrilir; 200–300 sn sonra aynı biyomda başka bir yerde yenisi büyür
func agac_devrildi(ag) -> void:
	for k in 14:
		parca(ag.position + Vector2(randf_range(-10, 10), -10 - randf() * 20), Vector2(randf_range(-20, 20), -20 - randf() * 30), 0.7, Color("#6a4426") if k % 2 else Color("#4a8a3a"))
	ag.visible = false
	var bio := Marshalls.base64_to_raw(harita.bio)
	var b0 := int(bio[int(ag.position.y / T) * bw + int(ag.position.x / T)])
	await get_tree().create_timer(rng.randf_range(float(toplama_veri.treeRegrow[0]), float(toplama_veri.treeRegrow[1]))).timeout
	for deneme in 400:
		var x := rng.randi_range(2, bw - 3)
		var y := rng.randi_range(2, bh - 3)
		var i := y * bw + x
		if tiles[i] > 1 or int(bio[i]) != b0:
			continue
		var p := Vector2(x * T + 8, y * T + 8)
		if p.distance_to(oyuncu.position) < 200.0:
			continue
		ag.position = p
		ag.kesim = 0
		ag.visible = true
		return

# ------------------------------------------------------------------ Çayır'ın kişileri, kazan ve örsler
func _kisiler() -> void:
	for k in toplama_veri.kisiler:
		var n := preload("res://scripts/kisi.gd").new()
		n.kur(self, k)
		nesneler.add_child(n)
		kisiler.append(n)
	var I: Dictionary = toplama_veri.istasyon
	for a in [["kazan", I.kazan], ["ors", I.ors], ["ors", I.ors2]]:
		var o := Node2D.new()
		o.position = Vector2(a[1].x, a[1].y)
		o.set_meta("tur", a[0])
		o.draw.connect(_istasyon_ciz.bind(o))
		nesneler.add_child(o)

## kazan: kara kazan, mor buhar; örs: gri örs ve kütük (web'in kendi çizimleri sonra aktarılacak)
func _istasyon_ciz(o: Node2D) -> void:
	if o.get_meta("tur") == "kazan":
		o.draw_circle(Vector2(0, 1), 8.0, Color(0, 0, 0, 0.25))
		o.draw_rect(Rect2(-7, -9, 14, 9), Color("#1e1a22"))
		o.draw_rect(Rect2(-8, -10, 16, 2), Color("#3a3240"))
		o.draw_rect(Rect2(-6, -9, 12, 2), Color("#7a4ad8"))
		o.draw_rect(Rect2(-5, 0, 2, 2), Color("#2a2420")); o.draw_rect(Rect2(3, 0, 2, 2), Color("#2a2420"))
	else:
		o.draw_rect(Rect2(-5, -4, 10, 5), Color("#5a3d22"))
		o.draw_rect(Rect2(-7, -9, 14, 4), Color("#6a6e74"))
		o.draw_rect(Rect2(-9, -9, 3, 2), Color("#6a6e74"))
		o.draw_rect(Rect2(-6, -9, 12, 1), Color("#9aa0a8"))

## F: toplanacak bir şey yoksa yakındaki kişi (görev işi varsa önce o), kazan, örs ya da kişinin kendi hizmeti (web target sırası)
func konus_ya_da_istasyon() -> bool:
	var p: Vector2 = oyuncu.position
	var yakin = null
	for n in kisiler:
		if p.distance_to(n.position) < 30.0 and (yakin == null or p.distance_to(n.position) < p.distance_to(yakin.position)):
			yakin = n
	if yakin != null and gorev.konus(gorev.g_of(yakin.K.k), _hizmet(yakin.K.k)):
		return true
	var I: Dictionary = toplama_veri.istasyon
	if p.distance_to(Vector2(I.kazan.x, I.kazan.y)) < 26.0:
		istasyon.ac("kazan")
		return true
	if p.distance_to(Vector2(I.ors.x, I.ors.y)) < 20.0:
		istasyon.ac("smith")
		return true
	if p.distance_to(Vector2(I.ors2.x, I.ors2.y)) < 18.0:
		istasyon.ac("durmus")
		return true
	if yakin != null:
		_konus(yakin)
		return true
	return false

func _hizmet(k: String) -> Dictionary:
	match k:
		"witch": return {t = "Kazana bak", f = func(): istasyon.ac("kazan")}
		"smith": return {t = "Örse bak", f = func(): istasyon.ac("smith")}
		"durmus": return {t = "Örse bak", f = func(): istasyon.ac("durmus")}
		"market": return {t = "Pazara bak", f = func(): pazar.ac()}
	return {}

const SELAM := {"ekin": "Ateş sıcak, çay demde. Otur biraz evlat.", "market": "Hoş geldin! Tezgâhım yakında açılacak; satacak bir şeyin olursa unutma beni.", "alp": "Kılıcını hep elinin altında tut. Bu adada her çalının ardında bir diş vardır."}

func _konus(n) -> void:
	var K: Dictionary = n.K
	var por = load(K.portre) if K.portre != null else null
	match K.k:
		"witch":
			konusma.ac(K.ad, por, "Kazanım hep kaynar evlat. Yeni bir şey bulduğunda gel; malzemelerini kazana atarsın, tarifi öğrenirsin.", [{t = "Kazana bak", pri = true, f = func(): istasyon.ac("kazan")}, {t = "Sonra", kapat = true}])
		"smith":
			konusma.ac(K.ad, por, "Tarifini bildiğin aleti ve silahı örsümde döverim; malzemeyi sen getir, işçiliğimi ödersin.", [{t = "Örse bak", pri = true, f = func(): istasyon.ac("smith")}, {t = "Sonra", kapat = true}])
		"durmus":
			konusma.ac(K.ad, por, "Zırh benim işim. Tarifini bildiğin zırhı malzemesi ve işçiliğiyle döverim.", [{t = "Örse bak", pri = true, f = func(): istasyon.ac("durmus")}, {t = "Sonra", kapat = true}])
		"market":
			konusma.ac(K.ad, por, "Hoş geldin! Silah, zırh, takı ve aletler dışında her şeyi alırım; eline geçmiş doğal malzemeleri ve tarifini bildiğin eşyaları da satarım.", [{t = "Pazara bak", pri = true, f = func(): pazar.ac()}, {t = "Sonra", kapat = true}])
		_:
			konusma.ac(K.ad, por, SELAM.get(K.k, "Merhaba!"))

func kamera_sinir() -> void:
	kamera.limit_left = bx0 * T; kamera.limit_top = by0 * T
	kamera.limit_right = (bx0 + bw) * T; kamera.limit_bottom = (by0 + bh) * T

## dünyanın rengi: mağaranın karanlığı × sahnenin tonu (sepya, gece)
func renk_guncelle() -> void:
	ortam.color = taban_renk * sahne_renk

func sahne_rengi(c: Color) -> void:
	sahne_renk = c
	renk_guncelle()

func menu_acik() -> bool:
	return kayit != null and kayit.ic.visible

## karakterin kısa sözü başının üstünde (web bubble)
func balon(t: String, sure: float) -> void:
	balon_yazi.text = t
	balon_yazi.visible = true
	balon_yazi.reset_size()
	balon_t = sure

func _physics_process(dt: float) -> void:
	if balon_t > 0.0:
		balon_t -= dt
		var s: Vector2 = get_viewport().get_canvas_transform() * (oyuncu.position + Vector2(0, -40))
		balon_yazi.position = s - Vector2(balon_yazi.size.x / 2.0, balon_yazi.size.y)
		if balon_t <= 0.0: balon_yazi.visible = false
	# çantanın üstüne yürüyünce her şey geri gelir
	for m in mezarlar.duplicate():
		if m.p.distance_to(oyuncu.position) < 14.0 and not oyuncu.bayildi:
			var n := 0
			for k in m.inv:
				env.ekle(k, int(m.inv[k])); n += int(m.inv[k])
			env.vio_ekle(int(m.vio))
			for i in 16: parca(m.p + Vector2(0, -4), Vector2(randf_range(-25, 25), -20 - randf() * 40), 0.7, Color("#c9a0ff") if i % 2 else Color.WHITE)
			env.mesaj("Eşyalarını geri aldın: %d malzeme%s" % [n, (", %d Vio" % int(m.vio)) if int(m.vio) > 0 else ""])
			m.dugum.queue_free()
			mezarlar.erase(m)

# ------------------------------------------------------------------ bayılma (web faint, deathDrop, deathTalk; belge: Hayatta kalma › Bayılma)
## taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) %20'si ve Vio'nun %20'si gider (ilk gece hiçbir şey gitmez);
## kalanı düştüğün yerde bir çantada kalır (kurukafa). Kumsalda can %50 ile uyanırsın; Kemal seni bulduğunu anlatır.
const KEMAL_ALAY := ["Gece karanlıktır evlat, öğreneceksin bunları! Sabah seni burada, yüzüstü buldum.", "Yine mi? Gece karanlıktır evlat! Ateşin ya da meşalen yoksa karanlıkta durmayacaksın.", "Hah, bizim gece kuşu uyanmış! Karanlıkta ışıksız gezilmez evlat, kaç kere söyleyeceğim?", "Seni yine taşıdım buraya. Gece karanlıktır, karanlık da açtır. Meşalesiz çıkma!"]
var ilk_gece_bayilma := true
func bayil(sebep: String) -> void:
	if oyuncu.bayildi: return
	oyuncu.bayildi = true
	oyuncu.rotation = PI / 2
	var gece := sebep == "gece"
	var kayip := 0.0 if zaman.ilk_gece() else 0.2
	var yer: Vector2 = oyuncu.position
	if magara.icinde: yer = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 30.0)
	var m := {p = yer, inv = {}, vio = 0}
	var gitti := 0
	for n in env.inv.keys():
		var q: int = env.adet(n)
		if q <= 0 or toplama_veri.tools.has(n) or n == "Taş kılıç" or (el_yapimi.R.has(n) and el_yapimi.R[n].place) or n == "Kaba meşale" or n == "Meşale":
			continue
		var l := int(round(q * kayip))
		gitti += l
		if q - l > 0: m.inv[n] = q - l
		env.eksilt(n, q)
	var lv := int(round(env.vio * kayip))
	m.vio = env.vio - lv
	env.vio_ekle(-env.vio)
	var cantali: bool = not m.inv.is_empty() or int(m.vio) > 0
	if cantali:
		var d := Node2D.new()
		d.position = yer
		d.draw.connect(_mezar_ciz.bind(d))
		nesneler.add_child(d)
		m.dugum = d
		mezarlar.append(m)
	await get_tree().create_timer(1.2).timeout
	if magara.icinde: magara._cik(true, true)
	for c in canlilari_ver(): c.queue_free()
	oyuncu.rotation = 0
	oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	oyuncu.hp = round(oyuncu.hp_max * 0.5)
	can_guncelle(oyuncu.hp, oyuncu.hp_max)
	env.tokluk = maxf(env.tokluk, 30.0)
	kamera.reset_smoothing()
	oyuncu.bayildi = false
	for i in 3: _canli_koy("Tavşan", 10.0)
	await get_tree().create_timer(1.6).timeout
	var ne := ""
	if gece:
		ne = "Gece karanlıktır evlat, öğreneceksin bunları! Sabah seni kıyıda baygın buldum. Mor bir ışık mı? …Karanlıkta bir şey var, ışıktan korkar. Ya bir ateşin yanında kal ya da meşalen elinde olsun." if ilk_gece_bayilma else KEMAL_ALAY.pick_random()
		ilk_gece_bayilma = false
	else:
		ne = "Kıyıda baygın yatıyordun evlat, dalgalar seni yine bana getirdi."
	if cantali:
		ne += " Çantan ve Vio'ların [b]düştüğün yerde[/b] kaldı; git, kalanını geri al."
		if gitti > 0 or lv > 0: ne += " Bir kısmı çoktan gitmiş (%%20%s)." % ((", %d Vio" % lv) if lv > 0 else "")
	if kayip == 0.0: ne += " Neyse ki çantana kimse dokunmamış; ama bir dahaki gece bu kadar şanslı olmayabilirsin."
	var K: Dictionary = toplama_veri.kisiler[0]
	konusma.ac(K.ad, load(K.portre), ne, [{t = ("Öğrendim, öğrendim…" if gece and not ilk_gece_bayilma else ("Gidip alacağım" if cantali else "Anladım")), pri = true, kapat = true}])

func _mezar_ciz(d: Node2D) -> void:
	var px := func(x: float, y: float, w: float, h: float, c: Color): d.draw_rect(Rect2(x, y, w, h), c)
	d.draw_set_transform(Vector2(0, 3), 0, Vector2(8, 2.5)); d.draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.25)); d.draw_set_transform(Vector2.ZERO)
	px.call(-7, 0, 6, 2, Color("#e8e0d0")); px.call(1, 1, 6, 2, Color("#d8d0c0")); px.call(-8, -1, 2, 4, Color("#f4ecdc")); px.call(6, 0, 2, 4, Color("#f4ecdc"))
	px.call(-3, -8, 7, 6, Color("#f4ecdc")); px.call(-2, -9, 5, 1, Color("#f4ecdc")); px.call(-2, -6, 2, 2, Color("#2a1f2a")); px.call(1, -6, 2, 2, Color("#2a1f2a"))
	px.call(0, -3, 1, 1, Color("#2a1f2a")); px.call(-2, -2, 5, 1, Color("#d8d0c0"))

# ------------------------------------------------------------------ kayıt: oyunun durumu
func durum_al() -> Dictionary:
	var p: Vector2 = oyuncu.position
	if magara.icinde: p = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 24.0)
	var G = gorev
	var ak = null
	if G.aktif != null: ak = G.aktif if G.aktif.has("filler") else G.aktif.id
	var mz := []
	for m in mezarlar: mz.append({x = m.p.x, y = m.p.y, inv = m.inv, vio = m.vio})
	return {
		oyuncu = {x = p.x, y = p.y, hp = oyuncu.hp},
		env = {inv = env.inv, kemer = env.kemer, el = env.el, tokluk = env.tokluk, dayan = env.dayan, gorulen = env.gorulen.keys(), vio = env.vio, xp = env.xp, sv = env.sv},
		tarifler = el_yapimi.bilinen.keys(),
		gorev = {aktif = ak, b = G.b, bitenler = G.bitenler, kills = G.kills, biyomlar = G.biyomlar.keys(), dovulen = G.dovulen.keys(), dersler = G.gorulen_dersler},
		mesale = {ts = mesale.ts, yaniyor = mesale.yaniyor, yanma = mesale.yanma},
		magara = {gorulen = magara.gorulen, acilan = Marshalls.raw_to_base64(magara.acilan), kaya = 1 if magara.kaya_durum == 2 else magara.kaya_durum, denedi = magara.kaya_denedi or magara.kaya_durum == 2, boss = magara.boss_yenildi},
		zaman_oyun = {dk = zaman.dk, gun = zaman.gun, mesale_verildi = zaman.mesale_verildi, ilk_bayilma = ilk_gece_bayilma},
		mezarlar = mz, kahraman = gorunus, sevgili = sevgili, zorluk = zorluk, adlar = {kahraman = ad_kahraman, sevgili = ad_sevgili}}

func gorunus_uygula(L: Dictionary) -> void:
	gorunus = L
	oyuncu.spr.texture = Karakter.sayfa(L)

func durum_yukle(d: Dictionary) -> void:
	if d.has("kahraman"): gorunus_uygula(d.kahraman)
	if d.has("sevgili"): sevgili = d.sevgili
	zorluk = str(d.get("zorluk", "normal"))
	var ad: Dictionary = d.get("adlar", {})
	ad_kahraman = str(ad.get("kahraman", "")); ad_sevgili = str(ad.get("sevgili", ""))
	if d.get("yeni", false): return
	var o: Dictionary = d.get("oyuncu", {})
	if o.has("x"): oyuncu.position = Vector2(o.x, o.y)
	var e: Dictionary = d.get("env", {})
	env.inv = {}
	for k in e.get("inv", {}): env.inv[k] = int(e.inv[k])
	var km: Array = e.get("kemer", [])
	for i in mini(5, km.size()): env.kemer[i] = km[i]
	env.el = int(e.get("el", -1))
	env.tokluk = float(e.get("tokluk", env.tokluk))
	env.dayan = {}
	for k in e.get("dayan", {}): env.dayan[k] = float(e.dayan[k])
	env.gorulen = {}
	for k in e.get("gorulen", []): env.gorulen[k] = true
	env.sv = int(e.get("sv", 1)); env.xp = int(e.get("xp", 0))
	env.vio = 0; env.vio_ekle(int(e.get("vio", 0)))
	env._sv_ciz()
	env.kemer_ciz()
	el_yapimi.bilinen = {}
	for k in d.get("tarifler", []): el_yapimi.bilinen[k] = true
	var g: Dictionary = d.get("gorev", {})
	var G = gorev
	G.bitenler = g.get("bitenler", [])
	G.kills = {}
	for k in g.get("kills", {}): G.kills[k] = int(g.kills[k])
	G.biyomlar = {}
	for k in g.get("biyomlar", [0]): G.biyomlar[int(k)] = true
	G.dovulen = {}
	for k in g.get("dovulen", []): G.dovulen[k] = true
	G.gorulen_dersler = g.get("dersler", [])
	G.b = g.get("b", {})
	var ak = g.get("aktif", null)
	if ak is Dictionary: G.aktif = ak
	elif ak is String and G.QI.has(ak): G.aktif = G.QI[ak]
	else: G.aktif = null
	G.yenile()
	var ms: Dictionary = d.get("mesale", {})
	mesale.ts = ms.get("ts", null)
	mesale.yaniyor = bool(ms.get("yaniyor", false))
	mesale.yanma = ms.get("yanma", {})
	var mg: Dictionary = d.get("magara", {})
	magara.gorulen = bool(mg.get("gorulen", false))
	if mg.has("acilan"):
		var a := Marshalls.base64_to_raw(mg.acilan)
		if a.size() == magara.acilan.size(): magara.acilan = a
	magara.kaya_durum = int(mg.get("kaya", 0))
	magara.kaya_denedi = bool(mg.get("denedi", false))
	magara.boss_yenildi = bool(mg.get("boss", false))
	var z: Dictionary = d.get("zaman_oyun", {})
	zaman.dk = float(z.get("dk", 360.0)); zaman.gun = int(z.get("gun", 1))
	zaman.mesale_verildi = bool(z.get("mesale_verildi", false))
	ilk_gece_bayilma = bool(z.get("ilk_bayilma", true))
	for m in d.get("mezarlar", []):
		var dg := Node2D.new()
		dg.position = Vector2(m.x, m.y)
		dg.draw.connect(_mezar_ciz.bind(dg))
		nesneler.add_child(dg)
		mezarlar.append({p = dg.position, inv = m.inv, vio = int(m.vio), dugum = dg})
	oyuncu.hp = float(o.get("hp", oyuncu.hp_max))
	can_guncelle(oyuncu.hp, oyuncu.hp_max)
	kamera.reset_smoothing()
