## Atölye (web openWorkshop, renderWorkshop, wsPut, tickWorkshops): bir tarifi kendi kendine, 25 sn'de bir üretir.
extends CanvasLayer

const SURE := 25.0
var oyun
var env
var o = null        # açık atölye (yapi.kurulu öğesi)
var pencere: PanelContainer
var liste: VBoxContainer
var ara: LineEdit
var cubuk: ProgressBar

func kur(oy) -> void:
	oyun = oy
	env = oy.env
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
	var b := Label.new(); b.text = "Atölye"; b.add_theme_font_size_override("font_size", 17); b.add_theme_color_override("font_color", Color("#f2c94c"))
	v.add_child(b)
	var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(560, 400)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	liste = VBoxContainer.new(); liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste); v.add_child(sc)
	visible = false

static func yeni() -> Dictionary:
	return {r = null, store = [], out = 0, t = 0.0}

func ac(x) -> void:
	o = x
	visible = true
	ciz()

func _lbl(t: String, boy := 12, renk := Color("#e8e2cc")) -> Label:
	var l := Label.new(); l.text = t; l.add_theme_font_size_override("font_size", boy); l.add_theme_color_override("font_color", renk)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD; l.custom_minimum_size = Vector2(380, 0)
	return l

func ciz() -> void:
	for c in liste.get_children():
		liste.remove_child(c); c.queue_free()
	cubuk = null
	var ws: Dictionary = o.ws
	var ey = oyun.el_yapimi
	if ws.r == null:
		liste.add_child(_lbl("Atölye bir tarifi kendi kendine üretir: tarifi seç, bileşenleri içine koy; her %d saniyede bir ürün çıkar (en fazla 50 birikir). Sen uzaktayken de çalışır. Aletler gerekmez." % int(SURE), 11, Color("#b8ac90")))
		ara = LineEdit.new(); ara.placeholder_text = "Ara…"; ara.text_changed.connect(func(_t): _tarifler())
		liste.add_child(ara)
		_tarifler()
	else:
		var x: Dictionary = ey.R[ws.r]
		var h := HBoxContainer.new()
		var t := TextureRect.new(); t.texture = env.ikon_al(ws.r); t.custom_minimum_size = Vector2(32, 32); t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		h.add_child(t)
		h.add_child(_lbl("%s · %s · her ürün %d sn" % [ws.r, "Çalışıyor" if hazir(ws) else ("Çıkış dolu: ürünleri al" if int(ws.out) >= 50 else "Bileşen bekliyor"), int(SURE)], 13, Color("#fff2c0")))
		liste.add_child(h)
		cubuk = ProgressBar.new(); cubuk.show_percentage = false; cubuk.custom_minimum_size = Vector2(520, 12); cubuk.max_value = SURE; cubuk.value = float(ws.t)
		liste.add_child(cubuk)
		for i in x.i.size():
			var p: Array = x.i[i]
			var r := HBoxContainer.new()
			var ic := TextureRect.new(); ic.texture = env.ikon_al(str(p[0])); ic.custom_minimum_size = Vector2(24, 24); ic.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; ic.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			r.add_child(ic)
			var ic2 := _var(ws, i)
			r.add_child(_lbl("%s · %d içeride · ürün başına %d · sende %d" % [p[0], ic2, int(p[1]), env.adet(str(p[0]))], 12, Color("#a8e08a") if ic2 >= int(p[1]) else Color("#e8e2cc")))
			var b := Button.new(); b.text = "+"; b.tooltip_text = "Çantadan koy"; b.disabled = env.adet(str(p[0])) <= 0
			b.pressed.connect(_koy_tek.bind(i))
			r.add_child(b)
			liste.add_child(r)
		var hb := HBoxContainer.new()
		var b1 := Button.new(); b1.text = "Hepsini koy (10 ürünlük)"; b1.pressed.connect(_hepsi); hb.add_child(b1)
		var b2 := Button.new(); b2.text = "%d ürünü al" % int(ws.out); b2.disabled = int(ws.out) <= 0; b2.pressed.connect(_al); hb.add_child(b2)
		var b3 := Button.new(); b3.text = "Tarifi değiştir"; b3.pressed.connect(_degistir); hb.add_child(b3)
		liste.add_child(hb)
	_yerles.call_deferred()

func _yerles() -> void:
	pencere.reset_size()
	pencere.position = ((get_viewport().get_visible_rect().size - pencere.size) / 2.0).floor().max(Vector2.ZERO)

func _tarifler() -> void:
	var ey = oyun.el_yapimi
	for c in liste.get_children():
		if c.has_meta("tarif"):
			liste.remove_child(c); c.queue_free()
	var f: String = ara.text.to_lower() if ara != null else ""
	var n := 0
	var adlar: Array = ey.R.keys()
	adlar.sort()
	for r in adlar:
		var x: Dictionary = ey.R[r]
		if x.forged or oyun.yapi.yapi_mi(r) or not (ey.bilinen.has(r) or oyun.istasyon._acik(r)): continue
		if f != "" and not r.to_lower().contains(f): continue
		n += 1
		if n > 80: break
		var h := HBoxContainer.new(); h.set_meta("tarif", true)
		var t := TextureRect.new(); t.texture = env.ikon_al(r); t.custom_minimum_size = Vector2(24, 24); t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		h.add_child(t)
		var a := []
		for p in x.i: a.append("%d %s" % [int(p[1]), p[0]])
		h.add_child(_lbl("%s · %s" % [r, ", ".join(a)], 12))
		var b := Button.new(); b.text = "Seç"; b.pressed.connect(_sec.bind(r)); h.add_child(b)
		liste.add_child(h)

static func _var(ws: Dictionary, i: int) -> int:
	if i >= ws.store.size() or ws.store[i] == null: return 0
	var t := 0
	for k in ws.store[i]: t += int(ws.store[i][k])
	return t

func hazir(ws: Dictionary) -> bool:
	if ws.r == null or int(ws.out) >= 50: return false
	var x: Dictionary = oyun.el_yapimi.R[ws.r]
	for i in x.i.size():
		if _var(ws, i) < int(x.i[i][1]): return false
	return true

func _koy(ws: Dictionary, i: int, kac: int) -> int:
	var p: Array = oyun.el_yapimi.R[ws.r].i[i]
	var n := str(p[0])
	var ist: int = int(p[1]) * kac - _var(ws, i)
	var a: int = mini(maxi(0, ist), env.adet(n))
	if a <= 0: return 0
	while ws.store.size() <= i: ws.store.append({})
	if ws.store[i] == null: ws.store[i] = {}
	env.eksilt(n, a)
	ws.store[i][n] = int(ws.store[i].get(n, 0)) + a
	return a

func _koy_tek(i: int) -> void:
	_koy(o.ws, i, 10)
	ciz()

func _hepsi() -> void:
	var k := 0
	for i in oyun.el_yapimi.R[o.ws.r].i.size(): k += _koy(o.ws, i, 10)
	if k > 0: env.mesaj("%d malzeme atölyeye kondu" % k)
	ciz()

func _al() -> void:
	var ws: Dictionary = o.ws
	var n := int(ws.out)
	if n <= 0: return
	env.ekle(str(ws.r), n)
	env.mesaj("%d %s alındı" % [n, ws.r])
	env.xp_ekle(mini(20, n))
	ws.out = 0
	ciz()

func _geri(ws: Dictionary) -> void:
	for s in ws.store:
		if s == null: continue
		for m in s: env.ekle(str(m), int(s[m]))
	ws.store = []
	if int(ws.out) > 0: env.ekle(str(ws.r), int(ws.out))
	ws.out = 0

func _degistir() -> void:
	_geri(o.ws)
	o.ws.r = null
	o.ws.t = 0.0
	ciz()

func _sec(r: String) -> void:
	o.ws.r = r; o.ws.store = []; o.ws.t = 0.0
	ciz()

## bütün atölyeler, pencere kapalıyken ve uzaktayken de çalışır
func isle(dt: float) -> void:
	for x in oyun.yapi.kurulu:
		if not x.has("ws") or x.ws == null: continue
		var ws: Dictionary = x.ws
		if not hazir(ws):
			ws.t = 0.0
			continue
		ws.t = float(ws.t) + dt
		if ws.t >= SURE:
			ws.t = 0.0
			var R: Array = oyun.el_yapimi.R[ws.r].i
			for i in R.size():
				var need: int = int(R[i][1])
				for k in ws.store[i].keys():
					var a: int = mini(need, int(ws.store[i][k]))
					ws.store[i][k] = int(ws.store[i][k]) - a
					need -= a
					if int(ws.store[i][k]) <= 0: ws.store[i].erase(k)
					if need <= 0: break
			ws.out = int(ws.out) + 1
			if visible and o == x: ciz()
		if x.get("dugum", null) != null and is_instance_valid(x.dugum): x.dugum.queue_redraw()
	if visible and cubuk != null and o != null and o.ws.r != null: cubuk.value = float(o.ws.t)

func _unhandled_input(e: InputEvent) -> void:
	if visible and e is InputEventKey and e.pressed and e.physical_keycode == KEY_ESCAPE:
		visible = false
		get_viewport().set_input_as_handled()
