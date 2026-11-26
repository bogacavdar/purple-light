extends Node
## Mor ışık saldırıları ve Yıldızsızlar (web v330ys; belge Sistemler › Mor ışık saldırıları ve Yıldızsızlar).
## Sabit günlerde (6, 11, 18, 22, 31…; aralar 5,7,4,9,6,3,8) gece başlarken (20:00) bütün ada mora bürünür, Yıldızsızlar
## mor ışık sütunlarıyla çevrene iki dalga halinde iner; güçleri silahına, canına ve güne göre. Ölünce Vio düşürürler.

var oyun
var V: Dictionary                     # data/yildizsiz.json {G, P, H}
var D := {}                           # tür → canli.gd veri sözlüğü
var tex := {}                         # tür → [doku, parıltı dokusu]
const YD := {
	"Yıldızsız gözcü": {hits = 3, pc = 0.05, spd = 78, r = 5, coin = [6, 10]},
	"Yıldızsız sürüngen": {hits = 6, pc = 0.08, spd = 52, r = 6, coin = [12, 20]},
	"Yıldızsız tükürücü": {hits = 4, pc = 0.06, spd = 40, r = 6, coin = [10, 16], ranged = {range = 160, spd = 140, c = "#d07aff", n = 1, cd = 2.3}},
	"Yıldızsız dev": {hits = 14, pc = 0.14, spd = 38, r = 10, coin = [40, 60], reach = 40, wind = 0.7}}
const GAPS := [5, 7, 4, 9, 6, 3, 8]
const OZEL := [5, 15, 20]

var sira := 6                         # sıradaki saldırının günü
var sayi := 0                         # olan saldırı sayısı
var oldurulen := {}                   # tür → kaç tane (almanak için)
var konuk := false                    # gizli "Konuk": kimseyi incitmeden saldırının sonuna kadar kaldın
var ATK = null                        # {t, a, pend[], w2[], w2done, k}
var FADE := 0.0
var ciz: Node2D
var ortu: TextureRect
var ilan: Label
var ilan_alt: Label
var ilan_t := 0.0
var yardim := {}                      # kişi → {katildi, cd, ev}

func kur(o) -> void:
	oyun = o
	V = JSON.parse_string(FileAccess.get_file_as_string("res://data/yildizsiz.json"))
	for k in YD:
		_doku(k)
		var d: Dictionary = YD[k]
		var G: Array = V.G[k]
		var fw := 0
		for row in G[0]: fw = maxi(fw, str(row).length())
		D[k] = {fw = fw, fh = G[0].size(), frames = G.size(), ox = fw / 2, oy = G[0].size(), top = G[0].size(), shadow = int(d.r) + 2,
			temper = "saldırgan", hp = roundf(d.hits * 10 * 0.75), spd = d.spd, cs = null, aggro = 520, dmg = roundf(d.pc * 100 * 0.75),
			r = d.r, reach = d.get("reach", 26), wind = d.get("wind", 0.45), xp = d.hits * 3, night = false, still = false,
			landTiles = [0.0, 1.0, 2.0], drops = [], pack = null, ranged = d.get("ranged", null), fx = null, kind = "ys", tex = tex[k][0], parilti = tex[k][1], ys = true}
	ciz = Node2D.new()
	ciz.z_index = 50
	ciz.draw.connect(_ciz)
	oyun.add_child(ciz)
	var kat := CanvasLayer.new()
	kat.layer = 1
	oyun.add_child(kat)
	ortu = TextureRect.new()
	var g := GradientTexture2D.new()
	g.fill = GradientTexture2D.FILL_RADIAL
	g.fill_from = Vector2(0.5, 0.55)
	g.fill_to = Vector2(1.1, 1.1)
	var gr := Gradient.new()
	gr.set_color(0, Color(150 / 255.0, 60 / 255.0, 230 / 255.0, 0.10))
	gr.set_color(1, Color(70 / 255.0, 10 / 255.0, 150 / 255.0, 0.42))
	g.gradient = gr
	ortu.texture = g
	ortu.stretch_mode = TextureRect.STRETCH_SCALE
	ortu.set_anchors_preset(Control.PRESET_FULL_RECT)
	ortu.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ortu.modulate.a = 0.0
	kat.add_child(ortu)
	ilan = Label.new()
	ilan.add_theme_font_size_override("font_size", 26)
	ilan.add_theme_color_override("font_color", Color("#f0d8ff"))
	ilan.add_theme_color_override("font_outline_color", Color("#2a0a4a"))
	ilan.add_theme_constant_override("outline_size", 6)
	ilan.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ilan.set_anchors_preset(Control.PRESET_CENTER_TOP)
	ilan.position = Vector2(-300, 120); ilan.size = Vector2(600, 36)
	ilan.modulate.a = 0.0
	ilan_alt = Label.new()
	ilan_alt.add_theme_font_size_override("font_size", 15)
	ilan_alt.add_theme_color_override("font_color", Color("#e0c0ff"))
	ilan_alt.add_theme_color_override("font_outline_color", Color("#2a0a4a"))
	ilan_alt.add_theme_constant_override("outline_size", 4)
	ilan_alt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ilan_alt.position = Vector2(0, 38); ilan_alt.size = Vector2(600, 22)
	ilan.add_child(ilan_alt)
	oyun.hud.add_child(ilan)

## ızgaradan doku: satır 0 sakin (yeşil göz), satır 1 kovalarken (kırmızı göz); parıltı dokusu yalnız parlayan noktalar
func _doku(k: String) -> void:
	var G: Array = V.G[k]
	var w := 0
	for row in G[0]: w = maxi(w, str(row).length())
	var h: int = G[0].size()
	var im := Image.create(w * G.size(), h * 2, false, Image.FORMAT_RGBA8)
	var gl := Image.create(w * G.size(), h * 2, false, Image.FORMAT_RGBA8)
	for f in G.size():
		for ch in 2:
			for r in h:
				var s: String = G[f][r]
				for i in s.length():
					var q := s[i]
					if q == " ": continue
					var c: Color = (Color("#ff3a6a") if ch == 1 else Color("#6aff9a")) if q == "E" else Color(str(V.P.get(q, "#ff00ff")))
					im.set_pixel(f * w + i, ch * h + r, c)
					if q == "g" or q == "G" or q == "c" or q == "E":
						gl.set_pixel(f * w + i, ch * h + r, Color("#b0ffc8") if q == "E" else Color("#ffb0ff"))
	tex[k] = [ImageTexture.create_from_image(im), ImageTexture.create_from_image(gl)]

func aktif() -> bool:
	return ATK != null

func _serbest(d: int) -> int:
	while d <= 3 or OZEL.has(d): d += 1
	return d

func _siradan(m: int) -> int:
	var d := 6
	var i := 0
	while d < m:
		d += GAPS[i % GAPS.size()]; i += 1
	return _serbest(d)

func _bekle() -> bool:
	if oyun.basta or oyun.zaman.durdu() or oyun.oyuncu.bayildi: return true
	return oyun.roket != null and oyun.roket.faz != ""

func _siginak() -> bool:
	if oyun.ev.acik or oyun.magara.icinde or oyun.kuzen.yol_t >= 0.0: return true
	var P: Vector2 = oyun.oyuncu.position
	for o in oyun.yapi.kurulu:
		if str(o.n) == "Kamp ateşi" and Vector2((o.tx + 0.5) * 16.0, (o.ty + 0.5) * 16.0).distance_to(P) < 70.0: return true
	return false

func _process(dt: float) -> void:
	if oyun == null: return
	ilan_t -= dt
	ilan.modulate.a = clampf(ilan_t, 0.0, 1.0)
	if FADE > 0.0: FADE -= dt
	ortu.modulate.a = 1.0 if ATK != null else maxf(0.0, FADE)
	if ATK != null or FADE > 0.0: ciz.queue_redraw()
	var Z = oyun.zaman
	if ATK == null:
		_yardimcilar_don(dt)
		if oyun.basta: return
		if Z.gun > sira or (Z.gun == sira and Z.dk >= 1260.0):
			sira = _serbest(Z.gun if Z.dk < 1200.0 else Z.gun + 1)   # kaçırıldı (uyuyarak geçti, geç yüklendi): sıradaki olaysız gün
			return
		if Z.gun == sira and Z.dk >= 1200.0:
			if _bekle(): return
			if _siginak():
				sira = _serbest(Z.gun + 1)
				return
			basla()
		return
	if oyun.oyuncu.bayildi:
		bitir(false)
		return
	if Z.durdu(): return
	var C: Dictionary = ATK
	C.t += dt
	C.a = minf(1.0, C.a + dt)
	for i in range(C.pend.size() - 1, -1, -1):
		var q: Dictionary = C.pend[i]
		q.t -= dt
		if q.t > 0.0: continue
		C.pend.remove_at(i)
		var c = oyun._canli_yeni(q.k, q.p, 0)
		c.set_meta("ys", true)
		c.mad = true
		c.st = "chase"
		for k in 10: oyun.parca(q.p + Vector2(0, -4), Vector2(randf_range(-25, 25), -10 - randf() * 30), 0.5, Color("#c070ff") if k % 2 else Color("#ffe0ff"))
	if not C.w2done and ((_canli().size() <= 1 and C.pend.is_empty()) or C.t > 20.0):
		C.w2done = true
		_sira_ekle(C, C.w2)
	_yardimcilar(dt)
	if C.t > 240.0:
		bitir(false, true)
		return
	if C.w2done and C.pend.is_empty() and _canli().is_empty(): bitir(true)

func _canli() -> Array:
	var out := []
	for c in oyun.canlilari_ver():
		if c.has_meta("ys") and c.olu < 0.0: out.append(c)
	return out

func _yer():
	var P: Vector2 = oyun.oyuncu.position
	for i in 80:
		var a := randf() * TAU
		var r := 110.0 + randf() * 146.0
		var p := P + Vector2(cos(a), sin(a)) * r
		if oyun.engel(p, 6.0, true) or oyun.tile_at(p) > 2: continue
		return p
	return null

func _turler(n: int) -> Array:
	var L := ["Yıldızsız gözcü", "Yıldızsız sürüngen"]
	if oyun.env.sv >= 5 or oyun.zaman.gun >= 8: L.append("Yıldızsız tükürücü")
	var buyuk: bool = oyun.env.sv >= 12 or oyun.zaman.gun >= 18
	var devs := 0
	var out := []
	for i in n:
		if buyuk and devs < 2 and randf() < 0.18:
			out.append("Yıldızsız dev"); devs += 1; continue
		out.append(L[randi() % L.size()])
	return out

func _sira_ekle(C: Dictionary, list: Array) -> void:
	var i := 0
	for k in list:
		var p = _yer()
		if p == null: continue
		C.pend.append({k = k, p = p, t = 0.7 + i * 0.18})
		i += 1

## güçleri: can silahının bir vuruşunun katları, hasar tam canının yüzdesi; ikisi de günle artar (gün başına %2, en çok %80), hepsi ×0,75
func guc_ayarla() -> void:
	var w: Dictionary = oyun.oyuncu.silah_v()
	var P := maxf(6.0, float(w.get("dmg", 0)))
	var H: float = oyun.oyuncu.can_max()
	var dk := 1.0 + minf(0.8, oyun.zaman.gun * 0.02)
	for k in YD:
		var d: Dictionary = YD[k]
		D[k].hp = maxf(3.0, roundf(d.hits * P * dk * 0.75))
		D[k].dmg = maxf(2.0, roundf(d.pc * H * dk * 0.75))
		D[k].xp = roundi(d.hits * 3 * (1.0 + oyun.env.sv * 0.15))
		oyun.canlilar[k] = D[k]

func basla() -> void:
	guc_ayarla()
	var gun: int = oyun.zaman.gun
	var n := clampi(roundi((4 + gun / 5 + oyun.env.sv / 6) * 0.75), 3, 9)
	var list := _turler(n)
	var yari := ceili(n / 2.0)
	ATK = {t = 0.0, a = 0.0, pend = [], w2 = list.slice(yari), w2done = false, k = 0}
	_sira_ekle(ATK, list.slice(0, yari))
	sayi += 1
	duyur("Mor ışık saldırısı!", "Yıldızsızlar geliyor")

func bitir(kazandi: bool, sure: bool = false) -> void:
	if ATK == null: return
	var C: Dictionary = ATK
	ATK = null
	FADE = 1.0
	var sakin: bool = not kazandi and sure and int(C.k) == 0 and not oyun.oyuncu.bayildi
	for c in _canli():
		if sakin: oyun.yazi(c.position + Vector2(0, -22), "~", Color("#e0b0ff"), 14)
		for k in 8: oyun.parca(c.position + Vector2(0, -6), Vector2(randf_range(-7, 7), -40 - randf() * 40), 0.7, Color("#c070ff") if k % 2 else Color("#f0d8ff"))
		c.queue_free()
	sira = _siradan(oyun.zaman.gun + 3)
	if sakin:
		konuk = true
		duyur("Konuk", "Yıldızsızlar el salladı")
	elif not oyun.oyuncu.bayildi:
		duyur("Mor ışık çekildi", "Yıldızsızlar yenildi" if kazandi else "Yıldızsızlar geri çekildi")

## bir Yıldızsız düşünce Vio doğrudan keseye (gün ve seviyeyle artar)
func oldu(c) -> void:
	if c == null or not c.has_meta("ys"): return
	if ATK != null: ATK.k += 1
	oldurulen[c.tur] = int(oldurulen.get(c.tur, 0)) + 1
	var d: Dictionary = YD[c.tur]
	var base: int = randi_range(int(d.coin[0]), int(d.coin[1]))
	var n := maxi(1, roundi(base * (1.0 + oyun.zaman.gun * 0.03) * (1.0 + oyun.env.sv * 0.04)))
	oyun.env.vio += n
	for k in 12: oyun.parca(c.position + Vector2(0, -6), Vector2(randf_range(-25, 25), -30 - randf() * 40), 0.7, Color("#ffd84a") if k % 3 else Color("#fff4b0"))
	oyun.env.mesaj("%s yenildi · +%d Vio" % [c.tur, n])
	if oyun.env.has_method("vio_guncelle"): oyun.env.vio_guncelle()

func duyur(a: String, b: String) -> void:
	ilan.text = a
	ilan_alt.text = b
	ilan_t = 3.5

# ------------------------------------------------------------------ kişiler yardım eder: Börü savaşır, Zümrüt büyü yapar, Kemal can verir
const YARDIM := {"alp": "Ben de varım evlat! Sırtını bana ver!", "witch": "Bu ışık bu dünyanın değil… Kazanım hazır!", "ekin": "Yanıma gel evlat, yaralarını sarayım."}
const YARDIM_B := {"alp": "Savaşçı Börü savaşa katıldı", "witch": "Cadı Zümrüt büyü yapıyor", "ekin": "Yaşlı Kemal yaralarını sarıyor"}

func _yardimcilar(dt: float) -> void:
	var P = oyun.oyuncu
	var ys := _canli()
	for n in oyun.kisiler:
		var k: String = str(n.K.get("k", ""))
		if not YARDIM.has(k): continue
		var ev := Vector2(n.K.x, n.K.y)
		var Y: Dictionary = yardim.get(n, {})
		if Y.is_empty():
			var yakin: bool = P.position.distance_to(ev) < 352.0
			for c in ys:
				if c.position.distance_to(ev) < 320.0: yakin = true
			if not yakin: continue
			Y = {cd = 1.0, ev = ev}
			yardim[n] = Y
			oyun.yazi(n.position + Vector2(0, -34), YARDIM[k], Color("#f0e0ff"), 9)
			oyun.env.mesaj(YARDIM_B[k])
		Y.cd -= dt
		if k == "alp":
			var h = null
			var bd := 256.0
			for c in ys:
				var dd: float = c.position.distance_to(ev)
				if dd < bd: bd = dd; h = c
			if h == null:
				_yuru(n, ev, dt)
				continue
			if n.position.distance_to(h.position) > 18.0: _yuru(n, h.position, dt)
			elif Y.cd <= 0.0:
				Y.cd = 1.0
				h.vuruldu(maxi(1, roundi(float(P.silah_v().dmg) * 1.1)), (h.position - n.position).normalized())
		elif k == "witch":
			if Y.cd > 0.0: continue
			for c in ys:
				if c.position.distance_to(n.position) < 272.0:
					Y.cd = 3.5
					Y.isin = {a = n.position + Vector2(0, -18), b = c.position + Vector2(0, -6), t = 0.35}
					c.vuruldu(maxi(1, roundi(float(P.silah_v().dmg) * 1.4)), (c.position - n.position).normalized())
					break
		elif k == "ekin":
			if Y.cd > 0.0: continue
			if P.position.distance_to(n.position) < 160.0 and P.hp < P.hp_max:
				Y.cd = 5.0
				var art := roundf(P.hp_max * 0.08)
				P.hp = minf(P.hp_max, P.hp + art)
				oyun.can_guncelle(P.hp, P.hp_max)
				oyun.yazi(P.position + Vector2(0, -26), "+%d" % int(art), Color("#8fe86a"), 11)

func _yuru(n, hedef: Vector2, dt: float) -> void:
	var v: Vector2 = hedef - n.position
	if v.length() < 2.0: return
	n.position += v.normalized() * minf(v.length(), 90.0 * dt)

## saldırı bitince Börü yerine yürüyerek döner
func _yardimcilar_don(dt: float) -> void:
	if yardim.is_empty(): return
	for n in yardim.keys():
		if not is_instance_valid(n):
			yardim.erase(n); continue
		var ev: Vector2 = yardim[n].ev
		_yuru(n, ev, dt)
		if n.position.distance_to(ev) < 2.0:
			n.position = ev
			yardim.erase(n)

# ------------------------------------------------------------------ çizim: mor zerreler, ışık sütunları, Zümrüt'ün ışını
func _ciz() -> void:
	var al: float = ATK.a if ATK != null else maxf(0.0, FADE)
	var P: Vector2 = oyun.oyuncu.position
	var tm := Time.get_ticks_msec() / 1000.0
	for k in 60:
		var an := k * 2.4
		var rr := float(k * 53 % 100) / 100.0 * 360.0
		var yy := fmod(tm * 14.0 + k * 37, 40.0)
		ciz.draw_rect(Rect2(roundf(P.x + cos(an) * rr), roundf(P.y + sin(an) * rr * 0.7 - yy), 1, 1), Color("#e0b0ff" if k % 2 else "#a050ff", al))
	if ATK == null: return
	for q in ATK.pend:
		if q.t > 0.7: continue
		var k: float = 1.0 - q.t / 0.7
		var x := roundf(q.p.x); var y := roundf(q.p.y)
		ciz.draw_rect(Rect2(x - 3, y - 220, 6, 220), Color("#c070ff", 0.35 + 0.5 * k))
		ciz.draw_rect(Rect2(x - 1, y - 220, 2, 220), Color("#f4e0ff", 0.35 + 0.5 * k))
		ciz.draw_set_transform(Vector2(x, y + 1), 0, Vector2(1, 0.4))
		ciz.draw_arc(Vector2.ZERO, 4.0 + k * 8.0, 0, TAU, 20, Color("#e0b0ff", 0.6 * k), 1.0)
		ciz.draw_set_transform(Vector2.ZERO)
	for n in yardim:
		var Y: Dictionary = yardim[n]
		if Y.has("isin") and Y.isin.t > 0.0:
			Y.isin.t -= get_process_delta_time()
			ciz.draw_line(Y.isin.a, Y.isin.b, Color("#9aff7a", 0.8), 3.0)
			ciz.draw_line(Y.isin.a, Y.isin.b, Color("#e0a0ff"), 1.0)

func kayit() -> Dictionary:
	return {n = sira, c = sayi, o = oldurulen, k = konuk}

func yukle(d: Dictionary) -> void:
	ATK = null
	sayi = int(d.get("c", 0))
	oldurulen = d.get("o", {})
	konuk = bool(d.get("k", false))
	if int(d.get("n", 0)) > 0: sira = int(d.n)
	else: sira = _siradan(oyun.zaman.gun + 1 if oyun.zaman.dk >= 1260.0 else oyun.zaman.gun)
