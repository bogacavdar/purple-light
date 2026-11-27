extends PanelContainer
## Envanter penceresi (web v387env, v390el; belge Sistemler › Arayüz › Envanter ve Özellikler penceresi). I ile açılır.
## Solda sekmeli eşya listesi (her satırda resim, ad, adet ya da keskinlik); sağda listeden bağımsız giyim figürü (Baş kafada,
## Gövde göğüste, Eller sol elde, Silah sağ elde, Ayaklar ayakta; Boyun ve Yüzük) ve yanında karakterin kendisi; altında Savunma.
## Seçili eşyanın adı, bilgisi ve düğmeleri (Ye, Giy, Eline al, Yuvaya koy, Yere kur, Ok seç). Listeden figürdeki yuvaya ya da
## alttaki alet kemerine sürükleyince giyilir / yuvaya girer; alet Silah yuvasına sürüklenince eline alınır. Dışına basmak kapatır.

const SEKME := [["hepsi", "Hepsi"], ["yiyecek", "Yiyecekler"], ["malzeme", "Malzemeler"], ["alet", "Aletler"], ["giysi", "Giysi ve silah"]]
# figürdeki yuvalar: figürün sol üstüne göre yeri
const YER := {"bas": Vector2(52, 4), "kolye": Vector2(98, 34), "govde": Vector2(52, 62), "el": Vector2(4, 104), "silah": Vector2(100, 104), "yuzuk": Vector2(4, 148), "ayak": Vector2(52, 196)}
var oyun
var env
var sekme := "hepsi"
var secili := ""
var liste: VBoxContainer
var sekmeler: HBoxContainer
var figur: Control
var kahraman: TextureRect
var savunma: Label
var bilgi: RichTextLabel
var dugmeler: HBoxContainer
var _yuva_d := {}

func kur(o, e) -> void:
	oyun = o
	env = e
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.07, 0.09, 0.07, 0.96)
	st.border_color = Color("#c9a24a")
	st.set_border_width_all(2)
	st.set_corner_radius_all(6)
	st.set_content_margin_all(10)
	add_theme_stylebox_override("panel", st)
	custom_minimum_size = Vector2(760, 460)
	var v := VBoxContainer.new()
	add_child(v)
	var bas := HBoxContainer.new()
	var b := Label.new()
	b.text = "Envanter"
	b.add_theme_font_size_override("font_size", 18)
	b.add_theme_color_override("font_color", Color("#f2c94c"))
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bas.add_child(b)
	var x := Button.new()
	x.text = "Kapat"
	x.pressed.connect(kapat)
	bas.add_child(x)
	v.add_child(bas)
	var gov := HBoxContainer.new()
	gov.size_flags_vertical = Control.SIZE_EXPAND_FILL
	gov.add_theme_constant_override("separation", 14)
	v.add_child(gov)
	# sol: sekmeler ve liste
	var sol := VBoxContainer.new()
	sol.custom_minimum_size = Vector2(400, 0)
	sol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sekmeler = HBoxContainer.new()
	sol.add_child(sekmeler)
	var sc := ScrollContainer.new()
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sc.custom_minimum_size = Vector2(0, 380)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	liste = VBoxContainer.new()
	liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste)
	sol.add_child(sc)
	gov.add_child(sol)
	# sağ: figür, karakter, seçili eşya
	var sag := VBoxContainer.new()
	sag.custom_minimum_size = Vector2(300, 0)
	var ust := HBoxContainer.new()
	ust.add_theme_constant_override("separation", 16)
	figur = Control.new()
	figur.custom_minimum_size = Vector2(144, 236)
	figur.draw.connect(_figur_ciz)
	ust.add_child(figur)
	var kv := VBoxContainer.new()
	kahraman = TextureRect.new()
	kahraman.custom_minimum_size = Vector2(78, 120)
	kahraman.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	kahraman.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	kahraman.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kv.add_child(kahraman)
	savunma = Label.new()
	savunma.add_theme_font_size_override("font_size", 12)
	kv.add_child(savunma)
	ust.add_child(kv)
	sag.add_child(ust)
	bilgi = RichTextLabel.new()
	bilgi.bbcode_enabled = true
	bilgi.fit_content = true
	bilgi.scroll_active = false
	bilgi.custom_minimum_size = Vector2(300, 0)
	bilgi.add_theme_font_size_override("normal_font_size", 12)
	bilgi.add_theme_font_size_override("bold_font_size", 14)
	sag.add_child(bilgi)
	dugmeler = HBoxContainer.new()
	sag.add_child(dugmeler)
	gov.add_child(sag)
	for k in YER:
		var y := _kare(Vector2(40, 40))
		y.position = YER[k]
		y.set_drag_forwarding(Callable(), _birakilir_mi.bind(k), _birak.bind(k))
		y.gui_input.connect(_yuva_tik.bind(k))
		figur.add_child(y)
		_yuva_d[k] = y
	visible = false
	Boyut.bagla(self, "canta")

func _kare(s: Vector2) -> PanelContainer:
	var p := PanelContainer.new()
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.1, 0.13, 0.1, 0.9)
	st.border_color = Color("#3a4636")
	st.set_border_width_all(2)
	p.add_theme_stylebox_override("panel", st)
	p.custom_minimum_size = s
	p.size = s
	return p

func ac() -> void:
	visible = true
	get_parent().move_child(self, -1)
	ciz()
	_yerles()

func kapat() -> void:
	visible = false
	secili = ""

func _yerles() -> void:
	reset_size()
	position = ((get_viewport_rect().size - size) / 2.0).floor()
	position.y = maxf(8.0, minf(position.y, get_viewport_rect().size.y - size.y - 60.0))

func _input(e: InputEvent) -> void:
	if not visible: return
	if e is InputEventMouseButton and e.pressed and not get_global_rect().has_point(e.position) and not env.kemer_kutu.get_global_rect().has_point(e.position):
		kapat()
		get_viewport().set_input_as_handled()
	elif e is InputEventKey and e.pressed and not e.echo and e.physical_keycode == KEY_ESCAPE:
		kapat()
		get_viewport().set_input_as_handled()

# ------------------------------------------------------------------ sınıflar
func tur(n: String) -> String:
	if oyun.yuva_of(n) != "": return "giysi"
	if env.G.tools.has(n) or oyun.kusanma.silah.has(n) or oyun.yapi.yapi_mi(n) or n == "Kamp ateşi" or oyun.mesale.V.sure.has(n) or (oyun.ses != null and oyun.ses.alet_mi(n)): return "alet"
	if oyun.yemek != null and oyun.yemek.yenir(n): return "yiyecek"
	return "malzeme"

func _tasinir(n: String) -> bool:
	return tur(n) == "alet" and not oyun.mesale.V.sure.has(n)

# ------------------------------------------------------------------ çizim
func ciz() -> void:
	if not visible: return
	for c in sekmeler.get_children(): c.queue_free()
	for c in liste.get_children(): c.queue_free()
	var say := {"hepsi": 0}
	var adlar: Array = []
	for n in env.inv:
		if env.adet(n) <= 0: continue
		adlar.append(n)
		say.hepsi += 1
		var t := tur(n)
		say[t] = int(say.get(t, 0)) + 1
	adlar.sort()
	for s in SEKME:
		if s[0] != "hepsi" and not say.has(s[0]): continue
		var b := Button.new()
		b.text = "%s %d" % [s[1], say.get(s[0], 0)]
		b.toggle_mode = true
		b.button_pressed = sekme == s[0]
		b.add_theme_font_size_override("font_size", 12)
		var k: String = s[0]
		b.pressed.connect(func():
			sekme = k
			ciz())
		sekmeler.add_child(b)
	if not say.has(sekme): sekme = "hepsi"
	for n in adlar:
		if sekme != "hepsi" and tur(n) != sekme: continue
		liste.add_child(_satir(n))
	if adlar.is_empty():
		var l := Label.new()
		l.text = "Çanta boş"
		liste.add_child(l)
	_figur_doldur()
	_secili_yaz()

func _satir(n: String) -> Control:
	var p := PanelContainer.new()
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.2, 0.17, 0.08, 0.9) if n == secili else Color(0.1, 0.12, 0.1, 0.6)
	st.border_color = Color("#f2c94c") if n == secili else Color(0, 0, 0, 0)
	st.set_border_width_all(1)
	st.content_margin_left = 4; st.content_margin_right = 6
	p.add_theme_stylebox_override("panel", st)
	var h := HBoxContainer.new()
	var ik := TextureRect.new()
	ik.texture = env.ikon_al(n)
	ik.custom_minimum_size = Vector2(24, 24)
	ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	ik.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	h.add_child(ik)
	var a := Label.new()
	a.text = n
	a.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	a.add_theme_font_size_override("font_size", 13)
	var giyili := false
	for k in oyun.kusam:
		if oyun.kusam[k] == n: giyili = true
	if giyili: a.add_theme_color_override("font_color", Color("#9fd8ff"))
	h.add_child(a)
	var rz: String = env.rozet(n)
	if rz != "":
		var r := Label.new()
		r.text = ("Hasar " if rz.begins_with("⚔") else "Savunma ") + rz.substr(1)
		r.add_theme_font_size_override("font_size", 11)
		r.add_theme_color_override("font_color", Color("#ffd0a0") if rz.begins_with("⚔") else Color("#a0d8ff"))
		h.add_child(r)
	var c := Label.new()
	if env.dayan.has(n) and env.G.tools.has(n): c.text = "%d/%d" % [int(env.dayan[n]), int(env.G.tools[n].dur)]
	else: c.text = "×%d" % env.adet(n)
	c.add_theme_font_size_override("font_size", 12)
	c.custom_minimum_size = Vector2(54, 0)
	c.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	h.add_child(c)
	p.add_child(h)
	p.mouse_filter = Control.MOUSE_FILTER_STOP
	p.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
			secili = "" if secili == n and not e.double_click else n
			if e.double_click: _varsayilan(n)
			ciz())
	p.set_drag_forwarding(_surukle.bind(n), Callable(), Callable())
	return p

func _surukle(_at: Vector2, n: String):
	var ik := TextureRect.new()
	ik.texture = env.ikon_al(n)
	ik.size = Vector2(32, 32)
	ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	set_drag_preview(ik)
	return {esya = n}

func _birakilir_mi(_at: Vector2, d, k: String) -> bool:
	if typeof(d) != TYPE_DICTIONARY or not d.has("esya"): return false
	var n: String = d.esya
	return oyun.yuva_of(n) == k or (k == "silah" and _tasinir(n))

func _birak(_at: Vector2, d, k: String) -> void:
	var n: String = d.esya
	if oyun.yuva_of(n) == k: oyun.giy(n)
	elif k == "silah": eline_al(n)
	secili = n
	ciz()

## alttaki kemer yuvasına bırakma (envanter.kemer_ciz bağlar)
func kemere_birakilir(d) -> bool:
	return typeof(d) == TYPE_DICTIONARY and d.has("esya") and _tasinir(str(d.esya))

func kemere_birak(d, i: int) -> void:
	var n: String = d.esya
	var j: int = env.kemer.find(n)
	if j >= 0: env.kemer[j] = env.kemer[i]
	env.kemer[i] = n
	if env.G.tools.has(n) and not env.dayan.has(n): env.dayan[n] = int(env.G.tools[n].dur)
	env.kemer_ciz()
	ciz()

## eline al: kemerde yoksa boş yuvaya, hepsi doluysa hangisinin yerine geçeceği sorulur
func eline_al(n: String) -> void:
	var i: int = env.kemer.find(n)
	if i < 0: i = env.kemer.find(null)
	if i < 0:
		var ch: Array = []
		for j in 5:
			var jj := j
			ch.append({t = "%d: %s" % [j + 1, env.kemer[j]], f = func():
				env.kemer[jj] = n
				_el_sec(jj)})
		ch.append({t = "Vazgeç", kapat = true})
		oyun.konusma.ac("Yuvaların dolu", null, "Hangisinin yerine?", ch)
		return
	env.kemer[i] = n
	_el_sec(i)

func _el_sec(i: int) -> void:
	var n = env.kemer[i]
	if n != null and env.G.tools.has(n) and not env.dayan.has(n): env.dayan[n] = int(env.G.tools[n].dur)
	env.el = i
	env._el_degisti()
	env.kemer_ciz()
	ciz()

func _yuva_tik(e: InputEvent, k: String) -> void:
	if not (e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT): return
	if secili != "" and oyun.yuva_of(secili) == k:
		oyun.giy(secili)
	elif secili != "" and k == "silah" and _tasinir(secili):
		eline_al(secili)
	elif k == "silah" and env.elde() != "":
		env.el = -1
		env._el_degisti()
		env.kemer_ciz()
	elif oyun.kusam.get(k, null) != null:
		oyun.cikar(k)
	ciz()

func _figur_doldur() -> void:
	var tas := ""
	if secili != "": tas = oyun.yuva_of(secili) if oyun.yuva_of(secili) != "" else ("silah" if _tasinir(secili) else "")
	for k in YER:
		var y: PanelContainer = _yuva_d[k]
		for c in y.get_children(): c.queue_free()
		var n = oyun.kusam.get(k, null)
		if k == "silah" and env.elde() != "": n = env.elde()
		var st: StyleBoxFlat = y.get_theme_stylebox("panel").duplicate()
		st.border_color = Color("#ffd84a") if tas == k else Color("#3a4636")
		st.set_border_width_all(3 if tas == k else 2)
		y.add_theme_stylebox_override("panel", st)
		var ad := ""
		for Y in oyun.kusanma.yuvalar:
			if Y[0] == k: ad = Y[1]
		y.tooltip_text = ad + ((": " + str(n)) if n != null else " (boş)")
		if n != null:
			var t := TextureRect.new()
			t.texture = env.ikon_al(str(n))
			t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			t.custom_minimum_size = Vector2(32, 32)
			t.mouse_filter = Control.MOUSE_FILTER_IGNORE
			y.add_child(t)
		else:
			var l := Label.new()
			l.text = ad
			l.add_theme_font_size_override("font_size", 9)
			l.add_theme_color_override("font_color", Color(1, 1, 1, 0.45))
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			l.mouse_filter = Control.MOUSE_FILTER_IGNORE
			y.add_child(l)
	# karakterin kendisi (oyuncunun o anki resmi, önden)
	var at := AtlasTexture.new()
	at.atlas = Karakter.sayfa(oyun.gorunus)
	at.region = Rect2(0, 0, 26, 40)
	kahraman.texture = at
	savunma.text = "Savunma %d\nZırh %d" % [int(oyun.savunma()), int(oyun.stat("zirh"))]
	figur.queue_redraw()

## renksiz insan figürü (yuvaların altında)
func _figur_ciz() -> void:
	var c := Color(1, 1, 1, 0.13)
	figur.draw_circle(Vector2(72, 30), 22, c)
	figur.draw_rect(Rect2(46, 56, 52, 80), c)
	figur.draw_rect(Rect2(22, 60, 22, 70), c)
	figur.draw_rect(Rect2(100, 60, 22, 70), c)
	figur.draw_rect(Rect2(50, 138, 18, 70), c)
	figur.draw_rect(Rect2(76, 138, 18, 70), c)

func _secili_yaz() -> void:
	for c in dugmeler.get_children(): c.queue_free()
	if secili == "" or env.adet(secili) <= 0:
		secili = ""
		bilgi.text = "[color=#b8ac90]Bir eşya seç. Giysiyi ya da silahı figürdeki yuvaya, aleti alttaki kemere sürükleyebilirsin.[/color]"
		return
	var n := secili
	var a: Array = ["[b]%s[/b] ×%d" % [n, env.adet(n)]]
	var ey: String = oyun.esya_yazi(n) if oyun.yuva_of(n) != "" or oyun.kusanma.silah.has(n) else ""
	if ey != "": a.append(ey)
	if env.G.tools.has(n): a.append(str(env.G.tools[n].get("use", "")))
	if oyun.pazar != null and oyun.pazar.taban(n) > 0: a.append("Değeri %d Vio" % int(oyun.pazar.taban(n)))
	bilgi.text = "\n".join(a)
	var t := tur(n)
	if t == "yiyecek": _d("Ye", func(): oyun.yemek.ye(n))
	if oyun.yuva_of(n) != "": _d("Giy", func():
		oyun.giy(n)
		ciz())
	if _tasinir(n):
		_d("Eline al", func(): eline_al(n))
		if env.kemer.find(n) < 0: _d("Yuvaya koy", func():
			var i: int = env.kemer.find(null)
			if i < 0: eline_al(n)
			else:
				env.kemer[i] = n
				env.kemer_ciz()
				ciz())
		else: _d("Yuvadan çıkar", func():
			var i: int = env.kemer.find(n)
			env.kemer[i] = null
			if env.el == i: env.el = -1
			env.kemer_ciz()
			ciz())
	if oyun.yapi.yapi_mi(n): _d("Yere kur", func():
		kapat()
		oyun.yapi.basla(n))
	if oyun.buyu != null and oyun.buyu.ok_mu(n): _d("Ok olarak seç", func():
		oyun.buyu.ok_sec(n)
		ciz())

func _d(t: String, f: Callable) -> void:
	var b := Button.new()
	b.text = t
	b.pressed.connect(f)
	dugmeler.add_child(b)

## çift tıklama: eşyanın asıl işi
func _varsayilan(n: String) -> void:
	if oyun.yapi.yapi_mi(n):
		kapat()
		oyun.yapi.basla(n)
	elif oyun.yuva_of(n) != "": oyun.giy(n)
	elif _tasinir(n): eline_al(n)
	elif oyun.buyu != null and oyun.buyu.ok_mu(n): oyun.buyu.ok_sec(n)
	elif tur(n) == "yiyecek": oyun.yemek.ye(n)
