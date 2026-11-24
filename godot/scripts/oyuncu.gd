## Oyuncu: web frameBody'deki yürüme, koşu, atılma ve attack() vuruşu; resim v428kahraman'dan (8 yön × duruş + 4 adım).
extends Node2D

var oyun
var V: Dictionary  # data/oyuncu.json
var spr: Sprite2D
var kavis: Node2D  # vuruş kavisi (web drawSwing)

const YONLER := ["S", "SE", "E", "NE", "N", "NW", "W", "SW"]
var yon := 0              # satır: 0 S … 7 SW
var bakis := Vector2(0, 1)  # vuruşun ve atılmanın yönü (8 yön)
var adim := 0.0           # web player.step
var yuruyor := false
var kosu_kol := false     # L3 ile açılan koşu (çubuk bırakılınca kapanır)

var hp := 100.0
var hp_max := 100.0
var atk_cd := 0.0
var bekleyen_vurus := -1.0  # vuruş tamponu: bekleme bitince son basılan yöne vurulur (en çok 0,8 sn)
var bekleyen_yon := Vector2.ZERO
var savrulus := -1.0        # kavisin ilerlemesi (0..0,16 sn)
var savrulus_yon := Vector2(0, 1)
var savrulus_r := 16.0
var dokunulmaz := 0.0       # web pInv
var atilma := 0.0
var atilma_v := Vector2.ZERO
var atilma_cd := 0.0
var kirmizi := 0.0
var bayildi := false
var kilit := false          # görev sahnesi sürerken kontrol oyuncuda değil
var oto := Vector2.ZERO      # sahnede karakterin kendi yürüyüşü

func _ready() -> void:
	V = oyun.oyuncu_veri
	hp_max = float(V.hp)
	hp = hp_max
	spr = Sprite2D.new()
	spr.texture = load("res://art/kahraman.png")
	spr.hframes = 5
	spr.vframes = 8
	spr.centered = false
	# web heroAt: hücre (x - CW/2, y + 5 - CH) noktasına çizilir
	spr.offset = Vector2(-float(V.heroCell.w) / 2.0, 5.0 - float(V.heroCell.h))
	add_child(spr)
	kavis = Node2D.new()
	kavis.z_index = 5
	kavis.draw.connect(_kavis_ciz)
	add_child(kavis)

func silah_v() -> Dictionary:
	return V.sword if oyun.env and oyun.env.elde() == "Taş kılıç" else V.fist

func _silah_yaz() -> void:
	var w := silah_v()
	var h: String = oyun.env.elde() if oyun.env else ""
	oyun.silah_yazi.text = "Elinde: " + (h if h != "" else "boş el") + "  (vuruş %d · menzil %d)" % [int(w.dmg), int(w.reach)]

func _draw() -> void:
	draw_set_transform(Vector2(0, 2), 0, Vector2(7, 2.5))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.28))

func _unhandled_input(e: InputEvent) -> void:
	# sol tık her zaman tıklanan yöne vurur (çaprazlar dahil)
	if kilit:
		return
	if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
		var d: Vector2 = get_global_mouse_position() - (position + Vector2(0, -6))
		vur(d.normalized() if d.length() > 0.5 else bakis)

func _process(dt: float) -> void:
	if bayildi:
		return
	atk_cd -= dt
	dokunulmaz -= dt
	atilma_cd -= dt
	kirmizi = maxf(0.0, kirmizi - dt)
	var g := Input.get_vector("sol", "sag", "yukari", "asagi", 0.3)
	if kilit:
		g = oto
	if Input.is_action_just_pressed("kos_kol"):
		kosu_kol = not kosu_kol
	if g == Vector2.ZERO:
		kosu_kol = false
	_silah_yaz()
	if Input.is_action_just_pressed("vur") and not kilit:
		vur(bakis)
	if Input.is_action_just_pressed("atil") and not kilit:
		_atil(g)
	if bekleyen_vurus > 0.0:
		bekleyen_vurus -= dt
		if atk_cd <= 0.0:
			bekleyen_vurus = -1.0
			vur(bekleyen_yon)
	if atilma > 0.0:
		# atılma: 0,24 sn hep aynı mesafe; içindeyken hiçbir şey dokunmaz
		atilma -= dt
		_kay(atilma_v * dt)
		if randf() < 0.8:
			oyun.parca(position + Vector2(0, -6), -atilma_v * 0.1 + Vector2(0, -4), 0.3, Color(1, 1, 1, 0.7))
		g = Vector2.ZERO
	yuruyor = g != Vector2.ZERO
	if yuruyor:
		var n := g.normalized()
		var kos := Input.is_action_pressed("kos") or kosu_kol
		var sp: float = float(V.speed) * minf(1.0, g.length() * 1.15) * (float(V.runMult) if kos else 1.0)
		_kay(n * sp * dt)
		_yon_sec(n)
		adim += dt * (1.7 if kos else 1.0)
		if kos and randf() < dt * 14.0:
			var c := Color("#e8d4a0") if oyun.tile_at(position) == 2 else Color("#c8d8a8")
			oyun.parca(position + Vector2(-n.x * 5 + randf_range(-2, 2), 1), Vector2(-n.x * 14, -10 - randf() * 8), 0.35, c)
	# kare: duruş 0; yürürken adımın evresine göre 1–4 (web: ph = step*10 mod 2π)
	var fr := 0
	if yuruyor:
		var ph := fposmod(adim * 10.0, TAU)
		fr = 1 + mini(3, int(floor(ph / (PI / 2.0))))
	spr.frame = yon * 5 + fr
	var a := 0.55 if atilma > 0.0 else 1.0
	spr.modulate = Color(1, 1 - kirmizi * 2.5, 1 - kirmizi * 2.5, a)
	if savrulus >= 0.0:
		savrulus += dt
		if savrulus > 0.16:
			savrulus = -1.0
		kavis.queue_redraw()

## web: x ve y ayrı ayrı denenir, engel varsa o eksende durur
func _kay(d: Vector2) -> void:
	var h: float = float(V.halfBox)
	if not oyun.engel(Vector2(position.x + d.x, position.y), h):
		position.x += d.x
	if not oyun.engel(Vector2(position.x, position.y + d.y), h):
		position.y += d.y

## 8 yön: çapraz tutulurken çapraz poz; bir eksen açıkça baskın olunca düz poz
func _yon_sec(n: Vector2) -> void:
	var ang := atan2(n.y, n.x)  # 0 = sağ (E), +y aşağı
	var k := int(round(ang / (PI / 4.0)))  # -4..4
	var tablo := {0: 2, 1: 1, 2: 0, 3: 7, 4: 6, -4: 6, -3: 5, -2: 4, -1: 3}
	yon = tablo[k]
	bakis = Vector2(cos(k * PI / 4.0), sin(k * PI / 4.0))

func _atil(g: Vector2) -> void:
	if atilma > 0.0 or atilma_cd > 0.0:
		return
	var d := g.normalized() if g != Vector2.ZERO else bakis
	atilma = float(V.dodge.t)
	atilma_v = d * float(V.dodge.speed)
	atilma_cd = float(V.dodge.cd)

func vur(d: Vector2) -> void:
	if bayildi or atilma > 0.0:
		return
	var w := silah_v()
	if atk_cd > 0.0:
		bekleyen_vurus = 0.8
		bekleyen_yon = d
		return
	atk_cd = float(w.cd)
	if d != Vector2.ZERO:
		_yon_sec(d)
	var f := bakis
	savrulus = 0.0
	savrulus_yon = f
	savrulus_r = float(w.reach) * 0.8
	kavis.queue_redraw()
	var dm := int(w.dmg)
	var gogus := position + Vector2(0, -6)
	for a in oyun.canlilari_ver():
		var ar: float = float(a.D.r)
		var dv: Vector2 = (a.position + Vector2(0, -minf(8.0, ar))) - gogus
		var dist := dv.length()
		if dist > float(w.reach) + ar + 3.0:
			continue
		# geniş koni: vuruşun değdiği her şey vurulur, çaprazlar dahil
		if dist > ar + 6.0 and dv.dot(f) / maxf(dist, 0.001) < -0.1:
			continue
		a.vuruldu(dm, dv / maxf(dist, 1.0))
		if int(w.dmg) > 4:
			break

func _kavis_ciz() -> void:
	if savrulus < 0.0:
		return
	var k := savrulus / 0.16
	var ang := atan2(savrulus_yon.y, savrulus_yon.x)
	kavis.draw_arc(Vector2(0, -6), savrulus_r, ang - 1.1 + k * 1.4, ang - 0.3 + k * 1.4, 8, Color(1, 1, 1, 1.0 - k), 1.0)

## web biteHit: atılırken ya da az önce ısırıldıysa dokunmaz; ısırık oyuncuyu 10 px iter
func isirildi(dmg: int, from: Vector2) -> void:
	if atilma > 0.0 or dokunulmaz > 0.0 or bayildi:
		return
	dokunulmaz = 0.7
	hp = maxf(0.0, hp - dmg)
	kirmizi = 0.25
	oyun.yazi(position + Vector2(0, -24), "-%d" % dmg, Color("#ff6a5a"), 9)
	oyun.can_guncelle(hp, hp_max)
	var it := (position - from).normalized() * 10.0
	_kay(it)
	if hp <= 0.0:
		_bayil()

func _bayil() -> void:
	oyun.bayil("")

## sahnede karakter konuştuğu kişiye döner
func bak(d: Vector2) -> void:
	if d.length() > 0.1:
		_yon_sec(d.normalized())
		bakis = d.normalized()
