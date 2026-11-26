## Usta Sinan'ın yapıları ve evleri yere kurulur (web PLACEABLE, HOUSES, FOOT, placing, placeOK, doPlace, useHouse, sleepBed).
extends Node2D

var oyun
var env
var Y: Dictionary              # data/yapilar.json
var kurulu: Array = []         # {n, tx, ty, rot, yatak, dugum}
var yer = null                 # yerleştirme: {n, rot, tx, ty, tasinan}
var barinak_uyudu := false     # web shelterSlept
var hayalet: Node2D
const T := 16

func kur(o) -> void:
	oyun = o
	env = o.env
	Y = o._json("res://data/yapilar.json")
	hayalet = Node2D.new()
	hayalet.z_index = 40
	hayalet.draw.connect(_hayalet_ciz)
	add_child(hayalet)

func yapi_mi(n: String) -> bool:
	if n == "Direk feneri": return false   # inşa kipiyle tek karoya konur
	return Y.yapi.has(n) and Y.yapi[n].get("foot", null) != null

func ev_mi(n: String) -> bool:
	return Y.yapi.has(n) and int(Y.yapi[n].get("ev", 0)) == 1

func yatak_mi(n: String) -> bool:
	return n.to_lower().contains("yatak")

func ayak(n: String, rot: int) -> Vector2i:
	var f: Array = Y.yapi[n].foot
	return Vector2i(int(f[1]), int(f[0])) if rot % 2 == 1 else Vector2i(int(f[0]), int(f[1]))

func yerlestiriyor() -> bool:
	return yer != null

# ------------------------------------------------------------------ yerleştirme
func basla(n: String, tasinan = null) -> void:
	if not yapi_mi(n): return
	if tasinan == null and env.adet(n) <= 0: return
	yer = {n = n, rot = (tasinan.rot if tasinan != null else 0), tx = 0, ty = 0, tasinan = tasinan}
	_fare()
	env.mesaj("%s %s · yeşil yere tıkla, Boşluk döndürür, sağ tık vazgeçer" % [n, "taşınıyor" if tasinan != null else "yerleştiriliyor"])

func vazgec() -> void:
	if yer == null: return
	if yer.tasinan != null:
		_kur_dugum(yer.tasinan)
		kurulu.append(yer.tasinan)
	yer = null
	if yapi_mi(env.elde()): env.el = -1; env.kemer_ciz()
	hayalet.queue_redraw()

func _fare() -> void:
	var m: Vector2 = get_global_mouse_position()
	var f := ayak(yer.n, yer.rot)
	yer.tx = int(floor(m.x / T)) - f.x / 2
	yer.ty = int(floor(m.y / T)) - f.y / 2

func uygun(n: String, rot: int, tx: int, ty: int) -> bool:
	var f := ayak(n, rot)
	for y in range(ty, ty + f.y):
		for x in range(tx, tx + f.x):
			var c := Vector2(x * T + 8, y * T + 8)
			var tl: int = oyun.tile_at(c)
			if tl < 0 or tl > 2: return false
			for ag in oyun.agaclar:
				if is_instance_valid(ag) and ag.visible and absf(ag.position.x - c.x) < 12.0 and absf(ag.position.y + 2.0 - c.y) < 12.0: return false
			for o in kurulu:
				var g := ayak(o.n, o.rot)
				if x >= o.tx and x < o.tx + g.x and y >= o.ty and y < o.ty + g.y: return false
			for k in oyun.kisiler:
				if k.position.distance_to(c) < 24.0: return false
			for st in oyun.istasyonlar:
				if Vector2(st.x, st.y).distance_to(c) < 24.0: return false
			var I: Dictionary = oyun.toplama_veri.istasyon
			for a in [I.kazan, I.ors, I.ors2]:
				if Vector2(a.x, a.y).distance_to(c) < 24.0: return false
			for a in oyun.zaman.A.ates:
				if Vector2(a.x, a.y).distance_to(c) < 24.0: return false
	return true

func _yerlestir() -> void:
	var p = yer
	if not uygun(p.n, p.rot, p.tx, p.ty):
		env.mesaj("Buraya konmaz: su, ağaç, başka bir eşya ya da birinin yeri", true)
		return
	var f := ayak(p.n, p.rot)
	var P: Vector2 = oyun.oyuncu.position
	if P.x > p.tx * T - 5 and P.x < (p.tx + f.x) * T + 5 and P.y > p.ty * T - 5 and P.y < (p.ty + f.y) * T + 5:
		env.mesaj("Önce biraz kenara çekil", true)
		return
	for d in oyun.dugumler:
		if d.canli and d.position.x > p.tx * T - 4 and d.position.x < (p.tx + f.x) * T + 4 and d.position.y > p.ty * T - 4 and d.position.y < (p.ty + f.y) * T + 4:
			d.oldur(1e9)
	var o: Dictionary
	if p.tasinan != null:
		o = p.tasinan
		o.tx = p.tx; o.ty = p.ty; o.rot = p.rot
		env.mesaj("%s taşındı" % p.n)
	else:
		env.eksilt(p.n)
		o = {n = p.n, tx = p.tx, ty = p.ty, rot = p.rot, yatak = null}
		if p.n == "Atölye": o.ws = oyun.atolye.yeni()
		env.mesaj("%s yerleştirildi" % p.n)
	kurulu.append(o)
	_kur_dugum(o)
	for i in 16:
		oyun.parca(Vector2((p.tx + f.x / 2.0) * T + randf_range(-f.x, f.x) * 8.0, (p.ty + f.y) * T - 2), Vector2(randf_range(-20, 20), -20 - randf() * 30), 0.55, Color("#d8c8a0"))
	yer = null
	hayalet.queue_redraw()
	var h: String = env.elde()
	if yapi_mi(h):
		if env.adet(h) > 0: basla(h)
		else:
			env.el = -1
	env.kemer_ciz()
	if env.canta.visible: env.canta_ciz()

func _kur_dugum(o: Dictionary) -> void:
	var y: Dictionary = Y.yapi[o.n]
	var F: Array = y.foot
	var bw := float(F[0]) * T; var bh := float(F[1]) * T
	var f := ayak(o.n, o.rot)
	var s := Sprite2D.new()
	if y.get("file", null) != null:
		s.texture = load(y.file)
		s.scale = Vector2(bw / maxf(1.0, float(y.w) - 2.0), bh / maxf(1.0, float(y.h) - 2.0))
	s.rotation = int(o.rot) * PI / 2.0
	s.position = Vector2((o.tx + f.x / 2.0) * T, (o.ty + f.y / 2.0) * T - (2.0 if o.n == "Atölye" else 0.0))
	# sıralama: yapının alt kenarı
	var n := Node2D.new()
	n.position = Vector2((o.tx + f.x / 2.0) * T, (o.ty + f.y) * T)
	s.position -= n.position
	n.add_child(s)
	if o.get("ws", null) != null:
		var w := f.x * T
		var h := f.y * T
		n.draw.connect(_atolye_ciz.bind(n, o, w, h))
	oyun.nesneler.add_child(n)
	o.dugum = n

## atölyenin üstünde ilerleme çubuğu ve biriken ürün (web drawPlacedObj ws)
func _atolye_ciz(n: Node2D, o: Dictionary, w: float, h: float) -> void:
	var ws: Dictionary = o.ws
	if ws.r == null: return
	var k := minf(1.0, float(ws.t) / 25.0)
	var x0 := -w / 2.0
	var y0 := -h - 5.0
	n.draw_rect(Rect2(x0 + 2, y0, w - 4, 3), Color("#11170f"))
	n.draw_rect(Rect2(x0 + 3, y0 + 1, roundf((w - 6) * k), 1), Color("#8fd46b") if oyun.atolye.hazir(ws) else Color("#c9bfa3"))
	if int(ws.out) > 0:
		n.draw_string(ThemeDB.fallback_font, Vector2(-6, y0 - 2), "×%d" % int(ws.out), HORIZONTAL_ALIGNMENT_LEFT, -1, 7, Color("#ffd27a"))

func engel(p: Vector2, half: float) -> bool:
	for o in kurulu:
		var f := ayak(o.n, o.rot)
		if p.x > o.tx * T - half + 1 and p.x < (o.tx + f.x) * T + half - 1 and p.y > o.ty * T - half + 3 and p.y < (o.ty + f.y) * T + half - 2: return true
	return false

func _process(_dt: float) -> void:
	if yer != null:
		_fare()
		hayalet.queue_redraw()
	oyun.atolye.isle(_dt)

func _hayalet_ciz() -> void:
	if yer == null: return
	var f := ayak(yer.n, yer.rot)
	var ok := uygun(yer.n, yer.rot, yer.tx, yer.ty)
	for y in range(yer.ty - 3, yer.ty + f.y + 3):
		for x in range(yer.tx - 3, yer.tx + f.x + 3):
			hayalet.draw_rect(Rect2(x * T + 0.5, y * T + 0.5, T - 1, T - 1), Color(1, 1, 1, 0.12), false, 1.0)
	var r := Rect2(yer.tx * T, yer.ty * T, f.x * T, f.y * T)
	hayalet.draw_rect(r, Color(0.43, 0.86, 0.35, 0.35) if ok else Color(0.94, 0.31, 0.24, 0.4))
	hayalet.draw_rect(r, Color("#8fe06b") if ok else Color("#ff6a5a"), false, 1.0)
	var y2: Dictionary = Y.yapi[yer.n]
	if y2.get("file", null) != null:
		var tx: Texture2D = load(y2.file)
		var F: Array = y2.foot
		var sz := Vector2(float(F[0]) * T, float(F[1]) * T)
		hayalet.draw_set_transform(r.get_center(), int(yer.rot) * PI / 2.0, Vector2.ONE)
		hayalet.draw_texture_rect(tx, Rect2(-sz / 2.0, sz), false, Color(1, 1, 1, 0.7))
		hayalet.draw_set_transform(Vector2.ZERO)

func _unhandled_input(e: InputEvent) -> void:
	if yer == null: return
	if e is InputEventMouseButton and e.pressed:
		if e.button_index == MOUSE_BUTTON_LEFT: _yerlestir()
		elif e.button_index == MOUSE_BUTTON_RIGHT: vazgec()
		get_viewport().set_input_as_handled()
	elif e is InputEventKey and e.pressed and not e.echo:
		if e.physical_keycode == KEY_SPACE or e.physical_keycode == KEY_R:
			yer.rot = (int(yer.rot) + 1) % 4
			get_viewport().set_input_as_handled()
		elif e.physical_keycode == KEY_ESCAPE:
			vazgec()
			get_viewport().set_input_as_handled()

# ------------------------------------------------------------------ kurulu yapıyla F (web placedNear, useplaced, useHouse)
func yakindaki():
	var P: Vector2 = oyun.oyuncu.position
	var en = null
	var bd := 14.0
	for o in kurulu:
		var f := ayak(o.n, o.rot)
		var x0: float = o.tx * T; var y0: float = o.ty * T
		var dx := maxf(maxf(x0 - P.x, 0.0), P.x - (x0 + f.x * T))
		var dy := maxf(maxf(y0 - P.y, 0.0), P.y - (y0 + f.y * T))
		var d := Vector2(dx, dy).length()
		if d < bd:
			bd = d
			en = o
	return en

func kullan() -> bool:
	var o = yakindaki()
	if o == null: return false
	if ev_mi(o.n):
		if o.n == "Yaprak barınağı":
			_uyu(o)
			return true
		oyun.ev.gir(o)
		return true
	if yatak_mi(o.n):
		_uyu(o)
		return true
	if o.n == "Ağıl":
		oyun.evcil.agil_ac()
		return true
	if o.get("ws", null) != null:
		oyun.atolye.ac(o)
		return true
	oyun.konusma.ac("", null, "[b]%s[/b]" % o.n, [{t = "Taşı", f = _tasi.bind(o)}, {t = "Geri al", f = _geri_al.bind(o)}, {t = "Tamam", pri = true, kapat = true}])
	return true

func _kaldir(o: Dictionary) -> void:
	kurulu.erase(o)
	if o.get("dugum", null) != null and is_instance_valid(o.dugum): o.dugum.queue_free()
	o.dugum = null

func _tasi(o: Dictionary) -> void:
	_kaldir(o)
	basla(o.n, o)

func _geri_al(o: Dictionary) -> void:
	if o.get("ws", null) != null: oyun.atolye._geri(o.ws)
	_kaldir(o)
	env.ekle(o.n)
	env.mesaj("%s çantana döndü" % o.n)

func gece() -> bool:
	return oyun.zaman.dk >= 1200.0 or oyun.zaman.dk < 300.0

func _saat() -> String:
	var m := int(oyun.zaman.dk)
	return "%02d:%02d" % [(m / 60) % 24, m % 60]

func _uyu(o: Dictionary) -> void:
	if not gece():
		env.mesaj("Henüz uyku vakti değil (saat %s). Yatağa gece 20:00 ile 05:00 arasında yatabilirsin." % _saat(), true)
		return
	var P = oyun.oyuncu
	var kara := ColorRect.new()
	kara.color = Color(0, 0, 0, 0)
	kara.set_anchors_preset(Control.PRESET_FULL_RECT)
	oyun.hud.add_child(kara)
	kara.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var yazi := Label.new(); yazi.text = "Zzz… Yorgun bedenin yatağa gömüldü."; oyun._golge(yazi)
	yazi.add_theme_font_size_override("font_size", 20)
	kara.add_child(yazi); yazi.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	P.kilit = true
	var tw := create_tween()
	tw.tween_property(kara, "color:a", 1.0, 0.8)
	await tw.finished
	if o.n == "Yaprak barınağı":
		_kaldir(o)
		barinak_uyudu = true
	oyun.zaman.dk = 360.0
	oyun.zaman.gun += 1
	get_tree().create_timer(3.6).timeout.connect(func(): oyun.ani.olay("sleep"))   # web v318: gece uyuyunca %40 bir anı (rüya)
	env.tokluk = maxf(5.0, env.tokluk - 20.0)
	for c in oyun.canlilari_ver():
		if not c.has_meta("ders"): c.queue_free()
	P.hp = P.hp_max; P.st = P.st_max; P.yorgun = false
	oyun.can_guncelle(P.hp, P.hp_max)
	await get_tree().create_timer(1.2).timeout
	var tw2 := create_tween()
	tw2.tween_property(kara, "color:a", 0.0, 0.8)
	await tw2.finished
	kara.queue_free()
	P.kilit = false
	env.mesaj("Gün %d · Güne dinç başladın: can ve enerji dolu" % oyun.zaman.gun)
	if o.n == "Yaprak barınağı":
		await get_tree().create_timer(2.0).timeout
		env.mesaj("Yaprak barınağı dağıldı; bir gecelikti.")

func yatak_kurulu() -> bool:
	for o in kurulu:
		if ev_mi(o.n) and o.n != "Yaprak barınağı" and o.yatak != null: return true
	return false

func ev_kurulu() -> bool:
	for o in kurulu:
		if ev_mi(o.n) and o.n != "Yaprak barınağı": return true
	return false

func kurulu_mu(n: String) -> bool:
	if oyun.insa.var_mi(n): return true
	for o in kurulu:
		if o.n == n: return true
	return false

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	var L := []
	for o in kurulu: L.append({n = o.n, tx = o.tx, ty = o.ty, rot = o.rot, yatak = o.yatak, ws = o.get("ws", null), oda = o.get("oda", null)})
	return {kurulu = L, barinak = barinak_uyudu}

func yukle(d: Dictionary) -> void:
	oyun.ev.cik()
	for o in kurulu.duplicate(): _kaldir(o)
	kurulu = []
	for x in d.get("kurulu", []):
		if not yapi_mi(str(x.n)): continue
		var o := {n = str(x.n), tx = int(x.tx), ty = int(x.ty), rot = int(x.get("rot", 0)), yatak = x.get("yatak", null), oda = x.get("oda", null)}
		if o.oda != null:
			for it in o.oda.it:
				it.x = int(it.x); it.y = int(it.y); it.r = int(it.get("r", 0))
		if o.n == "Atölye":
			var w0 = x.get("ws", null)
			o.ws = w0 if w0 is Dictionary else oyun.atolye.yeni()
			if not o.ws.has("store"): o.ws = oyun.atolye.yeni()
		kurulu.append(o)
		_kur_dugum(o)
	barinak_uyudu = bool(d.get("barinak", false))
