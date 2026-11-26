extends CanvasLayer
## Evin içi ve Döşe (web v56-room; belge 99_godot 2e). Kurulu bir evin (Yaprak barınağı dışında) yanında F içeri alır:
## oda evin boyunda; WASD ya da tıklayarak yürünür, yatakta gece uyunur, lamba geceyi aydınlatır. "Döşe" çantadaki ev eşyalarını
## odaya koyar (halı altta, perde/resim/raf duvarda, kapının önü boş). İçerideyken adanın canlıları durur, mor ışık zarar vermez.

var oyun
var env
var V: Dictionary          # data/ev.json
var acik := false
var o = null               # içindeki ev (yapi.kurulu içinden)
var w := 0
var h := 0
var px := 0.0
var py := 0.0
var yon := 0
var adim := 0.0
var yuruyor := false
var hedef = null           # tıklanan yere yürüme: {p, f}
var duzen := false         # Döşe kipi
var sec := ""
var rot := 0
var gx := -99
var gy := -99
var mv = null              # taşınan eşya
var msg := ""
var msg_t := 0.0
var tex := {}
var t := 0.0
var uyku := false
var ciz: Control
var ust: PanelContainer
var ust_ad: Label
var duzen_b: Button
var msg_kutu: PanelContainer
var msg_yazi: Label
var serit_kutu: PanelContainer
var serit: HBoxContainer
var serit_yazi: Label
var menu: PanelContainer
var parlak: GradientTexture2D
var kat: CanvasLayer        # düğmeler HUD'un üstünde
const WALL := 32

func kur(oy) -> void:
	oyun = oy
	env = oy.env
	V = oy._json("res://data/ev.json")
	for n in V.esya:
		var L: Array = []
		for f in V.esya[n].file: L.append(load(str(f)))
		tex[n] = L
	layer = 1
	visible = false
	ciz = Control.new()
	ciz.mouse_filter = Control.MOUSE_FILTER_STOP
	ciz.draw.connect(_ciz)
	ciz.gui_input.connect(_fare)
	add_child(ciz)
	ciz.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var g := Gradient.new()
	g.set_color(0, Color(1, 0.78, 0.47, 0.4)); g.set_color(1, Color(1, 0.63, 0.31, 0.0))
	parlak = GradientTexture2D.new(); parlak.gradient = g; parlak.fill = GradientTexture2D.FILL_RADIAL
	parlak.fill_from = Vector2(0.5, 0.5); parlak.fill_to = Vector2(1, 0.5); parlak.width = 64; parlak.height = 64
	_arayuz()

func _kutu(renk: Color, kenar: Color) -> StyleBoxFlat:
	var st := StyleBoxFlat.new(); st.bg_color = renk; st.border_color = kenar; st.set_border_width_all(2); st.set_content_margin_all(6)
	return st

func _arayuz() -> void:
	kat = CanvasLayer.new(); kat.layer = 3; kat.visible = false
	add_child(kat)
	ust = PanelContainer.new(); ust.add_theme_stylebox_override("panel", _kutu(Color(0.07, 0.09, 0.06, 0.92), Color("#4a5a3a")))
	kat.add_child(ust)
	var hb := HBoxContainer.new(); ust.add_child(hb)
	ust_ad = Label.new(); ust_ad.add_theme_font_size_override("font_size", 14); hb.add_child(ust_ad)
	duzen_b = Button.new(); duzen_b.text = "Döşe"; duzen_b.pressed.connect(_duzen_degis); hb.add_child(duzen_b)
	var c := Button.new(); c.text = "Dışarı çık"; c.pressed.connect(cik); hb.add_child(c)
	msg_kutu = PanelContainer.new(); msg_kutu.add_theme_stylebox_override("panel", _kutu(Color(0.12, 0.06, 0.2, 0.92), Color("#7a4ab0")))
	msg_yazi = Label.new(); msg_yazi.add_theme_font_size_override("font_size", 13); msg_yazi.add_theme_color_override("font_color", Color("#e8d8ff"))
	msg_kutu.add_child(msg_yazi); kat.add_child(msg_kutu); msg_kutu.visible = false
	serit_kutu = PanelContainer.new(); serit_kutu.add_theme_stylebox_override("panel", _kutu(Color(0.07, 0.09, 0.06, 0.94), Color("#4a5a3a")))
	kat.add_child(serit_kutu)
	var v := VBoxContainer.new(); serit_kutu.add_child(v)
	serit_yazi = Label.new(); serit_yazi.add_theme_font_size_override("font_size", 12); serit_yazi.add_theme_color_override("font_color", Color("#b8ac90"))
	serit_yazi.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; v.add_child(serit_yazi)
	serit = HBoxContainer.new(); v.add_child(serit)
	serit_kutu.visible = false
	menu = PanelContainer.new(); menu.add_theme_stylebox_override("panel", _kutu(Color(0.07, 0.09, 0.06, 0.96), Color("#f2c94c")))
	kat.add_child(menu); menu.visible = false

# ------------------------------------------------------------------ giriş, çıkış
func esya(n: String) -> bool:
	return V.esya.has(n)

func _its() -> Array:
	return o.oda.it if o != null else []

func _fp(it: Dictionary) -> Vector2i:
	var D: Dictionary = V.esya[it.n]
	return Vector2i(int(D.h), int(D.w)) if int(it.get("r", 0)) == 1 else Vector2i(int(D.w), int(D.h))

func yatagi(ev: Dictionary):
	if ev.get("oda", null) == null: return ev.get("yatak", null)
	for it in ev.oda.it:
		if str(V.esya[it.n].k) == "bed": return it.n
	return null

func _cantadakiler() -> Array:
	var L: Array = []
	for n in env.inv:
		if esya(n) and env.adet(n) > 0: L.append(n)
	return L

func gir(ev: Dictionary) -> void:
	var sz = V.oda.get(ev.n, null)
	if sz == null: return
	if ev.get("oda", null) == null:
		ev.oda = {it = [], seen = false}
		if ev.get("yatak", null) != null and esya(str(ev.yatak)): ev.oda.it.append({n = ev.yatak, x = 0, y = 0, r = 0})
	o = ev
	acik = true
	w = int(sz[0]); h = int(sz[1])
	px = floorf(w / 2.0) * 16 + 8; py = WALL + h * 16 - 6
	hedef = null; duzen = false; sec = ""; mv = null; gx = -99; menu.visible = false
	if not ev.oda.seen:
		ev.oda.seen = true
		if not _cantadakiler().is_empty(): duzen = true
	visible = true
	kat.visible = true
	oyun.oyuncu.kilit = true
	oyun.oyuncu.oto = Vector2.ZERO
	if oyun.kh_resim: oyun.kh_resim.get_parent().visible = false
	var yb := false
	for n in _cantadakiler():
		if str(V.esya[n].k) == "bed": yb = true
	if yatagi(ev) == null and yb: _say("Yatağın envanterinde: Döşe ile içeri yerleştir.")
	elif _its().is_empty(): _say("%s bomboş. Usta Sinan'ın yaptığı eşyaları Döşe ile yerleştir." % ev.n)
	else: _say("")
	_ui()

func cik() -> void:
	if not acik: return
	acik = false
	duzen = false
	visible = false
	kat.visible = false
	menu.visible = false
	env.kemer_kutu.visible = true
	oyun.oyuncu.kilit = false
	if oyun.kh_resim: oyun.kh_resim.get_parent().visible = true
	o = null

func _say(s: String) -> void:
	msg = s
	msg_t = 4.5 if s != "" else 0.0
	msg_yazi.text = s
	msg_kutu.visible = s != ""
	_yerles.call_deferred()

# ------------------------------------------------------------------ yerleşim kuralları (web cellFree, solidAt, canStand)
func bos_mu(x: int, y: int, ew: int, eh: int, L: String, skip) -> bool:
	if L == "wall":
		if y != -1 or x < 0 or x + ew > w: return false
		for it in _its():
			if it != skip and str(V.esya[it.n].L) == "wall" and it.x < x + ew and it.x + _fp(it).x > x: return false
		return true
	if x < 0 or y < 0 or x + ew > w or y + eh > h: return false
	var dx := w / 2
	if y + eh >= h and x <= dx and x + ew > dx: return false
	for it in _its():
		if it == skip: continue
		var L2 := str(V.esya[it.n].L)
		if L2 == "wall" or (L2 == "rug") != (L == "rug"): continue
		var f := _fp(it)
		if it.x < x + ew and it.x + f.x > x and it.y < y + eh and it.y + f.y > y: return false
	return true

func _kati(x: float, y: float) -> bool:
	var cx := int(floorf(x / 16.0)); var cy := int(floorf((y - WALL) / 16.0))
	for it in _its():
		if str(V.esya[it.n].L) != "floor": continue
		var f := _fp(it)
		if cx >= it.x and cx < it.x + f.x and cy >= it.y and cy < it.y + f.y: return true
	return false

func _durur(x: float, y: float) -> bool:
	return x >= 5 and x <= w * 16 - 5 and y >= WALL + 5 and y <= WALL + h * 16 - 2 and not _kati(x, y)

func _kapi() -> Vector2:
	return Vector2(floorf(w / 2.0) * 16 + 8, WALL + h * 16)

## yakındaki yatak, lamba ya da kapı (web nearThing)
func yakin():
	var en = null
	var bd := 22.0
	for it in _its():
		var k := str(V.esya[it.n].k)
		if k != "bed" and k != "lamp": continue
		var f := _fp(it)
		var c: Vector2 = Vector2((it.x + f.x / 2.0) * 16, WALL - 8 if str(V.esya[it.n].L) == "wall" else WALL + (it.y + f.y / 2.0) * 16)
		var d := c.distance_to(Vector2(px, py)) - maxf(f.x, f.y) * 6
		if d < bd:
			bd = d
			en = it
	if _kapi().distance_to(Vector2(px, py)) < 16.0: return {kapi = true}
	return en

func gece() -> bool:
	return oyun.yapi.gece()

func _islem() -> void:
	var n = yakin()
	if n == null: return
	if n.get("kapi", false):
		cik()
		return
	var k := str(V.esya[n.n].k)
	if k == "bed":
		o.yatak = n.n
		if not gece():
			_say("Henüz uyku vakti değil (saat %s)." % oyun.yapi._saat())
			return
		uyku = true
		await oyun.yapi._uyu(o)
		uyku = false
	elif k == "lamp":
		_say("Lamba yanıyor: bu gece mor ışık içeri giremez." if gece() else "Gece yakılır; içerideyken mor ışıktan korur.")

# ------------------------------------------------------------------ döngü
func _process(dt: float) -> void:
	if not acik: return
	t += dt
	oyun.oyuncu.kilit = true
	if msg_t > 0.0:
		msg_t -= dt
		if msg_t <= 0.0: _say("")
	yuruyor = false
	if not duzen and not uyku:
		var g := Input.get_vector("sol", "sag", "yukari", "asagi", 0.3)
		if g != Vector2.ZERO: hedef = null
		elif hedef != null:
			var d: Vector2 = hedef.p - Vector2(px, py)
			if d.length() < 2.0:
				var f = hedef.get("f", null)
				hedef = null
				if f != null: f.call()
			else: g = d.normalized()
		if g != Vector2.ZERO and acik:
			var n := g.normalized()
			var sp := 58.0 * dt
			if _durur(px + n.x * sp, py): px += n.x * sp
			if _durur(px, py + n.y * sp): py += n.y * sp
			adim += dt * 1.4
			yuruyor = true
			var k := int(round(atan2(n.y, n.x) / (PI / 4.0)))
			yon = {0: 2, 1: 1, 2: 0, 3: 7, 4: 6, -4: 6, -3: 5, -2: 4, -1: 3}[k]
			if py > WALL + h * 16 - 3 and absf(px - _kapi().x) < 8 and n.y > 0:
				cik()
				return
		if Input.is_action_just_pressed("topla"): _islem()
	ciz.queue_redraw()

# ------------------------------------------------------------------ çizim (web draw)
func olcek() -> float:
	var vs := get_viewport().get_visible_rect().size
	var a := _alan()
	var f := minf(vs.x * 0.96 / (w * 16), a.y / (h * 16 + WALL + 10))
	return clampf(f, 0.8, 6.0)

func _alan() -> Vector2:
	var vs := get_viewport().get_visible_rect().size
	var top := ust.position.y + ust.size.y + 6
	var alt := (serit_kutu.size.y + 6) if duzen else 70.0
	return Vector2(top, maxf(60.0, vs.y - top - alt - 6))

func koken() -> Vector2:
	var vs := get_viewport().get_visible_rect().size
	var k := olcek()
	var a := _alan()
	return Vector2(roundf((vs.x - w * 16 * k) / 2.0), roundf(a.x + (a.y - (h * 16 + WALL + 10) * k) / 2.0))

func _r(x: float, y: float, rw: float, rh: float, c: Color) -> void:
	ciz.draw_rect(Rect2(x, y, rw, rh), c)

func _tx(n: String) -> Texture2D:
	var L: Array = tex[n]
	return L[0] if sin(t * 9.0) > 0.0 else L[L.size() - 1]

func _ciz() -> void:
	if not acik: return
	var vs := get_viewport().get_visible_rect().size
	ciz.draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)
	_r(0, 0, vs.x, vs.y, Color("#0c0a10"))
	var k := olcek()
	ciz.draw_set_transform(koken(), 0, Vector2(k, k))
	var st: Dictionary = V.renk.get(o.n, V.renk["Kulübe"])
	var W := w * 16; var H := h * 16
	var gec := gece()
	var dusk: float = oyun.zaman.karanlik()
	_r(-4, -4, W + 8, WALL + H + 14, Color("#2a1e14"))
	_r(0, 0, W, WALL, Color(st.w)); _r(0, WALL - 3, W, 3, Color(st.w2))
	for x in range(0, W, 8): _r(x, 0, 1, WALL - 3, Color(st.w2))
	for wx in range(1, w - 1, 3):
		var gok := Color("#1a1840") if gec else (Color("#e8906a") if dusk > 0.3 else Color("#9ad0ff"))
		_r(wx * 16 + 2, 6, 12, 14, Color("#5a3418")); _r(wx * 16 + 3, 7, 10, 12, gok); _r(wx * 16 + 8, 7, 1, 12, Color("#5a3418")); _r(wx * 16 + 3, 12, 10, 1, Color("#5a3418"))
		if gec and sin(t * 0.7 + wx) > 0.6: _r(wx * 16 + 5, 9, 1, 1, Color("#e8d8ff"))
	for y in h:
		for x in w:
			_r(x * 16, WALL + y * 16, 16, 16, Color(st.f) if (x + y) % 2 == 1 else Color(st.f2))
			_r(x * 16, WALL + y * 16 + 15, 16, 1, Color(0, 0, 0, 0.12))
	var dxc := floorf(w / 2.0) * 16
	_r(0, WALL + H, W, 4, Color(st.w2)); _r(dxc, WALL + H, 16, 6, Color("#3a2414")); _r(dxc + 2, WALL + H - 4, 12, 4, Color("#8a6a3a"))
	for it in _its():
		if str(V.esya[it.n].L) == "wall": ciz.draw_texture(_tx(it.n), Vector2(it.x * 16, 8 - 16))
	for it in _its():
		if str(V.esya[it.n].L) == "rug": ciz.draw_texture(_tx(it.n), Vector2(it.x * 16, WALL + it.y * 16 - 16))
	var vis: Array = []
	for it in _its():
		if str(V.esya[it.n].L) == "floor": vis.append([WALL + (it.y + _fp(it).y) * 16, it])
	vis.append([py + 1, null])
	vis.sort_custom(func(a, b): return a[0] < b[0])
	for v in vis:
		if v[1] == null: _kahraman()
		else: ciz.draw_texture(_tx(v[1].n), Vector2(v[1].x * 16, WALL + v[1].y * 16 - 16))
	# ışık: gece lamba yoksa oda kararır, lamba çevresini aydınlatır
	if dusk > 0.05:
		var lambalar: Array = []
		for it in _its():
			if str(V.esya[it.n].k) == "lamp": lambalar.append(it)
		_r(-4, -4, W + 8, WALL + H + 14, Color(0.03, 0.02, 0.055, minf(0.86, dusk * (0.55 if not lambalar.is_empty() else 0.95))))
		for it in lambalar:
			var f := _fp(it)
			var lx: float = (it.x + f.x / 2.0) * 16
			var ly: float = 16.0 if str(V.esya[it.n].L) == "wall" else WALL + (it.y + 0.4) * 16
			var r: float = 46.0 + sin(t * 6 + it.x) * 2
			ciz.draw_texture_rect(parlak, Rect2(lx - r, ly - r, r * 2, r * 2), false)
		if lambalar.is_empty() and gec:
			var a := 0.25 + 0.15 * sin(t * 3)
			for wx in range(1, w - 1, 3): _r(wx * 16 + 3, 7, 10, 12, Color(0.54, 0.29, 1, a))
	if duzen:
		for x in w + 1: ciz.draw_line(Vector2(x * 16, WALL), Vector2(x * 16, WALL + H), Color(1, 1, 1, 0.25), 0.5)
		for y in h + 1: ciz.draw_line(Vector2(0, WALL + y * 16), Vector2(W, WALL + y * 16), Color(1, 1, 1, 0.25), 0.5)
		var n := ""
		var r0 := 0
		var skip = null
		if mv != null:
			n = mv.n; r0 = int(mv.get("r", 0)); skip = mv
		elif sec != "":
			n = sec; r0 = rot
		if n != "" and gx > -90:
			var D: Dictionary = V.esya[n]
			var L := str(D.L)
			var fw := int(D.h) if (r0 == 1 and L != "wall") else int(D.w)
			var fh := int(D.w) if (r0 == 1 and L != "wall") else int(D.h)
			var ok := bos_mu(gx, gy, fw, fh, L, skip)
			var yy := 8.0 if L == "wall" else WALL + gy * 16.0
			ciz.draw_texture(_tx(n), Vector2(gx * 16, yy - 16), Color(1, 1, 1, 0.6))
			_r(gx * 16, yy, fw * 16, 16 if L == "wall" else fh * 16, Color(0.42, 0.82, 0.42, 0.35) if ok else Color(0.88, 0.35, 0.29, 0.35))
	else:
		var yk = yakin()
		if yk != null:
			var lab := "F · Dışarı çık"
			if not yk.get("kapi", false):
				var kk := str(V.esya[yk.n].k)
				lab = ("F · Uyu" if gece() else "Yatak · gece uyunur") if kk == "bed" else "F · Lamba"
			var fnt := ThemeDB.fallback_font
			var sw := fnt.get_string_size(lab, HORIZONTAL_ALIGNMENT_LEFT, -1, 6).x
			ciz.draw_string_outline(fnt, Vector2(px - sw / 2, py - 26), lab, HORIZONTAL_ALIGNMENT_LEFT, -1, 6, 2, Color(0.04, 0.03, 0.02, 0.9))
			ciz.draw_string(fnt, Vector2(px - sw / 2, py - 26), lab, HORIZONTAL_ALIGNMENT_LEFT, -1, 6, Color("#fff2c8"))

func _kahraman() -> void:
	var s: Sprite2D = oyun.oyuncu.spr
	var tx: Texture2D = s.texture
	var cw := tx.get_width() / 5.0
	var ch := tx.get_height() / 8.0
	var fr := 0
	if yuruyor: fr = 1 + mini(3, int(floor(fposmod(adim * 10.0, TAU) / (PI / 2.0))))
	ciz.draw_texture_rect_region(tx, Rect2(Vector2(roundf(px), roundf(py)) + s.offset, Vector2(cw, ch)), Rect2(fr * cw, yon * ch, cw, ch))

# ------------------------------------------------------------------ fare (web pointerdown)
func _oda(p: Vector2) -> Vector2:
	return (p - koken()) / olcek()

func _izgara(n: String, r: int, p: Vector2) -> Vector2i:
	var D: Dictionary = V.esya[n]
	if str(D.L) == "wall": return Vector2i(int(floorf(p.x / 16.0 - (int(D.w) - 1) / 2.0)), -1)
	var fw := int(D.h) if r == 1 else int(D.w)
	var fh := int(D.w) if r == 1 else int(D.h)
	return Vector2i(int(roundf(p.x / 16.0 - fw / 2.0)), int(roundf((p.y - WALL) / 16.0 - fh / 2.0)))

func _vurulan(p: Vector2):
	var cx := int(floorf(p.x / 16.0)); var cy := int(floorf((p.y - WALL) / 16.0))
	var its := _its()
	for i in range(its.size() - 1, -1, -1):
		var it: Dictionary = its[i]
		var f := _fp(it)
		if str(V.esya[it.n].L) == "wall":
			if p.y >= 8 and p.y < 24 and cx >= it.x and cx < it.x + f.x: return it
		elif cx >= it.x and cx < it.x + f.x and cy >= it.y and cy < it.y + f.y: return it
	return null

func _fare(e: InputEvent) -> void:
	if not acik: return
	if e is InputEventMouseMotion and duzen:
		var p := _oda(e.position)
		if mv != null:
			var g := _izgara(mv.n, int(mv.get("r", 0)), p); gx = g.x; gy = g.y
		elif sec != "":
			var g2 := _izgara(sec, rot, p); gx = g2.x; gy = g2.y
		return
	if not (e is InputEventMouseButton and e.pressed): return
	var p := _oda(e.position)
	if e.button_index == MOUSE_BUTTON_RIGHT:
		sec = ""; mv = null; gx = -99; menu.visible = false; _serit()
		return
	if e.button_index != MOUSE_BUTTON_LEFT: return
	if duzen:
		menu.visible = false
		if sec != "":
			var g := _izgara(sec, rot, p); gx = g.x; gy = g.y
			_koy()
			return
		if mv != null:
			var it: Dictionary = mv
			mv = null
			var g3 := _izgara(it.n, int(it.get("r", 0)), p)
			_tasi(it, g3.x, g3.y)
			gx = -99
			_serit()
			return
		var hit = _vurulan(p)
		if hit != null: _menu_ac(hit, e.position)
		return
	# yürü: kapıya, eşyaya ya da tıklanan yere
	var kp := _kapi()
	if absf(p.x - kp.x) < 10 and p.y > kp.y - 10:
		hedef = {p = Vector2(kp.x, kp.y - 4), f = cik}
		return
	for it in _its():
		var k := str(V.esya[it.n].k)
		if k != "bed" and k != "lamp": continue
		var f := _fp(it)
		var duvar := str(V.esya[it.n].L) == "wall"
		var icinde: bool = (p.y >= 4 and p.y < 28 and p.x >= it.x * 16 and p.x < (it.x + f.x) * 16) if duvar else (p.x >= it.x * 16 and p.x < (it.x + f.x) * 16 and p.y >= WALL + it.y * 16 - 8 and p.y < WALL + (it.y + f.y) * 16)
		if icinde:
			var tx: float = (it.x + f.x / 2.0) * 16
			var ty: float = WALL + 8.0 if duvar else WALL + (it.y + f.y) * 16.0 + 6.0
			if not _durur(tx, ty): ty = minf(WALL + h * 16 - 4, ty + 8)
			hedef = {p = Vector2(tx, ty), f = _islem}
			return
	if _durur(p.x, p.y): hedef = {p = p}

func _unhandled_input(e: InputEvent) -> void:
	if not acik or not duzen: return
	if e is InputEventKey and e.pressed and not e.echo:
		if e.keycode == KEY_R:
			rot = 1 - rot
			get_viewport().set_input_as_handled()
		elif e.keycode == KEY_ESCAPE:
			if sec != "" or mv != null:
				sec = ""; mv = null; gx = -99; _serit()
			else: _duzen_degis()
			get_viewport().set_input_as_handled()

# ------------------------------------------------------------------ Döşe (web placeSel, pickUp, moveTo)
func _koy() -> void:
	var D: Dictionary = V.esya[sec]
	var L := str(D.L)
	if L == "wall": gy = -1
	var r := rot if L != "wall" else 0
	var fw := int(D.h) if r == 1 else int(D.w)
	var fh := int(D.w) if r == 1 else int(D.h)
	if not bos_mu(gx, gy, fw, fh, L, null):
		return
	o.oda.it.append({n = sec, x = gx, y = gy, r = r})
	env.eksilt(sec)
	if str(D.k) == "bed":
		if o.get("yatak", null) == null: o.yatak = sec
		if msg.begins_with("Yatağın envanterinde"): _say("")
	if env.adet(sec) <= 0: sec = ""
	_serit()

func _geri(it: Dictionary) -> void:
	o.oda.it.erase(it)
	env.ekle(it.n)
	if str(V.esya[it.n].k) == "bed": o.yatak = yatagi(o)
	menu.visible = false
	_serit()

func _tasi(it: Dictionary, x: int, y: int) -> bool:
	var f := _fp(it)
	var L := str(V.esya[it.n].L)
	if bos_mu(x, y, f.x, f.y, L, it):
		it.x = x
		if L != "wall": it.y = y
		return true
	return false

func _dondur(it: Dictionary) -> void:
	var f := _fp(it)
	if bos_mu(it.x, it.y, f.y, f.x, str(V.esya[it.n].L), it): it.r = 1 - int(it.get("r", 0))
	menu.visible = false

func _tasi_basla(it: Dictionary) -> void:
	mv = it; sec = ""; gx = -99
	menu.visible = false
	_serit()

func _menu_ac(it: Dictionary, at: Vector2) -> void:
	for c in menu.get_children():
		menu.remove_child(c); c.queue_free()
	var hb := HBoxContainer.new(); menu.add_child(hb)
	var b1 := Button.new(); b1.text = "Taşı"; b1.pressed.connect(_tasi_basla.bind(it)); hb.add_child(b1)
	var b2 := Button.new(); b2.text = "Geri al"; b2.pressed.connect(_geri.bind(it)); hb.add_child(b2)
	var D: Dictionary = V.esya[it.n]
	if str(D.L) != "wall" and int(D.w) != int(D.h):
		var b3 := Button.new(); b3.text = "Döndür"; b3.pressed.connect(_dondur.bind(it)); hb.add_child(b3)
	menu.visible = true
	menu.reset_size()
	var vs := get_viewport().get_visible_rect().size
	menu.position = Vector2(clampf(at.x - 80, 6, vs.x - 200), maxf(6, at.y - 58))

func _sec(n: String) -> void:
	sec = "" if sec == n else n
	rot = 0; mv = null; gx = -99
	_serit()

func _duzen_degis() -> void:
	duzen = not duzen
	sec = ""; mv = null; gx = -99; menu.visible = false; hedef = null
	_ui()

func _ui() -> void:
	ust_ad.text = "%s  %d×%d  " % [o.n, w, h] if o != null else ""
	duzen_b.text = "Bitti" if duzen else "Döşe"
	serit_kutu.visible = duzen
	env.kemer_kutu.visible = not duzen
	_serit()

func _serit() -> void:
	if not acik: return
	for c in serit.get_children():
		serit.remove_child(c); c.queue_free()
	var L := _cantadakiler()
	if mv != null: serit_yazi.text = "Yeni yerine tıkla."
	elif not L.is_empty(): serit_yazi.text = "Bir eşya seç, sonra odada yerine tıkla (R: döndür). Yerleşik bir eşyaya tıklayınca: Taşı, Geri al, Döndür."
	else: serit_yazi.text = "Çantanda yerleştirilecek eşya yok. Usta Sinan masa, sandalye, halı, perde, lamba gibi eşyalar yapar; yatak ve lambalar da konur. Yerleşik eşyalara tıklayarak taşıyabilirsin."
	for n in L:
		var b := Button.new()
		b.icon = env.ikon_al(n)
		b.text = "%s ×%d" % [n, env.adet(n)]
		b.add_theme_font_size_override("font_size", 11)
		if sec == n: b.add_theme_color_override("font_color", Color("#f2b84b"))
		b.pressed.connect(_sec.bind(n))
		serit.add_child(b)
	_yerles.call_deferred()

func _yerles() -> void:
	var vs := get_viewport().get_visible_rect().size
	ust.reset_size()
	ust.position = Vector2(floorf((vs.x - ust.size.x) / 2.0), 10)
	msg_kutu.reset_size()
	msg_kutu.position = Vector2(floorf((vs.x - msg_kutu.size.x) / 2.0), ust.position.y + ust.size.y + 4)
	serit_kutu.custom_minimum_size = Vector2(vs.x, 0)
	serit_yazi.custom_minimum_size = Vector2(vs.x - 20, 0)
	serit_kutu.reset_size()
	serit_kutu.position = Vector2(0, vs.y - serit_kutu.size.y)

func kayit_it(ev: Dictionary):
	return ev.get("oda", null)
