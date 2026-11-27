extends CanvasLayer
## Kendi işaretlerin ve yol gösterme (web map marks; belge Sistemler › Harita, işaretler, defterler; Kontroller: T bulunduğun yere işaret koy).
## T: bulunduğun yere işaret (ad + 5 renk, en çok 40). Büyük haritada işarete tıklayınca "Yol göster" / "Sil", bir kişinin simgesine
## tıklayınca ok onu gösterir; varınca, sağ tıkla ya da ✕ ile kalkar. Haritada ayrıca bayıldığın yerler (kurukafa), kurduğun evler,
## yataklar ve tuzaklar görünür.

var oyun
const RENK := ["#ffd84a", "#ff6a5a", "#7ad8ff", "#8fe06b", "#d08aff"]
var L: Array = []            # {x, y, ad, r}
var hedef = null             # Vector2 ya da kişi düğümü
var hedef_ad := ""
var ok: Node2D
var ok_yon := Vector2.ZERO
var pen: PanelContainer
var ad_kutu: LineEdit
var renk_sec := 0
var renk_b: Array = []
var menu: PanelContainer
var menu_i := -1
var bas_p := Vector2.ZERO

func kur(o) -> void:
	oyun = o
	layer = 8
	process_mode = Node.PROCESS_MODE_ALWAYS
	if not InputMap.has_action("isaret"):
		InputMap.add_action("isaret")
		var e := InputEventKey.new(); e.physical_keycode = KEY_T
		InputMap.action_add_event("isaret", e)
	ok = Node2D.new()
	ok.z_index = 50
	ok.draw.connect(_ok_ciz)
	oyun.add_child(ok)
	# işaret koyma penceresi
	pen = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#1a2216"); st.border_color = Color("#c9a24a"); st.set_border_width_all(2); st.set_content_margin_all(10)
	pen.add_theme_stylebox_override("panel", st)
	pen.set_anchors_preset(Control.PRESET_CENTER)
	pen.position = Vector2(-150, -70)
	pen.custom_minimum_size = Vector2(300, 0)
	pen.visible = false
	add_child(pen)
	var v := VBoxContainer.new()
	pen.add_child(v)
	var l := Label.new(); l.text = "Buraya işaret koy"; l.add_theme_color_override("font_color", Color("#f2c84b"))
	v.add_child(l)
	ad_kutu = LineEdit.new(); ad_kutu.max_length = 24
	ad_kutu.text_submitted.connect(func(_t): _koy())
	v.add_child(ad_kutu)
	var rh := HBoxContainer.new()
	for i in RENK.size():
		var b := Button.new()
		b.custom_minimum_size = Vector2(32, 24)
		b.focus_mode = Control.FOCUS_NONE
		var k := i
		b.pressed.connect(func():
			renk_sec = k
			_renk_ciz())
		renk_b.append(b)
		rh.add_child(b)
	v.add_child(rh)
	var bh := HBoxContainer.new()
	var b1 := Button.new(); b1.text = "Koy"; b1.pressed.connect(_koy)
	var b2 := Button.new(); b2.text = "Vazgeç"; b2.pressed.connect(_kapat)
	bh.add_child(b1); bh.add_child(b2)
	v.add_child(bh)
	# haritadaki işaret menüsü
	menu = PanelContainer.new()
	menu.add_theme_stylebox_override("panel", st)
	menu.visible = false
	add_child(menu)
	var mv := VBoxContainer.new()
	menu.add_child(mv)
	var m1 := Button.new(); m1.text = "Yol göster"; m1.pressed.connect(func():
		if menu_i >= 0 and menu_i < L.size():
			var m: Dictionary = L[menu_i]
			hedef = Vector2(float(m.x), float(m.y)); hedef_ad = str(m.ad)
			oyun.env.mesaj("Ok %s işaretini gösteriyor" % hedef_ad)
		menu.visible = false
		oyun.harita_k.kapat())
	var m2 := Button.new(); m2.text = "Sil"; m2.pressed.connect(func():
		if menu_i >= 0 and menu_i < L.size(): _sil(menu_i)
		menu.visible = false)
	mv.add_child(m1); mv.add_child(m2)

func _renk_ciz() -> void:
	for i in renk_b.size():
		var s := StyleBoxFlat.new(); s.bg_color = Color(RENK[i]); s.border_color = Color.WHITE if i == renk_sec else Color(0, 0, 0, 0.6); s.set_border_width_all(3 if i == renk_sec else 1)
		renk_b[i].add_theme_stylebox_override("normal", s)
		renk_b[i].add_theme_stylebox_override("hover", s)

func _ac() -> void:
	if L.size() >= 40:
		oyun.env.mesaj("En çok 40 işaret koyabilirsin; büyük haritada birini sil", true)
		return
	ad_kutu.text = "İşaret %d" % (L.size() + 1)
	_renk_ciz()
	pen.visible = true
	get_tree().paused = true
	ad_kutu.grab_focus()
	ad_kutu.select_all()

func _kapat() -> void:
	pen.visible = false
	ad_kutu.release_focus()
	get_tree().paused = false

func _koy() -> void:
	var p: Vector2 = oyun.oyuncu.position
	L.append({x = roundf(p.x), y = roundf(p.y), ad = ad_kutu.text.strip_edges() if ad_kutu.text.strip_edges() != "" else "İşaret", r = renk_sec})
	_kapat()
	oyun.env.mesaj("İşaret kondu: %s" % L[L.size() - 1].ad)

func _sil(i: int) -> void:
	var m: Dictionary = L[i]
	if hedef is Vector2 and hedef == Vector2(float(m.x), float(m.y)): hedef = null
	L.remove_at(i)

# ------------------------------------------------------------------ büyük haritada tıklama (harita.gd çağırır)
## sol tık: işaret → menü, kişi → ok onu gösterir; sağ tık: işaret siler, yoksa oku kaldırır. true dönerse tık kullanıldı
func harita_tik(e: InputEventMouseButton, o: Vector2, s: float) -> bool:
	var T := float(oyun.T)
	for i in L.size():
		var p := o + Vector2(float(L[i].x), float(L[i].y)) / T * s
		if p.distance_to(e.position) < 9.0:
			if e.button_index == MOUSE_BUTTON_RIGHT:
				_sil(i)
			else:
				menu_i = i
				menu.visible = true
				menu.reset_size()
				menu.position = oyun.harita_k.alan.get_global_rect().position + e.position + Vector2(10, 0)
			return true
	if e.button_index == MOUSE_BUTTON_RIGHT:
		if hedef != null:
			hedef = null
			oyun.env.mesaj("Ok kaldırıldı")
		return true
	for n in oyun.kisiler:
		if not n.visible or not oyun.harita_k.goruldu(n.position): continue
		var p2: Vector2 = o + n.position / T * s
		if p2.distance_to(e.position) < 7.0:
			hedef = n; hedef_ad = str(n.K.ad)
			oyun.env.mesaj("Ok %s'i gösteriyor" % hedef_ad)
			oyun.harita_k.kapat()
			return true
	return false

# ------------------------------------------------------------------ çizim
func _nokta(c: Control, p: Vector2, renk: Color, boy: float) -> void:
	c.draw_circle(p, boy * 0.45, Color("#1a1408"))
	c.draw_circle(p, boy * 0.35, renk)
	c.draw_rect(Rect2(p + Vector2(-0.5, -boy), Vector2(1.5, boy * 0.6)), Color("#1a1408"))

## haritada (büyük ve küçük) işaretler, ok hedefi, bayıldığın yerler, evler, yataklar, tuzaklar
func ciz(c: Control, o: Vector2, s: float, boy: float, buyuk: bool) -> void:
	if oyun.magara.icinde: return
	var T := float(oyun.T)
	var font := ThemeDB.fallback_font
	for k in oyun.yapi.kurulu:
		var p := o + Vector2((float(k.tx) + 0.5) * T, (float(k.ty) + 0.5) * T) / T * s
		var ev: bool = oyun.ev.V.oda.has(str(k.n))
		var yt: bool = bool(k.get("yatak", false)) or str(k.n).to_lower().contains("yatak")
		if ev: c.draw_rect(Rect2(p - Vector2(3, 3) * boy / 10.0, Vector2(6, 6) * boy / 10.0), Color("#a0703a"))
		elif yt: c.draw_rect(Rect2(p - Vector2(2, 3) * boy / 10.0, Vector2(4, 6) * boy / 10.0), Color("#d8c8a0"))
	for tz in oyun.balik.tuzaklar:
		var p2: Vector2 = o + tz.p / T * s
		c.draw_rect(Rect2(p2 - Vector2(2, 2) * boy / 10.0, Vector2(4, 4) * boy / 10.0), Color("#9fd0f0"), false, 1.0)
	for m in oyun.mezarlar:
		var p3: Vector2 = o + m.p / T * s
		var k3 := boy / 10.0
		c.draw_circle(p3, 3.2 * k3, Color("#e8e2cc")); c.draw_rect(Rect2(p3 + Vector2(-2, 1) * k3, Vector2(4, 3) * k3), Color("#e8e2cc"))
		c.draw_rect(Rect2(p3 + Vector2(-1.6, -1) * k3, Vector2(1.2, 1.2) * k3), Color("#1a1408")); c.draw_rect(Rect2(p3 + Vector2(0.6, -1) * k3, Vector2(1.2, 1.2) * k3), Color("#1a1408"))
	for m in L:
		var p4 := o + Vector2(float(m.x), float(m.y)) / T * s
		_nokta(c, p4, Color(RENK[int(m.r) % RENK.size()]), boy)
		if buyuk and oyun.harita_k.zoom >= 1.5: c.draw_string(font, p4 + Vector2(6, 4), str(m.ad), HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color("#f3ecd8"))
	var hp := _hedef_p()
	if hp != Vector2.INF:
		var p5 := o + hp / T * s
		c.draw_arc(p5, boy * 0.7 + 2.0 * sin(Time.get_ticks_msec() / 200.0), 0, TAU, 20, Color("#7ad8ff"), 2.0)

func _hedef_p() -> Vector2:
	if hedef == null: return Vector2.INF
	if hedef is Vector2: return hedef
	if is_instance_valid(hedef): return hedef.position
	hedef = null
	return Vector2.INF

# ------------------------------------------------------------------ ok
func _ok_ciz() -> void:
	if ok_yon == Vector2.ZERO: return
	var y := ok_yon
	var u := y * 26.0
	var n := Vector2(-y.y, y.x)
	var pts := PackedVector2Array([u + y * 9.0, u - y * 2.0 + n * 6.0, u - y * 2.0 - n * 6.0])
	ok.draw_colored_polygon(pts, Color("#7ad8ff"))
	ok.draw_polyline(PackedVector2Array([pts[0], pts[1], pts[2], pts[0]]), Color("#0e2838"), 1.0)

func _process(_dt: float) -> void:
	if oyun == null: return
	if pen.visible and Input.is_action_just_pressed("ui_cancel"): _kapat()
	if menu.visible and not oyun.harita_k.acik(): menu.visible = false
	if oyun.basta or oyun.arena != null:
		ok_yon = Vector2.ZERO; ok.queue_redraw()
		return
	if Input.is_action_just_pressed("isaret") and not get_tree().paused and not oyun.konusma.visible and not oyun.magara.icinde and not oyun.ev.acik:
		_ac()
	ok_yon = Vector2.ZERO
	var hp := _hedef_p()
	if hp != Vector2.INF and not oyun.magara.icinde:
		var d: Vector2 = hp - oyun.oyuncu.position
		if d.length() < 32.0:
			oyun.env.mesaj("Vardın: %s" % hedef_ad)
			hedef = null
		elif d.length() > 128.0:
			ok_yon = d.normalized()
	ok.position = oyun.oyuncu.position + Vector2(0, -10)
	ok.queue_redraw()

func kayit() -> Array:
	return L

func yukle(a) -> void:
	L = []
	hedef = null
	if a is Array:
		for m in a:
			if m is Dictionary and m.has("x"): L.append(m)
