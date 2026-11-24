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

## secs: [{t: "Anladım", f: Callable, pri: true, kapat: true}]
func ac(kim: String, por, metin: String, secs: Array = []) -> void:
	if secs.is_empty():
		secs = [{t = "Anladım", kapat = true}]
	liste = secs
	ad.text = kim
	ad.visible = kim != ""
	portre.texture = por
	portre.visible = por != null
	yazi.text = metin
	for c in secenekler.get_children():
		c.queue_free()
	for s in secs:
		var b := Button.new()
		b.text = s.t
		b.pressed.connect(_sec.bind(s))
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
	if e is InputEventMouseButton and e.pressed and not kutu.get_global_rect().has_point(e.position):
		_cik()

func _unhandled_input(e: InputEvent) -> void:
	if visible and e.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		_cik()
