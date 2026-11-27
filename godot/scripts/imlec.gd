extends Node
## Fare imleci (web v371el; belge Sistemler › Kontroller › Fare imleci): oyunun üstünde mor ışıkta piksel bir el. 16×16 şekil 2 kat:
## krem el, ince koyu mor kenar, mor parmak ucu, çevresinde soluk mor ışık. Toplanacak, konuşulacak ya da kullanılacak bir şeyin
## üstünde el açılır ve ışığı büyür. Dokunmatik ekranda yok; ana menüde ve pencerelerde normal ok.

const POINT := ["................", "......XX........", "......XX........", "......XX........", "......XX........", "......XX........", "......XXXXX.....", "......XXXXXXX...", "...XX.XXXXXXXX..", "...XXXXXXXXXXX..", "....XXXXXXXXXX..", ".....XXXXXXXXX..", "......XXXXXXX...", "......XXXXXXX...", "................", "................"]
const PALM := ["................", "....X.X.X.......", "....X.X.X.X.....", "....X.X.X.X.....", "....X.X.X.X.....", "....XXXXXXX.....", ".X..XXXXXXX.....", ".XX.XXXXXXX.....", "..XXXXXXXXX.....", "...XXXXXXXX.....", "....XXXXXXX.....", ".....XXXXX......", ".....XXXXX......", "................", "................", "................"]
const SC := 2
const N := 16
const HOT := Vector2(13, 2)
var oyun
var el_p: ImageTexture
var el_a: ImageTexture
var acik = false
var _t := 0.0
var etkin := true

func kur(o) -> void:
	oyun = o
	etkin = not DisplayServer.is_touchscreen_available()
	if not etkin: return
	el_p = _yap(POINT, false)
	el_a = _yap(PALM, true)
	Input.set_custom_mouse_cursor(el_p, Input.CURSOR_ARROW, HOT)

func _yap(M: Array, ac: bool) -> ImageTexture:
	var im := Image.create(N * SC, N * SC, false, Image.FORMAT_RGBA8)
	var F := func(x: int, y: int) -> bool: return x >= 0 and y >= 0 and x < N and y < N and M[y][x] == "X"
	var E := func(x: int, y: int) -> bool: return not F.call(x, y) and (F.call(x + 1, y) or F.call(x - 1, y) or F.call(x, y + 1) or F.call(x, y - 1))
	var px := func(x: int, y: int, c: Color):
		for yy in SC:
			for xx in SC: im.set_pixel(x * SC + xx, y * SC + yy, c)
	var ga := 0.78 if ac else 0.5
	for y in N:
		for x in N:
			if F.call(x, y) or E.call(x, y): continue
			var near := false
			var diag := true
			for dy in [-1, 0, 1]:
				for dx in [-1, 0, 1]:
					if E.call(x + dx, y + dy):
						near = true
						if dx == 0 or dy == 0: diag = false
			if near: px.call(x, y, Color(160 / 255.0, 80 / 255.0, 1.0, ga * 0.55 if diag else ga))
	for y in N:
		for x in N:
			if E.call(x, y): px.call(x, y, Color("#3a1c5c"))
			elif F.call(x, y): px.call(x, y, Color("#dccbf0") if (not F.call(x + 1, y) or not F.call(x, y + 1)) else Color("#f6eedc"))
	if not ac:
		for k in [[8, 7], [10, 7], [12, 8]]:
			if F.call(k[0], k[1]): px.call(k[0], k[1], Color("#a98ed4"))
		px.call(6, 1, Color("#c9a0ff")); px.call(7, 1, Color("#e8d8ff"))
	else:
		for x in [4, 6, 8, 10]:
			var y := 2 if x == 10 else 1
			if F.call(x, y): px.call(x, y, Color("#d4b4ff"))
		px.call(6, 8, Color("#e8d8ff")); px.call(13, 2, Color.WHITE); px.call(2, 3, Color("#e8d8ff")); px.call(14, 6, Color("#c9a0ff"))
	return ImageTexture.create_from_image(im)

func _process(dt: float) -> void:
	if not etkin or oyun == null or oyun.oyuncu == null: return
	_t -= dt
	if _t > 0.0: return
	_t = 0.1
	if oyun.basta:
		if acik != null:
			Input.set_custom_mouse_cursor(null)
			acik = null
		return
	var v := false
	if not oyun.basta and not oyun.pencere_acik() and not oyun.konusma.visible and not oyun.sahne.acik:
		v = _ustunde(oyun.get_global_mouse_position())
	if acik == null or v != acik:
		acik = v
		Input.set_custom_mouse_cursor(el_a if v else el_p, Input.CURSOR_ARROW, HOT)

## farenin altında toplanacak, konuşulacak ya da kullanılacak bir şey var mı (web pickAt; su sayılmaz)
func _ustunde(w: Vector2) -> bool:
	for d in oyun.toplama.dusenler:
		if d.node.position.distance_to(w) < 10.0: return true
	for d in oyun.dugumler:
		if d.canli and d.position.distance_to(w + Vector2(0, 4)) < 12.0: return true
	for n in oyun.kisiler:
		if n.visible and n.position.distance_to(w + Vector2(0, 12)) < 14.0: return true
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.visible and ag.position.distance_to(w + Vector2(0, 14)) < 14.0: return true
	if oyun.kamp != null:
		for c in oyun.kamp.camps:
			if c.t > 0.0 and c.p.distance_to(w) < 12.0: return true
	return false
