extends CanvasLayer
## Ekranın ortasındaki büyük yazılar (web daybanner / lvlup / discover; belge Sistemler › Ekrandaki duyurular):
## Gün afişi "YENİ BİR GÜN · N. Gün" (3,6 sn), seviye afişi "Seviye atladın!" (3 sn) ve sırayla gelen keşif kartları
## ("Yeni malzeme bulundu", "Yeni tarif öğrendin", bölge, köprü…; her biri 2,4 sn). Sıra: önce gün, sonra seviye, sonra kartlar.
## Gün afişi bir pencere açıkken bekler (seviye ve kartlar beklemez). Büyük harita ya da bir hikâye sahnesi açıkken hiçbiri çizilmez; ekrandakiler iner, kapanınca yeniden gelir.

var oyun
var gun_k: VBoxContainer
var gun_n: Label
var sv_k: VBoxContainer
var sv_n: Label
var ks_k: PanelContainer
var ks_lab: Label
var ks_ad: Label
var gun_t := -1.0
var sv_t := -1.0
var ks_t := -1.0
var gun_no := 0
var sv_no := 0
var gun_bekle := 0
var sv_bekle := 0
var kuyruk: Array = []
var ks_cur = null
var ara := 0.0
const GUN_S := 3.6
const SV_S := 3.0
const KS_S := 2.4

func kur(o) -> void:
	oyun = o
	layer = 4
	process_mode = Node.PROCESS_MODE_ALWAYS
	gun_k = VBoxContainer.new()
	gun_k.alignment = BoxContainer.ALIGNMENT_CENTER
	gun_k.add_child(_yazi("YENİ BİR GÜN", 15, Color("#ffe2a8"), Color(0, 0, 0, 0.9), 4))
	gun_n = _yazi("1. Gün", 56, Color("#fff3d0"), Color("#8a5a2e"), 8)
	gun_k.add_child(gun_n)
	sv_k = VBoxContainer.new()
	sv_k.alignment = BoxContainer.ALIGNMENT_CENTER
	sv_k.add_theme_constant_override("separation", 6)
	sv_k.add_child(_yazi("Seviye atladın!", 40, Color("#f2b84b"), Color("#11170f"), 8))
	var kutu := PanelContainer.new()
	kutu.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	kutu.add_theme_stylebox_override("panel", _kutu(Color("#232d1f"), Color("#7fb8e0"), 16, 4))
	sv_n = _yazi("Seviye 2", 26, Color.WHITE, Color(0, 0, 0, 0), 0)
	kutu.add_child(sv_n)
	sv_k.add_child(kutu)
	sv_k.add_child(_yazi("Seviye puanı kazandın", 15, Color("#e8f2fa"), Color(0, 0, 0, 0.9), 4))
	ks_k = PanelContainer.new()
	ks_k.add_theme_stylebox_override("panel", _kutu(Color("#232d1f"), Color("#f2b84b"), 22, 12))
	var v := VBoxContainer.new()
	v.add_theme_constant_override("separation", 2)
	ks_lab = _yazi("YENİ MALZEME BULUNDU", 13, Color("#f2b84b"), Color(0, 0, 0, 0), 0)
	ks_ad = _yazi("", 24, Color("#f4ecd8"), Color(0, 0, 0, 0), 0)
	v.add_child(ks_lab); v.add_child(ks_ad)
	ks_k.add_child(v)
	for c in [gun_k, sv_k, ks_k]:
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.visible = false
		add_child(c)

func _yazi(t: String, boy: int, renk: Color, kenar: Color, kalin: int) -> Label:
	var l := Label.new()
	l.text = t
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", boy)
	l.add_theme_color_override("font_color", renk)
	if kalin > 0:
		l.add_theme_color_override("font_outline_color", kenar)
		l.add_theme_constant_override("outline_size", kalin)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

func _kutu(ic: Color, kenar: Color, yan: int, ust: int) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = ic
	s.border_color = kenar
	s.set_border_width_all(3)
	s.content_margin_left = yan; s.content_margin_right = yan
	s.content_margin_top = ust; s.content_margin_bottom = ust
	s.shadow_color = Color(0.07, 0.09, 0.06, 0.9)
	s.shadow_size = 3
	return s

## yeni gün başladı (zaman.gd): afiş, açık pencere kapanınca gelir
func gun(n: int) -> void:
	gun_bekle = n

## seviye atlandı (envanter.gd): ekrandaki kart sıraya geri döner, seviye önce gösterilir (web lvlFirst)
func seviye(n: int) -> void:
	if sv_t >= 0.0:
		sv_no = n
		sv_n.text = "Seviye %d" % n
		sv_t = 0.0
		return
	sv_bekle = n
	_kart_geri()

## keşif kartı: büyük yazı + üstte küçük etiket (web announce)
func duyur(ad: String, etiket: String = "Yeni malzeme bulundu") -> void:
	if oyun.basta: return
	kuyruk.append([ad, etiket])

func _kart_geri() -> void:
	if ks_t >= 0.0 and ks_cur != null:
		kuyruk.push_front(ks_cur)
	ks_cur = null
	ks_t = -1.0
	ks_k.visible = false

func _sessiz() -> bool:
	if oyun.basta: return true
	if oyun.harita_k != null and oyun.harita_k.acik(): return true
	for m in [oyun.sahne, oyun.cine, oyun.uyanis]:
		if m != null and m.acik: return true
	return false

func _process(dt: float) -> void:
	if oyun == null: return
	if _sessiz():
		if gun_t >= 0.0: gun_bekle = gun_no; gun_t = -1.0; gun_k.visible = false
		if sv_t >= 0.0: sv_bekle = sv_no; sv_t = -1.0; sv_k.visible = false
		_kart_geri()
		return
	var vs := get_viewport().get_visible_rect().size
	if gun_bekle > 0 and gun_t < 0.0 and not oyun.zaman.durdu():
		gun_no = gun_bekle; gun_bekle = 0
		gun_n.text = "%d. Gün" % gun_no
		gun_t = 0.0
		gun_k.visible = true
		if oyun.ses != null: oyun.ses.cal("level", 0.6)
	if gun_t >= 0.0:
		gun_t += dt
		var f := gun_t / GUN_S
		gun_k.modulate.a = clampf(f / 0.15, 0.0, 1.0) if f < 0.75 else clampf((1.0 - f) / 0.25, 0.0, 1.0)
		var dy := lerpf(20.0, 0.0, clampf(f / 0.15, 0.0, 1.0)) if f < 0.75 else lerpf(0.0, -18.0, (f - 0.75) / 0.25)
		_yerles(gun_k, vs, 0.22, dy, 1.0)
		if f >= 1.0: gun_t = -1.0; gun_k.visible = false
	if sv_bekle > 0 and sv_t < 0.0 and gun_t < 0.0:
		sv_no = sv_bekle; sv_bekle = 0
		sv_n.text = "Seviye %d" % sv_no
		sv_t = 0.0
		sv_k.visible = true
		var P: Vector2 = oyun.oyuncu.position
		for i in 24: oyun.parca(P + Vector2(randf_range(-10, 10), -16), Vector2(randf_range(-70, 70), -60 - randf() * 70), 1.1, [Color("#ff7a59"), Color("#f2b84b"), Color("#8fd46b"), Color("#7fb8e0"), Color("#c99ae0")][i % 5])
	if sv_t >= 0.0:
		sv_t += dt
		var f := sv_t / SV_S
		var sc := lerpf(0.6, 1.12, f / 0.12) if f < 0.12 else (lerpf(1.12, 1.0, (f - 0.12) / 0.08) if f < 0.2 else 1.0)
		sv_k.modulate.a = clampf(f / 0.12, 0.0, 1.0) if f < 0.8 else clampf((1.0 - f) / 0.2, 0.0, 1.0)
		_yerles(sv_k, vs, 0.38, 0.0 if f < 0.8 else lerpf(0.0, -24.0, (f - 0.8) / 0.2), sc)
		if f >= 1.0: sv_t = -1.0; sv_k.visible = false
	if ks_t < 0.0 and gun_t < 0.0 and sv_t < 0.0 and sv_bekle == 0 and not kuyruk.is_empty():
		ara -= dt
		if ara <= 0.0:
			ks_cur = kuyruk.pop_front()
			ks_lab.text = str(ks_cur[1]).replace("i", "İ").to_upper()
			ks_ad.text = str(ks_cur[0])
			ks_k.reset_size()
			ks_t = 0.0
			ks_k.visible = true
	if ks_t >= 0.0:
		ks_t += dt
		var f := ks_t / KS_S
		var sc := lerpf(0.8, 1.06, f / 0.1) if f < 0.1 else (lerpf(1.06, 1.0, (f - 0.1) / 0.08) if f < 0.18 else 1.0)
		ks_k.modulate.a = clampf(f / 0.1, 0.0, 1.0) if f < 0.8 else clampf((1.0 - f) / 0.2, 0.0, 1.0)
		_yerles(ks_k, vs, 0.32, 0.0 if f < 0.8 else lerpf(0.0, -14.0, (f - 0.8) / 0.2), sc)
		if f >= 1.0:
			ks_t = -1.0; ks_cur = null; ks_k.visible = false; ara = 0.22

func _yerles(c: Control, vs: Vector2, oran: float, dy: float, sc: float) -> void:
	c.reset_size()
	c.pivot_offset = c.size / 2.0
	c.scale = Vector2(sc, sc)
	c.position = Vector2((vs.x - c.size.x) / 2.0, vs.y * oran - c.size.y / 2.0 + dy)
