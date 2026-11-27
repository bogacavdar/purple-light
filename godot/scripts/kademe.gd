extends Node2D
## Silahların kademe kimliği (web v322tier; belge Aletler › Silahların kademe kimliği). Kılıç, savaş çekici, topuz, mızrak, balta, kazma
## ve yayın 7 kademesi: her kademenin kendi savuruş/vuruş/kiriş sesi (art/ses/kademe, web'in sentezinden), vuruş kıvılcımları ve halkası,
## Çelik ve üstünde elde parıltı, okların kademe resmi ve izi. Bir türde ilk kez daha yüksek kademe alınınca "Yeni kademe!" kartı ve kutlama.

var oyun
var halkalar: Array = []   # {p, t, r, c}
var BEST := {}             # tür → {t, n} (kayıt: v322)
var _bilgi := {}
var _el_t := 0.0

const MT := [["Mor kristal", 6, 0], ["Kara çelik", 5, 0], ["Çelik", 4, 0], ["Demir", 3, 0], ["Tunç", 2, 0], ["Bakır", 1, 0], ["Taş", 0, 0],
	["Çakmaktaşı", 1, 1], ["Granit", 2, 1], ["Timsah dişi", 3, 1], ["Gümüş", 4, 1], ["Kuvars", 4, 1], ["Ejder", 5, 1], ["Ametist", 6, 1], ["Obsidyen", 6, 1]]
const BOWT := {"Basit yay": [0, 0], "Odun yayı": [1, 0], "Sert odun yayı": [2, 0], "Sağlam odun yayı": [3, 0], "Güçlü odun yayı": [4, 0],
	"Kor odun yayı": [5, 0], "Kadim odun yayı": [6, 0], "Kemik yay": [1, 1], "Granit yayı": [2, 1], "Timsah dişi yayı": [3, 1],
	"Gümüş yayı": [4, 1], "Ejder yayı": [5, 1], "Ametist yayı": [6, 1]}
const RGB := ["#c8c4b8", "#ffbe8c", "#ffdc78", "#ebf0fa", "#c8e6ff", "#ff6e32", "#dcaaff"]
const SP := [["#c8c4b8", "#8d9196", "#e8e0d0"], ["#ffd0a0", "#ff9a4a", "#ffffff"], ["#ffe080", "#e8b040", "#ffffff"], ["#ffffff", "#dfe8f0", "#ffe8a0"],
	["#ffffff", "#bfe4ff", "#8ad0ff"], ["#ff8a3a", "#ffd060", "#ff4a1a"], ["#f0d8ff", "#c080ff", "#ffffff"]]
const EXTRA := [0, 2, 4, 6, 10, 14, 18]
const ARRT := {"Basit ok": 0, "Bakır ok": 1, "Tunç ok": 2, "Demir ok": 3, "Çelik ok": 4, "Kara çelik ok": 5, "Mor kristal ok": 6}
const ARRP := [["#8d9196", "#d8d0c0", "#b08a5a"], ["#d8783a", "#9a7a5a", "#a07a4a"], ["#e0a84a", "#9a7a5a", "#a07a4a"], ["#a8aeb8", "#3a8a5a", "#8a6a40"],
	["#eef4ff", "#f0ece4", "#7a5a3a"], ["#3a3a46", "#2a2a2a", "#4a3a30"], ["#c890ff", "#e8d8ff", "#3a2a5a"]]
const ARRG := ["", "", "", "", "#ffffff", "#ff6e28", "#dcaaff"]
const EFRGB := {"Alevli": ["#ff7a1a", "#ffd060"], "Zehirli": ["#6ad040", "#c8f090"], "Keskin": ["#e8303a", "#ff9a9a"]}

func kur(o) -> void:
	oyun = o
	z_index = 21

func _on(n: String) -> String:
	for p in ["Alevli ", "Zehirli ", "Keskin "]:
		if n.begins_with(p): return p.strip_edges()
	return ""

func _tur(b: String) -> String:
	if oyun.buyu != null and oyun.buyu.YAY.has(b): return "yay"
	var S: Dictionary = oyun.kusanma.get("silah", {})
	if S.has(b):
		var w: Dictionary = S[b]
		if w.kind == "hunt": return "mızrak"
		if w.get("mace") == "gurz": return "savaş çekici"
		if w.get("mace") == "topuz": return "topuz"
		return "kılıç"
	var T = oyun.env.G.tools.get(b, null)
	if T != null:
		if T.kind == "axe": return "balta"
		if T.kind == "pick": return "kazma"
	return ""

## web info: {n, tur, t, u} ya da boş
func bilgi(n: String) -> Dictionary:
	if n == "": return {}
	if _bilgi.has(n): return _bilgi[n]
	var b := n
	var on := _on(n)
	if on != "": b = n.substr(on.length() + 1)
	var tur := _tur(b)
	var r := {}
	if tur != "" and b != "Işın kılıcı":
		var t := -1; var u := 0
		if tur == "yay":
			if BOWT.has(b): t = int(BOWT[b][0]); u = int(BOWT[b][1])
		elif b == "Mızrak": t = 0
		else:
			for m in MT:
				if b.begins_with(str(m[0]) + " ") or b.begins_with(str(m[0]) + "ı "):
					t = int(m[1]); u = int(m[2]); break
		if t >= 0: r = {n = b, tur = tur, t = t, u = u}
	_bilgi[n] = r
	return r

func _ses(k: String, v := 1.0) -> void:
	if oyun.ses != null: oyun.ses.kademe(k, v)

## savuruş: kademenin ses katmanı
func savur(n: String) -> void:
	var I := bilgi(n)
	if not I.is_empty(): _ses("sw%d" % I.t)

## isabet: ses + kıvılcım (yakın dövüşte göğüs ile canlı arasında, web hitPos)
func isabet(n: String, p: Vector2, dm: int, k := 1.0) -> void:
	var I := bilgi(n)
	if I.is_empty(): return
	_ses("vur%d" % I.t, minf(1.0, 0.55 + dm / 50.0) * k)
	patla(int(I.t), p)

func patla(t: int, p: Vector2) -> void:
	var sp: Array = SP[t]
	for i in EXTRA[t]:
		var a := randf() * TAU
		var s := 40.0 + randf() * (60.0 + t * 12.0)
		oyun.parca(p, Vector2(cos(a), sin(a)) * s + Vector2(0, -20), 0.22 + randf() * 0.2 + t * 0.02, Color(sp[i % 3]))
	if t == 0:
		for i in 4: oyun.parca(p, Vector2(randf_range(-30, 30), -30 - randf() * 30), 0.35, Color("#8d9196") if i % 2 else Color("#c8c4b8"))
	if t >= 3: halkalar.append({p = p, t = 0.0, r = 5.0 + t, c = Color(RGB[t])})
	if t == 4: halkalar.append({p = p, t = 0.0, r = 3.0, c = Color.WHITE})
	if t == 5:
		for i in 6: oyun.parca(p + Vector2(randf_range(-4, 4), 0), Vector2(randf_range(-15, 15), -50 - randf() * 40), 0.5 + randf() * 0.3, Color("#ff6a2a") if i % 2 else Color("#ffd060"))
	if t == 6:
		for i in 8:
			var a := randf() * TAU
			oyun.parca(p, Vector2(cos(a), sin(a)) * (30.0 + randf() * 50.0), 0.55, Color("#c080ff") if i % 2 else Color.WHITE)
		halkalar.append({p = p, t = 0.0, r = 14.0, c = Color("#c88cff")})

## yay: kiriş sesi ve namludan kıvılcım
func yay_at(h: String, a: float) -> void:
	var I := bilgi(h)
	if I.is_empty(): return
	var t: int = I.t
	_ses("kiris%d" % t)
	var P: Vector2 = oyun.oyuncu.position + Vector2(cos(a) * 10.0, -10.0 + sin(a) * 10.0)
	var cs: Array = SP[t] if t >= 5 else ["#e8e0d0", "#ffffff", "#c8c0b0"]
	for i in [3, 3, 4, 5, 6, 8, 9][t]:
		oyun.parca(P, Vector2(cos(a) * 40.0 + randf_range(-20, 20), sin(a) * 40.0 + randf_range(-20, 20) - 6), 0.18 + t * 0.02, Color(cs[i % 3]))

## okun kademesi ve etkisi
func ok_bilgi(an: String) -> Dictionary:
	var on := _on(an)
	var b := an.substr(on.length() + 1) if on != "" else an
	return {t = int(ARRT.get(b, 0)), on = on}

## ok uçarken izi ve resmi (buyu.gd _draw)
func ok_ciz(c: CanvasItem, p: Vector2, v: Vector2, A: Dictionary) -> void:
	var t: int = A.t
	var a := v.angle()
	var d := Vector2.from_angle(a)
	var L: float = [4, 6, 7, 8, 10, 12, 16][t]
	var ic := Color.WHITE if A.on != "" else Color(RGB[t])
	ic.a = 0.55 if t >= 4 else 0.35
	c.draw_line(p - d * 7.0, p - d * (7.0 + L), ic, 1.0)
	var P: Array = ARRP[t]
	var hw := 0.8 + t * 0.08
	var dn := d.orthogonal()
	var at := func(x: float, y: float) -> Vector2: return p + d * x + dn * y
	c.draw_line(at.call(-7.5, 0), at.call(2.5, 0), Color("#1a140c"), 2.0)
	c.draw_line(at.call(-7, 0), at.call(2, 0), Color(P[2]), 1.0)
	c.draw_colored_polygon(PackedVector2Array([at.call(6.8, 0), at.call(1.6, -2 * hw - 0.6), at.call(1.6, 2 * hw + 0.6)]), Color("#1a140c"))
	c.draw_colored_polygon(PackedVector2Array([at.call(6, 0), at.call(2, -1.8 * hw), at.call(2, 1.8 * hw)]), Color(P[0]))
	c.draw_colored_polygon(PackedVector2Array([at.call(-4, 0), at.call(-7.6, -2.2), at.call(-6.4, 0), at.call(-7.6, 2.2)]), Color(P[1]))
	if A.on != "": c.draw_line(at.call(-5, 0), at.call(-3, 0), Color(EFRGB[A.on][0]), 1.0)
	if ARRG[t] != "":
		var g := Color(ARRG[t]); g.a = 0.35
		c.draw_circle(at.call(4, 0), 3.0 + t * 0.4, g)
	if randf() < 0.6 * get_process_delta_time() * 60.0:
		if A.on != "":
			var E: Array = EFRGB[A.on]
			oyun.parca(p - d * 6.0, Vector2(randf_range(-7, 7), -18.0 if A.on == "Alevli" else randf_range(-7, 7)), 0.3, Color(E[0]) if randf() < 0.5 else Color(E[1]))
		elif t == 5: oyun.parca(p - d * 5.0, Vector2(randf_range(-6, 6), -14), 0.35, Color("#ff6a2a") if randf() < 0.5 else Color("#ffd060"))
		elif t == 6: oyun.parca(p - d * 5.0, Vector2(randf_range(-5, 5), randf_range(-5, 5)), 0.4, Color("#d8b0ff") if randf() < 0.5 else Color.WHITE)

var _ok_ses := 0
func ok_isabet(A: Dictionary, p: Vector2, dm: int) -> void:
	var now := Time.get_ticks_msec()
	if now - _ok_ses > 40:
		_ok_ses = now
		_ses("vur%d" % A.t, minf(1.0, 0.55 + dm / 50.0) * 0.7)
	patla(int(A.t), p)

func _process(dt: float) -> void:
	if oyun == null or oyun.basta: return
	# Çelik ve üstü: elde parıltı (web heldFx)
	var h = oyun.env.elde()
	var I := bilgi(str(h)) if h != null else {}
	if not I.is_empty() and int(I.t) >= 4:
		var t: int = I.t
		var r := 0.8 if t == 4 else (4.0 if t == 5 else 5.0)
		if randf() < r * dt:
			var sg := -1.0 if oyun.oyuncu.bakis.x < 0 else 1.0
			var P: Vector2 = oyun.oyuncu.position + Vector2(sg * 8.0, -11.0)
			if t == 4: oyun.parca(P + Vector2(randf_range(-3, 3), randf_range(-3, 3)), Vector2.ZERO, 0.14, Color.WHITE)
			elif t == 5: oyun.parca(P + Vector2(randf_range(-2.5, 2.5), randf_range(-2.5, 2.5)), Vector2(randf_range(-3, 3), -16 - randf() * 10), 0.5, Color("#ff7a2a") if randf() < 0.5 else Color("#ffc040"))
			else: oyun.parca(P + Vector2(randf_range(-3.5, 3.5), randf_range(-3.5, 3.5)), Vector2(randf_range(-3, 3), -8), 0.6, Color("#d8b0ff") if randf() < 0.5 else Color.WHITE)
	if halkalar.is_empty(): return
	for i in range(halkalar.size() - 1, -1, -1):
		halkalar[i].t += dt
		if halkalar[i].t > 0.35: halkalar.remove_at(i)
	queue_redraw()

func _draw() -> void:
	for h in halkalar:
		if h.t < 0.0: continue
		var k: float = h.t / 0.35
		var c: Color = h.c; c.a = 0.8 * (1.0 - k)
		draw_arc(h.p, float(h.r) + k * 16.0, 0, TAU, 20, c, 1.5)

# ------------------------------------------------------------------ "Yeni kademe!" (web announceUp)
func _guc(n: String) -> float:
	if oyun.buyu != null and oyun.buyu.YAY.has(n): return float(oyun.buyu.YAY[n].dmg)
	var S: Dictionary = oyun.kusanma.get("silah", {})
	return float(S[n].dmg) if S.has(n) else 0.0

## envanter.ekle çağırır (eşya envantere girmeden önce)
func alindi(n: String) -> void:
	if oyun.basta or oyun.arena_mi(): return
	var I := bilgi(n)
	if I.is_empty(): return
	var b = BEST.get(I.tur, null)
	if b != null and int(I.t) <= int(b.t): return
	BEST[I.tur] = {t = I.t, n = I.n}
	if b == null: return
	var lab := "Yeni kademe!"
	if I.tur == "balta" or I.tur == "kazma":
		var pa := float(oyun.env.G.tools.get(b.n, {}).get("time", 0)); var pb := float(oyun.env.G.tools.get(I.n, {}).get("time", 0))
		if pa > 0 and pb > 0:
			var pc := int(round((pa / pb - 1.0) * 100.0))
			if pc > 0: lab += " · %%%d daha hızlı" % pc
	else:
		var a := _guc(str(b.n)); var c := _guc(str(I.n))
		if a > 0 and c > 0:
			var pc := int(round((c / a - 1.0) * 100.0))
			if pc > 0: lab += " · %%%d daha güçlü" % pc
	lab += " (öncekin: %s)" % b.n
	if oyun.duyuru != null and not oyun.duyuru.degistir(str(I.n), lab): oyun.duyuru.duyur(str(I.n), lab)
	if oyun.ses != null: oyun.ses.cal("level", 0.7)
	get_tree().create_timer(0.42).timeout.connect(func(): _ses("sw%d" % I.t))
	var P: Vector2 = oyun.oyuncu.position + Vector2(0, -8)
	var sp: Array = SP[I.t]
	for i in 28:
		var a := i / 28.0 * TAU
		var s := 70.0 + randf() * 30.0
		oyun.parca(P, Vector2(cos(a) * s, sin(a) * s * 0.6), 0.6, Color(sp[i % 3]))
	for i in 10: oyun.parca(P + Vector2(randf_range(-7, 7), 6), Vector2(randf_range(-4, 4), -30 - randf() * 30), 0.9, Color(sp[i % 3]))
	halkalar.append({p = P, t = 0.0, r = 26.0, c = Color(RGB[I.t])})
	halkalar.append({p = P, t = -0.08, r = 16.0, c = Color.WHITE})

## eldekilerden en iyileri (yeni oyun ve yüklemede; web fill)
func doldur() -> void:
	var L: Array = []
	for n in oyun.env.inv: if int(oyun.env.inv[n]) > 0: L.append(n)
	for k in oyun.kusam: if str(oyun.kusam[k]) != "": L.append(oyun.kusam[k])
	for n in L:
		var I := bilgi(str(n))
		if I.is_empty(): continue
		var b = BEST.get(I.tur, null)
		if b == null or int(I.t) > int(b.t): BEST[I.tur] = {t = I.t, n = I.n}

func kayit() -> Dictionary:
	return {b = BEST}

func yukle(d) -> void:
	BEST = {}
	if d is Dictionary and d.get("b") is Dictionary:
		for k in d.b:
			var o = d.b[k]
			if o is Dictionary and o.has("n") and float(o.get("t", -1)) >= 0: BEST[k] = {t = int(o.t), n = str(o.n)}
	doldur()
