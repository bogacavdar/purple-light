extends Node
## Godot'ya özgü durağan görsel güzelleştirmeler (belge Godot › Grafik; 28 Kasım 2026, Boğaç: kamera sallantısı, hareket bulanıklığı
## gibi ekranı oynatan efektler olmaz, yalnızca durağan güzelleştirmeler):
## 1) Biyom renk havası: her biyomun dünyaya hafif kendi tonu (gece, mağara, sahne renkleriyle çarpılır), biyom değişince 2 sn'de geçer.
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

func ot_ver(d) -> void:
	if not is_instance_valid(d): return
	var N: Dictionary = oyun.toplama_veri.nodes.get(d.ad, {})
	if N.get("mine", false) or SALLANMAZ.has(d.ad): return
	d.material = mat_ot

func _process(dt: float) -> void:
	if oyun == null or oyun.basta: return
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
