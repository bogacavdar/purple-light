extends CanvasLayer
class_name Ayarlar
## Ayarlar ve erişilebilirlik (web settings; belge Sistemler › Kontroller, Arayüz › Erişilebilirlik, Akış › Ana menü › Menü vurgusu).
## Ana menüde "Ayarlar", oyunda O (ya da Esc menüsünde "Ayarlar"). Seçimler bu cihazda hatırlanır (user://ayarlar.json, bütün kayıtlar için ortak).
## Müzik ve efekt sesi, menü vurgusu, kontroller (tuş atama, varsayılana dön), kayıtları dışa/içe aktar (tarayıcıda), renk körü modu,
## kalp atışını ekranda göster, titreşim, tam ekran; hile ayarları görünürse hile modu ve hileler. Başlığa art arda 3 dokunuş hile ayarlarını açar.

const YOL := "user://ayarlar.json"
const VURGU := [["Mor", "#B57BFF"], ["Pembe", "#FF7AD9"], ["Mavi", "#7AC8FF"], ["Altın", "#FFC56B"]]
const ETIKET := {"yukari": "Yukarı", "asagi": "Aşağı", "sol": "Sol", "sag": "Sağ", "kos": "Koş", "vur": "Vur", "atil": "Atıl", "savus": "Savuştur / gard",
	"topla": "Topla / konuş", "ye": "Ye", "canta": "Çanta", "el_yapimi": "El yapımı", "kitap": "Tarif kitabı", "yetenek": "Yetenekler", "karakter": "Karakter",
	"insa": "İnşa", "bin": "Bin / in", "kopek": "Ulti / köpekler", "harita": "Harita", "isaret": "İşaret koy", "almanak": "Almanak", "kamp": "Kamp ateşi yak", "mesale": "Meşale", "kemer1": "Kemer 1",
	"kemer2": "Kemer 2", "kemer3": "Kemer 3", "kemer4": "Kemer 4", "kemer5": "Kemer 5", "ayarlar": "Ayarlar"}

static var V := {}
static var yuklendi := false
static var rk := false          # renk körü modu
static var kalp := false        # kalp atışını ekranda göster
static var titresim := true
static var tam_ekran := true
static var muzik := 70
static var efekt := 80
static var vurgu := "#B57BFF"
static var tuslar := {}         # eylem → [fiziksel tuş kodu]
static var butun_sahne := false # ana menüde "love": Kitap › Anılar'da Bütün sahneler (cihazda)

var oyun
var pen: ColorRect
var ic: VBoxContainer
var baslik: Label
var bekle := ""                 # tuş bekleyen eylem
var dokunus: Array = []
var hile_gorunur := false

static func yukle() -> void:
	if yuklendi: return
	yuklendi = true
	if FileAccess.file_exists(YOL):
		var j = JSON.parse_string(FileAccess.get_file_as_string(YOL))
		if j is Dictionary: V = j
	rk = bool(V.get("rk", false)); kalp = bool(V.get("kalp", false)); titresim = bool(V.get("tit", true)); tam_ekran = bool(V.get("tam", true))
	butun_sahne = bool(V.get("love", false))
	muzik = int(V.get("muzik", 70)); efekt = int(V.get("efekt", 80)); vurgu = str(V.get("vurgu", "#B57BFF")); tuslar = V.get("tuslar", {})

static func kaydet() -> void:
	V = {love = butun_sahne, rk = rk, kalp = kalp, tit = titresim, tam = tam_ekran, muzik = muzik, efekt = efekt, vurgu = vurgu, tuslar = tuslar}
	var f := FileAccess.open(YOL, FileAccess.WRITE)
	if f != null: f.store_string(JSON.stringify(V))

# ------------------------------------------------------------------ renk körü modu (Okabe–Ito'dan, koyu zemine göre açılmış)
static func tamam() -> Color:
	return Color("#56B4E9") if rk else Color("#c8f0a0")

static func eksik() -> Color:
	return Color("#E8743A") if rk else Color("#ffb0a0")

static func yapilir() -> Color:
	return Color("#F0E442") if rk else Color("#F2D070")

static func isaret(ok: bool) -> String:
	return ("✓ " if ok else "✗ ") if rk else ""

static func konur(ok: bool, a := 1.0) -> Color:
	var c := (Color("#56B4E9") if ok else Color("#E8743A")) if rk else (Color("#8fe06b") if ok else Color("#ff6a5a"))
	c.a = a
	return c

static func hex(c: Color) -> String:
	return "#" + c.to_html(false)

# ------------------------------------------------------------------ tuşlar
static func tuslari_uygula() -> void:
	yukle()
	for a in tuslar:
		if not InputMap.has_action(a): continue
		for e in InputMap.action_get_events(a):
			if e is InputEventKey: InputMap.action_erase_event(a, e)
		for k in tuslar[a]:
			var e := InputEventKey.new()
			e.physical_keycode = int(k)
			InputMap.action_add_event(a, e)

static func tus_adi(a: String) -> String:
	var L := []
	if not InputMap.has_action(a): return "-"
	for e in InputMap.action_get_events(a):
		if e is InputEventKey: L.append(OS.get_keycode_string(e.physical_keycode if e.physical_keycode != 0 else e.keycode))
	return ", ".join(L) if L.size() > 0 else "-"

# ------------------------------------------------------------------ titreşim: hasar alınca kol (ve telefon) titrer, hasarla güçlenir
static func titret(guc: float, sure := 0.18) -> void:
	yukle()
	if not titresim: return
	var g := clampf(guc, 0.1, 1.0)
	for d in Input.get_connected_joypads(): Input.start_joy_vibration(d, g * 0.6, g, sure)
	if OS.has_feature("mobile") or OS.has_feature("web_android") or OS.has_feature("web_ios"): Input.vibrate_handheld(int(sure * 1000.0))

# ------------------------------------------------------------------ pencere
func kur(o) -> void:
	oyun = o
	layer = 34
	process_mode = Node.PROCESS_MODE_ALWAYS
	yukle()
	_ses_uygula()
	if not InputMap.has_action("ayarlar"):
		InputMap.add_action("ayarlar")
		var e := InputEventKey.new(); e.physical_keycode = KEY_O
		InputMap.action_add_event("ayarlar", e)
	tuslari_uygula()
	pen = ColorRect.new()
	pen.color = Color(0.03, 0.02, 0.06, 0.72)
	pen.set_anchors_preset(Control.PRESET_FULL_RECT)
	pen.visible = false
	pen.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT: kapat())
	add_child(pen)
	var kutu := PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#1a2216"); st.border_color = Color("#c9a24a"); st.set_border_width_all(3); st.set_content_margin_all(12)
	kutu.add_theme_stylebox_override("panel", st)
	kutu.set_anchors_preset(Control.PRESET_CENTER)
	kutu.custom_minimum_size = Vector2(760, 540)
	kutu.position = Vector2(-380, -270)
	kutu.gui_input.connect(func(_e): kutu.accept_event())
	pen.add_child(kutu)
	var v := VBoxContainer.new()
	kutu.add_child(v)
	var bh := HBoxContainer.new()
	baslik = Label.new()
	baslik.text = "Ayarlar"
	baslik.add_theme_font_size_override("font_size", 20)
	baslik.add_theme_color_override("font_color", Color("#f2c84b"))
	baslik.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	baslik.mouse_filter = Control.MOUSE_FILTER_STOP
	baslik.gui_input.connect(_baslik_dokun)
	bh.add_child(baslik)
	var x := Button.new(); x.text = "Tamam"; x.focus_mode = Control.FOCUS_NONE; x.pressed.connect(kapat)
	bh.add_child(x)
	v.add_child(bh)
	var sk := ScrollContainer.new()
	sk.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sk.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	v.add_child(sk)
	ic = VBoxContainer.new()
	ic.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sk.add_child(ic)

## telefonda başlığa art arda 3 dokunuş hile ayarlarını açar (yalnız açar, kapatmaz)
func _baslik_dokun(e: InputEvent) -> void:
	if not ((e is InputEventMouseButton or e is InputEventScreenTouch) and e.pressed): return
	var t := Time.get_ticks_msec() / 1000.0
	dokunus.append(t)
	while dokunus.size() > 0 and t - float(dokunus[0]) > 1.2: dokunus.pop_front()
	if dokunus.size() >= 3:
		dokunus = []
		hile_gorunur = true
		if not Hile.mod: oyun.hile._degis(true)
		_ciz()

func acik() -> bool:
	return pen.visible

func ac() -> void:
	pen.visible = true
	get_tree().paused = true
	_ciz()

func kapat() -> void:
	bekle = ""
	pen.visible = false
	if not oyun.basta: get_tree().paused = false

func _bl(t: String) -> Label:
	var l := Label.new()
	l.text = t
	l.add_theme_color_override("font_color", Color("#f2c84b"))
	l.add_theme_font_size_override("font_size", 14)
	return l

func _not(t: String) -> Label:
	var l := Label.new()
	l.text = t
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.add_theme_font_size_override("font_size", 11)
	l.add_theme_color_override("font_color", Color("#b8b090"))
	return l

func _anahtar(t: String, on: bool, f: Callable, aciklama := "") -> void:
	var c := CheckButton.new()
	c.text = t
	c.button_pressed = on
	c.focus_mode = Control.FOCUS_NONE
	c.add_theme_font_size_override("font_size", 13)
	c.toggled.connect(f)
	ic.add_child(c)
	if aciklama != "": ic.add_child(_not(aciklama))

func _kaydirici(t: String, d: int, f: Callable) -> void:
	var h := HBoxContainer.new()
	var l := Label.new(); l.text = t; l.custom_minimum_size = Vector2(120, 0); l.add_theme_font_size_override("font_size", 13)
	h.add_child(l)
	var s := HSlider.new()
	s.min_value = 0; s.max_value = 100; s.value = d
	s.custom_minimum_size = Vector2(300, 20)
	s.focus_mode = Control.FOCUS_NONE
	var yz := Label.new(); yz.text = "%d" % d; yz.add_theme_font_size_override("font_size", 12)
	s.value_changed.connect(func(v):
		yz.text = "%d" % int(v)
		f.call(int(v)))
	h.add_child(s); h.add_child(yz)
	ic.add_child(h)

func _ciz() -> void:
	for c in ic.get_children(): c.queue_free()
	ic.add_child(_bl("Ses"))
	_kaydirici("Müzik sesi", muzik, func(v):
		muzik = v; _ses_uygula(); kaydet())
	_kaydirici("Efekt sesi", efekt, func(v):
		efekt = v; _ses_uygula(); kaydet())
	ic.add_child(_bl("Menü vurgusu"))
	ic.add_child(_not("Ana menüdeki düğmelerin çerçevesi ve parlamasının rengi."))
	var vh := HBoxContainer.new()
	for a in VURGU:
		var b := Button.new()
		b.text = a[0]
		b.focus_mode = Control.FOCUS_NONE
		var stl := StyleBoxFlat.new(); stl.bg_color = Color(a[1]).darkened(0.5); stl.border_color = Color(a[1]); stl.set_border_width_all(3 if vurgu == a[1] else 1)
		stl.content_margin_left = 10; stl.content_margin_right = 10
		b.add_theme_stylebox_override("normal", stl)
		var hx: String = a[1]
		b.pressed.connect(func():
			vurgu = hx; kaydet(); _ciz()
			if oyun.basta: oyun.kayit.ana_dugmeler())
		vh.add_child(b)
	ic.add_child(vh)
	ic.add_child(_bl("Erişilebilirlik"))
	_anahtar("Renk körü modu", rk, func(on):
		rk = on; kaydet(),
		"\"Var / yok / yapılabilir\" renkleri her renk körlüğü türünde ayırt edilen bir palete geçer (mavi ✓, turuncu ✗, açık sarı +) ve her durumun önüne işaret konur.")
	_anahtar("Kalp atışını ekranda göster", kalp, func(on):
		kalp = on; kaydet(),
		"Gece beliren sevdiğin kişi göründüğü sürece her kalp atışında ekranın kenarları mor bir ışıkla nabız gibi atar.")
	_anahtar("Titreşim", titresim, func(on):
		titresim = on; kaydet(),
		"Açıkken hasar aldığında oyun kolu (ve telefon) titrer.")
	_anahtar("Tam ekran", tam_ekran, func(on):
		tam_ekran = on; kaydet(); _tam_ekran_uygula(),
		"Açıkken oyun bütün ekranı kaplar. Oyun açılınca ilk tıklamada kendiliğinden tam ekrana geçer; kapatırsan bu tercih hatırlanır.")
	if OS.has_feature("web"):
		ic.add_child(_bl("Kayıtlar"))
		var kh := HBoxContainer.new()
		var b1 := Button.new(); b1.text = "Kayıtları dışa aktar"; b1.focus_mode = Control.FOCUS_NONE; b1.pressed.connect(_disa)
		var b2 := Button.new(); b2.text = "Kayıtları içe aktar"; b2.focus_mode = Control.FOCUS_NONE; b2.pressed.connect(_ice)
		kh.add_child(b1); kh.add_child(b2)
		ic.add_child(kh)
	ic.add_child(_bl("Kontroller"))
	ic.add_child(_not("Bir eyleme bas, sonra yeni tuşa bas. Esc vazgeçer."))
	var g := GridContainer.new(); g.columns = 4
	for a in ETIKET:
		var l := Label.new(); l.text = ETIKET[a]; l.add_theme_font_size_override("font_size", 12); l.custom_minimum_size = Vector2(120, 0)
		g.add_child(l)
		var b := Button.new()
		b.text = "Bir tuşa bas…" if bekle == a else tus_adi(a)
		b.focus_mode = Control.FOCUS_NONE
		b.custom_minimum_size = Vector2(110, 0)
		b.add_theme_font_size_override("font_size", 12)
		var ad: String = a
		b.pressed.connect(func():
			bekle = ad; _ciz())
		g.add_child(b)
	ic.add_child(g)
	var vd := Button.new(); vd.text = "Varsayılana dön"; vd.focus_mode = Control.FOCUS_NONE
	vd.pressed.connect(func():
		tuslar = {}; kaydet()
		Girdi.kur()
		if InputMap.has_action("ayarlar"):
			InputMap.erase_action("ayarlar")
		InputMap.add_action("ayarlar")
		var e := InputEventKey.new(); e.physical_keycode = KEY_O
		InputMap.action_add_event("ayarlar", e)
		oyun.yardim_guncelle()
		_ciz())
	ic.add_child(vd)
	if hile_gorunur or Hile.mod:
		ic.add_child(_bl("Hile"))
		_anahtar("Hile modu", Hile.mod, func(on):
			oyun.hile._degis(on)
			_ciz(),
			"Açınca kendiliğinden hiçbir hile gelmez: oyunun içinde hileler tek tek açılır.")
		if Hile.mod and not oyun.basta:
			var hb := Button.new(); hb.text = "Hileler…"; hb.focus_mode = Control.FOCUS_NONE
			hb.pressed.connect(func():
				kapat(); oyun.hile._ac_pen())
			ic.add_child(hb)

func _input(e: InputEvent) -> void:
	if oyun == null: return
	if bekle != "" and e is InputEventKey and e.pressed and not e.echo:
		get_viewport().set_input_as_handled()
		if e.physical_keycode != KEY_ESCAPE:
			tuslar[bekle] = [int(e.physical_keycode)]
			kaydet()
			tuslari_uygula()
			oyun.yardim_guncelle()
		bekle = ""
		_ciz()
		return
	# ilk tıklamada tam ekran (tarayıcı izin verirse)
	if tam_ekran and e is InputEventMouseButton and e.pressed and DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN and not V.has("_tam_denendi"):
		V["_tam_denendi"] = true
		_tam_ekran_uygula()

func _tam_ekran_uygula() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if tam_ekran else DisplayServer.WINDOW_MODE_WINDOWED)

func _ses_uygula() -> void:
	for b in [["Muzik", muzik], ["Efekt", efekt]]:
		var i := AudioServer.get_bus_index(b[0])
		if i < 0:
			AudioServer.add_bus()
			i = AudioServer.bus_count - 1
			AudioServer.set_bus_name(i, b[0])
		AudioServer.set_bus_volume_db(i, linear_to_db(maxf(0.0001, int(b[1]) / 100.0)))

# ------------------------------------------------------------------ kayıtları dışa / içe aktar (tarayıcıda dosya olarak)
func _disa() -> void:
	var d := {}
	for y in ["oto", "1", "2", "3"]:
		var p: String = Kayit.yol(y)
		if FileAccess.file_exists(p): d[y] = FileAccess.get_file_as_string(p)
	var s := JSON.stringify({purple_light = 1, kayitlar = d})
	JavaScriptBridge.download_buffer(s.to_utf8_buffer(), "purple-light-kayitlar.json", "application/json")

var _js_cb = null
func _ice() -> void:
	_js_cb = JavaScriptBridge.create_callback(_ice_geldi)
	var w = JavaScriptBridge.get_interface("window")
	w.__plIce = _js_cb
	JavaScriptBridge.eval("(function(){var i=document.createElement('input');i.type='file';i.accept='.json,application/json';i.onchange=function(){var f=i.files&&i.files[0];if(!f)return;var r=new FileReader();r.onload=function(){window.__plIce(String(r.result))};r.readAsText(f)};i.click()})()")

func _ice_geldi(args) -> void:
	var j = JSON.parse_string(str(args[0]))
	if not (j is Dictionary) or not j.has("kayitlar"):
		oyun.env.mesaj("Bu dosya bir Purple Light kaydı değil", true)
		return
	var n := 0
	for y in j.kayitlar:
		var f := FileAccess.open(Kayit.yol(str(y)), FileAccess.WRITE)
		if f != null:
			f.store_string(str(j.kayitlar[y])); n += 1
	if oyun.basta: oyun.kayit.ana_goster("%d kayıt içe aktarıldı" % n)
	else: oyun.env.mesaj("%d kayıt içe aktarıldı" % n)

func _process(_dt: float) -> void:
	if oyun == null: return
	if Input.is_action_just_pressed("ayarlar") and bekle == "" and not oyun.konusma.visible:
		if acik(): kapat()
		elif not get_tree().paused or oyun.basta: ac()
	elif acik() and bekle == "" and Input.is_action_just_pressed("ui_cancel"): kapat()
