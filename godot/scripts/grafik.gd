extends Node
## Godot'ya özgü durağan görsel güzelleştirmeler (belge Godot › Grafik; 28 Kasım 2026, Boğaç: kamera sallantısı, hareket bulanıklığı
## gibi ekranı oynatan efektler olmaz, yalnızca durağan güzelleştirmeler):
## 1) Biyom renk havası: her biyomun dünyaya hafif kendi tonu (gece, mağara, sahne renkleriyle çarpılır), biyom değişince 2 sn'de geçer.
## 3) Parıltı: kristaller, ışıklı bitkiler ve ateşli taşlar karanlıkta (gece, mağara) kendi renginde hafifçe ışır ve yavaşça nefes alır;
##    oyuncuya en yakın 12 tanesi ışık alır (her 0,4 sn'de yeniden seçilir), gündüz kapalı.
## 4) Gölge: maden kayalarının ve çalıların altında yumuşak, yassı bir gölge (ağaçların ve canlıların gölgesi zaten var).
## 5) Ortam parçacıkları (ekranda görülen yerde, en çok 46): gece Orman'da ve Bataklık'ta (yazın Çayır'da da) yanıp sönen ateş böcekleri,
##    ilkbahar-yaz gündüzü Çayır'da uçuşan tohum tüyleri, sonbaharda Orman'da düşen yapraklar, Kül'de yükselen kor kıvılcımları,
##    Mor Kristal'de süzülen mor pırıltılar. Gece karanlığından etkilenmez (kendi katında çizilir); mağarada yok.
## 6) Kabartmalı ışık: ağaçların, yerdeki şeylerin ve kahramanın ışık haritası (art/…_n.png, tools/normal_uret.py) vardır;
##    meşale, kamp ateşi, parıltı gibi ışıklar onlara yandan vurunca hacimli görünürler (gündüz fark yoktur). Işıklar 150 px yükseklikten vurur (gölge tarafı hafif kararır, okunurluk korunur).
## 2) Rüzgâr: ağaçlar, çalılar ve otlar tepeden hafifçe salınır (kökü yerinde); yağmurda, karda, kül fırtınasında daha çok.

var oyun
var renk := Color.WHITE
const BIYOM_RENK := [Color(1.0, 1.0, 1.0), Color(0.95, 1.0, 0.95), Color(0.9, 0.97, 0.86), Color(0.96, 0.97, 1.0),
	Color(1.0, 0.9, 0.82), Color(0.9, 0.87, 1.0)]
## sallanmayan yer malzemeleri (taş, toprak, kil, kabuk, mantar…); maden kayaları zaten sallanmaz
const SALLANMAZ := ["Dal", "Taş", "Çakmaktaşı", "Nehir çakılı", "Kum", "Tatlısu midyesi", "Turba", "Göl kili", "Kırmızı kil", "Beyaz kil",
	"Kül", "Kehribar", "Kırmızı okr", "Sarı okr", "Lav camı", "Kara tuz", "Ay taşı", "Yankı taşı", "Yıldız tozu", "Yabani bal",
	"Sinek mantarı", "Kayın mantarı", "Işık mantarı", "Liken", "Yosun", "Mor yosun", "Yaprak"]

const RUZGAR := """
shader_type canvas_item;
uniform float taban = 0.0;
uniform float guc = 1.0;
void vertex() {
	vec2 w = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
	float yuk = max(0.0, taban - VERTEX.y);
	float s = sin(TIME * 1.7 + w.x * 0.045 + w.y * 0.02) * 0.6 + sin(TIME * 2.9 + w.x * 0.11) * 0.4;
	VERTEX.x += s * guc * yuk * 0.028;
}
"""
var mat_agac: ShaderMaterial
var mat_ot: ShaderMaterial
var _guc := 1.0
var _kuruldu := false

func kur(o) -> void:
	oyun = o
	var sh := Shader.new()
	sh.code = RUZGAR
	mat_agac = ShaderMaterial.new(); mat_agac.shader = sh; mat_agac.set_shader_parameter("taban", 6.0)
	mat_ot = ShaderMaterial.new(); mat_ot.shader = sh; mat_ot.set_shader_parameter("taban", 0.0)

## ağaç ve otlara rüzgâr malzemesi (dünya kurulduktan sonra bir kez; sonradan eklenen otlar dugum_ekle'den)
func ruzgar_ver() -> void:
	_kuruldu = true
	for a in oyun.agaclar:
		if is_instance_valid(a) and a.spr != null:
			a.spr.material = mat_agac
			a.spr.texture = kabart(a.spr.texture)

	for d in oyun.dugumler: ot_ver(d)

class Golge extends Node2D:
	var w := 10.0
	func _draw() -> void:
		for i in 3:
			var k := 1.0 - i * 0.28
			draw_set_transform(Vector2(1, 1), 0.0, Vector2(w * k, w * 0.32 * k))
			draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.09))
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

var _nm := {}
## resmin ışık haritalı hali (yoksa kendisi)
func kabart(tex: Texture2D) -> Texture2D:
	if tex == null or tex is CanvasTexture: return tex
	var yol: String = tex.resource_path
	if yol == "": return tex
	if _nm.has(yol): return _nm[yol]
	var r: Texture2D = tex
	var ny := yol.substr(0, yol.length() - 4) + "_n.png"
	if ResourceLoader.exists(ny):
		var ct := CanvasTexture.new()
		ct.diffuse_texture = tex
		ct.normal_texture = load(ny)
		ct.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		r = ct
	_nm[yol] = r
	return r

## kahramanın sayfası (görünüşü değişince yeniden üretilir, yolu olmaz): aynı yerleşimdeki kahraman_n.png kullanılır
var _kah_n: Texture2D
var kabart_kapali := false
func _kahraman() -> void:
	if kabart_kapali: return
	var sp: Sprite2D = oyun.oyuncu.spr if oyun.oyuncu != null else null
	if sp == null or sp.texture == null or sp.texture is CanvasTexture: return
	if _kah_n == null: _kah_n = load("res://art/kahraman_n.png")
	if _kah_n == null or _kah_n.get_size() != sp.texture.get_size(): return
	var ct := CanvasTexture.new()
	ct.diffuse_texture = sp.texture
	ct.normal_texture = _kah_n
	sp.texture = ct

var YUKSEK := 150.0
var _isik_t := 0.0
func _isik_yukseklik(dt: float) -> void:
	_isik_t -= dt
	if _isik_t > 0.0: return
	_isik_t = 2.0
	for l in oyun.find_children("*", "PointLight2D", true, false):
		if l.height == 0.0 or l.height == 48.0: l.height = YUKSEK

func ot_ver(d) -> void:
	if not is_instance_valid(d): return
	d.texture = kabart(d.texture)
	var N: Dictionary = oyun.toplama_veri.nodes.get(d.ad, {})
	if (N.get("mine", false) or N.get("bush", false)) and d.texture != null and d.get_node_or_null("golge") == null:
		var g := Golge.new()
		g.name = "golge"
		g.show_behind_parent = true
		g.w = d.texture.get_width() * 0.42
		g.scale = Vector2.ONE
		d.add_child(g)
	if N.get("mine", false) or SALLANMAZ.has(d.ad): return
	d.material = mat_ot

const PARILTI := {"Kristal": ["#c8a0ff", 40.0], "Ametist": ["#b070ff", 40.0], "Kuvars": ["#e0f0ff", 32.0], "Işık mantarı": ["#9ae8ff", 36.0],
	"Yıldız çiçeği": ["#fff0a0", 34.0], "Ay otu": ["#c8e0ff", 30.0], "Kristal çiçeği": ["#d8b0ff", 34.0], "Yıldız tozu": ["#fff6c8", 28.0],
	"Ay taşı": ["#d0e4ff", 30.0], "Mor kök": ["#a060e0", 26.0], "Mor sarmaşık": ["#a060e0", 26.0], "Ateş çiçeği": ["#ff9040", 30.0],
	"Kor otu": ["#ff7030", 30.0], "Lav camı": ["#ff6020", 30.0], "Gece zambağı": ["#d8d0ff", 28.0], "Yankı taşı": ["#b0d0ff", 26.0]}
var isiklar: Array = []
var _sec_t := 0.0
var _sec: Array = []

func _isik_kur() -> void:
	var g := GradientTexture2D.new()
	g.width = 128; g.height = 128
	g.fill = GradientTexture2D.FILL_RADIAL
	g.fill_from = Vector2(0.5, 0.5); g.fill_to = Vector2(1.0, 0.5)
	var gr := Gradient.new()
	gr.set_color(0, Color(1, 1, 1, 1)); gr.set_color(1, Color(1, 1, 1, 0))
	gr.add_point(0.45, Color(1, 1, 1, 0.35))
	g.gradient = gr
	for i in 12:
		var l := PointLight2D.new()
		l.texture = g
		l.enabled = false
		oyun.add_child(l)
		isiklar.append(l)

func _parilti(dt: float) -> void:
	if isiklar.is_empty(): _isik_kur()
	var mag: bool = oyun.magara != null and oyun.magara.icinde
	var k: float = 1.0 if mag else (oyun.zaman.karanlik() if oyun.zaman != null else 0.0)
	_sec_t -= dt
	if _sec_t <= 0.0 and k > 0.05:
		_sec_t = 0.4
		var P: Vector2 = oyun.oyuncu.position
		var L: Array = []
		for d in oyun.dugumler:
			if d.canli and d.visible and PARILTI.has(d.ad):
				var q: float = d.position.distance_squared_to(P)
				if q < 360000.0: L.append([q, d])
		L.sort_custom(func(a, b): return a[0] < b[0])
		_sec = []
		for i in mini(L.size(), isiklar.size()): _sec.append(L[i][1])
	var tk := Time.get_ticks_msec() / 1000.0
	for i in isiklar.size():
		var l: PointLight2D = isiklar[i]
		if k <= 0.05 or i >= _sec.size() or not is_instance_valid(_sec[i]) or not _sec[i].canli:
			l.enabled = false
			continue
		var d = _sec[i]
		var R: Array = PARILTI[d.ad]
		l.enabled = true
		l.color = Color(R[0])
		l.position = d.position + Vector2(0, -5)
		l.texture_scale = float(R[1]) / 64.0
		l.energy = (0.55 + 0.12 * sin(tk * 1.3 + d.position.x * 0.07)) * k

class Ortam extends Node2D:
	var P: Array = []   # {p, v, t, life, tur, c, faz}
	func _draw() -> void:
		var tk := Time.get_ticks_msec() / 1000.0
		for q in P:
			var a: float = clampf(minf(q.t / 0.8, (q.life - q.t) / 0.8), 0.0, 1.0)
			var c: Color = q.c
			match q.tur:
				"bocek":
					var b := 0.35 + 0.65 * maxf(0.0, sin(tk * 2.2 + q.faz))
					var h := c; h.a = 0.22 * a * b
					draw_circle(q.p, 3.0, h)
					c.a = a * b
					draw_rect(Rect2(q.p - Vector2(0.5, 0.5), Vector2(1.5, 1.5)), c)
				"yaprak":
					c.a = a
					var r := Vector2(cos(tk * 3.0 + q.faz), 0.0) * 1.2
					draw_rect(Rect2(q.p + r, Vector2(2, 1)), c)
				"kor", "pirilti":
					c.a = a * (0.6 + 0.4 * sin(tk * 9.0 + q.faz))
					draw_rect(Rect2(q.p, Vector2(1, 1)), c)
				_:
					c.a = a * 0.8
					draw_rect(Rect2(q.p, Vector2(1, 1)), c)

var ortam_kat: CanvasLayer
var ortam: Ortam
var _ortam_t := 0.0

func _ortam_kur() -> void:
	ortam_kat = CanvasLayer.new()
	ortam_kat.layer = 0
	ortam_kat.follow_viewport_enabled = true
	add_child(ortam_kat)
	ortam = Ortam.new()
	ortam.z_index = 30
	ortam_kat.add_child(ortam)

func _ortam_tur() -> String:
	if oyun.ada != 1 or (oyun.magara != null and oyun.magara.icinde) or oyun.hava == null: return ""
	if oyun.hava.yagiyor() or oyun.hava.kar_yagiyor(): return ""
	var b: int = oyun.bio_at(oyun.oyuncu.position)
	var gece: bool = oyun.zaman.karanlik() > 0.4
	var m: int = oyun.hava.mevsim()
	if b == 4: return "kor"
	if b == 5: return "pirilti"
	if gece and (b == 1 or b == 2 or (b == 0 and m == 1)) and m != 3: return "bocek"
	if not gece and b == 0 and m <= 1: return "tohum"
	if not gece and b == 1 and m == 2: return "yaprak"
	return ""

func _ortam(dt: float) -> void:
	if ortam == null: _ortam_kur()
	var tur := _ortam_tur()
	var vs: Vector2 = get_viewport().get_visible_rect().size / oyun.kamera.zoom
	var c0: Vector2 = oyun.kamera.get_screen_center_position() - vs / 2.0
	var hiz := {"bocek": 6.0, "tohum": 5.0, "yaprak": 4.0, "kor": 14.0, "pirilti": 8.0}
	if tur != "" and ortam.P.size() < 46:
		_ortam_t -= dt * float(hiz[tur])
		var den := 0
		while _ortam_t <= 0.0 and den < 6:
			_ortam_t += 1.0
			den += 1
			var p := c0 + Vector2(randf() * vs.x, randf() * vs.y)
			# yalnızca oyuncunun biyomunda ve karada doğar
			if oyun.su_mu(oyun.tile_at(p)) or oyun.bio_at(p) != oyun.bio_at(oyun.oyuncu.position): continue
			var q := {p = p, t = 0.0, tur = tur, faz = randf() * TAU}
			match tur:
				"bocek": q.v = Vector2(randf_range(-6, 6), randf_range(-4, 4)); q.life = 4.0 + randf() * 4.0; q.c = Color("#e8ff7a")
				"tohum": q.v = Vector2(randf_range(6, 14), randf_range(-3, 2)); q.life = 5.0 + randf() * 3.0; q.c = Color("#fffdf0")
				"yaprak": p.y = c0.y + randf() * vs.y * 0.6; q.p = p; q.v = Vector2(randf_range(-4, 8), randf_range(10, 18)); q.life = 4.0 + randf() * 2.0; q.c = [Color("#e0802a"), Color("#c8501e"), Color("#e8b040")][randi() % 3]
				"kor": q.v = Vector2(randf_range(-4, 4), randf_range(-22, -12)); q.life = 1.8 + randf() * 1.5; q.c = [Color("#ff7a2a"), Color("#ffc040")][randi() % 2]
				"pirilti": q.v = Vector2(randf_range(-3, 3), randf_range(-8, -3)); q.life = 2.5 + randf() * 2.0; q.c = [Color("#d8b0ff"), Color("#ffffff"), Color("#a070ff")][randi() % 3]
			ortam.P.append(q)
	for i in range(ortam.P.size() - 1, -1, -1):
		var q: Dictionary = ortam.P[i]
		q.t += dt
		if q.tur == "bocek" and randf() < dt * 0.8: q.v = Vector2(randf_range(-6, 6), randf_range(-4, 4))
		q.p += q.v * dt
		if q.t >= q.life or (tur != q.tur and q.t < q.life - 0.8): q.life = minf(q.life, q.t + 0.8)
		if q.t >= q.life: ortam.P.remove_at(i)
	ortam.queue_redraw()

func _process(dt: float) -> void:
	if oyun == null: return
	if oyun.basta:
		if ortam != null and not ortam.P.is_empty(): ortam.P.clear(); ortam.queue_redraw()
		return
	_parilti(dt)
	_ortam(dt)
	_isik_yukseklik(dt)
	_kahraman()
	if not _kuruldu and not oyun.agaclar.is_empty(): ruzgar_ver()
	# rüzgâr gücü: açık havada 1, yağmurda/karda 1,8, kül fırtınasında 2,4
	var g := 1.0
	if oyun.hava != null:
		if oyun.hava.kul_firtinasi(): g = 2.4
		elif oyun.hava.yagiyor() or oyun.hava.kar_yagiyor(): g = 1.8
	_guc = lerpf(_guc, g, minf(1.0, dt * 0.5))
	mat_agac.set_shader_parameter("guc", _guc)
	mat_ot.set_shader_parameter("guc", _guc)
	# biyom renk havası (mağarada ve ACT 2'de nötr)
	var hedef := Color.WHITE
	if oyun.ada == 1 and not (oyun.magara != null and oyun.magara.icinde):
		var b: int = oyun.bio_at(oyun.oyuncu.position)
		if b >= 0 and b < BIYOM_RENK.size(): hedef = BIYOM_RENK[b]
	if not renk.is_equal_approx(hedef):
		renk = renk.lerp(hedef, minf(1.0, dt * 0.5))
		if renk.is_equal_approx(hedef): renk = hedef
		oyun.renk_guncelle()
