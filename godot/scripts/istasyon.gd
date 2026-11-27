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

var kazan_sahibi := ""   # kuzen cadının kazanında açıldıysa onun kısa adı

func ac(k: String, sahip := "") -> void:
	kip = k
	kazan_sahibi = sahip
	secili = ""
	pencere.visible = true
	ciz()
	pencere.reset_size()
	pencere.position = ((get_viewport().get_visible_rect().size - pencere.size) / 2.0).floor()

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
			if ey.R[r].forged and ey.bilinen.has(r) and _dover(kip, r):
				out.append(r)
	out.sort_custom(func(a, b): return [ey.kat_sira[ey.R[a].c], a] < [ey.kat_sira[ey.R[b].c], b])
	return out

## web tierOf/smithOf: silahçı silah ve aleti, zırhçı zırhı; kendi kademesine kadar döver
func _dover(k: String, r: String) -> bool:
	var u: Dictionary = oyun.usta_bilgi(k)
	if u.is_empty(): return false
	var zirh: bool = oyun.zirh_set.has(r)
	if zirh != (u.rol == "a"): return false
	return int(oyun.kademe.get(r, 0)) <= int(u.b)

## dövemediği bilinen tarifler ve kimin dövebileceği (web fnote184)
func _dovemez_notu() -> String:
	var u: Dictionary = oyun.usta_bilgi(kip)
	if u.is_empty(): return ""
	var by := {}
	for r in ey.R:
		if not ey.R[r].forged or not ey.bilinen.has(r): continue
		if oyun.zirh_set.has(r) != (u.rol == "a"): continue
		var t := int(oyun.kademe.get(r, 0))
		if t <= int(u.b): continue
		var kim: String = oyun.usta_adi(u.rol, t)
		if not by.has(kim): by[kim] = []
		by[kim].append(r)
	if by.is_empty(): return ""
	var a := []
	for kim in by: a.append("%s → [b]%s[/b]" % [", ".join(by[kim]), kim])
	return "[b]%s[/b] bunları dövemez: %s" % [u.ad, " · ".join(a)]

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

var canta: HFlowContainer

func _canta_ciz() -> void:
	for c in canta.get_children(): c.queue_free()
	canta.visible = kip == "kazan" and kazan_sahibi == "" and oyun.ada == 1
	if not canta.visible: return
	var bl := Label.new()
	bl.text = "Çantan:"
	bl.add_theme_font_size_override("font_size", 11)
	canta.add_child(bl)
	var L := []
	for n in env.inv:
		if int(env.inv[n]) <= 0 or oyun.kusanma.esya.has(n) or oyun.kusanma.silah.has(n) or oyun.toplama_veri.tools.has(n): continue
		L.append(n)
	L.sort()
	for n in L.slice(0, 48):
		var b := Button.new()
		b.icon = env.ikon_al(n)
		b.flat = true
		b.focus_mode = Control.FOCUS_NONE
		b.tooltip_text = "%s ×%d" % [n, int(env.inv[n])]
		b.expand_icon = false
		b.custom_minimum_size = Vector2(26, 26)
		var ad: String = n
		b.pressed.connect(func():
			if oyun.gizli.copluk(ad):
				oyun.gizli.cop_at(ad)
				if pencere.visible: ciz()
				return
			for r in _adlar():
				for p in ey.R[r].i:
					if str(p[0]) == ad:
						secili = r; _ayrinti(); return)
		canta.add_child(b)

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
	# çantandakiler (kazanda): dokununca o malzemeyi kullanan tarif seçilir
	canta = HFlowContainer.new()
	canta.custom_minimum_size = Vector2(600, 0)
	v.add_child(canta)
	pencere.add_child(v)
	pencere.visible = false
	oyun.hud.add_child(pencere)
	pencere.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)

func ciz() -> void:
	for c in liste.get_children():
		c.queue_free()
	var adlar := _adlar()
	if kip == "kazan":
		baslik.text = (oyun.iyelik(kazan_sahibi) + " kazanı · tarif öğren") if kazan_sahibi != "" else ("Yıldız'ın kazanı · tarif öğren" if oyun.ada == 2 else "Zümrüt'ün kazanı · tarif öğren")
	else:
		var u: Dictionary = oyun.usta_bilgi(kip)
		baslik.text = "%s örsü · %s" % [oyun.iyelik(u.ad), "zırh" if u.rol == "a" else "alet ve silah"]
		var nt := _dovemez_notu()
		if nt != "":
			var rl := RichTextLabel.new(); rl.bbcode_enabled = true; rl.fit_content = true; rl.text = nt
			rl.add_theme_font_size_override("normal_font_size", 11); rl.add_theme_font_size_override("bold_font_size", 11)
			liste.add_child(rl)
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
		if ey.eksik(r) == "" and Ayarlar.rk: b.text = "✓ " + b.text
		b.add_theme_color_override("font_color", Ayarlar.tamam() if ey.eksik(r) == "" else Color("#e8e2cc"))
		b.pressed.connect(func(): secili = r; _ayrinti())
		liste.add_child(b)
	if secili == "" and not adlar.is_empty():
		secili = adlar[0]
	_ayrinti()
	_canta_ciz()

func _ayrinti() -> void:
	for c in ayrinti.get_children():
		c.queue_free()
	if secili == "":
		return
	var x: Dictionary = ey.R[secili]
	ayrinti.add_child(ey._ikonlu(secili, secili + "  · " + str(x.c), Color("#fff2c0")))
	for p in x.i:
		var var_: int = env.adet(str(p[0]))
		ayrinti.add_child(ey._ikonlu(str(p[0]), Ayarlar.isaret(var_ >= int(p[1])) + "%d× %s  (sende %d)" % [int(p[1]), p[0], var_], Ayarlar.tamam() if var_ >= int(p[1]) else Ayarlar.eksik()))
	for t in x.t:
		ayrinti.add_child(ey._ikonlu(str(t), "alet: %s %s" % [t, "✓" if env.adet(str(t)) > 0 else "(yok)"], Ayarlar.tamam() if env.adet(str(t)) > 0 else Ayarlar.eksik()))
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
		en.add_theme_color_override("font_color", Ayarlar.eksik()); en.add_theme_font_size_override("font_size", 11)
		ayrinti.add_child(en)
