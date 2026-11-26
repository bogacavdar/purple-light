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

var tur_k := ""        # mağara canlıları: "w" önden yarasa, "t" üstten kertenkele/örümcek (web v436cayir)
var boss := false
var cvb := false        # mağaranın boss'u (yan görev çağırır)
var sersem := 0.0       # savuşturulunca sersemler (web a.stun)
var renk := "n"         # saldırının rengi: n beyaz, y sarı (×1,4), r kırmızı (×1,7, savuşturulamaz)
var ders := false       # Börü'nün ders kereviti: dersi ders.gd yürütür, hasar almaz
var ders_yuru := false
var ogr := false        # öğreticide Börü'nün yumruk kereviti: saldırmaz, kaçmaz
const MUL := {"n": 1.0, "y": 1.4, "r": 1.7}
const RENK := {"n": Color("#ffffff"), "y": Color("#ffd028"), "r": Color("#ff3a2a")}
const AGIR := ["Timsah", "Yaban öküzü", "Kara ejder", "Mağara ayısı", "Hurda devi", "Büyük golem", "Lav golemi", "Kızıl ejder", "Gölge muhafız", "Gök bekçisi", "Kristal golem", "Kristal golemcik", "Devriye robotu", "Yavru ejder", "Bataklık kurdu", "Kül kurdu", "Gölge kurdu", "Kristal geyik"]

## web v110 roll: saldırının rengi
func _zar() -> String:
	if D.get("ranged", false): return "n"
	var r := randf()
	if ders: return "y" if r < 0.25 else "n"
	if boss: return "r" if r < 0.3 else ("y" if r < 0.65 else "n")
	if AGIR.has(tur) or float(D.hp) >= 300.0: return "r" if r < 0.2 else ("y" if r < 0.5 else "n")
	if float(D.dmg) >= 8.0 and float(D.hp) >= 35.0: return "y" if r < 0.3 else "n"
	return "n"

## savuşturuldu: sersemler, geri savrulur (web parried)
func savusturuldu(yon: Vector2) -> void:
	sersem = 1.1 if boss else 1.6
	wind = 0.0
	lunge = {}
	flash = 0.15
	mad = true
	if not ders:
		kb = {v = yon * (90.0 if boss else 170.0), t = 0.16}

func _ready() -> void:
	hp = float(D.hp)
	tur_k = str(D.get("kind", ""))
	boss = bool(D.get("boss", false))
	spr = Sprite2D.new()
	spr.texture = load(D.file)
	spr.hframes = int(D.frames)
	if tur_k != "":
		spr.vframes = 3
	spr.centered = false
	spr.offset = Vector2(-float(D.ox), -float(D.oy))
	mat = ShaderMaterial.new()
	mat.shader = oyun.parlama_shader
	spr.material = mat
	add_child(spr)

func _draw() -> void:
	if boss and olu < 0.0:
		var pp := 0.5 + 0.5 * sin(Time.get_ticks_msec() / 250.0 + position.x)
		for r in [16.0, 11.0, 6.0]:
			draw_circle(Vector2(0, -8), r, Color(0.7, 0.29, 1.0, (0.1 + 0.06 * pp) * (1.0 - r / 20.0)))
	if olu >= 0.0:
		return
	var sh := float(D.shadow)
	draw_set_transform(Vector2(0, 1.5), 0, Vector2(sh * 0.5, maxf(1.5, sh * 0.12)))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.22))
	draw_set_transform(Vector2.ZERO)
	var top := -float(D.top)
	if sersem > 0.0:
		# sersem: başının üstünde dönen yıldızlar
		var tm := Time.get_ticks_msec() / 1000.0
		for i in 3:
			var a := tm * 5.0 + i * 2.094
			var c := Color("#ffe070") if i % 2 else Color("#fff8c8")
			draw_rect(Rect2(cos(a) * 7.0 - 1.0, top - 6.0 + sin(a) * 2.5 - 1.0, 3, 3), c)
			draw_rect(Rect2(cos(a) * 7.0, top - 6.0 + sin(a) * 2.5, 1, 1), Color.WHITE)
	elif wind > 0.0:
		# ünlem: saldırı geliyor; rengi darbenin rengi (beyaz, sarı savuşturulur; kırmızı savuşturulamaz)
		var hg := top - 10.0
		var c: Color = RENK[renk]
		var nn := 2 if renk == "r" else 1
		for i in nn:
			var ox := (3.0 if i else -3.0) if nn > 1 else 0.0
			draw_rect(Rect2(-2 + ox, hg - 1, 5, 9), Color("#11170f"))
			draw_rect(Rect2(-1 + ox, hg, 3, 5), c)
			draw_rect(Rect2(-1 + ox, hg + 6, 3, 2), c)
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
	var land: Array = D.get("landTiles", [0.0, 1.0, 2.0])
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
		olu += dt
		if tur_k != "":
			# mağara canlıları yuvarlanmaz: yarasa gölgesinin üstüne süzülür, kertenkele ve örümcek durduğu gibi yatar, gözleri söner
			_kare(dt, false)
			modulate.a = clampf(3.0 - olu * 1.2, 0.0, 1.0)
			if olu > 2.5:
				queue_free()
			return
		# ölünce yana devrilir ve söner
		rotation = minf(1.0, olu / 0.25) * PI / 2 * face
		modulate.a = clampf(1.6 - olu * 1.6, 0.0, 1.0)
		if olu > 1.0:
			queue_free()
		return
	if ders:
		_gorun(ders_yuru)
		sersem = maxf(0.0, sersem - dt)
		flash -= dt
		return
	if sersem > 0.0:
		sersem -= dt
		wind = 0.0; lunge = {}; atk = maxf(atk, 0.4)
		flash -= dt
		if not kb.is_empty():
			kb.t -= dt
			_git(kb.v, dt)
			if kb.t <= 0: kb = {}
		_gorun(false)
		return
	var P: Node2D = oyun.oyuncu
	var dv: Vector2 = P.position - position
	var d := maxf(dv.length(), 1.0)
	var aggro := float(D.aggro)
	var saldirgan: bool = (D.temper == "saldırgan" or (D.temper == "nötr" and mad)) and not ogr
	if D.temper == "nötr" and mad and d > 200.0:
		mad = false
	if saldirgan and not mad and d < aggro and not P.bayildi and not P.kilit:
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
		if D.temper == "saldırgan" and mad and not boss and (d > aggro * 2.0 or P.bayildi or P.kilit) and lunge.is_empty() and wind <= 0.0:
			mad = false
		if boss and (P.bayildi or P.kilit): mad = false
		var angry: bool = saldirgan and (mad or d < aggro) and not P.bayildi and not P.kilit
		if D.temper == "zararsız" and (d < 70.0 or mad):
			st = "flee"
			_git(-dv / d * float(D.spd), dt)
			moving = true
			mad = d <= 200.0
		elif angry:
			st = "chase"
			var R = D.get("ranged", null)
			if R != null:
				# web ranged: menzilin %80'inden uzaksa yaklaşır, %40'ından yakınsa geri çekilir; menzildeyken 0,6 sn hazırlanıp atar
				if wind > 0.0:
					wind -= dt
					if wind <= 0.0: oyun.atis.at(self)
				else:
					var rg := float(R.range)
					if d > rg * 0.8:
						_git(dv / d * float(D.spd), dt); moving = true
					elif d < rg * 0.4:
						_git(-dv / d * float(D.spd) * 0.8, dt); moving = true
					if d < rg and atk <= 0.0:
						wind = 0.6
						atk = float(R.cd)
						renk = "n"
						hedef = P.position + Vector2(0, -4)
						face = 1 if dv.x > 0 else -1
			elif not lunge.is_empty():
				lunge.t -= dt
				_git(lunge.v, dt)
				moving = true
				if P.position.distance_to(position) < float(D.r) + 9.0:
					if not lunge.hit:
						lunge.hit = true
						P.isirildi(int(round(float(D.dmg) * float(MUL[renk]))), position, self, renk)
						if D.get("fx", null) != null and P.hp > 0.0 and P.dokunulmaz > 0.5: P.etki_ekle(str(D.fx[0]), float(D.fx[1]), float(D.fx[2]))
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
					oyun.yazi(position + Vector2(0, -float(D.r) - 14.0), "!", RENK[renk] if renk != "n" else Color("#ff3b30"), 14)
			else:
				var cs: float = float(D.cs) if D.cs != null else float(D.spd)
				if d > maxf(14.0, float(D.r) + 10.0):
					_git(dv / d * cs, dt)
					moving = true
				if d < float(D.reach) and atk <= 0.0:
					wind = 0.1
					renk = _zar()
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
	_gorun(moving)

func _gorun(moving: bool) -> void:
	if tur_k != "":
		_kare(0.0, moving)
		mat.set_shader_parameter("flash", 1.0 if flash > 0.0 else 0.0)
		queue_redraw()
		return
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

## web v436cayir: yarasa kanadını üç kareyle çırpar (yukarı, düz, aşağı), leşi 6. kare; kertenkele/örümcek iki adım, leşi 'd' satırı;
## kovalarken gözler kırmızı ('r' satırı)
func _kare(_dt: float, moving: bool) -> void:
	var fw := float(D.fw); var fh := float(D.fh)
	var tm := Time.get_ticks_msec() / 1000.0
	var row := 0
	var fr := 0
	var top := 0.0
	var kovala: bool = (st == "chase" or mad) and olu < 0.0
	if tur_k == "w":
		var ph := sin(tm * 14.0 + position.x * 0.37)
		if olu >= 0.0:
			fr = 6
			top = -fh + 4.0 - (1.0 - minf(1.0, olu / 0.4)) * 12.0
		else:
			fr = 1 if ph > 0.45 else (3 if ph < -0.45 else 2)
			top = -fh - (6.0 if fh > 40.0 else 8.0) + sin(tm * 3.0 + position.x * 0.1) * 2.0
			row = 1 if kovala else 0
	else:
		var l := sin(step * (10.0 if st == "wander" else 18.0)) if moving else 0.0
		if olu >= 0.0:
			fr = 0; row = 2
		else:
			fr = 2 if l > 0.0 else 1
			row = 1 if kovala else 0
		top = -fh * 0.72
	spr.frame = row * int(D.frames) + fr
	spr.flip_h = face < 0
	spr.offset = Vector2(-floorf(fw / 2.0), roundf(top))

func vuruldu(dm: int, yon: Vector2) -> void:
	if olu >= 0.0:
		return
	if ders:
		flash = 0.15
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
		# web killAnimal: düşenler ve XP
		for dr in D.get("drops", []):
			if randf() < float(dr.p):
				oyun.toplama.dusur(str(dr.n), position, randi_range(int(dr.min), int(dr.max)))
		if int(D.get("xp", 0)) > 0:
			oyun.env.xp_ekle(int(D.xp))
		oyun.canli_oldu(tur, self)
