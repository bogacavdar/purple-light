## Usta Sinan (web talkUsta, renderUsta, renderCarp, HOUSES): tanışma hediyesi, yapı ve ev eşyası siparişi, ev ve barınak siparişi.
extends CanvasLayer

var oyun
var env
var pencere: PanelContainer
var baslik: Label
var liste: VBoxContainer
var kip := "siparis"

func kur(o) -> void:
	oyun = o
	env = o.env
	layer = 6
	var arka := ColorRect.new(); arka.color = Color(0, 0, 0, 0.45)
	add_child(arka); arka.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	arka.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed: visible = false)
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#1c2419"); st.border_color = Color("#c9a24a"); st.set_border_width_all(2); st.set_content_margin_all(10)
	pencere.add_theme_stylebox_override("panel", st)
	add_child(pencere)
	var v := VBoxContainer.new(); pencere.add_child(v)
	baslik = Label.new(); baslik.add_theme_font_size_override("font_size", 17); baslik.add_theme_color_override("font_color", Color("#f2c94c"))
	v.add_child(baslik)
	var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(620, 420)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	liste = VBoxContainer.new(); liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste); v.add_child(sc)
	visible = false

func _por():
	for n in oyun.kisiler:
		if n.K.k == "usta": return load(n.K.portre) if n.K.portre != null else null
	return null

## web talkUsta
func konus() -> void:
	if not oyun.kuzen.tanis.has("usta"):
		oyun.kuzen.tanis["usta"] = true
		env.ekle("Hasır yatak")
		oyun.konusma.ac("Usta Sinan", _por(), "Hoş geldin evlat! Ben [b]Sinan[/b], zanaatkârım. Kemal seni gönderdi demek… Al, bu [b]hasır yatak[/b] benden hediye. Çantana koydum; seçip istediğin yere koy, gece olunca üstünde uyursun.\n\nBen ahşap ve taş işinin, [b]yapıların[/b] ve [b]evlerin[/b] ustasıyım: yaprak barınağından konağa evleri Vio’yla yaparım; kulübe, çit, ocak, yatak… Tarifini Zümrüt'ün kazanında öğrendiğin bir yapının malzemelerini getirirsen kurarım; emeğimi ödersin. Bir de [b]Atölye[/b] kurarım: içine malzeme koyarsın, bir tarifi kendi kendine üretir.",
			[{t = "Sipariş vermek istiyorum", pri = true, f = func(): ac("siparis")}, {t = "Ev ve barınak siparişi", f = func(): ac("ev")}, {t = "Teşekkürler", kapat = true}])
		return
	var L := ["Testere hazır, tahta kuru. Ne yapıyoruz?", "Ev dediğin, içinde uyku olan yerdir. Yatağını unutma.", "Gel bakalım! Yatağın rahat mı?"]
	oyun.konusma.ac("Usta Sinan", _por(), L[randi() % L.size()], [{t = "Sipariş ver", pri = true, f = func(): ac("siparis")}, {t = "Ev ve barınak siparişi", f = func(): ac("ev")}, {t = "Hoşça kal", kapat = true}])

func ac(k: String) -> void:
	kip = k
	visible = true
	ciz()

func _lbl(t: String, boy := 12, renk := Color("#e8e2cc")) -> Label:
	var l := Label.new(); l.text = t; l.add_theme_font_size_override("font_size", boy); l.add_theme_color_override("font_color", renk)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD; l.custom_minimum_size = Vector2(440, 0)
	return l

func ciz() -> void:
	for c in liste.get_children():
		liste.remove_child(c); c.queue_free()
	if kip == "siparis": _siparis()
	else: _evler()
	pencere.reset_size()
	pencere.position = ((get_viewport().get_visible_rect().size - pencere.size) / 2.0).floor()

func _satir(ikon_ad: String, ust: String, alt: String, dugme: String, ok: bool, f: Callable, soluk := false) -> void:
	var h := HBoxContainer.new()
	var t := TextureRect.new(); t.texture = env.ikon_al(ikon_ad); t.custom_minimum_size = Vector2(28, 28)
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	h.add_child(t)
	var v := VBoxContainer.new(); v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.add_child(_lbl(ust, 13, Color("#fff2c0")))
	if alt != "": v.add_child(_lbl(alt, 11, Color("#b8ac90")))
	h.add_child(v)
	var b := Button.new(); b.text = dugme; b.disabled = not ok; b.pressed.connect(f)
	h.add_child(b)
	if soluk: h.modulate.a = 0.55
	liste.add_child(h)

static func _f(v: int) -> String:
	var s := str(v)
	return s if s.length() <= 3 else s.substr(0, s.length() - 3) + "." + s.substr(s.length() - 3)

## web renderUsta: tarifi öğrenilmiş yapılar ve ev eşyaları; malzeme senden, işçilik Sinan'dan
func _siparis() -> void:
	baslik.text = "Usta Sinan · Sipariş"
	liste.add_child(_lbl("Sinan hiçbir şey satmaz. Tarifini [kazanda öğrendiğin] bir yapının malzemelerini getirirsen kurar, yalnızca işçiliğini alır. Evleri ve barınakları da Usta Sinan yapar (\"Ev ve barınak siparişi\"); aldığını çantandan seçer, yere kurarsın.".replace("[", "").replace("]", ""), 11, Color("#b8ac90")))
	var ey = oyun.el_yapimi
	var adlar := []
	for n in oyun.yapi.Y.yapi:
		if ey.R.has(n) and not (int(oyun.yapi.Y.yapi[n].get("ev", 0)) == 1 and n == "Yaprak barınağı"): adlar.append(n)
	adlar.sort_custom(func(a, b): return [0 if ey.bilinen.has(a) else 1, a] < [0 if ey.bilinen.has(b) else 1, b])
	for n in adlar:
		var ok: bool = ey.bilinen.has(n)
		var pr := int(oyun.yapi.Y.yapi[n].usta)
		var eks: String = ey.eksik(n) if ok else ""
		var y: Dictionary = oyun.yapi.Y.yapi[n]
		var alt := ""
		if ok:
			var a := []
			for p in ey.R[n].i: a.append("%d %s (%d)" % [int(p[1]), p[0], env.adet(str(p[0]))])
			alt = ", ".join(a) + (" · evin içine konur (Döşe)" if int(y.get("evesya", 0)) == 1 else " · yere konur · %d×%d kare" % [int(y.foot[0]), int(y.foot[1])])
		else:
			alt = "tarifini önce Zümrüt'ün kazanında öğren"
		_satir(n, n if ok else "???", alt, "Yaptır · işçilik %d" % pr, ok and eks == "" and env.vio >= pr, _yaptir.bind(n), not ok)

func _yaptir(n: String) -> void:
	var ey = oyun.el_yapimi
	var pr := int(oyun.yapi.Y.yapi[n].usta)
	if not ey.bilinen.has(n) or ey.eksik(n) != "" or env.vio < pr: return
	for p in ey.R[n].i: env.eksilt(str(p[0]), int(p[1]))
	env.vio_ekle(-pr)
	env.ekle(n)
	env.xp_ekle(2)
	env.mesaj("%s hazır: %s" % [n, "evine gir, Döşe ile yerleştir" if int(oyun.yapi.Y.yapi[n].get("evesya", 0)) == 1 else "çantanda · seç, yere kur"])
	ciz()

func _ev_neden(H: Dictionary) -> String:
	if env.sv < int(H.lv): return "Seviye %d gerekli" % int(H.lv)
	if env.vio < int(H.c): return "%d Vio eksik" % (int(H.c) - env.vio)
	if H.mat != null:
		var m := []
		for x in H.mat:
			if env.adet(str(x[0])) < int(x[1]): m.append("%d %s" % [int(x[1]) - env.adet(str(x[0])), x[0]])
		if not m.is_empty(): return "Eksik: " + ", ".join(m)
	return ""

## web renderCarp
func _evler() -> void:
	baslik.text = "Usta Sinan · Evler ve barınaklar"
	liste.add_child(_lbl("Sinan, istediğin evi Vio karşılığı yapar; aldığını çantandan seçer, istediğin yere kurarsın. Yaprak barınağı dışındaki evlerde uyumak için içine bir yatak koymalısın (yatağı Usta Sinan yapar).", 11, Color("#b8ac90")))
	for H in oyun.yapi.Y.evler:
		var neden := _ev_neden(H)
		var alt: String = str(H.d)
		if H.mat != null:
			var a := []
			for x in H.mat: a.append("%d %s (%d)" % [int(x[1]), x[0], env.adet(str(x[0]))])
			alt += " · " + ", ".join(a)
		if env.sv < int(H.lv): alt += " · Seviye %d" % int(H.lv)
		var own: int = env.adet(str(H.n))
		_satir(str(H.n), str(H.n) + ("  · sende %d" % own if own > 0 else ""), alt, "Yaptır · " + _f(int(H.c)), neden == "", _ev_al.bind(H), env.sv < int(H.lv))

func _ev_al(H: Dictionary) -> void:
	if _ev_neden(H) != "": return
	env.vio_ekle(-int(H.c))
	if H.mat != null:
		for x in H.mat: env.eksilt(str(x[0]), int(x[1]))
	env.ekle(str(H.n))
	env.mesaj("%s hazır: çantanda · seç, yere kur" % H.n)
	ciz()

func _unhandled_input(e: InputEvent) -> void:
	if visible and e is InputEventKey and e.pressed and e.physical_keycode == KEY_ESCAPE:
		visible = false
		get_viewport().set_input_as_handled()
