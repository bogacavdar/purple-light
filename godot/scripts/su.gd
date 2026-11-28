## Su ve kıyı (web drawWater + v425karo kıyı çizgileri), yalnız ekranda görünen karolar için her karede çizilir:
## denizde iki sıra yavaş kabaran ak dalga sırtı, tatlı suda doğuya akan akıntı çizgileri, ara sıra parıltı,
## kumla komşu su karolarında sabit kıyı çizgisi ve nefes alır gibi gelip giden köpük şeridi.
## Godot grafik (belge Godot › Grafik-4): kıyıdaki ağaçların ve kahramanın suda soluk, mavimsi ters yansıması (yalnız su karolarına
## düşen kısmı); parıltılar şafakta ve akşamüstü altın, gece ay ışığı gibi soluk mavi.
extends Node2D

var oyun
var kiyilar := {}  # karo indeksi → [[dx, dy], …] kara tarafı (web SHORE)
var zaman := 0.0

func _ready() -> void:
	var W: int = oyun.bw
	var H: int = oyun.bh
	var t: PackedByteArray = oyun.tiles
	for y in range(1, H - 1):
		for x in range(1, W - 1):
			var k := t[y * W + x]
			if k < 3 or k == 5:
				continue
			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				if t[(y + d.y) * W + x + d.x] <= 2:
					var i := y * W + x
					if not kiyilar.has(i):
						kiyilar[i] = []
					kiyilar[i].append(d)

func _process(d: float) -> void:
	zaman += d
	queue_redraw()

func _draw() -> void:
	var T: int = oyun.T
	var W: int = oyun.bw
	var H: int = oyun.bh
	var tl: PackedByteArray = oyun.tiles
	var sh: PackedByteArray = oyun.shore
	var kam: Camera2D = oyun.kamera
	var vs := get_viewport_rect().size / kam.zoom
	var c := kam.get_screen_center_position()
	var x0 := maxi(0, int(floor((c.x - vs.x / 2) / T)) - 1)
	var y0 := maxi(0, int(floor((c.y - vs.y / 2) / T)) - 1)
	var x1 := mini(W, int(ceil((c.x + vs.x / 2) / T)) + 1)
	var y1 := mini(H, int(ceil((c.y + vs.y / 2) / T)) + 1)
	var tm := zaman
	var pr := Color.WHITE
	var pe := 0.96
	if oyun.zaman != null:
		var dk: float = oyun.zaman.dk
		if (dk > 330.0 and dk < 450.0) or (dk > 1050.0 and dk < 1200.0): pr = Color(1.0, 0.82, 0.5); pe = 0.94
		elif oyun.zaman.karanlik() > 0.5: pr = Color(0.75, 0.85, 1.0); pe = 0.985
	_yansima(Rect2(c - vs / 2.0, vs).grow(8.0))
	for y in range(y0, y1):
		for x in range(x0, x1):
			var i := y * W + x
			var k := tl[i]
			var bx := float(x * T)
			var by := float(y * T)
			# sabit kıyı çizgisi (web shoreM: 1 sağ, 2 sol, 4 alt, 8 üst)
			var m := sh[i]
			if m != 0:
				var kc := Color(0.94, 0.97, 1.0, 0.55) if k == 4 else Color(0.16, 0.27, 0.39, 0.45)
				if m & 1: draw_rect(Rect2(bx + T - 2, by, 2, T), kc)
				if m & 2: draw_rect(Rect2(bx, by, 2, T), kc)
				if m & 4: draw_rect(Rect2(bx, by + T - 2, T, 2), kc)
				if m & 8: draw_rect(Rect2(bx, by, T, 2), kc)
			if k < 3 or k == 5:
				continue
			if k == 4:
				# yavaş kabarma: her karo sırasında iki ak sırt yuvarlanır
				for n in 2:
					var w := sin(tm * 1.4 + x * 0.5 + y * 0.45 + n * 2.6)
					if w > 0.35:
						var a := (w - 0.35) * 0.45
						var ox := floorf(fmod(tm * 5.0 + x * 7 + n * 6, 14.0))
						var oy := 3 + n * 7 + ((x + y) & 1)
						draw_rect(Rect2(bx + ox, by + oy, 4, 1), Color(1, 1, 1, a))
						draw_rect(Rect2(bx + ox + 1, by + oy - 1, 2, 1), Color(1, 1, 1, a))
			else:
				# tatlı su: doğuya akan akıntı
				for n in 2:
					var o := fmod(tm * 11.0 + x * 5 + y * 9 + n * 8, 18.0)
					draw_rect(Rect2(bx + floorf(o) - 2, by + 3 + n * 6 + ((x * 3 + y) % 3), 3, 1), Color(0.88, 0.97, 1.0, 0.32))
			# parıltı (günün saatine göre renk)
			var sp := sin(tm * 2.7 + x * 12.9 + y * 7.3)
			if sp > pe:
				var px := bx + ((x * 11) % 13)
				var py := by + ((y * 5) % 13)
				draw_rect(Rect2(px, py, 1, 1), Color(pr.r, pr.g, pr.b, 0.9))
				draw_rect(Rect2(px - 1, py, 3, 1), Color(pr.r, pr.g, pr.b, 0.4))
			# kıyı köpüğü: kumla komşu kenarda gelip giden şerit
			if kiyilar.has(i):
				var deniz := k == 4
				var w2 := sin(tm * (1.8 if deniz else 2.4) + (x * 1.3 + y * 0.7))
				var a2 := (0.42 if deniz else 0.25) + 0.22 * w2
				var off := roundf((w2 + 1) * (1.5 if deniz else 1.0))
				var fc := Color(1, 1, 1, clampf(a2, 0, 1))
				for e in kiyilar[i]:
					if e.x == 1: draw_rect(Rect2(bx + T - 2 - off, by, 2, T), fc)
					elif e.x == -1: draw_rect(Rect2(bx + off, by, 2, T), fc)
					elif e.y == 1: draw_rect(Rect2(bx, by + T - 2 - off, T, 2), fc)
					else: draw_rect(Rect2(bx, by + off, T, 2), fc)

# ------------------------------------------------------------------ yansıma
var _agac_kova := {}
var _kova_n := -1
const YANSI := Color(0.62, 0.78, 1.0, 0.26)

func _sulu(p: Vector2) -> bool:
	var k: int = oyun.tile_at(p)
	return k >= 3 and k != 5

## bir resmin (bölgesi src, dünyada sol üstü at, ölçek sc, ayağı foot) ayak çizgisine göre ters yansımasını yalnız su karolarına çizer
func _ters(tex: Texture2D, src: Rect2, at: Vector2, sc: float, foot: float, renk: Color, flip: bool) -> void:
	var T: int = oyun.T
	var ws := src.size * sc
	var y_alt := foot + (foot - at.y)
	var r0 := Rect2(at.x, foot, ws.x, y_alt - foot)
	if r0.size.y <= 0.0: return
	var cx0 := int(floor(r0.position.x / T)); var cx1 := int(floor(r0.end.x / T))
	var cy0 := int(floor(r0.position.y / T)); var cy1 := int(floor(r0.end.y / T))
	for cy in range(cy0, cy1 + 1):
		for cx in range(cx0, cx1 + 1):
			var cell := Rect2(cx * T, cy * T, T, T)
			if not _sulu(cell.get_center()): continue
			var q := cell.intersection(r0)
			if q.size.x <= 0.0 or q.size.y <= 0.0: continue
			var oy0 := foot - (q.end.y - foot)      # q'nun aynadaki üst ucu (dünya)
			var sx := q.position.x - at.x
			if flip: sx = ws.x - (sx + q.size.x)
			var sr := Rect2(src.position.x + sx / sc, src.position.y + (oy0 - at.y) / sc, q.size.x / sc, q.size.y / sc)
			if sr.position.y < src.position.y:
				var cut := src.position.y - sr.position.y
				if cut * sc >= q.size.y: continue
				sr.position.y += cut; sr.size.y -= cut; q.size.y -= cut * sc
			draw_set_transform(Vector2(0, q.position.y + q.end.y), 0.0, Vector2(1, -1))
			var dst := Rect2(q.position.x, q.position.y, q.size.x, q.size.y)
			if flip: dst = Rect2(q.end.x, q.position.y, -q.size.x, q.size.y)
			draw_texture_rect_region(tex, dst, sr, renk)
			draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

## bir Sprite2D'nin yansıması (çerçeveli ya da ölçekli olabilir); ayak = düğümün konumu + ayak_dy
func _spr(sp: Sprite2D, ayak_dy: float, renk: Color) -> void:
	if sp == null or not sp.is_visible_in_tree() or sp.texture == null: return
	var tx: Texture2D = sp.texture
	var fw: float = tx.get_width() / float(sp.hframes); var fh: float = tx.get_height() / float(sp.vframes)
	var src := Rect2((sp.frame % sp.hframes) * fw, (sp.frame / sp.hframes) * fh, fw, fh)
	var sc: float = absf(sp.global_scale.x)
	var o := sp.offset
	if sp.centered: o -= Vector2(fw, fh) / 2.0
	var gp: Vector2 = sp.global_position
	var at := gp + o * sc
	if sp.flip_h and sp.centered: at.x = gp.x - (o.x + fw) * sc
	_ters(tx, src, at, sc, gp.y + ayak_dy, renk, sp.flip_h)

var _dug_kova := {}
var _dug_n := -1
func _kova(L: Array, kova: Dictionary) -> void:
	kova.clear()
	for a in L:
		if not is_instance_valid(a): continue
		var k := Vector2i(int(floor(a.position.x / 128.0)), int(floor(a.position.y / 128.0)))
		if not kova.has(k): kova[k] = []
		kova[k].append(a)

func _yakin_su(p: Vector2, boy: float) -> bool:
	var dy := 4.0
	while dy <= boy:
		if _sulu(Vector2(p.x, p.y + dy)): return true
		dy += 10.0
	return false

func _yansima(vr: Rect2) -> void:
	if oyun.magara != null and oyun.magara.icinde: return
	if _kova_n != oyun.agaclar.size():
		_kova_n = oyun.agaclar.size(); _kova(oyun.agaclar, _agac_kova)
	if _dug_n != oyun.dugumler.size():
		_dug_n = oyun.dugumler.size(); _kova(oyun.dugumler, _dug_kova)
	var renk := YANSI
	renk.a *= 1.0 - 0.6 * (oyun.zaman.karanlik() if oyun.zaman != null else 0.0)
	var vx0 := int(floor(vr.position.x / 128.0)) - 1; var vy0 := int(floor(vr.position.y / 128.0)) - 1
	for ky in range(vy0, int(floor(vr.end.y / 128.0)) + 1):
		for kx in range(vx0, int(floor(vr.end.x / 128.0)) + 1):
			var kk := Vector2i(kx, ky)
			for a in _agac_kova.get(kk, []):
				if is_instance_valid(a) and a.visible and a.spr != null and _yakin_su(a.position + Vector2(0, 6), 40.0): _spr(a.spr, 6.0 - a.spr.position.y, renk)
			for d in _dug_kova.get(kk, []):
				if is_instance_valid(d) and d.canli and d.visible and _yakin_su(d.position, 14.0): _spr(d, 0.0, renk)
	# kahraman, kişiler ve canlılar
	var o = oyun.oyuncu
	if o != null and _yakin_su(o.position + Vector2(0, 5), 20.0): _spr(o.spr, 5.0, renk)
	for n in oyun.kisiler:
		if is_instance_valid(n) and n.visible and vr.has_point(n.position) and _yakin_su(n.position, 20.0):
			for c in n.get_children(): if c is Sprite2D: _spr(c, 0.0, renk); break
	for c in oyun.canlilari_ver():
		if is_instance_valid(c) and c.visible and vr.has_point(c.position) and c.spr != null and _yakin_su(c.position, 16.0): _spr(c.spr, c.position.y - c.spr.global_position.y, renk)
