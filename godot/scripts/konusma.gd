## Konuşma penceresi (web say): konuşanın resmi, adı, yazı ve seçenekler.
## Boğaç'ın kuralı (3 Kasım 2026): pencerenin dışına basmak, Esc ya da X "Anladım" sayılır: yalnız kapatan seçenek → tek seçenek → ana (pri) seçenek.
extends Control

var oyun
var kutu: PanelContainer
var portre: TextureRect
var ad: Label
var yazi: RichTextLabel
var secenekler: HBoxContainer
var liste: Array = []   # [{t, f, pri}]
# onay kutusu (web confirmBox #q2cf): ortada krem kâğıt kutu, arkası hafif karartılı; Enter = evet, Esc ve dışına basmak = Vazgeç
var onay_kat: ColorRect
var onay_kutu: PanelContainer
var onay_yazi: RichTextLabel
var onay_evet: Button
var onay_hayir: Button
var onay_f := Callable()

func kur(o) -> void:
	oyun = o
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	visible = false
	kutu = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.08, 0.07, 0.06, 0.96); st.border_color = Color("#c9a24a"); st.set_border_width_all(2)
	st.set_content_margin_all(10)
	kutu.add_theme_stylebox_override("panel", st)
	kutu.custom_minimum_size = Vector2(560, 0)
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 10)
	portre = TextureRect.new()
	portre.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	portre.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	portre.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	portre.custom_minimum_size = Vector2(72, 78)
	h.add_child(portre)
	var v := VBoxContainer.new()
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ad = Label.new(); ad.add_theme_color_override("font_color", Color("#f2c94c")); oyun._golge(ad)
	yazi = RichTextLabel.new(); yazi.bbcode_enabled = true; yazi.fit_content = true; yazi.scroll_active = false; yazi.custom_minimum_size = Vector2(440, 0)
	secenekler = HBoxContainer.new()
	secenekler.add_theme_constant_override("separation", 8)
	v.add_child(ad); v.add_child(yazi); v.add_child(secenekler)
	h.add_child(v)
	kutu.add_child(h)
	add_child(kutu)
	kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM, Control.PRESET_MODE_MINSIZE, 70)
	kutu.grow_vertical = Control.GROW_DIRECTION_BEGIN
	kutu.grow_horizontal = Control.GROW_DIRECTION_BOTH
	gui_input.connect(_dis)
	onay_kat = ColorRect.new()
	onay_kat.color = Color(0, 0, 0, 0.35)
	onay_kat.mouse_filter = Control.MOUSE_FILTER_IGNORE
	onay_kat.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	onay_kat.visible = false
	add_child(onay_kat)
	onay_kutu = PanelContainer.new()
	var ks := StyleBoxFlat.new(); ks.bg_color = Color("#f6efdc"); ks.border_color = Color("#3a2a1a"); ks.set_border_width_all(3)
	ks.content_margin_left = 16; ks.content_margin_right = 16; ks.content_margin_top = 14; ks.content_margin_bottom = 14
	ks.shadow_color = Color(0, 0, 0, 0.5); ks.shadow_size = 12; ks.shadow_offset = Vector2(0, 10)
	onay_kutu.add_theme_stylebox_override("panel", ks)
	onay_kutu.custom_minimum_size = Vector2(400, 0)
	var ov := VBoxContainer.new(); ov.add_theme_constant_override("separation", 12)
	onay_yazi = RichTextLabel.new(); onay_yazi.bbcode_enabled = true; onay_yazi.fit_content = true; onay_yazi.scroll_active = false
	onay_yazi.custom_minimum_size = Vector2(368, 0)
	onay_yazi.add_theme_color_override("default_color", Color("#2a1e14"))
	for k in ["normal_font_size", "bold_font_size"]: onay_yazi.add_theme_font_size_override(k, 16)
	var oh := HBoxContainer.new(); oh.add_theme_constant_override("separation", 8)
	onay_evet = _onay_tus(true); onay_hayir = _onay_tus(false)
	onay_evet.pressed.connect(_onay_kapat.bind(true)); onay_hayir.pressed.connect(_onay_kapat.bind(false))
	oh.add_child(onay_evet); oh.add_child(onay_hayir)
	ov.add_child(onay_yazi); ov.add_child(oh)
	onay_kutu.add_child(ov)
	onay_kutu.visible = false
	add_child(onay_kutu)

func _onay_tus(pri: bool) -> Button:
	var b := Button.new()
	b.add_theme_font_size_override("font_size", 14)
	b.custom_minimum_size = Vector2(0, 34)
	for d in ["normal", "hover", "pressed", "focus"]:
		var sb := StyleBoxFlat.new()
		sb.bg_color = Color("#ffd23a") if pri else Color(0, 0, 0, 0.3)
		if d == "hover": sb.bg_color = sb.bg_color.lightened(0.12)
		sb.border_color = Color("#ffd23a") if pri else Color("#6a5a3a")
		sb.set_border_width_all(2)
		sb.content_margin_left = 14; sb.content_margin_right = 14
		b.add_theme_stylebox_override(d, sb)
	var yc := Color("#1a1408") if pri else Color("#f3ecd8")
	for k in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]: b.add_theme_color_override(k, yc)
	return b

## evet/vazgeç sorusu (web confirmBox): f yalnızca evet denince çalışır
func onay(metin: String, f: Callable, evet := "Evet", hayir := "Vazgeç") -> void:
	onay_f = f
	onay_yazi.text = metin.replace("<b>", "[b]").replace("</b>", "[/b]").replace("<br>", "\n")
	onay_evet.text = evet; onay_hayir.text = hayir
	kutu.visible = false
	onay_kat.visible = true; onay_kutu.visible = true
	onay_kat.position = Vector2.ZERO; onay_kat.size = get_viewport_rect().size
	liste = []
	visible = true
	onay_kutu.reset_size()
	onay_kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
	onay_evet.grab_focus.call_deferred()

func _onay_kapat(ok: bool) -> void:
	if not onay_kutu.visible: return
	onay_kutu.visible = false; onay_kat.visible = false; kutu.visible = true
	visible = false
	var f := onay_f
	onay_f = Callable()
	if ok and f.is_valid(): f.call()

## secs: [{t: "Anladım", f: Callable, pri: true, kapat: true}]
func ac(kim: String, por, metin: String, secs: Array = []) -> void:
	if oyun.gizli != null and kim == "Yaşlı Kemal": metin = oyun.gizli.kemal_saat(metin)
	if secs.is_empty():
		secs = [{t = "Anladım", kapat = true}]
	if oyun.hikaye != null: secs = oyun.hikaye.ekle(kim, por, secs)
	liste = secs
	onay_kutu.visible = false; onay_kat.visible = false; kutu.visible = true
	ad.text = kim
	ad.visible = kim != ""
	portre.texture = por
	portre.visible = por != null
	yazi.text = metin.replace("<b>", "[b]").replace("</b>", "[/b]").replace("<i>", "[i]").replace("</i>", "[/i]").replace("<br>", "\n")
	for c in secenekler.get_children():
		c.queue_free()
	for s in secs:
		var b := Button.new()
		b.text = s.t
		b.pressed.connect(_sec.bind(s))
		if s.get("soluk", false):
			b.disabled = true
			b.modulate.a = 0.45
			b.tooltip_text = "Vio yetmiyor"
		secenekler.add_child(b)
	visible = true
	kutu.reset_size()
	kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM, Control.PRESET_MODE_MINSIZE, 70)

func _sec(s) -> void:
	visible = false
	if s.has("f"):
		s.f.call()

## dışına basmak = "Anladım" (web dlgOut)
func _cik() -> void:
	if onay_kutu.visible:
		_onay_kapat(false)
		return
	var s = null
	for x in liste:
		if x.get("kapat", false):
			s = x
	if s == null and liste.size() == 1:
		s = liste[0]
	if s == null:
		for x in liste:
			if x.get("pri", false):
				s = x
	if s == null:
		s = liste[0]
	_sec(s)

func _dis(e: InputEvent) -> void:
	var k: Control = onay_kutu if onay_kutu.visible else kutu
	if e is InputEventMouseButton and e.pressed and not k.get_global_rect().has_point(e.position):
		_cik()

func _unhandled_input(e: InputEvent) -> void:
	if visible and onay_kutu.visible and e is InputEventKey and e.pressed and (e.keycode == KEY_ENTER or e.keycode == KEY_KP_ENTER):
		get_viewport().set_input_as_handled()
		_onay_kapat(true)
		return
	if visible and e.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		_cik()
