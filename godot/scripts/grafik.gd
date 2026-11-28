extends Node
## Godot'ya özgü durağan görsel güzelleştirmeler (belge Godot › Grafik; 28 Kasım 2026, Boğaç: kamera sallantısı, hareket bulanıklığı
## gibi ekranı oynatan efektler olmaz, yalnızca durağan güzelleştirmeler):
## 1) Biyom renk havası: her biyomun dünyaya hafif kendi tonu (gece, mağara, sahne renkleriyle çarpılır), biyom değişince 2 sn'de geçer.
## 3) Parıltı: kristaller, ışıklı bitkiler ve ateşli taşlar karanlıkta (gece, mağara) kendi renginde hafifçe ışır ve yavaşça nefes alır;
##    oyuncuya en yakın 12 tanesi ışık alır (her 0,4 sn'de yeniden seçilir), gündüz kapalı.
## 4) Gölge: maden kayalarının ve çalıların altında yumuşak, yassı bir gölge (ağaçların ve canlıların gölgesi zaten var).
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
		if is_instance_valid(a) and a.spr != null: a.spr.material = mat_agac
	for d in oyun.dugumler: ot_ver(d)

class Golge extends Node2D:
	var w := 10.0
	func _draw() -> void:
		for i in 3:
			var k := 1.0 - i * 0.28
			draw_set_transform(Vector2(1, 1), 0.0, Vector2(w * k, w * 0.32 * k))
			draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.09))
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

func ot_ver(d) -> void:
	if not is_instance_valid(d): return
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

func _process(dt: float) -> void:
	if oyun == null or oyun.basta: return
	_parilti(dt)
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
