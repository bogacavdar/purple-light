extends Node2D
## Evcil hayvan, yavru ya da Pamuk'un görüntüsü (evcil.gd sürer): canlının resmi, ad etiketi, can çubuğu, güven kalbi.

var D: Dictionary = {}       # canlı verisi (oyun.canlilar[tür]); boşsa keçi çizilir
var ad := ""
var etiket := false
var hp_oran := 1.0
var kalp := -1.0             # güven %; -1 gösterme
var face := 1
var yuruyor := false
var adim := 0.0
var soluk := false
var olcek := 1.0
var hop := 0
var spr: Sprite2D

func kur(d: Dictionary) -> void:
	D = d
	if D.is_empty(): return
	spr = Sprite2D.new()
	spr.texture = load(D.file)
	spr.hframes = int(D.frames)
	spr.centered = false
	add_child(spr)

func _process(dt: float) -> void:
	if yuruyor: adim += dt
	if spr != null:
		var fr := 0
		if yuruyor: fr = 1 + (int(floor(adim * 18.0 / PI)) % 4)
		spr.frame = mini(fr, int(D.frames) - 1)
		spr.flip_h = face < 0
		spr.offset = Vector2((-float(D.ox)) if face > 0 else (float(D.ox) - float(D.fw)), -float(D.oy))
		spr.scale = Vector2(olcek, olcek)
		spr.modulate.a = 0.6 if soluk else 1.0
	queue_redraw()

func _r(x: float, y: float, w: float, h: float, c: String) -> void:
	draw_rect(Rect2(x, y, w, h), Color(c))

func _draw() -> void:
	if D.is_empty():
		# Pamuk (web drawGoat): beyaz keçi, tek boynuzu kırık
		var y := -hop
		var f := face
		var P := func(dx: float, dy: float, w: float, h: float, c: String) -> void:
			_r(dx if f > 0 else -dx - w, y + dy, w, h, c)
		_r(-6, 1, 12, 2, "#00000038")
		P.call(-5, -7, 10, 5, "#f0ece4"); P.call(-5, -7, 10, 1, "#ffffff"); P.call(4, -10, 4, 4, "#f0ece4"); P.call(7, -8, 1, 1, "#2a1f08"); P.call(5, -12, 1, 2, "#b8a888"); P.call(-6, -7, 1, 2, "#e0dcd2"); P.call(4, -6, 2, 2, "#d8d0c0")
		P.call(-4, -2, 1, 3, "#c8c0b0"); P.call(-1, -2, 1, 3, "#c8c0b0"); P.call(2, -2, 1, 3, "#c8c0b0"); P.call(4, -2, 1, 3, "#c8c0b0")
	else:
		draw_set_transform(Vector2(0, 1), 0, Vector2(float(D.fw) * 0.3 * olcek, 2.0 * olcek))
		draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.22))
		draw_set_transform(Vector2.ZERO)
	var top := -float(D.get("top", 14)) * olcek if not D.is_empty() else -14.0
	if etiket and ad != "":
		var fnt := ThemeDB.fallback_font
		var w := fnt.get_string_size(ad, HORIZONTAL_ALIGNMENT_LEFT, -1, 8).x + 6
		draw_rect(Rect2(roundf(-w / 2), top - 16, roundf(w), 10), Color(0.07, 0.09, 0.06, 0.75))
		draw_string(fnt, Vector2(roundf(-w / 2) + 3, top - 8), ad, HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("#f2e8c8"))
		if hp_oran < 1.0:
			draw_rect(Rect2(-10, top - 5, 20, 2), Color("#3a1a1a"))
			draw_rect(Rect2(-10, top - 5, roundf(20 * hp_oran), 2), Color("#8fd46b"))
	if kalp >= 0.0:
		kalp_ciz(self, Vector2(0, top - 6), kalp)

static func kalp_ciz(n: CanvasItem, p: Vector2, v: float) -> void:
	n.draw_rect(Rect2(p.x - 13, p.y - 4, 26, 6), Color(0.07, 0.09, 0.06, 0.75))
	n.draw_rect(Rect2(p.x - 12, p.y - 3, roundf(24 * v / 100.0), 4), Color("#ff7aa0"))
	n.draw_rect(Rect2(p.x - 18, p.y - 4, 4, 3), Color("#ffd0e0"))
	n.draw_rect(Rect2(p.x - 17, p.y - 2, 2, 2), Color("#ffd0e0"))
