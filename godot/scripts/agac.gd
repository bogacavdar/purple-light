## Bir ağaç: web drawTree gibi; gölge (x+2, y+4) 11×4, resim ayağı (bot) y+6'da; oyuncu arkasındayken yarı saydam.
extends Node2D

var oyun
var spr: Sprite2D
var w := 0
var tur := ""
var kesim := 0
var meyve_cd := 0.0
var sars := 0.0

func kur(tex: Texture2D, bot: int, _seed: int) -> void:
	spr = Sprite2D.new()
	spr.texture = tex
	spr.centered = false
	w = tex.get_width()
	spr.offset = Vector2(-floorf(w / 2.0), 6 - bot)
	add_child(spr)

func _draw() -> void:
	draw_set_transform(Vector2(2, 4), 0, Vector2(11, 4))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.22))

func vurulma() -> void:
	sars = 0.25

func _process(_d: float) -> void:
	meyve_cd = maxf(0.0, meyve_cd - _d)
	if sars > 0.0:
		sars -= _d
		spr.position.x = sin(sars * 60.0) * 1.5 if sars > 0.0 else 0.0
	var p: Vector2 = oyun.oyuncu.position
	var dx := position.x - floorf(w / 2.0)
	var dy := position.y + spr.offset.y
	var see := position.y > p.y and p.x + 5 > dx + 2 and p.x - 5 < dx + w - 2 and p.y > dy + 4 and p.y - 18 < position.y + 2
	spr.modulate.a = 0.42 if see else 1.0
