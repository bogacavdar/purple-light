## Bir kişi (web: npc, witch, smith…): ComfyUI çizimi; oyuncu yakındayken ona döner (yarım yandan, sağa bakınca aynalanır).
extends Node2D

var oyun
var K: Dictionary     # toplama.json → kisiler[i]
var spr: Sprite2D
var ad_yazi: Label
var t := 0.0
var isaret := false

func kur(o, k: Dictionary) -> void:
	oyun = o
	K = k
	position = Vector2(k.x, k.y)
	spr = Sprite2D.new()
	spr.centered = false
	add_child(spr)
	ad_yazi = Label.new()
	ad_yazi.text = k.ad
	ad_yazi.add_theme_font_size_override("font_size", 7)
	ad_yazi.add_theme_color_override("font_color", Color("#fff2c0"))
	ad_yazi.add_theme_color_override("font_outline_color", Color(0, 0, 0))
	ad_yazi.add_theme_constant_override("outline_size", 3)
	ad_yazi.visible = false
	add_child(ad_yazi)
	_resim("f", false)

func _resim(f: String, ayna: bool) -> void:
	var yol: String = K.resim.get(f, K.resim.f)
	var tx: Texture2D = load(yol)
	spr.texture = tx
	spr.flip_h = ayna
	spr.offset = Vector2(-floorf(tx.get_width() / 2.0), 4 - tx.get_height())
	ad_yazi.position = Vector2(-ad_yazi.size.x / 2.0, 6 - tx.get_height() - 12)

func _draw() -> void:
	if isaret:
		var a := 0.32 + 0.14 * sin(t * 4.0)
		for r in [26.0, 18.0, 10.0]:
			draw_circle(Vector2(0, -10), r, Color(1, 0.86, 0.3, a * (1.0 - r / 30.0)))
	draw_set_transform(Vector2(0, 2), 0, Vector2(7, 2.5))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.25))
	draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)
	if isaret:
		var y: float = -float(spr.texture.get_height()) - 14.0 + round(sin(t * 4.0 + position.x) * 2.0)
		draw_rect(Rect2(-5, y - 2, 11, 14), Color("#1a1408"))
		draw_rect(Rect2(-4, y - 1, 9, 12), Color("#ffd23a"))
		draw_rect(Rect2(-1, y + 1, 3, 6), Color("#111111"))
		draw_rect(Rect2(-1, y + 8, 3, 2), Color("#111111"))

func _process(dt: float) -> void:
	t += dt
	if K.k == "denizci":
		visible = oyun.kuzen.dz_burada()
		if not visible: return
	if K.k == "k_ekin":
		visible = oyun.ciftlik != null and oyun.ciftlik.ekin_gorunur()
		if not visible: return
	var p: Vector2 = oyun.oyuncu.position
	var d := p.distance_to(position)
	ad_yazi.visible = d < 60.0
	if d < 70.0 and absf(p.x - position.x) > 6.0:
		_resim("q", p.x > position.x)
	else:
		_resim("f", false)
	isaret = oyun.gorev != null and oyun.gorev.isaret(oyun.gorev.g_of(K.k))
	queue_redraw()
	spr.position.y = -1.0 if sin(t * 2.3 + position.x) > 0.55 else 0.0
