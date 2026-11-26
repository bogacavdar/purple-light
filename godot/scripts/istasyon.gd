## Zümrüt'ün kazanı ve örsler (web brew): kazan yalnızca öğretir: malzemeler kazana gider, tarif kitaba yazılır (+12 XP), bir şey çıkmaz.
## Örste (Dursun: alet ve silah, Durmuş: zırh) öğrenilmiş bir tarif malzemeler ve işçilik (Vio) karşılığı dövülür.
## Kazanda görünen tarifler (web isOpen, Normal): bütün malzemelerini (ve aletlerini) en az bir kez görmüş olduğun, henüz öğrenmediğin tarifler.
extends Node

var oyun
var env
var ey                 # el_yapimi.gd (tarif tablosu ve bilinenler)
var pencere: PanelContainer
var liste: VBoxContainer
var ayrinti: VBoxContainer
var baslik: Label
var kip := "kazan"     # "kazan" · "smith" · "durmus"
var secili := ""

func kur(o) -> void:
	oyun = o
	env = o.env
	ey = o.el_yapimi
	_arayuz()

func ac(k: String) -> void:
	kip = k
	secili = ""
	pencere.visible = true
	ciz()

func _process(_d: float) -> void:
	if pencere.visible and (Input.is_action_just_pressed("ui_cancel") or oyun.oyuncu.yuruyor):
		pencere.visible = false

## pencerenin dışına basmak kapatır (Boğaç, 3 Kasım 2026)
func _input(e: InputEvent) -> void:
	if pencere.visible and e is InputEventMouseButton and e.pressed and not pencere.get_global_rect().has_point(e.position):
		pencere.visible = false
		get_viewport().set_input_as_handled()

func sec(r: String) -> void:
	secili = r
	ciz()
	_ayrinti()

func _acik(r: String) -> bool:
	if ey.verilen.has(r): return true
	var x: Dictionary = ey.R[r]
	for p in x.i:
		if not env.gorulen.has(str(p[0])) and not ey.bilinen.has(str(p[0])):
			return false
	for t in x.t:
		if not env.gorulen.has(str(t)) and not ey.bilinen.has(str(t)):
			return false
	return true

func _adlar() -> Array:
	var out := []
	for r in ey.R:
		if kip == "kazan":
			if not ey.bilinen.has(r) and _acik(r):
				out.append(r)
		else:
			if ey.R[r].forged and ey.bilinen.has(r) and env.G.usta.get(r, "") == kip:
				out.append(r)
	out.sort_custom(func(a, b): return [ey.kat_sira[ey.R[a].c], a] < [ey.kat_sira[ey.R[b].c], b])
	return out

func _islem() -> void:
	var r := secili
	var m: String = ey.eksik(r)
	if m != "":
		env.mesaj("Eksik: " + m, true)
		return
	if kip == "kazan":
		for p in ey.R[r].i:
			env.eksilt(str(p[0]), int(p[1]))
		ey.bilinen[r] = true
		env.xp_ekle(int(env.G.ogrenXP) + (10 if oyun.sk("Z8") else 0))
		oyun.ogr.ogrendi(r)
		var x: Dictionary = ey.R[r]
		var nerde := "Malzemelerini topla, Usta Sinan kurar." if x.place else ("Malzemelerini topla, örste dövülür." if x.forged else "Malzemelerin olduğunda Tab ile yaparsın.")
		env.mesaj("Bu tarifi öğrendin: %s! %s" % [r, nerde])
	else:
		var fee := int(env.G.iscilik.get(r, 0))
		if env.vio < fee:
			env.mesaj("İşçilik %d Vio; %d Vio eksik." % [fee, fee - env.vio], true)
			return
		for p in ey.R[r].i:
			env.eksilt(str(p[0]), int(p[1]))
		env.vio_ekle(-fee)
		env.ekle(r)
		oyun.gorev.dovulen[r] = true
		oyun.ogr.dovuldu(r)
		env.mesaj("Dövüldü: %s · işçilik %d Vio" % [r, fee])
	secili = ""
	ciz()

func _arayuz() -> void:
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.06, 0.09, 0.96); st.border_color = Color("#a07ad8"); st.set_border_width_all(2)
	st.set_content_margin_all(10)
	pencere.add_theme_stylebox_override("panel", st)
	pencere.custom_minimum_size = Vector2(620, 380)
	var v := VBoxContainer.new()
	baslik = Label.new(); oyun._golge(baslik)
	v.add_child(baslik)
	var h := HBoxContainer.new()
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(280, 330)
	liste = VBoxContainer.new()
	liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste)
	h.add_child(sc)
	ayrinti = VBoxContainer.new()
	ayrinti.custom_minimum_size = Vector2(300, 330)
	h.add_child(ayrinti)
	v.add_child(h)
	pencere.add_child(v)
	pencere.visible = false
	oyun.hud.add_child(pencere)
	pencere.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)

func ciz() -> void:
	for c in liste.get_children():
		c.queue_free()
	var adlar := _adlar()
	baslik.text = {"kazan": "Zümrüt'ün kazanı · tarif öğren", "smith": "Demirci Dursun'un örsü · alet ve silah", "durmus": "Zırhçı Durmuş'un örsü · zırh"}[kip]
	if adlar.is_empty():
		var l := Label.new()
		l.autowrap_mode = TextServer.AUTOWRAP_WORD
		l.text = "Kazanda öğrenilecek yeni tarif yok: yeni malzemeler buldukça tarifler burada açılır." if kip == "kazan" else "Burada dövülecek bir tarif bilmiyorsun. Tarifleri Zümrüt'ün kazanında öğren."
		liste.add_child(l)
	for r in adlar:
		var b := Button.new()
		b.flat = true
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.icon = env.ikon_al(r)
		b.text = r
		b.add_theme_font_size_override("font_size", 12)
		b.add_theme_color_override("font_color", Color("#c8f0a0") if ey.eksik(r) == "" else Color("#e8e2cc"))
		b.pressed.connect(func(): secili = r; _ayrinti())
		liste.add_child(b)
	if secili == "" and not adlar.is_empty():
		secili = adlar[0]
	_ayrinti()

func _ayrinti() -> void:
	for c in ayrinti.get_children():
		c.queue_free()
	if secili == "":
		return
	var x: Dictionary = ey.R[secili]
	ayrinti.add_child(ey._ikonlu(secili, secili + "  · " + str(x.c), Color("#fff2c0")))
	for p in x.i:
		var var_: int = env.adet(str(p[0]))
		ayrinti.add_child(ey._ikonlu(str(p[0]), "%d× %s  (sende %d)" % [int(p[1]), p[0], var_], Color("#c8f0a0") if var_ >= int(p[1]) else Color("#ffb0a0")))
	for t in x.t:
		ayrinti.add_child(ey._ikonlu(str(t), "alet: %s %s" % [t, "✓" if env.adet(str(t)) > 0 else "(yok)"], Color("#c8f0a0") if env.adet(str(t)) > 0 else Color("#ffb0a0")))
	var b := Button.new()
	if kip == "kazan":
		b.text = "Öğren (malzemeler kazana gider · +%d XP)" % int(env.G.ogrenXP)
	else:
		b.text = "Döv (işçilik %d Vio)" % int(env.G.iscilik.get(secili, 0))
	b.disabled = ey.eksik(secili) != ""
	b.pressed.connect(_islem)
	ayrinti.add_child(b)
	var e: String = ey.eksik(secili)
	if e != "":
		var en := Label.new(); en.text = "Eksik: " + e; en.autowrap_mode = TextServer.AUTOWRAP_WORD
		en.add_theme_color_override("font_color", Color("#ffb0a0")); en.add_theme_font_size_override("font_size", 11)
		ayrinti.add_child(en)
