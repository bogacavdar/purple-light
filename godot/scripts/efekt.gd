## Uçan yazılar (-hasar, "!") ve küçük parçacıklar (web floats / parts)
extends Node2D

var yazilar: Array = []
var parcalar: Array = []
var font: Font

func _ready() -> void:
	font = ThemeDB.fallback_font

func yazi(p: Vector2, metin: String, renk: Color, boy: int = 8) -> void:
	yazilar.append({p = p, t = 0.0, m = metin, c = renk, b = boy})

func parca(p: Vector2, v: Vector2, omur: float, renk: Color) -> void:
	parcalar.append({p = p, v = v, l = omur, c = renk})

func _process(dt: float) -> void:
	for i in range(yazilar.size() - 1, -1, -1):
		var y = yazilar[i]
		y.t += dt
		if y.t > 0.9:
			yazilar.remove_at(i)
	for i in range(parcalar.size() - 1, -1, -1):
		var q = parcalar[i]
		q.l -= dt
		q.p += q.v * dt
		q.v.y += 80.0 * dt
		if q.l <= 0:
			parcalar.remove_at(i)
	queue_redraw()

func _draw() -> void:
	for q in parcalar:
		draw_rect(Rect2(roundf(q.p.x), roundf(q.p.y), 1, 1), q.c)
	for y in yazilar:
		var a := clampf(1.5 - y.t * 1.6, 0.0, 1.0)
		var p: Vector2 = y.p + Vector2(0, -y.t * 18.0)
		var s := font.get_string_size(y.m, HORIZONTAL_ALIGNMENT_LEFT, -1, y.b)
		var c: Color = y.c
		c.a = a
		draw_string_outline(font, p - Vector2(s.x / 2, 0), y.m, HORIZONTAL_ALIGNMENT_LEFT, -1, y.b, 2, Color(0.08, 0.06, 0.05, a))
		draw_string(font, p - Vector2(s.x / 2, 0), y.m, HORIZONTAL_ALIGNMENT_LEFT, -1, y.b, c)
