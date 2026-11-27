extends Node
## Üşüme, buzlanma ve ayak izleri (web v397soguk, v435iz; belge Sistemler › Hava, sıcaklık ve kar › Üşüme, Ayak izleri).
## Kış ve 0° altı: üşüme 0°'de ~3 dk'da dolar, her 6° daha soğukta bir kat hızlı. Yanan meşale yavaşça (~2 dk), ateş ya da ev hızla
## (~20 sn) ısıtır; soğuk değilse ~1 dk'da geçer. 75'ten sonra can düşer (75'te 1/sn, 100'de en yüksek canın %2'si, en az 4).
## Buzlanma ekranın dört köşesinden büyür. Ayak izi: çimen, orman, kum, Bataklık çamuru; karda büyük ve mavimsi; ömür hava ve zemine göre.

var oyun
var cold := 0.0
var told15 := -1
var told75 := false
var _yazi_t := 0.0
var buz: Array = []        # 4 köşe TextureRect
var buz_kat: CanvasLayer
# ayak izleri
const C := 12
const TINT := {"g": Color(30 / 255.0, 42 / 255.0, 18 / 255.0, 0.5), "s": Color(104 / 255.0, 78 / 255.0, 44 / 255.0, 0.62), "m": Color(52 / 255.0, 32 / 255.0, 16 / 255.0, 0.55), "n": Color(96 / 255.0, 118 / 255.0, 150 / 255.0, 0.62)}
var izler: Array = []      # {x, y, d, s, g, a}
var iz_ciz: Node2D
var iz_tex := {}
var ph := -1
var side := 0
var son := Vector2.ZERO

func kur(o) -> void:
	oyun = o
	# buzlanma: dört köşe parçası bir kez çizilir, büyüklüğü ve saydamlığıyla büyür
	buz_kat = CanvasLayer.new()
	buz_kat.layer = 0
	oyun.add_child(buz_kat)
	var t0 := _buz_doku()
	for i in 4:
		var r := TextureRect.new()
		var fx := i % 2 == 1
		var fy := i >= 2
		r.texture = t0
		r.flip_h = fx
		r.flip_v = fy
		r.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		r.stretch_mode = TextureRect.STRETCH_SCALE
		r.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		r.modulate.a = 0.0
		buz_kat.add_child(r)
		buz.append(r)
	# ayak izi resimleri (ComfyUI bot izi; satırlar sol/sağ, sonra karda büyük çift)
	var im: Image = load("res://art/ayakizi.png").get_image()
	for k in TINT:
		var c: Image = im.duplicate()
		var tc: Color = TINT[k]
		for y in c.get_height():
			for x in c.get_width():
				var a := c.get_pixel(x, y).a
				if a > 0.0: c.set_pixel(x, y, Color(tc.r, tc.g, tc.b, tc.a * a))
		iz_tex[k] = ImageTexture.create_from_image(c)
	iz_ciz = Node2D.new()
	iz_ciz.z_index = -7
	iz_ciz.draw.connect(_iz_ciz)
	oyun.add_child(iz_ciz)

func _buz_doku() -> ImageTexture:
	const N := 160
	var im := Image.create(N, N, false, Image.FORMAT_RGBA8)
	var sd := 7
	var G := 12
	var GR: Array = []
	for i in (G + 1) * (G + 1):
		sd = (sd * 16807) % 2147483647
		GR.append(float(sd) / 2147483647.0)
	var C4 := [Color("#f6fcff"), Color("#e2f4ff"), Color("#c4e6fb"), Color("#a2d4f2")]
	for y in N:
		for x in N:
			var fx := float(x) / N * G
			var fy := float(y) / N * G
			var ix := int(fx)
			var iy := int(fy)
			var tx := fx - ix
			var ty := fy - iy
			var sx := tx * tx * (3 - 2 * tx)
			var sy := ty * ty * (3 - 2 * ty)
			var a: float = GR[iy * (G + 1) + ix]
			var b: float = GR[iy * (G + 1) + ix + 1]
			var c2: float = GR[(iy + 1) * (G + 1) + ix]
			var d: float = GR[(iy + 1) * (G + 1) + ix + 1]
			var vn := lerpf(lerpf(a, b, sx), lerpf(c2, d, sx), sy)
			sd = (sd * 16807) % 2147483647
			var v := pow(maxf(0.0, 1.0 - Vector2(x, y).length() / N), 1.6) * 1.35 + (vn - 0.5) * 0.5 + (float(sd) / 2147483647.0 - 0.5) * 0.06
			if v > 0.12:
				var col: Color = C4[0 if v > 0.75 else (1 if v > 0.5 else (2 if v > 0.3 else 3))]
				col.a = minf(0.82, (v - 0.12) * 1.5)
				im.set_pixel(x, y, col)
	# kristal kolları
	var kol := func(f: Callable, x: float, y: float, a: float, ln: float, dep: int) -> void:
		for i in int(ln):
			x += cos(a); y += sin(a)
			var px := Vector2i(roundi(x), roundi(y))
			if px.x >= 0 and px.y >= 0 and px.x < N and px.y < N: im.set_pixel(px.x, px.y, Color(0.91, 0.97, 1.0, 0.9) if dep > 0 else Color(1, 1, 1, 0.9))
			if dep < 2 and i > 4 and i % 7 == 0:
				f.call(f, x, y, a + 0.75, ln * 0.35, dep + 1)
				f.call(f, x, y, a - 0.75, ln * 0.35, dep + 1)
	for k in 9:
		sd = (sd * 16807) % 2147483647
		var r1 := float(sd) / 2147483647.0
		var a := (k + 0.5) / 9.0 * PI / 2.0 + (r1 - 0.5) * 0.12
		kol.call(kol, r1 * 4.0, r1 * 4.0, a, 60.0 + r1 * 40.0, 0)
	return ImageTexture.create_from_image(im)

func _isinma(p: Vector2) -> bool:
	var Z = oyun.zaman
	var R := 64.0
	if p.distance_to(Vector2(float(Z.A.kamp.x) + 16.0, float(Z.A.kamp.y) + 2.0)) < R: return true
	if p.distance_to(Vector2(Z.A.ocak.x, float(Z.A.ocak.y) - 6.0)) < R: return true
	if p.distance_to(Vector2(Z.A.kazan.x, Z.A.kazan.y)) < R: return true
	for f in Z.A.ates:
		if p.distance_to(Vector2(f.x, f.y)) < R: return true
	for o in oyun.yapi.kurulu:
		if str(o.n) == "Kamp ateşi" and Vector2((o.tx + 0.5) * 16.0, (o.ty + 0.5) * 16.0).distance_to(p) < R: return true
	return false

func sifirla() -> void:
	cold = 0.0
	told75 = false

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null or oyun.hava == null: return
	var H = oyun.hava
	var P = oyun.oyuncu
	var acik: bool = H.canli() and not oyun.zaman.durdu() and not P.bayildi and not get_tree().paused
	if acik:
		var T_: float = H.sicaklik()
		var deniz: bool = oyun.kuzen.yol_t >= 0.0
		var dondur: bool = H.mevsim() == 3 and T_ <= 0.0 and not oyun.magara.icinde and not deniz
		var d: float
		if oyun.ev.acik or _isinma(P.position): d = -100.0 / 20.0
		elif not dondur: d = -100.0 / 60.0
		elif oyun.mesale.elde() != null: d = -100.0 / 120.0
		else: d = 100.0 / 180.0 * (1.0 + (-T_) / 6.0)
		var was := cold
		cold = clampf(cold + d * dt, 0.0, 100.0)
		var yil := int((maxi(1, oyun.zaman.gun) - 1) / 28)
		if cold > 15.0 and was <= 15.0 and told15 != yil:
			told15 = yil
			oyun.env.mesaj("Üşüyorsun: elinde yanan bir meşale ya da bir ateşin yanı seni ısıtır.", true)
		if cold > 75.0 and not told75:
			told75 = true
			oyun.env.mesaj("Donuyorsun! Hemen bir ateş bul.", true)
		if cold < 60.0: told75 = false
		if cold > 75.0 and not Hile.tanri:
			var k := (cold - 75.0) / 25.0
			var dps: float = 1.0 + (maxf(4.0, P.hp_max * 0.02) - 1.0) * k
			P.hp -= dps * dt
			oyun.can_guncelle(P.hp, P.hp_max)
			_yazi_t -= dt
			if _yazi_t <= 0.0:
				_yazi_t = 3.0
				oyun.yazi(P.position + Vector2(0, -30), "Donuyorsun!", Color("#bfe6ff"), 9)
			if P.hp <= 0.0:
				P.hp = 0.0
				cold = 0.0
				oyun.bayil("soğuk")
	_buz_boya()
	# ayak izleri
	if not H.canli(): return
	var D := dt if acik else 0.0
	_adim()
	for i in range(izler.size() - 1, -1, -1):
		var p: Dictionary = izler[i]
		p.a += D
		if p.a >= _omur(p.g): izler.remove_at(i)
	iz_ciz.queue_redraw()

func _buz_boya() -> void:
	var v := cold if (oyun.hava.canli()) else 0.0
	var V: Vector2 = buz_kat.get_viewport().get_visible_rect().size
	var S := maxf(V.x, V.y) * 0.42
	var k := 0.22 + 0.78 * v / 100.0
	var o := minf(1.0, v / 20.0) * (0.7 + 0.25 * v / 100.0)
	for i in 4:
		var r: TextureRect = buz[i]
		r.size = Vector2(S, S) * k
		r.position = Vector2(V.x - r.size.x if i % 2 == 1 else 0.0, V.y - r.size.y if i >= 2 else 0.0)
		r.modulate.a = lerpf(r.modulate.a, o, 0.08)
		r.visible = r.modulate.a > 0.01

# ------------------------------------------------------------------ ayak izleri
func _omur(g: String) -> float:
	var H = oyun.hava
	if g == "n" and H.kar >= 0.3: return 60.0 if H.kar_yagiyor() else 90.0
	if H.k == "fırtına" and H.yagiyor(): return 5.0
	if H.yagiyor(): return 8.0
	return 40.0 if g == "m" else (30.0 if g == "s" else 20.0)

func _engel() -> bool:
	return oyun.magara.icinde or oyun.ev.acik or oyun.kuzen.yol_t >= 0.0 or oyun.evcil.binilen != null

func _zemin(p: Vector2) -> String:
	var t: int = oyun.tile_at(p)
	if t >= 3 or oyun.bio_at(p) == 4: return ""
	if oyun.hava.kar >= 0.3: return "n"
	if oyun.camur_mu(p): return "m"
	return "s" if t == 2 else "g"

func _adim() -> void:
	var P = oyun.oyuncu
	var k := int(floor(P.adim * 10.0 / PI))
	if ph < 0:
		ph = k; son = P.position
		return
	if k == ph: return
	ph = k
	var dd: Vector2 = P.position - son
	son = P.position
	if dd.length() < 0.3 or _engel(): return
	var a := atan2(dd.x, -dd.y)
	var yon := (roundi(a / (PI / 4.0)) % 8 + 8) % 8
	side ^= 1
	var n := dd.normalized()
	var ofs := Vector2(-n.y, n.x) * (1.6 if side else -1.6)
	var q: Vector2 = P.position + Vector2(0, 2) + ofs
	var g := _zemin(q)
	if g == "": return
	if izler.size() >= 160: izler.pop_front()
	izler.append({x = q.x, y = q.y, d = yon, s = side, g = g, a = 0.0})

func _iz_ciz() -> void:
	if izler.is_empty() or _engel(): return
	var c: Vector2 = oyun.oyuncu.position
	for p in izler:
		if absf(p.x - c.x) > 600.0 or absf(p.y - c.y) > 400.0: continue
		var L := _omur(p.g)
		var f := clampf((L - p.a) / (L / 3.0), 0.0, 1.0)
		if f <= 0.0: continue
		var row: int = (2 if p.g == "n" else 0) + int(p.s)
		iz_ciz.draw_texture_rect_region(iz_tex[p.g], Rect2(roundf(p.x - C / 2.0), roundf(p.y - C / 2.0), C, C), Rect2(p.d * C, row * C, C, C), Color(1, 1, 1, f))

func kayit() -> int:
	return roundi(cold)

func yukle(v) -> void:
	cold = clampf(float(v), 0.0, 100.0) if v != null else 0.0
	told75 = false
	izler.clear()
	ph = -1
