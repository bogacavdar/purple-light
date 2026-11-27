## Keşif sisi, büyük harita (M) ve haritadaki yan görev işaretleri (web reveal/explored/fogC, drawMap; belge Sistemler › Harita, işaretler, defterler
## ve ACT 1 › Yan görevler › Haritada yan görevler). Geçtiğin yerin 7 karelik çevresi açılır; deniz baştan görünür ama keşfedilmiş sayılmaz.
## Küçük haritada ve büyük haritada: keşfedilmiş yerde saati gelmiş yan kişinin yerinde "?", keşfedilmemiş yerde ~10 kare yakınken sisli daire
## (kişiden en çok 48 piksel kayar). Büyük harita: tekerlek yakınlaştırır, sürükleme kaydırır, M ya da Esc kapatır; açıkken oyun durur.
extends CanvasLayer

var oyun
var kesif: PackedByteArray
var son := -1
var kirli := false
var t_guncel := 0.0
var t := 0.0
var fog_img: Image
var fog_tx: ImageTexture
var kh_fog: TextureRect
var kh_isaret: Control
var pencere: PanelContainer
var alan: Control
var bilgi: Label
var zoom := 1.0
var merkez := Vector2.ZERO        # karo cinsinden, ekranın ortasındaki yer
var surukle := false
var bas_yer := Vector2.ZERO
var kara := 0
const R := 7
const SIS := Color(0.29, 0.29, 0.32, 0.92)

func kur(o) -> void:
	oyun = o
	layer = 7
	process_mode = Node.PROCESS_MODE_ALWAYS
	var n: int = o.bw * o.bh
	kesif = PackedByteArray(); kesif.resize(n)
	fog_img = Image.create(o.bw, o.bh, false, Image.FORMAT_RGBA8)
	for i in n:
		if o.tiles[i] != 4:
			fog_img.set_pixel(i % o.bw, i / o.bw, SIS)
			kara += 1
	fog_tx = ImageTexture.create_from_image(fog_img)
	kh_fog = TextureRect.new(); kh_fog.texture = fog_tx; kh_fog.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	kh_fog.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; kh_fog.stretch_mode = TextureRect.STRETCH_SCALE
	kh_fog.size = o.kh_resim.custom_minimum_size; kh_fog.mouse_filter = Control.MOUSE_FILTER_IGNORE
	o.kh_resim.add_child(kh_fog)
	o.kh_resim.move_child(kh_fog, 0)
	kh_isaret = Control.new(); kh_isaret.size = o.kh_resim.custom_minimum_size; kh_isaret.mouse_filter = Control.MOUSE_FILTER_IGNORE
	kh_isaret.draw.connect(func():
		_isaretler(kh_isaret, Vector2.ZERO, o.kh_olcek, 10.0)
		if o.isaret != null: o.isaret.ciz(kh_isaret, Vector2.ZERO, o.kh_olcek, 10.0, false)
		if o.halat != null: o.halat.harita_ciz(kh_isaret, Vector2.ZERO, o.kh_olcek, false)
		if o.kamp != null: o.kamp.harita_ciz(kh_isaret, Vector2.ZERO, o.kh_olcek, false))
	o.kh_resim.add_child(kh_isaret)
	# büyük harita
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.03, 0.04, 0.05, 0.96); st.border_color = Color("#c9a24a"); st.set_border_width_all(2); st.set_content_margin_all(8)
	pencere.add_theme_stylebox_override("panel", st)
	var v := VBoxContainer.new()
	alan = Control.new(); alan.clip_contents = true; alan.size_flags_vertical = Control.SIZE_EXPAND_FILL; alan.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	alan.custom_minimum_size = Vector2(780, 500); alan.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	alan.draw.connect(_buyuk_ciz); alan.gui_input.connect(_alan_girdi)
	bilgi = Label.new(); bilgi.add_theme_font_size_override("font_size", 12); bilgi.add_theme_color_override("font_color", Color("#c8bc9c"))
	v.add_child(alan); v.add_child(bilgi)
	pencere.add_child(v)
	add_child(pencere)
	pencere.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
	pencere.visible = false

func acik() -> bool:
	return pencere.visible

# ------------------------------------------------------------------ keşif
func _ac(p: Vector2) -> void:
	var tx: int = int(p.x / oyun.T) - oyun.bx0
	var ty: int = int(p.y / oyun.T) - oyun.by0
	var k: int = ty * oyun.bw + tx
	if k == son: return
	son = k
	for y in range(ty - R, ty + R + 1):
		for x in range(tx - R, tx + R + 1):
			if x < 0 or y < 0 or x >= oyun.bw or y >= oyun.bh or (x - tx) * (x - tx) + (y - ty) * (y - ty) > R * R: continue
			var i: int = y * oyun.bw + x
			if kesif[i] == 0:
				kesif[i] = 1
				fog_img.set_pixel(x, y, Color(0, 0, 0, 0))
				kirli = true

func goruldu(p: Vector2) -> bool:
	var x: int = int(p.x / oyun.T) - oyun.bx0
	var y: int = int(p.y / oyun.T) - oyun.by0
	if x < 0 or y < 0 or x >= oyun.bw or y >= oyun.bh: return false
	return kesif[y * oyun.bw + x] == 1

func yuzde() -> int:
	var n := 0
	for i in kesif.size():
		if kesif[i] == 1 and oyun.tiles[i] != 4: n += 1
	return int(round(100.0 * n / maxf(1.0, float(kara))))

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	t += dt
	if Input.is_action_just_pressed("harita") and not oyun.basta and not oyun.konusma.visible and (acik() or not get_tree().paused):
		if acik(): kapat()
		else: ac()
	if not acik() and get_tree().paused: return
	if not oyun.basta and (oyun.magara == null or not oyun.magara.icinde): _ac(oyun.oyuncu.position)
	t_guncel += dt
	if kirli and t_guncel > 0.25:
		t_guncel = 0.0; kirli = false
		fog_tx.update(fog_img)
	kh_isaret.queue_redraw()
	kh_fog.visible = oyun.magara == null or not oyun.magara.icinde
	kh_isaret.visible = kh_fog.visible
	if acik(): alan.queue_redraw()

func _unhandled_input(e: InputEvent) -> void:
	if acik() and e is InputEventKey and e.pressed and not e.echo and e.keycode == KEY_ESCAPE:
		get_viewport().set_input_as_handled()
		kapat()

func ac() -> void:
	zoom = 1.0
	merkez = Vector2(oyun.bw, oyun.bh) / 2.0
	pencere.visible = true
	get_tree().paused = true
	_bilgi()

func kapat() -> void:
	pencere.visible = false
	get_tree().paused = false

func _bilgi() -> void:
	bilgi.text = "Keşif %%%d · tekerlek: yakınlaştır · sürükle: kaydır · işarete ya da kişiye tıkla: yol göster · sağ tık: sil / oku kaldır · M ya da Esc: kapat" % yuzde()

func _olcek() -> float:
	var A := alan.size
	return minf(A.x / float(oyun.bw), A.y / float(oyun.bh)) * zoom

func _koken() -> Vector2:
	return alan.size / 2.0 - merkez * _olcek()

func _alan_girdi(e: InputEvent) -> void:
	if e is InputEventMouseButton:
		if e.button_index in [MOUSE_BUTTON_WHEEL_UP, MOUSE_BUTTON_WHEEL_DOWN] and e.pressed:
			# farenin altındaki yer yerinde kalır
			var w: Vector2 = (e.position - _koken()) / _olcek()
			zoom = minf(8.0, zoom * 1.25) if e.button_index == MOUSE_BUTTON_WHEEL_UP else maxf(1.0, zoom / 1.25)
			merkez = w - (e.position - alan.size / 2.0) / _olcek()
			if zoom <= 1.0: merkez = Vector2(oyun.bw, oyun.bh) / 2.0
		elif e.button_index == MOUSE_BUTTON_LEFT:
			surukle = e.pressed
			if e.pressed: bas_yer = e.position
			elif e.position.distance_to(bas_yer) < 4.0 and oyun.isaret != null: oyun.isaret.harita_tik(e, _koken(), _olcek())
		elif e.button_index == MOUSE_BUTTON_RIGHT and e.pressed and oyun.isaret != null: oyun.isaret.harita_tik(e, _koken(), _olcek())
		alan.queue_redraw()
	elif e is InputEventMouseMotion and surukle:
		merkez -= e.relative / _olcek()
		alan.queue_redraw()

func _buyuk_ciz() -> void:
	var s := _olcek()
	var o := _koken()
	alan.draw_rect(Rect2(Vector2.ZERO, alan.size), Color("#1e4f86"))
	alan.draw_set_transform(o, 0.0, Vector2(s, s))
	alan.draw_texture(oyun.kh_resim.texture, Vector2.ZERO)
	alan.draw_texture(fog_tx, Vector2.ZERO)
	alan.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	# kişiler (keşfedilmiş yerdekiler; gece de görünür)
	var font := ThemeDB.fallback_font
	for n in oyun.kisiler:
		if not n.visible or not goruldu(n.position): continue
		var p: Vector2 = o + n.position / float(oyun.T) * s
		alan.draw_circle(p, 4.0, Color("#1a1408")); alan.draw_circle(p, 3.0, Color("#f3ecd8"))
		if zoom >= 2.0: alan.draw_string(font, p + Vector2(6, 4), str(n.K.ad), HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color("#f3ecd8"))
	# ana görevin "!"i (görevi olan kişi parlar)
	for x in oyun.gorev.vis:
		var n2 = oyun.gorev.kisi(x.g)
		if n2 == null: continue
		var p2: Vector2 = o + n2.position / float(oyun.T) * s
		var a := 0.5 + 0.4 * sin(t * 4.0)
		alan.draw_circle(p2, 12.0, Color(1, 0.85, 0.25, a * 0.5))
		alan.draw_arc(p2, 12.0 + fmod(t * 14.0, 10.0), 0, TAU, 24, Color(1, 0.85, 0.25, 0.6), 1.5)
		_unlem(alan, p2, 16.0)
	_isaretler(alan, o, s, 16.0)
	if oyun.isaret != null: oyun.isaret.ciz(alan, o, s, 16.0, true)
	if oyun.halat != null: oyun.halat.harita_ciz(alan, o, s, true)
	if oyun.kamp != null: oyun.kamp.harita_ciz(alan, o, s, true)
	# oyuncu
	var pp: Vector2 = o + oyun.oyuncu.position / float(oyun.T) * s
	alan.draw_circle(pp, 7.0, Color(1, 0.85, 0.3, 0.5)); alan.draw_circle(pp, 4.0, Color("#ffd84a")); alan.draw_arc(pp, 4.0, 0, TAU, 16, Color("#1a1408"), 1.0)

func _unlem(c: Control, p: Vector2, boy: float) -> void:
	var k := boy / 16.0
	c.draw_rect(Rect2(p + Vector2(-3, -9) * k, Vector2(6, 18) * k), Color("#1a1408"))
	c.draw_rect(Rect2(p + Vector2(-2, -8) * k, Vector2(4, 10) * k), Color("#ffd23a"))
	c.draw_rect(Rect2(p + Vector2(-2, 4) * k, Vector2(4, 4) * k), Color("#ffd23a"))

## yan görev işaretleri: keşfedilmiş yerde "?", değilse yakınken sisli daire
func _isaretler(c: Control, o: Vector2, s: float, boy: float) -> void:
	if oyun.yan == null or oyun.yan.kapali or oyun.magara.icinde: return
	var font := ThemeDB.fallback_font
	var P: Vector2 = oyun.oyuncu.position
	for q in oyun.yan.Q:
		if oyun.yan.done.has(q.id) or (oyun.yan.A != null and oyun.yan.A.id == q.id): continue
		if not oyun.yan.var_mi(q): continue
		var w: Vector2 = oyun.yan.ev(q)
		if goruldu(w):
			var p := o + w / float(oyun.T) * s
			c.draw_circle(p, boy * 0.6, Color(0.35, 0.6, 1.0, 0.85))
			c.draw_arc(p, boy * 0.6, 0, TAU, 20, Color("#0e1830"), 1.5)
			var fs := int(boy * 0.9)
			var sz := font.get_string_size("?", HORIZONTAL_ALIGNMENT_LEFT, -1, fs)
			c.draw_string(font, p + Vector2(-sz.x / 2.0, fs * 0.36), "?", HORIZONTAL_ALIGNMENT_LEFT, -1, fs, Color.WHITE)
		elif P.distance_to(w) <= 160.0:
			var h := hash(str(q.id))
			var kay := Vector2.from_angle(float(h % 628) / 100.0) * float(h % 49)
			var p2 := o + (w + kay) / float(oyun.T) * s
			var r := maxf(boy, 64.0 / float(oyun.T) * s)
			c.draw_circle(p2, r, Color(0.6, 0.65, 0.85, 0.28 + 0.08 * sin(t * 2.0)))
			c.draw_arc(p2, r, 0, TAU, 24, Color(0.8, 0.85, 1.0, 0.45), 1.0)

# ------------------------------------------------------------------ kayıt (her ada kendi keşfini tutar)
func kayit() -> String:
	var b := PackedByteArray(); b.resize((kesif.size() + 7) / 8)
	for i in kesif.size():
		if kesif[i] == 1: b[i >> 3] |= 1 << (i & 7)
	return Marshalls.raw_to_base64(b)

func yukle(s) -> void:
	kesif.fill(0)
	son = -1
	for i in kesif.size():
		if oyun.tiles[i] != 4: fog_img.set_pixel(i % oyun.bw, i / oyun.bw, SIS)
	if typeof(s) == TYPE_STRING and s != "":
		var b := Marshalls.base64_to_raw(s)
		for i in kesif.size():
			if (i >> 3) < b.size() and (b[i >> 3] >> (i & 7)) & 1:
				kesif[i] = 1
				fog_img.set_pixel(i % oyun.bw, i / oyun.bw, Color(0, 0, 0, 0))
	fog_tx.update(fog_img)
