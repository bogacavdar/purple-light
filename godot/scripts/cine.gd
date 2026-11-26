## Giriş sahnesi (web startCine/cineFrame/cineShip/cineSea; belge: Oyun akışı › Açılış 4). 240 × 135'lik sahne tam sayı katıyla büyütülür.
## Gün batımında gemide iki kişi yemek yer (kalpler), gövdenin altından mor ışık yükselir, çarpar (beyaz-mor parlama, sarsıntı),
## gemi sağa yatıp batar, sevdiğin kişi "Tut elimi!" der ve ikisi denize düşer; su altında sevdiğin kişi uzaklaşır, derinde dev bir göz
## açılır, karanlık kapanır; "Bir isim… bir yüz… Hiçbirini hatırlamıyorsun. Yalnızca onu sevdiğini biliyorsun." (31,6 sn). "Geç" ile atlanır.
## Sesler Godot'da ses gelince eklenecek.
extends Control

const CW := 240.0
const CH := 135.0
const HZ := 88.0
var oyun
var t := 0.0
var acik := false
var zor := false
var bitince: Callable
var parts: Array = []
var fall = null
var said := {}
var ang := 0.0
var sink := 0.0
var sahne: Node2D
var ust: Label
var alt: VBoxContainer
var gec: Button
var hero_tx: Texture2D
var love_tx: Texture2D
var isik_tx: GradientTexture2D
var karart_tx: GradientTexture2D
var k := 4.0
var X0 := 0.0; var X1 := CW; var Y0 := 0.0; var Y1 := CH

func kur(o) -> void:
	oyun = o
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var bg := ColorRect.new(); bg.color = Color.BLACK; bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	sahne = Node2D.new()
	sahne.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sahne.draw.connect(_ciz)
	add_child(sahne)
	ust = Label.new(); ust.add_theme_font_size_override("font_size", 22); ust.add_theme_color_override("font_color", Color("#f0e6c8"))
	ust.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; ust.set_anchors_and_offsets_preset(Control.PRESET_TOP_WIDE); ust.offset_top = 30
	ust.modulate.a = 0.0
	add_child(ust)
	alt = VBoxContainer.new(); alt.alignment = BoxContainer.ALIGNMENT_CENTER
	alt.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(alt)
	gec = Button.new(); gec.text = "Geç ›"; gec.flat = true; gec.add_theme_color_override("font_color", Color(1, 1, 1, 0.75))
	gec.anchor_left = 1.0; gec.anchor_right = 1.0; gec.anchor_top = 1.0; gec.anchor_bottom = 1.0
	gec.offset_left = -90; gec.offset_top = -44; gec.offset_right = -16; gec.offset_bottom = -12
	gec.pressed.connect(_bitir)
	add_child(gec)
	isik_tx = _radyal(Color(1, 1, 1, 1), Color(1, 1, 1, 0))
	karart_tx = _radyal(Color(0, 0, 0, 0), Color(0, 0, 0, 1), 0.35)
	visible = false

func _radyal(a: Color, b: Color, bas := 0.0) -> GradientTexture2D:
	var g := GradientTexture2D.new(); g.width = 128; g.height = 128; g.fill = GradientTexture2D.FILL_RADIAL
	g.fill_from = Vector2(0.5, 0.5); g.fill_to = Vector2(1.0, 0.5)
	var gr := Gradient.new(); gr.set_color(0, a); gr.set_color(1, b)
	if bas > 0.0: gr.add_point(bas, a)
	g.gradient = gr
	return g

func oyna(zor_mu: bool, son: Callable) -> void:
	zor = zor_mu
	bitince = son
	hero_tx = Karakter.sayfa(oyun.gorunus)
	love_tx = Karakter.sayfa(oyun.sevgili)
	t = 0.0; parts = []; fall = null; said = {}
	acik = true
	visible = true
	ust.modulate.a = 0.0
	for c in alt.get_children(): c.queue_free()
	oyun.oyuncu.kilit = true

func _input(e: InputEvent) -> void:
	if acik and e is InputEventKey and e.pressed and e.keycode == KEY_ESCAPE:
		get_viewport().set_input_as_handled()
		_bitir()

func _process(dt: float) -> void:
	if not acik: return
	dt = minf(dt, 0.05)
	t += dt
	var vs := get_viewport_rect().size
	k = maxf(1.0, floorf(minf(vs.x / CW, vs.y / CH) + 0.15))
	var ox := roundf((vs.x - CW * k) / 2.0); var oy := roundf((vs.y - CH * k) / 2.0)
	X0 = -ox / k; X1 = CW + ox / k; Y0 = -oy / k; Y1 = CH + oy / k
	var sx := 0.0; var sy := 0.0
	if t > 10.5 and t < 12.0:
		var a := (12.0 - t) * 2.2
		sx = roundf((randf() - 0.5) * a * 2.0); sy = roundf((randf() - 0.5) * a * 2.0)
	sahne.position = Vector2(ox + sx * k, oy + sy * k)
	sahne.scale = Vector2(k, k)
	_parca_ilerlet(dt, t >= 15.6)
	_olaylar(dt)
	sahne.queue_redraw()

func _once(a: String, tt: float) -> bool:
	if t >= tt and not said.has(a):
		said[a] = true
		return true
	return false

func _yazi(s: String, kucuk := false) -> void:
	var l := Label.new(); l.text = s; l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", 16 if kucuk else 22); l.add_theme_color_override("font_color", Color("#c9a2ff") if kucuk else Color("#efe6ff"))
	l.modulate.a = 0.0
	alt.add_child(l)
	create_tween().tween_property(l, "modulate:a", 1.0, 1.2)

func _olaylar(_dt: float) -> void:
	if _once("top", 0.6):
		ust.text = "Bir akşam, açık denizde…"
		create_tween().tween_property(ust, "modulate:a", 1.0, 1.0)
	if _once("top2", 4.2): create_tween().tween_property(ust, "modulate:a", 0.0, 1.0)
	if _once("crash", 10.5):
		for i in 40: parts.append({x = 70 + randf() * 100, y = HZ + 2, vx = (randf() - 0.5) * 50, vy = -40 - randf() * 70, life = 1 + randf() * 0.6, c = Color.WHITE if randf() < 0.5 else Color("#bfe0ff")})
	if _once("c1", 23.0): _yazi("…")
	if _once("c2", 24.4): _yazi("Bir isim… bir yüz…")
	if _once("c3", 26.0): _yazi("Hiçbirini hatırlamıyorsun.")
	if _once("c4", 27.6): _yazi("Yalnızca onu sevdiğini biliyorsun.")
	if zor and _once("c5", 28.6): _yazi("Zor mod · Bol şans", true)
	if _once("cout", 30.2): create_tween().tween_property(alt, "modulate:a", 0.0, 1.2)
	if t >= 31.6: _bitir()

func _bitir() -> void:
	if not acik: return
	acik = false
	visible = false
	alt.modulate.a = 1.0
	if bitince.is_valid(): bitince.call()

# ------------------------------------------------------------------ çizim yardımcıları
func cp(x: float, y: float, w: float, h: float, c: Color) -> void:
	sahne.draw_rect(Rect2(roundf(x), roundf(y), w, h), c)

func dikey(y0: float, y1: float, duraklar: Array) -> void:   # [[konum, Color], …]
	var n := int(ceilf(y1 - y0))
	for i in n:
		var u := float(i) / maxf(1.0, n - 1)
		var c: Color = duraklar[0][1]
		for j in range(duraklar.size() - 1):
			var a: Array = duraklar[j]; var b: Array = duraklar[j + 1]
			if u >= float(a[0]) and u <= float(b[0]):
				c = (a[1] as Color).lerp(b[1], (u - float(a[0])) / maxf(0.0001, float(b[0]) - float(a[0])))
		if u > float(duraklar[-1][0]): c = duraklar[-1][1]
		sahne.draw_rect(Rect2(X0, y0 + i, X1 - X0, 1.2), c)

func isik(c: Vector2, r: float, renk: Color) -> void:
	sahne.draw_texture_rect(isik_tx, Rect2(c.x - r, c.y - r, r * 2.0, r * 2.0), false, renk)

func balon(x: float, y: float, s: String, koyu := false) -> void:
	var f := ThemeDB.fallback_font
	var w := ceilf(f.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, 7).x) + 8.0
	x = roundf(x - w / 2.0); y = roundf(y)
	cp(x - 1, y - 1, w + 2, 12, Color("#11170f")); cp(x, y, w, 10, Color("#232d1f") if koyu else Color("#fff6e4")); cp(x + roundf(w / 2.0) - 1, y + 10, 3, 2, Color("#232d1f") if koyu else Color("#fff6e4"))
	sahne.draw_string(f, Vector2(x + 4, y + 8), s, HORIZONTAL_ALIGNMENT_LEFT, -1, 7, Color("#f2b84b") if koyu else Color("#2a1f08"))

func kalp(x: float, y: float, a: float) -> void:
	var c := Color("#ff6a9a"); c.a = clampf(a, 0.0, 1.0)
	x = roundf(x); y = roundf(y)
	cp(x - 2, y, 2, 1, c); cp(x + 1, y, 2, 1, c); cp(x - 2, y + 1, 5, 1, c); cp(x - 1, y + 2, 3, 1, c); cp(x, y + 3, 1, 1, c)

## kişi: web drawChibi → sayfanın duruş karesi; ayak (x, y)
func kisi(tx: Texture2D, x: float, y: float, sag: bool, a := 1.0) -> void:
	var row := 1 if sag else 7      # SE · SW (sahnelerde yüzler hafif bize döner)
	sahne.draw_texture_rect_region(tx, Rect2(roundf(x) - 13, roundf(y) - 35, 26, 40), Rect2(0, row * 40, 26, 40), Color(1, 1, 1, a))

func _parca_ilerlet(dt: float, under: bool) -> void:
	for p in parts.duplicate():
		p.life -= dt; p.x += p.vx * dt; p.y += p.vy * dt
		if p.has("bub"):
			p.vy = maxf(p.vy - 30.0 * dt, -34.0); p.x += sin((p.life + p.ph) * 8.0) * 0.25
		else:
			p.vy += 160.0 * dt
		if p.life <= 0.0 or (under and p.y < 2.0): parts.erase(p)

func _parca_ciz() -> void:
	for p in parts:
		var a := minf(1.0, p.life * 1.5)
		if p.has("bub"):
			var c := Color(0.78, 0.92, 1.0, 0.85 * a); var r: float = p.r
			var x := roundf(p.x); var y := roundf(p.y)
			cp(x, y - r, r, 1, c); cp(x, y + r, r, 1, c); cp(x - 1, y - r + 1, 1, r * 2 - 1, c); cp(x + r, y - r + 1, 1, r * 2 - 1, c)
		else:
			var c: Color = p.c; c.a = a
			cp(p.x, p.y, 2, 2, c)

func _ciz() -> void:
	if t < 15.6: _gemi(1.0 / 60.0)
	elif t < 22.4: _deniz(t - 15.6)
	var perde := func(c: Color, a: float):
		if a <= 0.0: return
		c.a = minf(1.0, a); sahne.draw_rect(Rect2(X0 - 4, Y0 - 4, X1 - X0 + 8, Y1 - Y0 + 8), c)
	perde.call(Color.BLACK, 1.0 - t / 1.4)
	if t > 10.5: perde.call(Color("#f0e0ff"), 1.0 - (t - 10.5) / 0.35)
	if t > 14.9 and t < 15.6: perde.call(Color("#0a1a40"), (t - 14.9) / 0.7)
	if t >= 15.6 and t < 16.2: perde.call(Color("#0a1a40"), 1.0 - (t - 15.6) / 0.6)
	if t >= 22.4: sahne.draw_rect(Rect2(X0 - 4, Y0 - 4, X1 - X0 + 8, Y1 - Y0 + 8), Color.BLACK)

# ------------------------------------------------------------------ gemi (0–15,6 sn)
func _gemi(dt: float) -> void:
	dikey(Y0, HZ, [[0.0, Color("#1e1640")], [0.5, Color("#7a3e72")], [0.82, Color("#e0785a")], [1.0, Color("#ffc070")]])
	for i in 30:
		var sx := X0 + float((i * 97) % 101) / 101.0 * (X1 - X0); var sy := Y0 + float((i * 61) % 43) / 43.0 * (46.0 - Y0)
		var tw := 0.5 + 0.5 * sin(t * 2.3 + i * 1.7)
		cp(sx, sy, 1, 1, Color(1, 0.94, 0.86, 0.25 + 0.55 * tw))
	# batan güneş
	for r in 13:
		var w := sqrt(169.0 - r * r) * 2.0
		cp(200 - w / 2.0, HZ - r - 1, w, 1, Color("#ffd88a"))
	cp(188, HZ - 5, 24, 1, Color("#ffb868")); cp(190, HZ - 9, 20, 1, Color("#ffb868"))
	for c in [[30, 40, 34], [150, 30, 26], [214, 52, 30]]:
		var cx: float = c[0] + sin(t * 0.1 + c[1]) * 3.0
		cp(cx, c[1], c[2], 3, Color(1, 0.67, 0.59, 0.35)); cp(cx + 5, c[1] - 2, c[2] - 12, 2, Color(1, 0.75, 0.67, 0.3))
	dikey(HZ, Y1, [[0.0, Color("#b0607a")], [0.1, Color("#3a4a8a")], [1.0, Color("#0e1a44")]])
	for r in 12:
		var w := maxf(2.0, (12 - r) * 2.2 + sin(t * 3.0 + r) * 2.0)
		cp(200 - w / 2.0 + sin(t * 2.0 + r * 1.3) * 2.0, HZ + 2 + r * 2, w, 1, Color(1, 0.78, 0.51, 0.45))
	for i in 46:
		var span := X1 - X0 + 20.0
		cp(X0 - 10 + fmod(i * 37 + t * (6 + i % 3 * 3), span), HZ + 3 + (i * 7) % 46, 3 + i % 3, 1, Color(1, 1, 1, 0.1))
	var la := 0.0 if t < 8.6 else ((t - 8.6) / 1.9 if t < 10.5 else maxf(0.0, 1.0 - (t - 10.5) / 1.6))
	if la > 0.0:
		var r := 10.0 + la * 36.0 + sin(t * 10.0) * 2.0 * la
		isik(Vector2(120, 106), r, Color(0.94, 0.82, 1.0, 0.95 * la))
		isik(Vector2(120, 106), r * 0.7, Color(0.67, 0.35, 0.96, 0.6 * la))
	# gemi: sallanır, çarpınca sarsılır, sağa yatıp batar
	var a := sin(t * 1.3) * 0.02
	var s := roundf(sin(t * 1.3 + 1.0))
	if t > 10.5:
		var j := t - 10.5
		a += -0.14 * exp(-j * 3.0) * sin(j * 14.0); s -= roundf(6.0 * exp(-j * 4.0) * sin(j * 9.0))
	if t > 11.2:
		var c := minf(1.0, (t - 11.2) / 4.2); a += c * c * 2.5
	if t > 12.6: s += (t - 12.6) * (t - 12.6) * 3.4
	ang = a; sink = s
	var hx := 104.0 + clampf((t - 12.2) * 8.0, 0.0, 10.0)
	var lx := 136.0 + clampf((t - 11.8) * 10.0, 0.0, 14.0)
	var M := Transform2D(0, Vector2(120, 92 + sink)) * Transform2D(ang, Vector2.ZERO) * Transform2D(0, Vector2(-120, -92))
	sahne.draw_set_transform_matrix(M)
	for r in 17:
		var ins := 0 if r < 5 else int(round((r - 5) * (r - 5) * 0.42))
		cp(58 + ins, 76 + r, 124 - ins * 2, 1, Color("#9a6a3a") if r < 2 else (Color("#4a2e18") if r == 8 else (Color("#5a3a20") if r % 4 == 0 else Color("#6a4426"))))
	cp(54, 73, 132, 3, Color("#b0844e")); cp(54, 73, 132, 1, Color("#c89a60")); cp(176, 64, 12, 10, Color("#7a5430")); cp(176, 64, 12, 1, Color("#9a6a3a"))
	for ph in [72, 94, 150, 168]: cp(ph, 80, 3, 3, Color("#ffd27a") if t < 10.5 else Color("#7a5a30"))
	cp(56, 67, 118, 1, Color("#8a5a2e"))
	for i in 15: cp(56 + i * 8, 67, 1, 6, Color("#8a5a2e"))
	cp(60, 55, 26, 18, Color("#7a5430")); cp(58, 53, 30, 2, Color("#4a2e18")); cp(60, 55, 26, 1, Color("#9a6a3a")); cp(64, 61, 4, 12, Color("#4a2e18"))
	cp(72, 59, 9, 6, Color("#ffd27a") if t < 10.5 else Color("#3a2a1a")); cp(76, 59, 1, 6, Color("#7a5430"))
	cp(158, 10, 2, 63, Color("#5a3a20")); cp(146, 16, 26, 1, Color("#4a2e18"))
	for r in 40:
		var b := roundf(sin(r / 40.0 * PI) * 4.0 + sin(t * 2.0))
		cp(147 + b, 17 + r, 24 - roundf(r / 12.0), 1, Color("#efe4c4") if r % 3 else Color("#e2d6b0"))
	var fw := roundf(sin(t * 6.0))
	cp(160, 6, 8, 2, Color("#c94f3d")); cp(160, 8, 7 + fw, 2, Color("#a83a2a"))
	cp(140, 34, 1, 6, Color("#4a2e18")); cp(138, 40, 5, 6, Color("#ffcf6a")); cp(138, 40, 5, 1, Color("#4a2e18"))
	if t < 10.8: isik(Vector2(140, 43), 16, Color(1, 0.82, 0.47, 0.35))
	cp(99, 70, 7, 2, Color("#6a4426")); cp(100, 72, 1, 2, Color("#5a3a20")); cp(104, 72, 1, 2, Color("#5a3a20"))
	cp(134, 70, 7, 2, Color("#6a4426")); cp(135, 72, 1, 2, Color("#5a3a20")); cp(139, 72, 1, 2, Color("#5a3a20"))
	cp(113, 66, 1, 7, Color("#5a3a20")); cp(126, 66, 1, 7, Color("#5a3a20"))
	cp(109, 63, 22, 2, Color("#f3ecd8")); cp(110, 65, 20, 3, Color("#e6dcc6")); cp(110, 64, 20, 1, Color("#c94f3d"))
	cp(111, 62, 6, 1, Color.WHITE); cp(112, 61, 2, 1, Color("#e8822a")); cp(114, 61, 2, 1, Color("#8fd46b")); cp(123, 62, 6, 1, Color.WHITE); cp(124, 61, 3, 1, Color("#e0c060"))
	if t < 10.5:
		cp(119, 57, 2, 5, Color("#f3ecd8"))
		var f := roundf(sin(t * 14.0))
		cp(119, 54 + f, 2, 3, Color("#ffd27a")); cp(119, 53 + f, 1, 1, Color("#fff3c0"))
		isik(Vector2(120, 56), 9, Color(1, 0.86, 0.55, 0.35))
	else:
		cp(117, 61, 5, 2, Color("#f3ecd8"))
	if fall == null:
		kisi(hero_tx, hx, 72, true)
		kisi(love_tx, lx, 72, false)
		for h0 in [2.6, 4.6, 6.4]:
			var u: float = t - h0
			if u > 0.0 and u < 2.2: kalp(120 + sin(u * 4.0) * 3.0, 49 - u * 7.0, 1.0 - u / 2.2)
	sahne.draw_set_transform_matrix(Transform2D.IDENTITY)
	var toW := func(px: float, py: float) -> Vector2: return M * Vector2(px, py)
	if fall == null:
		var H1: Vector2 = toW.call(hx, 52); var H2: Vector2 = toW.call(lx, 52)
		if t > 9.3 and t < 10.5: balon(H1.x, H1.y - 4, "?", true); balon(H2.x, H2.y - 4, "?", true)
		if t > 10.6 and t < 11.7: balon(H1.x, H1.y - 4, "!", true); balon(H2.x, H2.y - 4, "!", true)
		if t > 12.1: balon(H2.x, H2.y - 6, "Tut elimi!")
		if t >= 13.2:
			var A: Vector2 = toW.call(lx, 64); var B: Vector2 = toW.call(hx, 64)
			fall = [{tx = love_tx, x = A.x, y = A.y, vx = 26.0, vy = -30.0, rot = ang, vr = 2.6, sag = false, hold = false, at = 0.0, sp = false, sev = true},
				{tx = hero_tx, x = B.x, y = B.y, vx = 0.0, vy = 0.0, rot = ang, vr = 0.0, sag = true, hold = true, at = 0.45, sp = false, sev = false}]
	if fall != null:
		for b in fall:
			if b.hold:
				b.at -= dt
				var w: Vector2 = toW.call(hx, 64); b.x = w.x; b.y = w.y; b.rot = ang
				if b.at <= 0.0: b.hold = false; b.vx = 34.0; b.vy = -46.0; b.vr = 3.2
			else:
				b.vy += 150.0 * dt
				if b.sp: b.vy = minf(b.vy, 10.0); b.vx *= pow(0.2, dt)
				b.x += b.vx * dt; b.y += b.vy * dt; b.rot += b.vr * dt * (0.2 if b.sp else 1.0)
			if not b.sp and b.y > HZ + 2:
				b.sp = true
				for i in 22: parts.append({x = b.x + (randf() - 0.5) * 8, y = HZ + 1, vx = (randf() - 0.5) * 60, vy = -30 - randf() * 60, life = 0.8 + randf() * 0.4, c = Color.WHITE if randf() < 0.5 else Color("#bfe0ff")})
			var under: float = minf(1.0, (b.y - HZ) / 14.0) if b.sp else 0.0
			if under >= 1.0: continue
			sahne.draw_set_transform_matrix(Transform2D(b.rot, Vector2(roundf(b.x), roundf(b.y))))
			kisi(b.tx, 0, 8, b.sag, 1.0 - under)
			sahne.draw_set_transform_matrix(Transform2D.IDENTITY)
			if b.sev and not b.sp and not b.hold: balon(b.x, b.y - 26, "Tut elimi!")
	# yakın su gövdenin altını ve dalanları örter
	dikey(HZ + 1, Y1, [[0.0, Color(0.16, 0.25, 0.51, 0.78)], [1.0, Color(0.055, 0.1, 0.27, 0.95)]])
	var x := floorf(X0 / 6.0) * 6.0
	while x < X1:
		cp(x + fmod(t * 8.0, 6.0), HZ + 1 + roundf(sin(t * 2.0 + x * 0.3)), 3, 1, Color(1, 1, 1, 0.35))
		x += 6.0
	if la > 0.0:
		var r := 8.0 + la * 20.0
		isik(Vector2(120, HZ + 4), r * 1.6, Color(0.78, 0.55, 1.0, 0.5 * la))
	_parca_ciz()
	if t > 8.6: sahne.draw_rect(Rect2(X0, Y0, X1 - X0, Y1 - Y0), Color(0.04, 0.024, 0.12, minf(0.45, (t - 8.6) * 0.18)))

# ------------------------------------------------------------------ su altı (15,6–22,4 sn)
func _deniz(u: float) -> void:
	dikey(Y0, Y1, [[0.0, Color("#2e6ab0")], [0.45, Color("#163a78")], [1.0, Color("#050c26")]])
	var x := floorf(X0 / 5.0) * 5.0
	while x < X1:
		cp(x, Y0 + 3 + roundf(sin(u * 2.0 + x * 0.21) * 1.5), 4, 1, Color(0.78, 0.92, 1.0, 0.5))
		x += 5.0
	for i in 6:
		var x0 := 20.0 + i * 40.0 + sin(u * 0.6 + i) * 8.0
		sahne.draw_colored_polygon(PackedVector2Array([Vector2(x0, Y0), Vector2(x0 + 10, Y0), Vector2(x0 + 46, Y1), Vector2(x0 + 22, Y1)]), Color(0.59, 0.78, 1.0, 0.05 + 0.03 * sin(u * 1.3 + i * 2.0)))
	var pr := 46.0 + sin(u * 2.4) * 6.0
	isik(Vector2(120, CH + 26), pr + 30.0, Color(0.78, 0.55, 1.0, 0.55))
	isik(Vector2(120, CH + 26), (pr + 30.0) * 0.5, Color(0.47, 0.2, 0.86, 0.22))
	if u > 3.9 and u < 5.3:
		var e := sin(PI * (u - 3.9) / 1.4); var ey := CH - 8.0
		sahne.draw_set_transform(Vector2(120, ey), 0, Vector2(22, maxf(0.5, e * 7.0))); sahne.draw_circle(Vector2.ZERO, 1.0, Color(0.7, 0.43, 1.0, 0.55))
		sahne.draw_set_transform(Vector2(120, ey), 0, Vector2(15, maxf(0.4, e * 4.5))); sahne.draw_circle(Vector2.ZERO, 1.0, Color("#eadcff"))
		sahne.draw_set_transform(Vector2.ZERO)
		cp(119, roundf(ey - e * 4.0), 2, maxf(1.0, roundf(e * 8.0)), Color("#1a0638"))
	if u < 4.2:
		var a := maxf(0.0, 0.75 - u * 0.18)
		var M := Transform2D(0, Vector2(roundf(64 - u * 7.0), roundf(46 - u * 5.0))) * Transform2D(-0.5 + sin(u) * 0.2, Vector2(0.6, 0.6), 0, Vector2.ZERO)
		sahne.draw_set_transform_matrix(M)
		kisi(love_tx, 0, 8, true, a)
		sahne.draw_set_transform_matrix(Transform2D.IDENTITY)
	sahne.draw_rect(Rect2(X0, Y0, X1 - X0, Y1 - Y0), Color(0.06, 0.16, 0.35, 0.28))
	var hx := 132.0 + sin(u * 0.8) * 3.0; var hy := 36.0 + u * 6.4
	var dt := 1.0 / 60.0
	if randf() < dt * (7.0 if u < 3.6 else 2.5):
		var n := 3 if u < 3.6 and randf() < 0.3 else 1
		for i in n: parts.append({bub = 1, x = hx + (randf() - 0.5) * 4, y = hy - 12, vx = (randf() - 0.5) * 4, vy = -8.0, life = 2.6, r = 1 + randi() % 2, ph = randf() * 6})
	for kk in [0.6, 2.0, 3.4]:
		if u > kk and u - dt <= kk:
			for i in 7: parts.append({bub = 1, x = hx + (randf() - 0.5) * 6, y = hy - 12, vx = (randf() - 0.5) * 8, vy = -14 - randf() * 8, life = 2.4, r = 1 + randi() % 3, ph = randf() * 6})
	sahne.draw_set_transform_matrix(Transform2D(sin(u * 0.9) * 0.18 + (0.25 if u > 3.6 else 0.0), Vector2(roundf(hx), roundf(hy))))
	kisi(hero_tx, 0, 8, false)
	sahne.draw_set_transform_matrix(Transform2D.IDENTITY)
	_parca_ciz()
	if u > 4.0:
		var q := minf(1.0, (u - 4.0) / 2.3); var r := maxf(0.0, 190.0 * (1.0 - q))
		if q >= 1.0:
			sahne.draw_rect(Rect2(X0, Y0, X1 - X0, Y1 - Y0), Color.BLACK)
		else:
			var c := Vector2(hx, hy - 6)
			sahne.draw_texture_rect(karart_tx, Rect2(c.x - r - 1, c.y - r - 1, 2 * r + 2, 2 * r + 2), false)
			sahne.draw_rect(Rect2(X0, Y0, X1 - X0, c.y - r - 1 - Y0), Color.BLACK)
			sahne.draw_rect(Rect2(X0, c.y + r + 1, X1 - X0, Y1 - c.y), Color.BLACK)
			sahne.draw_rect(Rect2(X0, c.y - r - 1, c.x - r - 1 - X0, 2 * r + 2), Color.BLACK)
			sahne.draw_rect(Rect2(c.x + r + 1, c.y - r - 1, X1 - c.x, 2 * r + 2), Color.BLACK)
