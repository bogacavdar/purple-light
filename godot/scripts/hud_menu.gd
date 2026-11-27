extends Node
## Ekran düzeni (web v391hud, v3.84–v3.92; belge Sistemler › Arayüz › Bilgisayarda sol üst iki kat büyük):
## sol üstte saat, adları yazılı büyük Can / Enerji / Tokluk çubukları, altında yan yana üçlü iki sıra kare düğmeler
## (Envanter, El yapımı, Yetenek ağacı, Yemek; Robot köpeklerin yeri boş bekler). Sağ üstte Çıkış, Ayarlar ve Başarımlar
## aynı boyda alt alta; sağ altta Almanak'ın yanında Tarif kitabı. Kalıcı tuş yardımı ekranda durmaz (Ayarlar › Kontroller'de).

var oyun
var kare: GridContainer
var sag: VBoxContainer
var kitap_d: Button

func kur(o) -> void:
	oyun = o
	var kutu: Control = oyun.can_cubugu.get_parent()
	# çubuklar iki kat: adları üstünde
	for c in [[oyun.can_cubugu, "Can"], [oyun.enerji_cubugu, "Enerji"], [oyun.env.tok_cubuk, "Tokluk"]]:
		var b: ProgressBar = c[0]
		b.custom_minimum_size = Vector2(230, 20)
		var l := Label.new()
		l.text = c[1]
		l.add_theme_font_size_override("font_size", 12)
		oyun._golge(l)
		l.position = Vector2(6, 0)
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(l)
	kutu.move_child(oyun.enerji_cubugu, oyun.can_cubugu.get_index() + 1)
	kutu.move_child(oyun.env.tok_cubuk, oyun.enerji_cubugu.get_index() + 1)
	oyun.yardim_yazi.visible = false
	oyun.silah_yazi.visible = false
	# kare düğmeler
	kare = GridContainer.new()
	kare.columns = 3
	kare.add_theme_constant_override("h_separation", 4)
	kare.add_theme_constant_override("v_separation", 4)
	kutu.add_child(kare)
	_kare("Envanter", "Deri çanta", "canta", func(): _tus("canta"))
	_kare("El yapımı", "Taş balta", "el_yapimi", func(): _tus("el_yapimi"))
	_kare("Yetenekler", "", "yetenek", func(): _tus("yetenek"))
	_kare("Yemek", "Böğürtlen", "ye", func(): oyun.yemek.ac())
	var bos := Control.new()   # Robot köpekler gelince buraya
	bos.custom_minimum_size = Vector2(_boy(), _boy())
	kare.add_child(bos)
	# sağ üst: Çıkış, Ayarlar, Başarımlar
	sag = VBoxContainer.new()
	sag.add_theme_constant_override("separation", 4)
	oyun.hud.add_child(sag)
	for d in [["Çıkış", func(): oyun.kayit.ic_ac()], ["Ayarlar", func(): oyun.ayarlar.ac()]]:
		var b := _dugme(d[0], Color(0.12, 0.14, 0.12, 0.9), Color("#6a7a5a"))
		b.pressed.connect(d[1])
		sag.add_child(b)
	# sağ alt: Tarif kitabı (Başarımlar'ın eski yeri)
	kitap_d = _dugme("Tarif kitabı (K)", Color(0.2, 0.16, 0.08, 0.9), Color("#a8843a"))
	kitap_d.pressed.connect(func(): _tus("kitap"))
	oyun.hud.add_child(kitap_d)

func _boy() -> float:
	return clampf(oyun.get_viewport().get_visible_rect().size.x * 0.042, 40.0, 84.0)

func _dugme(t: String, bg: Color, kenar: Color) -> Button:
	var b := Button.new()
	b.text = t
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 13)
	for s in ["normal", "hover", "pressed"]:
		var st := StyleBoxFlat.new()
		st.bg_color = bg.lightened(0.12) if s != "normal" else bg
		st.border_color = kenar.lightened(0.3) if s != "normal" else kenar
		st.set_border_width_all(2)
		st.set_corner_radius_all(4)
		st.content_margin_left = 8; st.content_margin_right = 8; st.content_margin_top = 4; st.content_margin_bottom = 4
		b.add_theme_stylebox_override(s, st)
	return b

func _kare(ad: String, ikon: String, eylem: String, f: Callable) -> void:
	var b := Button.new()
	var s := _boy()
	b.custom_minimum_size = Vector2(s, s)
	b.focus_mode = Control.FOCUS_NONE
	b.tooltip_text = "%s (%s)" % [ad, Ayarlar.tus_adi(eylem).split(",")[0]]
	for k in ["normal", "hover", "pressed"]:
		var st := StyleBoxFlat.new()
		st.bg_color = Color(0.1, 0.12, 0.1, 0.85) if k == "normal" else Color(0.18, 0.2, 0.14, 0.95)
		st.border_color = Color("#c9a24a") if k != "normal" else Color("#5a6a4a")
		st.set_border_width_all(2)
		st.set_corner_radius_all(5)
		b.add_theme_stylebox_override(k, st)
	if ikon != "":
		var t := TextureRect.new()
		t.texture = oyun.env.ikon_al(ikon)
		t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		t.position = Vector2(s * 0.18, s * 0.08)
		t.size = Vector2(s * 0.64, s * 0.6)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(t)
	else:
		var c := Control.new()
		c.size = Vector2(s, s * 0.7)
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.draw.connect(func():   # yetenek ağacı: dallanan üç düğüm
			var m := Vector2(s / 2.0, s * 0.5)
			var col := Color("#f2c94c")
			c.draw_line(m, m + Vector2(-s * 0.2, -s * 0.22), col, 2.0)
			c.draw_line(m, m + Vector2(s * 0.2, -s * 0.22), col, 2.0)
			c.draw_line(m, m + Vector2(0, s * 0.15), col, 2.0)
			for p in [m, m + Vector2(-s * 0.2, -s * 0.22), m + Vector2(s * 0.2, -s * 0.22)]: c.draw_circle(p, s * 0.07, col))
		b.add_child(c)
	var l := Label.new()
	l.text = ad
	l.add_theme_font_size_override("font_size", 8)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_OFF
	l.clip_text = true
	l.position = Vector2(0, s * 0.68)
	l.size = Vector2(s, s * 0.3)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	oyun._golge(l)
	b.add_child(l)
	b.pressed.connect(f)
	kare.add_child(b)

## düğme, o işin tuşuna basılmış gibi çalışır (her pencere kendi açma/kapama kuralıyla)
func _tus(a: String) -> void:
	var e := InputEventAction.new()
	e.action = a
	e.pressed = true
	Input.parse_input_event(e)
	await get_tree().process_frame
	await get_tree().process_frame
	var r := InputEventAction.new()
	r.action = a
	r.pressed = false
	Input.parse_input_event(r)

func _process(_dt: float) -> void:
	if oyun == null: return
	var V: Vector2 = oyun.get_viewport().get_visible_rect().size
	var bd = oyun.basarim.dugme if oyun.basarim != null else null
	if bd != null and bd.get_parent() != sag:
		bd.get_parent().remove_child(bd)
		sag.add_child(bd)
	sag.visible = not oyun.basta
	kare.visible = not oyun.basta
	sag.reset_size()
	var w := 0.0
	for c in sag.get_children():
		c.custom_minimum_size.x = 0
		w = maxf(w, c.get_combined_minimum_size().x)
	for c in sag.get_children(): c.custom_minimum_size.x = w
	sag.position = Vector2(V.x - w - 10.0, 30.0)
	# görev kartı sağ üst sütunun soluna, ders kartı kare düğmelerin altına
	var G = oyun.gorev
	if G != null and G.kart != null:
		G.kart.offset_right = -(w + 20.0)
		G.kart.offset_left = G.kart.offset_right - 300.0
	if oyun.ogr != null and oyun.ogr.kart != null:
		oyun.ogr.kart.offset_right = -(w + 20.0)
		oyun.ogr.kart.offset_left = oyun.ogr.kart.offset_right - 330.0
	if G != null and G.ders_kart != null:
		var kb: Control = oyun.can_cubugu.get_parent()
		G.ders_kart.position.y = kb.position.y + kb.size.y + 8.0
	var al = oyun.almanak
	kitap_d.visible = not oyun.basta and al != null and al.dugme.visible
	if al != null:
		kitap_d.reset_size()
		kitap_d.position = Vector2(al.dugme.position.x - kitap_d.size.x - 6.0, al.dugme.position.y)
