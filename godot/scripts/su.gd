## Su ve kıyı (web drawWater + v425karo kıyı çizgileri), yalnız ekranda görünen karolar için her karede çizilir:
## denizde iki sıra yavaş kabaran ak dalga sırtı, tatlı suda doğuya akan akıntı çizgileri, ara sıra parıltı,
## kumla komşu su karolarında sabit kıyı çizgisi ve nefes alır gibi gelip giden köpük şeridi.
extends Node2D

var oyun
var kiyilar := {}  # karo indeksi → [[dx, dy], …] kara tarafı (web SHORE)
var zaman := 0.0

func _ready() -> void:
	var W: int = oyun.bw
	var H: int = oyun.bh
	var t: PackedByteArray = oyun.tiles
	for y in range(1, H - 1):
		for x in range(1, W - 1):
			var k := t[y * W + x]
			if k < 3 or k == 5:
				continue
			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				if t[(y + d.y) * W + x + d.x] <= 2:
					var i := y * W + x
					if not kiyilar.has(i):
						kiyilar[i] = []
					kiyilar[i].append(d)

func _process(d: float) -> void:
	zaman += d
	queue_redraw()

func _draw() -> void:
	var T: int = oyun.T
	var W: int = oyun.bw
	var H: int = oyun.bh
	var tl: PackedByteArray = oyun.tiles
	var sh: PackedByteArray = oyun.shore
	var kam: Camera2D = oyun.kamera
	var vs := get_viewport_rect().size / kam.zoom
	var c := kam.get_screen_center_position()
	var x0 := maxi(0, int(floor((c.x - vs.x / 2) / T)) - 1)
	var y0 := maxi(0, int(floor((c.y - vs.y / 2) / T)) - 1)
	var x1 := mini(W, int(ceil((c.x + vs.x / 2) / T)) + 1)
	var y1 := mini(H, int(ceil((c.y + vs.y / 2) / T)) + 1)
	var tm := zaman
	for y in range(y0, y1):
		for x in range(x0, x1):
			var i := y * W + x
			var k := tl[i]
			var bx := float(x * T)
			var by := float(y * T)
			# sabit kıyı çizgisi (web shoreM: 1 sağ, 2 sol, 4 alt, 8 üst)
			var m := sh[i]
			if m != 0:
				var kc := Color(0.94, 0.97, 1.0, 0.55) if k == 4 else Color(0.16, 0.27, 0.39, 0.45)
				if m & 1: draw_rect(Rect2(bx + T - 2, by, 2, T), kc)
				if m & 2: draw_rect(Rect2(bx, by, 2, T), kc)
				if m & 4: draw_rect(Rect2(bx, by + T - 2, T, 2), kc)
				if m & 8: draw_rect(Rect2(bx, by, T, 2), kc)
			if k < 3 or k == 5:
				continue
			if k == 4:
				# yavaş kabarma: her karo sırasında iki ak sırt yuvarlanır
				for n in 2:
					var w := sin(tm * 1.4 + x * 0.5 + y * 0.45 + n * 2.6)
					if w > 0.35:
						var a := (w - 0.35) * 0.45
						var ox := floorf(fmod(tm * 5.0 + x * 7 + n * 6, 14.0))
						var oy := 3 + n * 7 + ((x + y) & 1)
						draw_rect(Rect2(bx + ox, by + oy, 4, 1), Color(1, 1, 1, a))
						draw_rect(Rect2(bx + ox + 1, by + oy - 1, 2, 1), Color(1, 1, 1, a))
			else:
				# tatlı su: doğuya akan akıntı
				for n in 2:
					var o := fmod(tm * 11.0 + x * 5 + y * 9 + n * 8, 18.0)
					draw_rect(Rect2(bx + floorf(o) - 2, by + 3 + n * 6 + ((x * 3 + y) % 3), 3, 1), Color(0.88, 0.97, 1.0, 0.32))
			# parıltı
			var sp := sin(tm * 2.7 + x * 12.9 + y * 7.3)
			if sp > 0.96:
				var px := bx + ((x * 11) % 13)
				var py := by + ((y * 5) % 13)
				draw_rect(Rect2(px, py, 1, 1), Color(1, 1, 1, 0.9))
				draw_rect(Rect2(px - 1, py, 3, 1), Color(1, 1, 1, 0.4))
			# kıyı köpüğü: kumla komşu kenarda gelip giden şerit
			if kiyilar.has(i):
				var deniz := k == 4
				var w2 := sin(tm * (1.8 if deniz else 2.4) + (x * 1.3 + y * 0.7))
				var a2 := (0.42 if deniz else 0.25) + 0.22 * w2
				var off := roundf((w2 + 1) * (1.5 if deniz else 1.0))
				var fc := Color(1, 1, 1, clampf(a2, 0, 1))
				for e in kiyilar[i]:
					if e.x == 1: draw_rect(Rect2(bx + T - 2 - off, by, 2, T), fc)
					elif e.x == -1: draw_rect(Rect2(bx + off, by, 2, T), fc)
					elif e.y == 1: draw_rect(Rect2(bx, by + T - 2 - off, T, 2), fc)
					else: draw_rect(Rect2(bx, by + off, T, 2), fc)
