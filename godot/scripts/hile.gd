extends CanvasLayer
class_name Hile
## Hileler (web cheat; belge Sistemler › Arena, hileler, kayıt › Hileler).
## Ana menüde klavyeyle "cheat" yazınca (tekrar yazınca kapanır) ya da Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A ile
## Hile modu açılır. Kalıcı değildir: sekme/oturum boyunca açık kalır (statik), sayfa yenilenince kapanır; tek tek hileler kapalı başlar.
## Açıkken oyunda üstte küçük hile pedi: +100 Vio, +100 XP, +2 saat, Günü bitir, Zamanı sar (basılı), eşya arama, Hileler… penceresi.

static var mod := false
static var tanri := false
static var tek := false
static var dayan := false
static var sonsuz := false
static var gece := false
static var kisayol := false
static var panel := false

var oyun
var yazi := ""
var kod: Array = []
var kod_t := 0.0
const KONAMI := ["u", "u", "d", "d", "l", "r", "l", "r", "b", "a"]
var ped: HBoxContainer
var sar_b: Button
var pen: PanelContainer
var ara: LineEdit
var ara_list: HFlowContainer
var miktar := 1
var anahtarlar := {}

func kur(o) -> void:
	oyun = o
	layer = 32
	process_mode = Node.PROCESS_MODE_ALWAYS
	_arayuz()

# ------------------------------------------------------------------ açma: "cheat" ya da kol kodu (ana menüde)
func _input(e: InputEvent) -> void:
	if oyun == null: return
	if e is InputEventKey and e.pressed and not e.echo:
		if oyun.basta and e.unicode > 0:
			yazi = (yazi + char(e.unicode).to_lower()).right(5)
			if yazi == "cheat":
				yazi = ""
				_degis(not mod)
		if kisayol and mod and not oyun.basta and not get_tree().paused and (ara == null or not ara.has_focus()):
			if e.keycode == KEY_Z: _vio()
			elif e.keycode == KEY_J: _xp()
	var y := ""
	if e is InputEventKey and e.pressed and not e.echo:
		match e.keycode:
			KEY_UP: y = "u"
			KEY_DOWN: y = "d"
			KEY_LEFT: y = "l"
			KEY_RIGHT: y = "r"
			KEY_B: y = "b"
			KEY_A: y = "a"
	elif e is InputEventJoypadButton and e.pressed:
		match e.button_index:
			JOY_BUTTON_DPAD_UP: y = "u"
			JOY_BUTTON_DPAD_DOWN: y = "d"
			JOY_BUTTON_DPAD_LEFT: y = "l"
			JOY_BUTTON_DPAD_RIGHT: y = "r"
			JOY_BUTTON_B: y = "b"
			JOY_BUTTON_A: y = "a"
	if y == "": return
	var t := Time.get_ticks_msec() / 1000.0
	if t - kod_t > 2.0: kod = []
	kod_t = t
	kod.append(y)
	if kod.size() > KONAMI.size(): kod = kod.slice(kod.size() - KONAMI.size())
	if kod == KONAMI:
		kod = []
		if not oyun.basta:
			oyun.env.mesaj("Hile kodu ana menüde çalışır")
			return
		get_viewport().set_input_as_handled()   # son A seçili düğmeye basmaz
		_degis(not mod)

func _degis(a: bool) -> void:
	mod = a
	if not a:
		tanri = false; tek = false; dayan = false; sonsuz = false; gece = false; kisayol = false; panel = false
	else:
		oyun.basarim.bayrak("hile")
	_ilan("Hile modu açık" if a else "Hile modu kapalı")
	if oyun.kayit != null and oyun.kayit.has_method("ana_dugmeler") and oyun.basta: oyun.kayit.ana_dugmeler()

func _ilan(s: String) -> void:
	if oyun.basta:
		var l := Label.new()
		l.text = s
		l.add_theme_font_size_override("font_size", 18)
		l.add_theme_color_override("font_color", Color("#e8d8ff"))
		l.add_theme_color_override("font_outline_color", Color.BLACK)
		l.add_theme_constant_override("outline_size", 4)
		l.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
		l.position = Vector2(-80, -60)
		add_child(l)
		get_tree().create_timer(2.0).timeout.connect(l.queue_free)
	else:
		oyun.env.mesaj(s)

# ------------------------------------------------------------------ işler
func _vio() -> void:
	oyun.env.vio_ekle(100)

func _xp() -> void:
	oyun.env.xp_ekle(100)

func _saat(dk: float) -> void:
	var Z = oyun.zaman
	Z.dk += dk
	while Z.dk >= 1440.0:
		Z.dk -= 1440.0; Z.gun += 1

func _gun_bitir() -> void:
	var Z = oyun.zaman
	if Z.dk >= 360.0: Z.gun += 1
	Z.dk = 360.0

func act2() -> void:
	if oyun.ada == 2: return
	oyun.el_yapimi.bilinen["Gemi"] = true
	oyun.kuzen.tanis["act2"] = true; oyun.kuzen.tanis["denizci"] = true
	_kapat_pen()
	oyun.seyahat(2, "land")

func en_ust() -> void:
	var need: Array = oyun.env.G.xpNeed
	while oyun.env.sv - 1 < need.size() and int(need[oyun.env.sv - 1]) > 0:
		oyun.env.xp_ekle(int(need[oyun.env.sv - 1]) - oyun.env.xp + 1)

func harita_ac() -> void:
	var H = oyun.harita_k
	for i in H.kesif.size():
		H.kesif[i] = 1
		H.fog_img.set_pixel(i % oyun.bw, i / oyun.bw, Color(0, 0, 0, 0))
	H.fog_tx.update(H.fog_img)
	H.kirli = true

# ------------------------------------------------------------------ ped ve pencere
func _btn(t: String, f: Callable) -> Button:
	var b := Button.new()
	b.text = t
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 12)
	b.pressed.connect(f)
	return b

func _arayuz() -> void:
	ped = HBoxContainer.new()
	ped.set_anchors_preset(Control.PRESET_CENTER_TOP)
	ped.position = Vector2(-260, 4)
	ped.visible = false
	add_child(ped)
	ped.add_child(_btn("+100 Vio", _vio))
	ped.add_child(_btn("+100 XP", _xp))
	ped.add_child(_btn("+2 saat", func(): _saat(120.0)))
	ped.add_child(_btn("Günü bitir", _gun_bitir))
	sar_b = _btn("Zamanı sar »", func(): pass)
	sar_b.tooltip_text = "Basılı tuttukça zaman hızla akar"
	ped.add_child(sar_b)
	ped.add_child(_btn("Hileler…", _ac_pen))
	pen = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.08, 0.06, 0.12, 0.97); st.border_color = Color("#a07ad8"); st.set_border_width_all(2); st.set_content_margin_all(10)
	pen.add_theme_stylebox_override("panel", st)
	pen.set_anchors_preset(Control.PRESET_CENTER)
	pen.custom_minimum_size = Vector2(560, 420)
	pen.position = Vector2(-280, -210)
	pen.visible = false
	add_child(pen)
	var v := VBoxContainer.new()
	pen.add_child(v)
	var bh := HBoxContainer.new()
	var bl := Label.new(); bl.text = "Hileler"; bl.add_theme_font_size_override("font_size", 18); bl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bh.add_child(bl)
	bh.add_child(_btn("X", _kapat_pen))
	v.add_child(bh)
	var g := GridContainer.new(); g.columns = 2
	v.add_child(g)
	for a in [["mod", "Hile modu"], ["tanri", "Tanrı modu · can, tokluk, enerji, mana hep dolu"], ["tek", "Tek vuruşta öldür"], ["dayan", "Sınırsız dayanıklılık"],
			["sonsuz", "Sınırsız Vio · satın almak Vio'nu azaltmaz"], ["gece", "Gece ışığı"], ["kisayol", "Hile kısayolları · Z +100 Vio, J +100 XP"], ["panel", "Hile paneli · +100 Vio, +100 XP, saat, gün, zaman"]]:
		var c := CheckBox.new()
		c.text = a[1]
		c.focus_mode = Control.FOCUS_NONE
		c.add_theme_font_size_override("font_size", 12)
		var k: String = a[0]
		c.toggled.connect(func(on: bool): _anahtar(k, on))
		anahtarlar[k] = c
		g.add_child(c)
	var hb := HBoxContainer.new()
	v.add_child(hb)
	hb.add_child(_btn("ACT 2'ye geç", act2))
	hb.add_child(_btn("Seviyeyi en üste çıkar", en_ust))
	hb.add_child(_btn("Haritayı tamamen aç", harita_ac))
	var ah := HBoxContainer.new()
	v.add_child(ah)
	ara = LineEdit.new()
	ara.placeholder_text = "Eşya ara…"
	ara.custom_minimum_size = Vector2(260, 0)
	ara.text_changed.connect(func(_t): _ara_ciz())
	ah.add_child(ara)
	for m in [1, 10, 50, 100]:
		var mb := _btn("×%d" % m, func():
			miktar = m
			_ara_ciz())
		ah.add_child(mb)
	var sk := ScrollContainer.new()
	sk.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sk.custom_minimum_size = Vector2(0, 200)
	v.add_child(sk)
	ara_list = HFlowContainer.new()
	ara_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sk.add_child(ara_list)

func _anahtar(k: String, on: bool) -> void:
	match k:
		"mod":
			if on != mod: _degis(on)
		"tanri": tanri = on
		"tek": tek = on
		"dayan": dayan = on
		"sonsuz":
			sonsuz = on
			oyun.set_meta("sonsuz_vio", on)
		"gece": gece = on
		"kisayol": kisayol = on
		"panel": panel = on
	_esitle()

func _esitle() -> void:
	var D := {mod = mod, tanri = tanri, tek = tek, dayan = dayan, sonsuz = sonsuz, gece = gece, kisayol = kisayol, panel = panel}
	for k in anahtarlar:
		anahtarlar[k].set_pressed_no_signal(bool(D[k]))

func _ac_pen() -> void:
	_esitle()
	pen.visible = true
	get_tree().paused = true
	_ara_ciz()

func _kapat_pen() -> void:
	pen.visible = false
	ara.release_focus()
	get_tree().paused = false

func _ara_ciz() -> void:
	for c in ara_list.get_children(): c.queue_free()
	var q := ara.text.strip_edges().to_lower()
	if q.length() < 2: return
	var L := []
	for n in oyun.env.ikon:
		if str(n).to_lower().contains(q): L.append(n)
	L.sort()
	for n in L.slice(0, 60):
		var b := Button.new()
		b.icon = oyun.env.ikon_al(n)
		b.text = n
		b.focus_mode = Control.FOCUS_NONE
		b.add_theme_font_size_override("font_size", 11)
		var ad: String = n
		b.pressed.connect(func():
			oyun.env.ekle(ad, miktar)
			oyun.env.mesaj("+%d %s" % [miktar, ad]))
		ara_list.add_child(b)

func _process(dt: float) -> void:
	if oyun == null: return
	ped.visible = mod and panel and not oyun.basta and not (oyun.arena != null and oyun.arena.acik_mi())
	if pen.visible and Input.is_action_just_pressed("ui_cancel"): _kapat_pen()
	if not mod or oyun.basta: return
	if sar_b.button_pressed and not get_tree().paused: _saat(dt * 60.0)
	if tanri and not get_tree().paused:
		var P = oyun.oyuncu
		P.hp = P.hp_max; P.st = P.st_max
		oyun.can_guncelle(P.hp, P.hp_max)
		oyun.env.tokluk = 100.0
		if oyun.buyu != null: oyun.buyu.mana = oyun.buyu.en_cok()
