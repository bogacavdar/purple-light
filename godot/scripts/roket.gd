## ACT 2'nin sonu (web v81 launch, v83 hug, endCard): roketin fırlatılışı (15,6 sn), "ACT 3 · Mor gemi" kartı (3,5 sn), mor gemide
## kavuşma (14,6 sn; arka plan web'in kendi çiziminden kareler, iki kişi oyuncunun ve sevdiği kişinin kendi çizimiyle üstüne), son kart.
## "Geç", Esc, Enter ya da Boşluk o bölümün sonuna atlar. Ağaç durur (tree pause), sahne çalışmaya devam eder.
extends CanvasLayer

var oyun
var V: Dictionary
var faz := ""          # "f" fırlatma · "k" ACT 3 kartı · "s" kavuşma · "son" son kart
var t := 0.0
var tekrar := false
var ekran: Control
var yazi: Label
var kart: VBoxContainer
var son: PanelContainer
var gec: Button
var kare: Texture2D
var kol: Label
var hero_tx: Texture2D
var love_tx: Texture2D

func kur(o) -> void:
	oyun = o
	layer = 9
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	var a := ColorRect.new(); a.color = Color.BLACK; a.set_anchors_preset(Control.PRESET_FULL_RECT); add_child(a)
	ekran = Control.new(); ekran.set_anchors_preset(Control.PRESET_FULL_RECT); ekran.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST; ekran.draw.connect(_ciz); add_child(ekran)
	yazi = Label.new(); yazi.set_anchors_preset(Control.PRESET_CENTER_BOTTOM); yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	yazi.custom_minimum_size = Vector2(680, 0); yazi.position = Vector2(-340, -90); yazi.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	yazi.add_theme_font_size_override("font_size", 20); yazi.add_theme_color_override("font_color", Color("#f3ecd8"))
	yazi.add_theme_color_override("font_outline_color", Color.BLACK); yazi.add_theme_constant_override("outline_size", 4)
	add_child(yazi)
	gec = Button.new(); gec.text = "Geç ›"; gec.set_anchors_preset(Control.PRESET_TOP_RIGHT); gec.position = Vector2(-80, 14); gec.pressed.connect(_gec)
	add_child(gec)
	kart = VBoxContainer.new(); kart.set_anchors_preset(Control.PRESET_CENTER); kart.position = Vector2(-200, -60); kart.custom_minimum_size = Vector2(400, 0)
	var k1 := Label.new(); k1.text = "ACT 3"; k1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; k1.add_theme_font_size_override("font_size", 18); k1.add_theme_color_override("font_color", Color("#b9aed6"))
	var k2 := Label.new(); k2.text = "Mor gemi"; k2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; k2.add_theme_font_size_override("font_size", 40); k2.add_theme_color_override("font_color", Color("#efe6ff"))
	kart.add_child(k1); kart.add_child(k2)
	add_child(kart)
	# son kart (web endCard)
	son = PanelContainer.new(); son.set_anchors_preset(Control.PRESET_FULL_RECT)
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.024, 0.016, 0.055, 0.92); son.add_theme_stylebox_override("panel", st)
	var cc := CenterContainer.new(); son.add_child(cc)
	var v := VBoxContainer.new(); v.add_theme_constant_override("separation", 8); v.custom_minimum_size = Vector2(480, 0); cc.add_child(v)
	var b1 := Label.new(); b1.text = "Purple Light"; b1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b1.add_theme_font_size_override("font_size", 56); b1.add_theme_color_override("font_color", Color("#c070ff"))
	var cz := ColorRect.new(); cz.color = Color("#a050e0"); cz.custom_minimum_size = Vector2(200, 2); cz.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	var b2 := Label.new(); b2.text = "Yeniden birliktesiniz."; b2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b2.add_theme_font_size_override("font_size", 20); b2.add_theme_color_override("font_color", Color("#f3ecd8"))
	var b3 := Label.new(); b3.text = "Hikâye ACT 3 ile devam edecek."; b3.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b3.add_theme_font_size_override("font_size", 15); b3.add_theme_color_override("font_color", Color("#c9a0ff"))
	var b4 := Label.new(); kol = b4; b4.text = "Astronot Gökay'dan kolla oynayanlara bir sır: ana menüde Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A."
	b4.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b4.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; b4.add_theme_font_size_override("font_size", 13); b4.add_theme_color_override("font_color", Color("#9ad8ff"))
	var hb := HBoxContainer.new(); hb.alignment = BoxContainer.ALIGNMENT_CENTER; hb.add_theme_constant_override("separation", 10)
	var d1 := Button.new(); d1.text = "Oyuna devam et"; d1.pressed.connect(_devam)
	var d2 := Button.new(); d2.text = "Ana menü"; d2.pressed.connect(func(): _devam(); oyun.kayit.ana_goster())
	hb.add_child(d1); hb.add_child(d2)
	for c in [b1, cz, b2, b3, b4, hb]: v.add_child(c)
	add_child(son)

func basla(tekrar_mi: bool) -> void:
	if faz != "": return
	V = oyun._json("res://data/roket.json")
	tekrar = tekrar_mi
	hero_tx = Karakter.sayfa(oyun.gorunus)
	love_tx = Karakter.sayfa(oyun.sevgili)
	faz = "f"; t = 0.0
	visible = true
	kart.visible = false; son.visible = false; gec.visible = true; yazi.text = ""
	get_tree().paused = true

func _gec() -> void:
	if faz == "f": t = float(V.f.sure)
	elif faz == "k": t = 3.5
	elif faz == "s": t = float(V.s.sure)

func _unhandled_input(e: InputEvent) -> void:
	if faz == "" or faz == "son" or not (e is InputEventKey) or not e.pressed or e.echo: return
	if e.keycode in [KEY_ESCAPE, KEY_ENTER, KEY_SPACE]:
		get_viewport().set_input_as_handled()
		_gec()

func _yazi(B: Dictionary) -> void:
	var y := ""
	for c in B.yazilar:
		if t >= float(c[0]): y = str(c[1])
	if t >= float(B.yazi_bitis): y = ""
	yazi.text = y.replace("{L}", oyun.ad_sevgili if oyun.ad_sevgili != "" else "O").replace("{H}", oyun.ad_kahraman if oyun.ad_kahraman != "" else "Sen")

func _process(dt: float) -> void:
	if faz == "" or faz == "son": return
	t += dt
	match faz:
		"f":
			if t < float(V.f.sure):
				kare = load("res://art/roket/f_%d.png" % mini(int(V.f.kare) - 1, int(t * float(V.fps))))
				_yazi(V.f)
			else:
				faz = "k"; t = 0.0; kare = null; yazi.text = ""; kart.visible = true
		"k":
			if t >= 3.5:
				faz = "s"; t = 0.0; kart.visible = false
		"s":
			if t < float(V.s.sure):
				kare = load("res://art/roket/s_%d.png" % mini(int(V.s.kare) - 1, int(t * float(V.fps))))
				_yazi(V.s)
			else:
				_bitti()
	ekran.queue_redraw()

func _bitti() -> void:
	faz = "son"; kare = null; yazi.text = ""; gec.visible = false
	if not tekrar:
		oyun.kuzen.tanis["roket"] = true
		if oyun.kayit != null: oyun.kayit.kaydet("oto")
	kol.visible = not Input.get_connected_joypads().is_empty()
	son.visible = true

func _devam() -> void:
	son.visible = false
	visible = false
	faz = ""
	get_tree().paused = false
	ekran.queue_redraw()

## kare 240 × 135, ekrana sığan en büyük ölçekle ortada; kavuşmada iki kişi (web hdraw: drawChibi)
func _ciz() -> void:
	if kare == null: return
	var W := ekran.size
	var s := minf(W.x / 240.0, W.y / 135.0)
	var o := (W - Vector2(240, 135) * s) / 2.0
	ekran.draw_set_transform(o, 0.0, Vector2(s, s))
	ekran.draw_texture(kare, Vector2.ZERO)
	if faz == "s":
		var m := clampf((t - 4.6) / 2.6, 0.0, 1.0)
		var hx := roundf(150.0 - m * 12.0)
		var lx := roundf(132.0 + (1.0 - m) * -4.0 + m * -2.0)
		_kisi(hero_tx, hx, 112.0, 6)
		if t < 4.4: _kisi(love_tx, 141.0, 94.0, 2)
		else: _kisi(love_tx, lx, 112.0, 2)
	ekran.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

func _kisi(tx: Texture2D, x: float, y: float, row: int) -> void:
	ekran.draw_texture_rect_region(tx, Rect2(x - 13, y - 35, 26, 40), Rect2(0, row * 40, 26, 40))
