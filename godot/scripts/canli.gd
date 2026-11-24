## Bir canlı: web tickAnimals / drawAnimal (ART yolu). Tavşan (zararsız) yaklaşınca kaçar; Kurt (saldırgan) görünce kovalar,
## önünde durur, "!" ile atılır ve ısırır. Resim v436cayir'den: kare 0 duruş, 1–4 yürüyüş, 5 hamle; sağa bakar, sola giderken aynalanır.
extends Node2D

var oyun
var tur := ""
var D: Dictionary
var spr: Sprite2D
var mat: ShaderMaterial

var hp := 1.0
var st := "wander"
var t := 0.0
var dir := Vector2.ZERO
var step := 0.0
var face := 1
var mad := false
var flash := 0.0
var atk := 0.0
var wind := 0.0
var lunge := {}
var kb := {}
var hedef := Vector2.ZERO
var olu := -1.0

func _ready() -> void:
	hp = float(D.hp)
	spr = Sprite2D.new()
	spr.texture = load(D.file)
	spr.hframes = int(D.frames)
	spr.centered = false
	spr.offset = Vector2(-float(D.ox), -float(D.oy))
	mat = ShaderMaterial.new()
	mat.shader = oyun.parlama_shader
	spr.material = mat
	add_child(spr)

func _draw() -> void:
	if olu >= 0.0:
		return
	var sh := float(D.shadow)
	draw_set_transform(Vector2(0, 1.5), 0, Vector2(sh * 0.5, maxf(1.5, sh * 0.12)))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.22))
	draw_set_transform(Vector2.ZERO)
	var top := -float(D.top)
	if wind > 0.0:
		# kırmızı ünlem: saldırı geliyor
		var hg := top - 10.0
		draw_rect(Rect2(-2, hg - 1, 5, 9), Color("#11170f"))
		draw_rect(Rect2(-1, hg, 3, 5), Color("#ff3a2a"))
		draw_rect(Rect2(-1, hg + 6, 3, 2), Color("#ff3a2a"))
	elif mad and D.temper != "zararsız":
		var b := roundf(sin(Time.get_ticks_msec() / 125.0))
		draw_rect(Rect2(-1, top - 9 + b, 2, 5), Color("#ff4a2a"))
		draw_rect(Rect2(-1, top - 3 + b, 2, 1), Color("#ff4a2a"))
	if hp < float(D.hp):
		# web hpBar: boş kısmı görünen can çubuğu
		var w := roundf(maxf(14.0, minf(32.0, float(D.fw) * 0.7)))
		var k := clampf(hp / float(D.hp), 0.0, 1.0)
		var x := roundf(-w / 2.0)
		var y := roundf(top - 5.0)
		draw_rect(Rect2(x - 1, y - 1, w + 2, 4), Color("#0b0f0a"))
		draw_rect(Rect2(x, y, w, 2), Color("#5a2a26"))
		var f := roundf(w * k)
		if f > 0:
			draw_rect(Rect2(x, y, f, 2), Color("#8fd46b") if k > 0.5 else (Color("#f2b84b") if k > 0.25 else Color("#e8775a")))

func _git(v: Vector2, dt: float) -> void:
	var land: Array = D.landTiles
	var nx := position + Vector2(v.x * dt, 0)
	if not oyun.engel(nx, 5.0) and land.has(float(oyun.tile_at(nx))):
		position.x = nx.x
	else:
		t = 0.0
	var ny := position + Vector2(0, v.y * dt)
	if not oyun.engel(ny, 5.0) and land.has(float(oyun.tile_at(ny))):
		position.y = ny.y
	else:
		t = 0.0
	if v.x != 0.0:
		face = 1 if v.x > 0 else -1

func _process(dt: float) -> void:
	if olu >= 0.0:
		# ölünce yana devrilir ve söner
		olu += dt
		rotation = minf(1.0, olu / 0.25) * PI / 2 * face
		modulate.a = clampf(1.6 - olu * 1.6, 0.0, 1.0)
		if olu > 1.0:
			queue_free()
		return
	var P: Node2D = oyun.oyuncu
	var dv: Vector2 = P.position - position
	var d := maxf(dv.length(), 1.0)
	var aggro := float(D.aggro)
	var saldirgan: bool = D.temper == "saldırgan"
	if saldirgan and not mad and d < aggro and not P.bayildi:
		mad = true
	flash -= dt
	atk -= dt
	step += dt
	var moving := false
	if not kb.is_empty():
		kb.t -= dt
		_git(kb.v, dt)
		if kb.t <= 0:
			kb = {}
	else:
		if saldirgan and mad and (d > aggro * 2.0 or P.bayildi) and lunge.is_empty() and wind <= 0.0:
			mad = false
		var angry: bool = saldirgan and (mad or d < aggro) and not P.bayildi
		if D.temper == "zararsız" and (d < 70.0 or mad):
			st = "flee"
			_git(-dv / d * float(D.spd), dt)
			moving = true
			mad = d <= 200.0
		elif angry:
			st = "chase"
			if not lunge.is_empty():
				lunge.t -= dt
				_git(lunge.v, dt)
				moving = true
				if P.position.distance_to(position) < float(D.r) + 9.0:
					if not lunge.hit:
						lunge.hit = true
						P.isirildi(int(D.dmg), position)
					lunge = {}
				elif lunge.t <= 0:
					lunge = {}
			elif wind > 0.0:
				wind -= dt
				if wind <= 0.0:
					# atılma oyuncunun şimdi durduğu yere gider, sonra çizgisini korur
					hedef = P.position
					var e := hedef - position
					var el := maxf(e.length(), 1.0)
					var sp := minf(300.0, (el + 12.0) / 0.3)
					lunge = {v = e / el * sp, t = 0.3, hit = false}
					oyun.yazi(position + Vector2(0, -float(D.r) - 14.0), "!", Color("#ff3b30"), 14)
			else:
				var cs: float = float(D.cs) if D.cs != null else float(D.spd)
				if d > maxf(14.0, float(D.r) + 10.0):
					_git(dv / d * cs, dt)
					moving = true
				if d < float(D.reach) and atk <= 0.0:
					wind = 0.1
					atk = float(D.wind) + 0.9
					face = 1 if dv.x > 0 else -1
		else:
			st = "wander"
			t -= dt
			if t <= 0.0:
				t = 1.5 + randf() * 2.5
				var an := randf() * TAU
				dir = Vector2(cos(an), sin(an)) if randf() < 0.6 else Vector2.ZERO
			if dir != Vector2.ZERO:
				_git(dir * float(D.spd) * 0.3, dt)
				moving = true
	# kare seçimi: hamlede 5, yürürken 1–4, dururken 0
	var fr := 0
	if wind > 0.0 or not lunge.is_empty():
		fr = 5
	elif moving:
		var hz := 10.0 if st == "wander" else 18.0
		fr = 1 + (int(floor(step * hz / PI)) % 4)
	spr.frame = mini(fr, int(D.frames) - 1)
	spr.flip_h = face < 0
	spr.offset.x = (-float(D.ox)) if face > 0 else (float(D.ox) - float(D.fw))
	mat.set_shader_parameter("flash", 1.0 if flash > 0.0 else 0.0)
	queue_redraw()

func vuruldu(dm: int, yon: Vector2) -> void:
	if olu >= 0.0:
		return
	hp -= dm
	flash = 0.15
	mad = true
	kb = {v = yon * 140.0, t = 0.12}
	lunge = {}
	oyun.yazi(position + Vector2(0, -12), "-%d" % dm, Color.WHITE, 9)
	if hp <= 0.0:
		hp = 0.0
		olu = 0.0
		for k in 14:
			oyun.parca(position + Vector2(0, -4), Vector2(randf_range(-30, 30), -20 - randf() * 40), 0.6, Color("#c84a3a") if k % 2 else Color("#e8e0c8"))
		oyun.yazi(position + Vector2(0, -26), tur + " avlandı", Color("#fff2b0"), 9)
		oyun.canli_oldu(tur)
