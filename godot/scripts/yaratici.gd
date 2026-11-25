## Karakter yaratma (belge: Oyun akışı › Açılış 2–3): iki adım ("Karakterini yarat", "Sevdiğin kişi"), isim yazılmaz; sonra zorluk.
## Satırlar: Cinsiyet, Ten, Yüz, Göz rengi, Saç, Saç rengi, (kadında) Kıyafet, Tişört/Elbise rengi, Pantolon. Önizleme NPC boyunda tam boy,
## her seçim hemen görünür. Döndür, Rastgele; Geri, Devam. Şapka, gözlük, sakal, buff ve toka şimdilik gizli (sonra çizilecek).
extends Control

var kayit
var adim := 1            # 1 karakterin · 2 sevdiğin kişi · 3 zorluk
var secim := {}
var kahraman := {}
var sevgili := {}
var yon := 0
var on: TextureRect
var satirlar: VBoxContainer
var baslik: Label
var not_: Label
var alt: HBoxContainer
var od: HBoxContainer
const YONLER := [0, 2, 4, 6]     # S, E, N, W (web cDraw sırası)
const YUZ := [[0, "Sakin"], [1, "Güler yüzlü"], [2, "Çilli"], [3, "Ciddi"]]

func kur(k) -> void:
	kayit = k
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var bg := ColorRect.new(); bg.color = Color(0.05, 0.03, 0.1, 0.94); bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	var h := HBoxContainer.new()
	h.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	h.offset_left = 30; h.offset_top = 20; h.offset_right = -30; h.offset_bottom = -20
	h.add_theme_constant_override("separation", 24)
	add_child(h)
	var sol := VBoxContainer.new(); sol.custom_minimum_size = Vector2(260, 0); sol.alignment = BoxContainer.ALIGNMENT_CENTER
	baslik = Label.new(); baslik.add_theme_font_size_override("font_size", 26); baslik.add_theme_color_override("font_color", Color("#CFA6F6"))
	baslik.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	on = TextureRect.new(); on.custom_minimum_size = Vector2(26 * 6, 40 * 6); on.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	on.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; on.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	od = HBoxContainer.new(); od.alignment = BoxContainer.ALIGNMENT_CENTER
	od.add_child(_dugme("Döndür", _dondur))
	od.add_child(_dugme("Rastgele", _rastgele))
	not_ = Label.new(); not_.autowrap_mode = TextServer.AUTOWRAP_WORD; not_.add_theme_color_override("font_color", Color("#b9aed6"))
	not_.custom_minimum_size = Vector2(260, 0); not_.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sol.add_child(baslik); sol.add_child(on); sol.add_child(od); sol.add_child(not_)
	h.add_child(sol)
	var sag := VBoxContainer.new(); sag.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sc := ScrollContainer.new(); sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	satirlar = VBoxContainer.new(); satirlar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	satirlar.add_theme_constant_override("separation", 8)
	sc.add_child(satirlar)
	alt = HBoxContainer.new(); alt.alignment = BoxContainer.ALIGNMENT_END
	alt.add_theme_constant_override("separation", 10)
	sag.add_child(sc); sag.add_child(alt)
	h.add_child(sag)
	visible = false

func ac() -> void:
	adim = 1
	secim = Karakter.varsayilan("e")
	yon = 0
	visible = true
	_kur()

func _dugme(t: String, f: Callable, dolu := false) -> Button:
	var b := Button.new()
	b.text = t
	b.custom_minimum_size = Vector2(0, 34)
	b.add_theme_font_size_override("font_size", 15)
	for s in ["normal", "hover", "pressed", "focus"]:
		var st := StyleBoxFlat.new()
		st.bg_color = Color("#6a3aa8") if (dolu or s == "hover") else Color(0.2, 0.1, 0.3, 0.8)
		st.border_color = Color("#CFA6F6"); st.set_border_width_all(2); st.set_corner_radius_all(6)
		st.content_margin_left = 10; st.content_margin_right = 10
		b.add_theme_stylebox_override(s, st)
	b.pressed.connect(f)
	return b

func _renk(c: String, sec: bool, f: Callable) -> Button:
	var b := Button.new()
	b.custom_minimum_size = Vector2(30, 30)
	for s in ["normal", "hover", "pressed", "focus"]:
		var st := StyleBoxFlat.new(); st.bg_color = Color(c); st.set_corner_radius_all(15)
		st.border_color = Color.WHITE if sec else (Color("#CFA6F6") if s == "hover" else Color(0, 0, 0, 0.5)); st.set_border_width_all(3 if sec else 2)
		b.add_theme_stylebox_override(s, st)
	b.pressed.connect(f)
	return b

func _satir(ad: String, ogeler: Array) -> void:
	var r := HBoxContainer.new()
	var l := Label.new(); l.text = ad; l.custom_minimum_size = Vector2(120, 0); l.add_theme_color_override("font_color", Color("#f0e0ff"))
	r.add_child(l)
	var f := HFlowContainer.new(); f.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	for o in ogeler: f.add_child(o)
	r.add_child(f)
	satirlar.add_child(r)

func _sec(k: String, v) -> void:
	secim[k] = v
	_kur()

func _kur() -> void:
	for c in satirlar.get_children(): c.queue_free()
	for c in alt.get_children(): c.queue_free()
	var V := Karakter.veri()
	if adim == 3:
		baslik.text = "Zorluk"
		on.visible = false
		od.visible = false
		not_.text = ""
		var n := Label.new(); n.autowrap_mode = TextServer.AUTOWRAP_WORD
		n.text = "Normal: tarifler kazanda malzemelerini gördükçe açılır.\nZor: tarifler kapalıdır, kazanda deneyerek bulunur."
		satirlar.add_child(n)
		alt.add_child(_dugme("Geri", _zorluktan_geri))
		alt.add_child(_dugme("Normal", _basla.bind("normal"), true))
		alt.add_child(_dugme("Zor", _basla.bind("zor")))
		return
	on.visible = true
	od.visible = true
	baslik.text = "Karakterini yarat" if adim == 1 else "Sevdiğin kişi"
	var g: String = secim.g
	_satir("Cinsiyet", [_dugme("Erkek", _cins.bind("e"), g == "e"), _dugme("Kadın", _cins.bind("k"), g == "k")])
	var ten := []
	for i in V.CC.skin.size(): ten.append(_renk(V.CC.skin[i][0], int(secim.skin) == i, _sec.bind("skin", i)))
	_satir("Ten", ten)
	var yz := []
	for y in YUZ: yz.append(_dugme(y[1], _sec.bind("face", y[0]), int(secim.face) == int(y[0])))
	_satir("Yüz", yz)
	var gz := []
	for i in V.EYES.size(): gz.append(_renk(V.EYES[i][0], int(secim.eye) == i, _sec.bind("eye", i)))
	_satir("Göz rengi", gz)
	var hs := []
	for h in (V.HS_E if g == "e" else V.HS_K): hs.append(_dugme(h[1], _sec.bind("hs", h[0]), secim.hs == h[0]))
	hs.append(_dugme("Kel", _sec.bind("hs", "kel"), secim.hs == "kel"))
	_satir("Saç", hs)
	var sr := []
	for i in V.CC.hair.size(): sr.append(_renk(V.CC.hair[i][0], int(secim.hair) == i, _sec.bind("hair", i)))
	_satir("Saç rengi", sr)
	if g == "k":
		_satir("Kıyafet", [_dugme("Tişört", _sec.bind("dress", false), not secim.dress), _dugme("Elbise", _sec.bind("dress", true), bool(secim.dress))])
	var ts := []
	for i in V.CC.shirt.size(): ts.append(_renk(V.CC.shirt[i], int(secim.shirt) == i, _sec.bind("shirt", i)))
	_satir("Elbise rengi" if (g == "k" and secim.dress) else "Tişört rengi", ts)
	if not (g == "k" and secim.dress):
		var pn := []
		for i in V.CC.pants.size(): pn.append(_renk(V.CC.pants[i], int(secim.pants) == i, _sec.bind("pants", i)))
		_satir("Pantolon", pn)
	alt.add_child(_dugme("Geri", _geri))
	alt.add_child(_dugme("Devam", _devam, true))
	not_.text = "Seçtiğin görünüş bütün oyunda, anılarda ve sahnelerde kullanılır." if adim == 1 else "Giriş sahnesinde kaybedeceğin kişi. Kadın ya da erkek, istediğin gibi seç."
	_ciz()

func _ciz() -> void:
	var tx := Karakter.sayfa(Karakter.gorunus(secim))
	var at := AtlasTexture.new()
	at.atlas = tx
	at.region = Rect2(0, YONLER[yon] * 40, 26, 40)
	on.texture = at

func _rastgele() -> void:
	var V := Karakter.veri()
	var g := "e" if randf() < 0.5 else "k"
	secim = Karakter.varsayilan(g)
	var HS: Array = V.HS_E if g == "e" else V.HS_K
	secim.skin = randi() % V.CC.skin.size(); secim.hair = randi() % V.CC.hair.size(); secim.shirt = randi() % V.CC.shirt.size()
	secim.pants = randi() % V.CC.pants.size(); secim.hs = HS[randi() % HS.size()][0]; secim.face = randi() % 4; secim.eye = randi() % V.EYES.size()
	if g == "k": secim.dress = randf() < 0.5
	_kur()

func _geri() -> void:
	if adim == 1:
		visible = false
		kayit.ana_dugmeler()
		return
	adim = 1
	secim = kahraman.get("_s", Karakter.varsayilan("e"))
	_kur()

func _devam() -> void:
	if adim == 1:
		kahraman = Karakter.gorunus(secim); kahraman._s = secim.duplicate()
		adim = 2
		secim = sevgili.get("_s", Karakter.varsayilan("k" if secim.g == "e" else "e"))
		_kur()
	else:
		sevgili = Karakter.gorunus(secim); sevgili._s = secim.duplicate()
		adim = 3
		_kur()

func _basla(zorluk: String) -> void:
	var k := kahraman.duplicate(); k.erase("_s")
	var s := sevgili.duplicate(); s.erase("_s")
	Kayit.bekleyen = {yeni = true, kahraman = k, sevgili = s, zorluk = zorluk}
	Kayit.dogrudan = true
	get_tree().reload_current_scene()

func _cins(g: String) -> void:
	secim = Karakter.varsayilan(g)
	_kur()

func _dondur() -> void:
	yon = (yon + 1) % 4
	_ciz()

func _zorluktan_geri() -> void:
	adim = 2
	secim = sevgili.get("_s", Karakter.varsayilan("k"))
	on.visible = true
	_kur()
