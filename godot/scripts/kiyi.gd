## Kumla komşu su karolarının kıyı çizgileri (web shoreM: 1 sağ, 2 sol, 4 alt, 8 üst)
extends Node2D

var oyun

func _draw() -> void:
	var T: int = oyun.T
	var sh: Array = oyun.harita.shore
	for y in oyun.bh:
		for x in oyun.bw:
			var m := int(sh[y * oyun.bw + x])
			if m == 0:
				continue
			var c := Color(0.94, 0.97, 1.0, 0.55) if oyun.tiles[y * oyun.bw + x] == 4 else Color(0.16, 0.27, 0.39, 0.45)
			var bx := float((oyun.bx0 + x) * T)
			var by := float((oyun.by0 + y) * T)
			if m & 1: draw_rect(Rect2(bx + T - 2, by, 2, T), c)
			if m & 2: draw_rect(Rect2(bx, by, 2, T), c)
			if m & 4: draw_rect(Rect2(bx, by + T - 2, T, 2), c)
			if m & 8: draw_rect(Rect2(bx, by, T, 2), c)
