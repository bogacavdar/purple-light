## Adım 0 · Deneme: Çayır'ın oyuncunun başladığı 80×60 karelik parçası.
## Bütün sayılar ve resimler web oyunundan otomatik dökülür (godot/tools/disa_aktar.js → data/*.json, art/*.png).
extends Node2D

const SURUM := "Godot · Adım 1a"

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
	_hud()
	_zemin()
	_kucuk_harita()
	nesneler = Node2D.new()
	nesneler.y_sort_enabled = true
	add_child(nesneler)
	_agaclar()
	_dugumler()
	oyuncu = preload("res://scripts/oyuncu.gd").new()
	oyuncu.oyun = self
	oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	nesneler.add_child(oyuncu)
	efekt = preload("res://scripts/efekt.gd").new()
	efekt.z_index = 50
	add_child(efekt)
	kamera = Camera2D.new()
	kamera.limit_left = bx0 * T; kamera.limit_top = by0 * T
	kamera.limit_right = (bx0 + bw) * T; kamera.limit_bottom = (by0 + bh) * T
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
	get_viewport().size_changed.connect(_yakinlik)
	_yakinlik()

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

func tile_at(p: Vector2) -> int:
	var x := int(floor(p.x / T)) - bx0
	var y := int(floor(p.y / T)) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh:
		return 4
	return tiles[y * bw + x]

static func su_mu(t: int) -> bool:
	return t >= 3

## web blocked(): kutunun dört köşesinden biri sudaysa ya da bir ağaç gövdesine değiyorsa geçilmez
func engel(p: Vector2, half: float = 5.0) -> bool:
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
		var s := Sprite2D.new()
		s.texture = load(R.file)
		s.centered = false
		s.offset = Vector2(-float(R.ox), -float(R.oy))
		# captured k times finer than the world: same size in the world, the web's detail on screen
		s.scale = Vector2(1.0 / k, 1.0 / k)
		s.position = Vector2(d.x, d.y)
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

func canli_oldu(k: String) -> void:
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
	yardim.text = "WASD / oklar: yürü · Shift: koş · Q ya da sol tık: vur · Boşluk: atıl · 1: Taş kılıç / yumruk\nKol: sol çubuk yürü · L3 koş · X ya da RT vur · B atıl · Y silah"
	yardim.add_theme_font_size_override("font_size", 12)
	_golge(yardim)
	hud.add_child(yardim)
	yardim.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_LEFT, Control.PRESET_MODE_MINSIZE, 10)
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
		kh_nokta.position = oyuncu.position / float(T) * kh_olcek - Vector2(2, 2)
