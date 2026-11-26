extends Node2D
## Doğu geçidindeki kaya yığını ve sıradağ (web rockfall, ROCKS, rockUse, setRidge; belge 99_godot 4c).

const PS := [345, 611, 614]       # web MAPD.ps: [y, x0, x1] (karo)
var oyun
var kapali := false       # ikinci adanın kaya yığını sonra (A5)
var env
var T := 16
var acik := false
var dedi := false
var soyledi := false
var KAYA: Array = []
var x0 := 0
var x1 := 0
var y0 := 0
var y1 := 0
var cx := 0.0
var cy := 0.0

func kur(o) -> void:
	oyun = o
	env = o.env
	T = o.T
	if o.ada == 2:
		kapali = true
		set_process(false)
		return
	y0 = PS[0] - 1; y1 = PS[0] + 1; x0 = PS[1]; x1 = PS[2]
	cx = (x0 + x1 + 1) / 2.0 * T; cy = (PS[0] + 0.5) * T
	var h = [9]
	var r = func() -> float:
		h[0] = (int(h[0]) * 16807) % 2147483647
		return float(h[0]) / 2147483647.0
	for i in 18:
		KAYA.append({x = x0 * T + r.call() * ((x1 - x0 + 1) * T), y = y0 * T + 4 + r.call() * ((y1 - y0 + 1) * T - 6), s = 5 + int(floor(r.call() * 7)), c = r.call()})
	KAYA.sort_custom(func(a, b): return a.y < b.y)
	z_index = 0

## web inRockfall: yığın kalkana kadar geçilmez
func engel(p: Vector2) -> bool:
	if kapali: return false
	return not acik and p.x >= x0 * T - 2 and p.x < (x1 + 1) * T + 2 and p.y >= y0 * T - 2 and p.y < (y1 + 1) * T + 2

func _kazma() -> int:
	var en = 0
	for n in env.inv:
		if env.adet(n) > 0 and env.G.tools.has(n) and env.G.tools[n].kind == "pick": en = maxi(en, int(env.G.tools[n].tier))
	return en

func satir(ok: bool) -> String:
	if ok: return "✓ Geçit açıldı"
	return "Kaya patlatıcı %d/2 · kazma %s" % [mini(env.adet("Kaya patlatıcı"), 2), "✓" if _kazma() >= 4 else "(kuvars ya da çelik)"]

func f() -> bool:
	if kapali: return false
	if acik or oyun.oyuncu.position.distance_to(Vector2(x0 * T - 10, cy)) > 38.0: return false
	var k = env.adet("Kaya patlatıcı")
	if oyun.gorev.aktif == null or str(oyun.gorev.aktif.id) != "E3":
		if k >= 2 and not dedi:
			dedi = true
			oyun.balon("Bu kayaları nasıl açarım ki? Kemal bir şey bilir.", 3.5)
		else:
			env.mesaj("Geçidi kapatan dev bir kaya yığını. Kemal bunu bilir mi acaba?", true)
		return true
	if k < 2 or _kazma() < 4:
		env.mesaj("Geçidi kapatan kaya yığını. Açmak için %s2 kaya patlatıcı gerekli (sende %d). Patlatıcıyı Kemal anlatır: yarasa gübresi, turba, tuz ve bir çömlek." % ["bir kuvars ya da çelik kazma (ya da daha iyisi) ve " if _kazma() < 4 else "", k], true)
		return true
	oyun.konusma.ac("", null, "[b]Kaya yığını[/b]\n2 kaya patlatıcı harcanacak. Kayalar patlatılsın mı?", [{t = "Patlat", f = _patlat}, {t = "Vazgeç", pri = true, kapat = true}])
	return true

func _patlat() -> void:
	oyun.balon("Kulaklarımı tıkasam iyi olur…", 1.4)
	await get_tree().create_timer(1.3).timeout
	if acik or env.adet("Kaya patlatıcı") < 2: return
	env.eksilt("Kaya patlatıcı", 2)
	for i in 70:
		var a = randf() * TAU
		var s = 40.0 + randf() * 120.0
		oyun.parca(Vector2(cx + randf_range(-30, 30), cy), Vector2(cos(a) * s, sin(a) * s - 60), 0.6 + randf() * 0.8, Color("#8a8278") if i % 3 else (Color("#ffb040") if i % 2 else Color.WHITE))
	await get_tree().create_timer(0.35).timeout
	_ac(true)
	env.mesaj("Sıradağ çöktü · Sınır kalktı: Kül Diyarı ve Mor Kristal Vadisi · Ölümcül")
	oyun.gorev.yenile()
	await get_tree().create_timer(0.9).timeout
	oyun.balon("Vay be!", 2.4)

## web setRidge: dağ karoları çevresinin zeminine döner
func _ac(fx: bool) -> void:
	if acik: return
	acik = true
	var tm: TileMapLayer = oyun.zemin_katman
	var w: int = oyun.bw
	var BR := [Color("#7fb04a"), Color("#3f7a3a"), Color("#6b7440"), Color("#8a8580"), Color("#5a3a36"), Color("#7a5aa8")]
	var img: Image = oyun.kh_resim.texture.get_image() if oyun.kh_resim != null else null
	for i in oyun.tiles.size():
		if oyun.tiles[i] != 5: continue
		oyun.tiles[i] = 0
		if img != null: img.set_pixel(i % w, i / w, BR[mini(int(oyun.bio_arr[i]), 5)])
		var x = i % w
		var y = i / w
		var kom = -1
		for d in [Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1), Vector2i(0, 1), Vector2i(-2, 0), Vector2i(2, 0), Vector2i(0, -2), Vector2i(0, 2)]:
			var j: int = (y + d.y) * w + (x + d.x)
			if j >= 0 and j < oyun.tiles.size() and oyun.tiles[j] <= 1 and (int(oyun.tvar[j]) >> 3) != 13:
				kom = j
				break
		if kom >= 0:
			oyun.tvar[i] = oyun.tvar[kom]
			var src = tm.get_cell_source_id(Vector2i(oyun.bx0 + kom % w, oyun.by0 + kom / w))
			var ac = tm.get_cell_atlas_coords(Vector2i(oyun.bx0 + kom % w, oyun.by0 + kom / w))
			if src > 0:
				var n: int = int(sqrt(float(tm.tile_set.get_source(src).get_tiles_count())))
				ac = Vector2i((oyun.bx0 + x) % n, (oyun.by0 + y) % n)
			tm.set_cell(Vector2i(oyun.bx0 + x, oyun.by0 + y), src, ac)
		if fx and absf(x * T + 8 - oyun.oyuncu.position.x) < 420 and absf(y * T + 8 - oyun.oyuncu.position.y) < 300 and randi() % 3 == 0:
			for k in 3: oyun.parca(Vector2(x * T + 8, y * T + 8), Vector2(randf_range(-30, 30), -30 - randf() * 60), 0.7 + randf() * 0.9, Color("#8a8278") if k % 2 else Color("#c8c0b0"))
	if img != null and oyun.kh_resim.texture is ImageTexture: oyun.kh_resim.texture.update(img)
	queue_redraw()

func _process(_dt: float) -> void:
	if not acik and not soyledi and oyun.oyuncu.position.distance_to(Vector2(cx, cy)) < 120.0:
		soyledi = true
		oyun.balon("Yol kayalarla kapanmış…", 3.0)

func _r(x: float, y: float, w: float, h: float, c: Color) -> void:
	draw_rect(Rect2(roundf(x), roundf(y), w, h), c)

func _draw() -> void:
	if not acik:
		for r in KAYA:
			var x: float = roundf(r.x); var y: float = roundf(r.y); var s: float = r.s
			var c = Color("#7a7268") if r.c < 0.5 else Color("#8a8278")
			draw_set_transform(Vector2(x, y + s * 0.4), 0, Vector2(s, s * 0.35))
			draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.25))
			draw_set_transform(Vector2.ZERO)
			_r(x - s, y - s, s * 2, s * 1.4, c); _r(x - s + 1, y - s - 1, s * 2 - 2, 1, c.lightened(0.2)); _r(x - s, y - s, 2, s, c.lightened(0.15)); _r(x + s - 2, y - s + 1, 2, s, c.darkened(0.25)); _r(x - s, y + s * 0.4 - 1, s * 2, 1, c.darkened(0.35))
	else:
		for i in mini(7, KAYA.size()):
			var r: Dictionary = KAYA[i]
			_r(r.x - 2, r.y - 1, 4, 3, Color("#7a7268")); _r(r.x - 2, r.y - 1, 4, 1, Color("#9a9288"))

func kayit() -> bool:
	return acik

func yukle(d) -> void:
	if kapali: return
	soyledi = false
	dedi = false
	if bool(d): _ac(false)
	queue_redraw()
