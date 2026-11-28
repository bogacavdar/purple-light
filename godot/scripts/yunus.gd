extends Node2D
## Yunuslar (web v67; belge ACT 1 › Deniz): ara sıra açık denizden bir yunus (bazen iki) sıçrar; yalnızca ekranda görülen yerde,
## kıyının yakınında hiç (çevresindeki 5×5 karonun hepsi derin deniz). 18–48 sn'de bir; suya girerken ve çıkarken köpük.

var oyun
var tex: Texture2D
var L: Array = []          # {x, y, dir, t, dur, len}
var sonraki := 0.0

func kur(o) -> void:
	oyun = o
	tex = load("res://art/yunus.png")
	z_index = 3
	sonraki = 8.0 + randf() * 12.0

func _derin(p: Vector2) -> bool:
	for dy in range(-2, 3):
		for dx in range(-2, 3):
			if oyun.tile_at(p + Vector2(dx, dy) * oyun.T) != 4: return false
	return true

func _sicra() -> void:
	var vs: Vector2 = get_viewport().get_visible_rect().size / oyun.kamera.zoom
	var c0: Vector2 = oyun.kamera.get_screen_center_position() - vs / 2.0
	for k in 30:
		var p := c0 + Vector2(16.0 + randf() * (vs.x - 32.0), 24.0 + randf() * (vs.y - 40.0))
		if not _derin(p): continue
		var dir := -1.0 if randf() < 0.5 else 1.0
		var n := 2 if randf() < 0.3 else 1
		for i in n: L.append({x = p.x - i * dir * 18.0, y = p.y + i * 3.0, dir = dir, t = -i * 0.25, dur = 1.3, len = 42.0})
		return

func _kopuk(p: Vector2) -> void:
	for k in 10: oyun.parca(p, Vector2(randf_range(-15, 15), -15 - randf() * 25), 0.45, Color.WHITE if k % 2 else Color("#bfe6ff"))

func _process(dt: float) -> void:
	if oyun == null or oyun.basta or oyun.ada != 1 or (oyun.magara != null and oyun.magara.icinde):
		if not L.is_empty(): L.clear(); queue_redraw()
		return
	dt = minf(dt, 0.1)
	sonraki -= dt
	if sonraki <= 0.0:
		sonraki = 18.0 + randf() * 30.0
		_sicra()
	for i in range(L.size() - 1, -1, -1):
		var d: Dictionary = L[i]
		var was: float = d.t
		d.t += dt
		if was < 0.0 and d.t >= 0.0: _kopuk(Vector2(d.x - d.dir * d.len / 2.0, d.y))
		if d.t >= d.dur and was < d.dur: _kopuk(Vector2(d.x + d.dir * d.len / 2.0, d.y))
		if d.t > d.dur + 0.3: L.remove_at(i)
	if not L.is_empty() or _ciz_var: queue_redraw()
	_ciz_var = not L.is_empty()

var _ciz_var := false

func _draw() -> void:
	for d in L:
		var k: float = clampf(d.t / d.dur, 0.0, 1.0)
		if k <= 0.0 or k >= 1.0: continue
		var px: float = d.x + d.dir * (k - 0.5) * d.len
		var h := sin(k * PI) * 20.0
		var py: float = d.y - h
		var ang := atan2(-cos(k * PI) * 20.0 * PI / d.dur, d.dir * d.len / d.dur)
		draw_set_transform(Vector2(round(px), round(py)), ang, Vector2(0.65, -0.65 if d.dir < 0 else 0.65))
		draw_texture(tex, Vector2(-round(tex.get_width() / 2.0), -12))
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
		var r := 8.0 * (1.0 - h / 34.0)
		draw_set_transform(Vector2(px, d.y + 2.0), 0.0, Vector2(1.0, 1.5 / maxf(r, 0.1)))
		draw_circle(Vector2.ZERO, r, Color(20 / 255.0, 50 / 255.0, 90 / 255.0, 0.25))
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
