## El yapımı (Tab) ve tarif kitabı (K) — web: kazanda öğrenilen tarifler (foundSet) el yapımı ekranında yapılır (quickBrew).
## Örste dövülenler (FORGED) ve Usta Sinan'ın kurduğu yapılar (PLACEABLE) burada yapılmaz; kitapta nerede yapıldıkları yazar.
## Tarif verisi web'in DB.R tablosundan (data/toplama.json → recipes).
extends Node

var oyun
var env
var R := {}            # tarif adı → {r, i, t, c, forged, place}
var kat_sira := {}     # kategori → web'deki sırası
var verilen := {}       # web bought: öğretilen (kazanda hemen açık) tarifler
var bilinen := {}      # öğrenilmiş tarifler (web foundSet)
var pencere: PanelContainer
var liste: VBoxContainer
var ayrinti: VBoxContainer
var baslik: Label
var kip := "el"        # "el": el yapımı (Tab) · "kitap": tarif kitabı (K)
var secili := ""

func kur(o) -> void:
	oyun = o
	env = o.env
	for x in env.G.recipes:
		R[x.r] = x
		if not kat_sira.has(x.c):
			kat_sira[x.c] = kat_sira.size()
	_arayuz()

func _process(_dt: float) -> void:
	if Input.is_action_just_pressed("el_yapimi"):
		_ac("el")
	if Input.is_action_just_pressed("kitap"):
		_ac("kitap")
	if pencere.visible and Input.is_action_just_pressed("ui_cancel"):
		pencere.visible = false

func _ac(k: String) -> void:
	if pencere.visible and kip == k:
		pencere.visible = false
		return
	kip = k
	pencere.visible = true
	ciz()

func elde_yapilir(r: String) -> bool:
	var x: Dictionary = R[r]
	return not x.forged and not x.place

## web missingFor: eksik malzemeler ve aletler
func eksik(r: String) -> String:
	var x: Dictionary = R[r]
	var out := []
	for p in x.i:
		var need: int = int(p[1]) - int(env.adet(str(p[0])))
		if need > 0:
			out.append("%d× %s" % [need, p[0]])
	for t in x.t:
		if env.adet(str(t)) <= 0:
			out.append("alet: " + str(t))
	return ", ".join(out)

func yap(r: String) -> void:
	if not bilinen.has(r) or not elde_yapilir(r):
		return
	var m := eksik(r)
	if m != "":
		env.mesaj("%s için eksik: %s" % [r, m], true)
		return
	for p in R[r].i:
		env.eksilt(str(p[0]), int(p[1]))
	env.ekle(r)
	env.mesaj("Yapıldı: " + r)
	oyun.ogr.yapti(r)
	ciz()

# ------------------------------------------------------------------ arayüz
func _arayuz() -> void:
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.09, 0.07, 0.96); st.border_color = Color("#c9a24a"); st.set_border_width_all(2)
	st.set_content_margin_all(10)
	pencere.add_theme_stylebox_override("panel", st)
	pencere.custom_minimum_size = Vector2(620, 380)
	var v := VBoxContainer.new()
	baslik = Label.new(); oyun._golge(baslik)
	v.add_child(baslik)
	var h := HBoxContainer.new()
	h.size_flags_vertical = Control.SIZE_EXPAND_FILL
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

func _ikonlu(n: String, yazi: String, renk: Color) -> HBoxContainer:
	var h := HBoxContainer.new()
	var t := TextureRect.new()
	t.texture = env.ikon_al(n)
	t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.custom_minimum_size = Vector2(22, 22)
	h.add_child(t)
	var l := Label.new()
	l.text = yazi
	l.add_theme_font_size_override("font_size", 12)
	l.add_theme_color_override("font_color", renk)
	h.add_child(l)
	return h

func ciz() -> void:
	for c in liste.get_children():
		c.queue_free()
	var adlar: Array = []
	if kip == "el":
		baslik.text = "El yapımı  (Tab) · bildiğin tarifler"
		for r in bilinen:
			if elde_yapilir(r):
				adlar.append(r)
	else:
		baslik.text = "Tarif kitabı  (K) · %d / %d tarif biliniyor" % [bilinen.size(), R.size()]
		adlar = R.keys()
	adlar.sort_custom(func(a, b): return [kat_sira[R[a].c], a] < [kat_sira[R[b].c], b])
	if adlar.is_empty():
		var l := Label.new()
		l.text = "Henüz tarif bilmiyorsun. Tarifler Zümrüt'ün kazanında öğrenilir (kazanın yanında F)."
		l.autowrap_mode = TextServer.AUTOWRAP_WORD
		liste.add_child(l)
	var kat := ""
	for r in adlar:
		if R[r].c != kat:
			kat = R[r].c
			var k := Label.new(); k.text = "— " + kat; k.add_theme_color_override("font_color", Color("#c9a24a")); k.add_theme_font_size_override("font_size", 11)
			liste.add_child(k)
		var b := Button.new()
		b.flat = true
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.icon = env.ikon_al(r)
		b.expand_icon = false
		b.text = r if (kip == "el" or bilinen.has(r)) else r + "  (bilinmiyor)"
		b.add_theme_font_size_override("font_size", 12)
		var hazir := kip == "el" and eksik(r) == ""
		b.add_theme_color_override("font_color", Color("#c8f0a0") if hazir else (Color("#e8e2cc") if bilinen.has(r) else Color("#8a8a80")))
		b.pressed.connect(func(): secili = r; _ayrinti())
		liste.add_child(b)
	if secili == "" and not adlar.is_empty():
		secili = adlar[0]
	_ayrinti()

func _ayrinti() -> void:
	for c in ayrinti.get_children():
		c.queue_free()
	if secili == "" or not R.has(secili):
		return
	var x: Dictionary = R[secili]
	ayrinti.add_child(_ikonlu(secili, secili + "  · " + str(x.c), Color("#fff2c0")))
	for p in x.i:
		var var_: int = env.adet(str(p[0]))
		var yeter: bool = var_ >= int(p[1])
		ayrinti.add_child(_ikonlu(str(p[0]), "%d× %s  (sende %d)" % [int(p[1]), p[0], var_], Color("#c8f0a0") if yeter else Color("#ffb0a0")))
	for t in x.t:
		ayrinti.add_child(_ikonlu(str(t), "alet: %s %s" % [t, "✓" if env.adet(str(t)) > 0 else "(yok)"], Color("#c8f0a0") if env.adet(str(t)) > 0 else Color("#ffb0a0")))
	var nerede := Label.new()
	nerede.add_theme_font_size_override("font_size", 11)
	if x.forged:
		nerede.text = "Örste dövülür (Demirci)."
	elif x.place:
		nerede.text = "Usta Sinan kurar (malzemeleri ona götür)."
	elif not bilinen.has(secili):
		nerede.text = "Tarifi Zümrüt'ün kazanında öğrenilir."
	else:
		nerede.text = "Kendin yaparsın."
	ayrinti.add_child(nerede)
	if bilinen.has(secili) and elde_yapilir(secili):
		var yb := Button.new()
		yb.text = "Yap"
		yb.disabled = eksik(secili) != ""
		yb.pressed.connect(func(): yap(secili))
		ayrinti.add_child(yb)
		var en := Label.new()
		var e := eksik(secili)
		en.text = "Eksik: " + e if e != "" else ""
		en.add_theme_color_override("font_color", Color("#ffb0a0"))
		en.add_theme_font_size_override("font_size", 11)
		en.autowrap_mode = TextServer.AUTOWRAP_WORD
		ayrinti.add_child(en)

func acik_mi() -> bool:
	return pencere.visible
