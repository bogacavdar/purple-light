extends Node
## Tuncay'ın halat yolları (web v433halat + v4.34 Tuncay dışarıda; belge Mağaralar › Rüzgâr Mağarası › Tuncay'ın halat yolları).
## T6 bitince Dağcı Tuncay kuzenlerin ocağının yanında durur, "Halat yolları" penceresinde üç kestirme satar (2.500 / 3.500 / 4.500 Vio).
## Kurulu halatın direğinde F: koşu hızının 3 katıyla öbür uca kayarsın, canlılar dokunamaz. İki harita da kesik mavi çizgiyle gösterir.
## Uçlar web'in kurduğu yerlerden (tools/disa_aktar_halat.js → data/halat.json). Kayıt: halat [b, b, b].

var oyun
var V: Dictionary
var on := [false, false, false]
var RD := {}              # kayma: {i, a, b, L, d}
var ciz: Node2D

func kur(o) -> void:
	oyun = o
	V = o._json("res://data/halat.json")
	ciz = Node2D.new()
	ciz.z_index = 30
	ciz.draw.connect(_ciz)
	oyun.add_child(ciz)

func _var() -> bool:
	return oyun.ada == 1 and not V.is_empty()

func kurulu(i: int) -> bool:
	return _var() and bool(on[i]) and V.uclar[i] != null

func _uc(i: int, k: int) -> Vector2:
	return Vector2(float(V.uclar[i][k].x), float(V.uclar[i][k].y))

## Tuncay ocakta görünür mü (T6 bitti, mağarada değil)
func tuncay_gorunur() -> bool:
	return _var() and oyun.gorev.bitti("T6") and not oyun.magara.icinde

func tuncay_kisi() -> Dictionary:
	var c: Dictionary = oyun._json("res://data/magara_c3.json").kaya
	return {k = "k_tuncay", ad = "Dağcı Tuncay", x = V.tuncay.x, y = V.tuncay.y, rol = "hl", resim = {f = c.png, q = c.png}, portre = c.portre}

func _fmt(v: int) -> String:
	var s := str(v)
	return s.substr(0, s.length() - 3) + "." + s.substr(s.length() - 3) if v >= 1000 else s

func konus(n) -> void:
	var yan_bitti: bool = oyun.yan != null and oyun.yan.done.has("tuncay")
	var soz := "İpim koptu ama ekibim sağlam. Dağı halatla bağlarız, yeter ki parası çıksın." if yan_bitti else "Dağı halatla bağlarız, yeter ki parası çıksın. Rüzgâr Mağarası'nda ipimi kopardım; yolun oraya düşerse beni orada da bulursun."
	oyun.konusma.ac(n.K.ad, load(n.K.portre), soz, [{t = "Halat yolları", pri = true, f = func(): pencere(n)}, {t = "Hoşça kal", kapat = true}])

func pencere(n) -> void:
	var satir := []
	for i in 3:
		satir.append("[b]%s[/b]: %s · %s Vio%s" % [V.ad[i], V.yer[i], _fmt(int(V.fiyat[i])), " · [i]kuruldu[/i]" if on[i] else ""])
	var ch := []
	for i in 3:
		if on[i] or V.uclar[i] == null: continue
		var c := int(V.fiyat[i])
		var fakir: bool = not Hile.sonsuz and oyun.env.vio < c
		var ii := i
		ch.append({t = "Kur: %s (%s Vio)%s" % [V.ad[i], _fmt(c), " · Vio yetmiyor" if fakir else ""], soluk = fakir, f = func(): _al(ii)})
	ch.append({t = "Kapat", pri = true, kapat = true})
	oyun.konusma.ac(n.K.ad, load(n.K.portre), "Ekibim dağı halatla bağlar; her kestirme bir kez kurulur, sonra halat senindir.\n[font_size=11]%s[/font_size]" % "\n".join(satir), ch)

func _al(i: int) -> void:
	var c := int(V.fiyat[i])
	if on[i]: return
	if not Hile.sonsuz and oyun.env.vio < c:
		if oyun.ses != null: oyun.ses.cal("bad")
		return
	oyun.env.vio_ekle(-c)
	on[i] = true
	if oyun.ses != null: oyun.ses.cal("found")
	oyun.env.mesaj("Tuncay'ın ekibi halatı gerdi. %s kuruldu · −%s Vio" % [V.ad[i], _fmt(c)])

## F: bir direğin dibindeysen halata asılırsın
func f() -> bool:
	if not RD.is_empty() or oyun.magara.icinde: return false
	var p: Vector2 = oyun.oyuncu.position
	for i in 3:
		if not kurulu(i): continue
		for k in 2:
			if p.distance_to(_uc(i, k) + Vector2(0, 4)) < 24.0:
				_bin(i, k)
				return true
	return false

func _bin(i: int, k: int) -> void:
	var a := _uc(i, k) + Vector2(0, 6)
	var b := _uc(i, 1 - k) + Vector2(0, 6)
	RD = {i = i, a = a, b = b, L = maxf(1.0, a.distance_to(b)), d = 0.0}
	oyun.oyuncu.position = a
	oyun.oyuncu.kilit = true
	if oyun.ses != null: oyun.ses.cal("swing")

func kayiyor() -> bool:
	return not RD.is_empty()

func _process(dt: float) -> void:
	if oyun == null: return
	ciz.queue_redraw()
	if RD.is_empty(): return
	if oyun.zaman.durdu() or get_tree().paused: return
	var P = oyun.oyuncu
	var sp: float = 72.0 * 3.0 * oyun.stat("move") * float(P.V.runMult)
	RD.d = minf(RD.L, RD.d + sp * dt)
	var t: float = RD.d / RD.L
	P.position = RD.a.lerp(RD.b, t)
	P.dokunulmaz = maxf(P.dokunulmaz, 0.3)
	for c in oyun.canlilari_ver():
		if c.mad:
			c.mad = false
			c.st = "wander"
	if t >= 1.0:
		RD = {}
		P.kilit = false
		P.dokunulmaz = maxf(P.dokunulmaz, 0.6)
		if oyun.evcil != null and oyun.evcil.has_method("yanina"): oyun.evcil.yanina()

# ------------------------------------------------------------------ resimler: direk, halat, asılı karakter
func _sark(i: int) -> float:
	return minf(12.0, _uc(i, 0).distance_to(_uc(i, 1)) * 0.02)

func _ust(p: Vector2) -> Vector2:
	return p + Vector2(5, -37)

func _direk(p: Vector2) -> void:
	var x := roundf(p.x)
	var y := roundf(p.y)
	var r := func(a: float, b: float, w: float, h: float, c: Color): ciz.draw_rect(Rect2(x + a, y + b, w, h), c)
	r.call(-6, 1, 13, 2, Color(0, 0, 0, 0.25)); r.call(-4, -2, 9, 3, Color("#7a7268")); r.call(-4, -2, 9, 1, Color("#9a9288"))
	r.call(-1, -34, 3, 32, Color("#7a5230")); r.call(-1, -34, 1, 32, Color("#9a6a40")); r.call(1, -34, 1, 32, Color("#5a3a20"))
	r.call(-5, -35, 11, 2, Color("#5a3a20")); r.call(-5, -35, 11, 1, Color("#7a5230")); r.call(3, -39, 5, 5, Color("#5a5a62")); r.call(4, -38, 3, 3, Color("#9a9aa2")); r.call(5, -37, 1, 1, Color("#3a3a42"))

func _ciz() -> void:
	if not _var() or oyun.magara.icinde: return
	var c: Vector2 = oyun.oyuncu.position
	for i in 3:
		if not kurulu(i): continue
		var a := _uc(i, 0)
		var b := _uc(i, 1)
		var lo := Rect2(a, Vector2.ZERO).expand(b).grow(80)
		if not lo.has_point(c) and lo.grow(500).has_point(c) == false: continue
		ciz.draw_line(a + Vector2(0, 1), b + Vector2(0, 1), Color(0, 0, 0, 0.18), 1.0)
		var A := _ust(a)
		var B := _ust(b)
		var s := _sark(i)
		var m := (A + B) / 2.0 + Vector2(0, 2 * s)
		var pts := PackedVector2Array()
		for k in 25:
			var t := k / 24.0
			pts.append(A.lerp(m, t).lerp(m.lerp(B, t), t))
		ciz.draw_polyline(pts, Color("#b89a62"), 1.2)
		_direk(a)
		_direk(b)
	# halatta asılıyken eller halata
	if not RD.is_empty():
		var P: Vector2 = oyun.oyuncu.position
		var t: float = RD.d / RD.L
		var ry: float = P.y - 37.0 + (1.0 - 4.0 * (t - 0.5) * (t - 0.5)) * _sark(RD.i)
		ciz.draw_line(Vector2(P.x - 2, P.y - 24), Vector2(P.x, ry), Color("#5a3a20"), 1.0)
		ciz.draw_line(Vector2(P.x + 2, P.y - 24), Vector2(P.x, ry), Color("#5a3a20"), 1.0)

## haritalar: kesik açık mavi çizgi, uçlarda direk; büyük haritada kalın ve koyu kenarlı
func harita_ciz(cv: Control, o: Vector2, s: float, buyuk: bool) -> void:
	if not _var() or oyun.magara.icinde: return
	var T := float(oyun.T)
	var font := ThemeDB.fallback_font
	for i in 3:
		if not kurulu(i): continue
		var a := o + _uc(i, 0) / T * s
		var b := o + _uc(i, 1) / T * s
		if buyuk: cv.draw_dashed_line(a, b, Color(10 / 255.0, 30 / 255.0, 50 / 255.0, 0.75), 6.0, 9.0)
		cv.draw_dashed_line(a, b, Color(150 / 255.0, 215 / 255.0, 1.0, 0.95), 3.5 if buyuk else 1.2, 9.0 if buyuk else 3.0)
		var z := 2.4 if buyuk else 0.8
		for p in [a, b]:
			cv.draw_rect(Rect2(p + Vector2(-2, -7) * z, Vector2(4, 8) * z), Color("#1a1208"))
			cv.draw_rect(Rect2(p + Vector2(-1, -6) * z, Vector2(2, 6) * z), Color("#a8743a"))
			cv.draw_rect(Rect2(p + Vector2(-3, -7) * z, Vector2(6, 1.5) * z), Color("#a8743a"))
		if buyuk and (cv.get_local_mouse_position().distance_to(a) < 12.0 or cv.get_local_mouse_position().distance_to(b) < 12.0):
			cv.draw_string(font, cv.get_local_mouse_position() + Vector2(10, -6), str(V.ad[i]), HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color.WHITE)

func kayit() -> Array:
	return on.duplicate()

func yukle(d) -> void:
	on = [false, false, false]
	if not RD.is_empty(): oyun.oyuncu.kilit = false
	RD = {}
	if typeof(d) == TYPE_ARRAY:
		for i in mini(3, d.size()): on[i] = bool(d[i])
