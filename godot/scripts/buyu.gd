## Mor mana ve asalar (web v77 mana, STAFF, cast, fire, tickShots; Buz asası dondurur, Yıldırım asası zincirlenir).
## Mana ikinci adada ya da Efsun'la tanışınca (ya da mana iksiri içince) açılır; kendiliğinden dolar (1,5/sn), mana iksiri +60.
## Asa elindeyken vuruş tuşu büyü atar: en yakın, önündeki (ya da yakındaki saldırgan) yaratığa ya da baktığın yöne.
extends Node2D

var oyun
var mana := 0.0
var acik := false            # web manaOn
var scd := 0.0
var shots: Array = []
var bar: ProgressBar
var bar_yazi: Label
const STAFF := {
	"Ateş asası": {cost = 12, cd = 0.55, dmg = 42, spd = 280, range = 270, c1 = "#ffd060", c2 = "#ff5a2a", sz = 4, use = "ateş topu atar (mana)"},
	"Buz asası": {cost = 16, cd = 0.7, dmg = 34, spd = 300, range = 280, c1 = "#e8f8ff", c2 = "#5ab0f0", freeze = 3.0, sz = 3, use = "buz oku atar (mana)"},
	"Yıldırım asası": {cost = 22, cd = 0.8, dmg = 72, spd = 440, range = 300, c1 = "#fff8a0", c2 = "#a0c8ff", chain = 3, line = true, trail = 0.5, use = "zincirleme yıldırım (mana)"}}

## ateşli silahlar (web v78 GUNS): her silahın kendi mermisi; pompalı beş saçma
const GUNS := {
	"Tabanca": {ammo = "Tabanca mermisi", cd = 0.42, dmg = 44, n = 1, spread = 0.0, S = {c1 = "#fff4b0", c2 = "#ffb030", spd = 640, range = 340, line = true, trail = 0.08}},
	"Pompalı": {ammo = "Pompalı fişeği", cd = 1.05, dmg = 24, n = 5, spread = 0.26, S = {c1 = "#fff0c0", c2 = "#ff9a30", spd = 560, range = 210, line = true, trail = 0.05}}}
const KUTU := {"Tabanca mermisi": 10, "Pompalı fişeği": 6}   # bir yapışta bir kutu
## yaylar ve oklar (web v249; data/yay.json): her atış bir ok ve yayın dayanıklılığından 1; çantadaki en güçlü ok (etkili ok önce) atılır
var YAY := {}
var OKLAR: Array = []
var VERIM := {}
var secili_ok := ""          # çantada "Yayla bunu at" ile seçilen ok
var ok_uyari := ""
## sapan ve bola (web v3.68 SL): sapan bir Taş harcar, kuşu sersemletir, ağaçtan meyve düşürür; bola harcanmaz, canlıyı 5 sn yavaşlatır
const SL := {"Sapan": {dmg = 5, cd = 0.8, rng = 200, spd = 330, dur = 25, ammo = "Taş"}, "Bola": {dmg = 3, cd = 1.2, rng = 180, spd = 300, dur = 25}}

func kur(o) -> void:
	oyun = o
	z_index = 20
	for n in STAFF:
		o.env.G.tools[n] = {kind = "staff", time = 1, dur = 999, tier = 0, use = STAFF[n].use}
	for n in GUNS:
		o.env.G.tools[n] = {kind = "gun", time = 1, dur = 999, tier = 0, use = "ateş eder (%s)" % GUNS[n].ammo}
	var Y: Dictionary = o._json("res://data/yay.json")
	YAY = Y.yaylar; OKLAR = Y.oklar; VERIM = Y.verim
	for n in YAY:
		o.env.G.tools[n] = {kind = "bow", time = YAY[n].cd, dur = YAY[n].dur, tier = 0, use = "ok atar (ok harcar)"}
	for n in SL:
		o.env.G.tools[n] = {kind = "sling", time = SL[n].cd, dur = SL[n].dur, tier = 0, use = "taş atar" if n == "Sapan" else "fırlatılır, yavaşlatır"}
	bar = ProgressBar.new()
	bar.custom_minimum_size = Vector2(180, 12)
	bar.show_percentage = false
	bar.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	var bg := StyleBoxFlat.new(); bg.bg_color = Color("#2a1a3a"); bg.border_color = Color("#0b0f0a"); bg.set_border_width_all(2)
	var fg := StyleBoxFlat.new(); fg.bg_color = Color("#a060e8")
	bar.add_theme_stylebox_override("background", bg)
	bar.add_theme_stylebox_override("fill", fg)
	bar.tooltip_text = "Mor mana"
	bar_yazi = Label.new()
	bar_yazi.add_theme_font_size_override("font_size", 9)
	bar_yazi.position = Vector2(6, -2)
	bar.add_child(bar_yazi)
	var kutu: Node = o.enerji_cubugu.get_parent()
	kutu.add_child(bar)
	kutu.move_child(bar, o.enerji_cubugu.get_index() + 1)
	bar.visible = false

func acik_mi() -> bool:
	return acik or oyun.ada == 2

func en_cok() -> float:
	return oyun.stat("mana")

func ac() -> void:
	acik = true

## mana iksiri içildi (web eat → +60 mana)
func iksir() -> void:
	acik = true
	mana = minf(en_cok(), mana + 60.0)
	oyun.yazi(oyun.oyuncu.position + Vector2(0, -34), "+60 mana", Color("#c9a0ff"), 9)

func asa_mi(n: String) -> bool:
	return STAFF.has(n) or GUNS.has(n) or YAY.has(n) or SL.has(n)

func ok_mu(n: String) -> bool:
	for A in OKLAR:
		if str(A[0]) == n: return true
	return false

## çantada oka dokunmak: yayla bunu at / seçimi kaldır
func ok_sec(n: String) -> void:
	if secili_ok == n:
		secili_ok = ""
		oyun.env.mesaj("Ok seçimi kaldırıldı: yay en güçlü oku atar")
	else:
		secili_ok = n; ok_uyari = ""
		oyun.env.mesaj("Yayla bunu at: %s" % n)

func _ok() -> Array:
	if secili_ok != "":
		for A in OKLAR:
			if str(A[0]) == secili_ok and oyun.env.adet(secili_ok) > 0: return A
	for A in OKLAR:
		if oyun.env.adet(str(A[0])) > 0: return A
	return []

## web shot: yay körse atmaz; ok yoksa "Ok yok"
func _yay(h: String) -> void:
	var B: Dictionary = YAY[h]
	var P: Vector2 = oyun.oyuncu.position
	var A: Array = _ok()
	if A.is_empty():
		oyun.yazi(P + Vector2(0, -28), "Ok yok", Color("#ffb060"), 9)
		scd = 0.4
		return
	if not oyun.env.alet_kullan(h):
		oyun.yazi(P + Vector2(0, -28), "Yay köreldi, bilet", Color("#ffb060"), 9)
		scd = 0.4
		return
	if secili_ok != "" and str(A[0]) != secili_ok and ok_uyari != secili_ok:
		ok_uyari = secili_ok
		oyun.yazi(P + Vector2(0, -34), "%s bitti · %s" % [secili_ok, A[0]], Color("#ffd060"), 9)
	oyun.env.eksilt(str(A[0]), 1)
	scd = float(B.cd)
	var lv := _carpan()
	var dm := maxi(1, int(round(float(B.dmg) * float(A[1]) * lv)))
	var S := {c1 = str(A[2]), c2 = "#e8d8b0", spd = float(B.spd), range = float(B.rng), line = true, trail = 0.04}
	if A[3] != null:
		S.efx = str(A[3]); S.edm = float(B.dmg) * float(A[1]) * lv
	_ates(S, dm, _nisan(), P + Vector2(0, -10), [], float(B.rng))

func _carpan() -> float:
	return oyun.stat("dmg") * (1.55 if oyun.sk("W4") else (1.4 if oyun.sk("W3") else (1.25 if oyun.sk("W2") else (1.1 if oyun.sk("W1") else 1.0))))

## web shoot: mermi yoksa ateş etmez; hedef büyüyle aynı seçilir
func _silah(h: String) -> void:
	var G: Dictionary = GUNS[h]
	var P: Vector2 = oyun.oyuncu.position
	if oyun.env.adet(G.ammo) <= 0:
		oyun.yazi(P + Vector2(0, -28), "%s yok" % G.ammo, Color("#ffb060"), 9)
		scd = 0.5
		return
	oyun.env.eksilt(G.ammo, 1)
	scd = float(G.cd)
	var dm := int(round(float(G.dmg) * _carpan()))
	var t := _nisan()
	var s := P + Vector2(0, -10)
	var a0 := (t - s).angle()
	for i in int(G.n):
		var da := 0.0 if int(G.n) == 1 else (float(i) / (int(G.n) - 1) - 0.5) * 2.0 * float(G.spread)
		_ates(G.S, dm, s + Vector2.from_angle(a0 + da) * 100.0, s, [], float(G.S.range))
	for k in 5: oyun.parca(P + oyun.oyuncu.bakis * 10.0 + Vector2(0, -10), Vector2(randf_range(-20, 20), -10 - randf() * 20), 0.25, Color("#d8d0c0"))

## vuruş tuşu: elde asa varsa büyü atılır (web attack → cast)
func at() -> void:
	var h: String = oyun.env.elde()
	if scd > 0.0: return
	if GUNS.has(h):
		_silah(h)
		return
	if YAY.has(h):
		_yay(h)
		return
	if SL.has(h):
		_sapan(h)
		return
	if not STAFF.has(h): return
	var S: Dictionary = STAFF[h]
	acik = true
	var P: Vector2 = oyun.oyuncu.position
	if mana < float(S.cost):
		oyun.yazi(P + Vector2(0, -28), "Mana yetmiyor", Color("#c9a0ff"), 9)
		scd = 0.4
		return
	mana -= float(S.cost)
	scd = float(S.cd)
	var dm := int(round(float(S.dmg) * _carpan()))
	_ates(S, dm, _nisan(), P + Vector2(0, -10), [], float(S.range))

func _nisan() -> Vector2:
	var P: Vector2 = oyun.oyuncu.position
	var f: Vector2 = oyun.oyuncu.bakis.normalized()
	var en = null
	var bd := 1e9
	for a in oyun.canlilari_ver():
		if a.olu >= 0.0: continue
		var dv: Vector2 = a.position - P
		var d := dv.length()
		if d > 240.0 or d < 1.0: continue
		var sal: bool = str(a.D.temper) == "saldırgan"
		if dv.dot(f) / d < 0.3 and not (sal and d < 120.0): continue
		var s := d - (60.0 if sal else 0.0)
		if s < bd:
			bd = s
			en = a
	if en != null: return en.position + Vector2(0, -6)
	return P + f * 100.0 + Vector2(0, -8)

func _sapan(h: String) -> void:
	var B: Dictionary = SL[h]
	var P: Vector2 = oyun.oyuncu.position
	if B.has("ammo") and oyun.env.adet(str(B.ammo)) <= 0:
		oyun.yazi(P + Vector2(0, -28), "Taş yok", Color("#ffb060"), 9)
		scd = 0.4
		return
	if not oyun.env.alet_kullan(h):
		scd = 0.4
		return
	if B.has("ammo"): oyun.env.eksilt(str(B.ammo), 1)
	scd = float(B.cd)
	var dm := maxi(1, int(round(float(B.dmg) * _carpan())))
	var S := {c1 = "#a8a29a" if h == "Sapan" else "#c8a878", c2 = "#6a6460", spd = float(B.spd), range = float(B.rng), sz = 2, trail = 0.1, sl = h}
	var t := _nisan()
	# sapan: önünde canlı yoksa en yakın meyveli ağaca (menzil içinde) atar
	if h == "Sapan" and t.distance_to(P + oyun.oyuncu.bakis.normalized() * 100.0 + Vector2(0, -8)) < 1.0:
		var ag = _meyveli_agac(P, float(B.rng))
		if ag != null:
			t = ag.position + Vector2(0, -22)
			S.agac = ag
			S.range = P.distance_to(t) + 4.0
	_ates(S, dm, t, P + Vector2(0, -10), [], float(S.range))

func _meyveli_agac(P: Vector2, r: float):
	var en = null
	var bd := r
	for ag in oyun.agaclar:
		if not ag.visible or ag.meyve_cd > 0.0: continue
		var A = oyun.env.G.trees.get(ag.tur, {})
		if A.get("fruit", null) == null: continue
		var d: float = ag.position.distance_to(P)
		if d < bd and (ag.position - P).dot(oyun.oyuncu.bakis) > 0.0:
			bd = d; en = ag
	return en

func _ates(S: Dictionary, dm: int, t: Vector2, s: Vector2, hs: Array, menzil: float) -> void:
	var dv := t - s
	if dv.length() < 0.5: dv = oyun.oyuncu.bakis
	var yon := dv.normalized()
	if hs.is_empty(): oyun.oyuncu._yon_sec(yon)
	shots.append({p = s, v = yon * float(S.spd), left = menzil, S = S, dm = dm, hs = hs})

func _process(dt: float) -> void:
	if oyun == null: return
	var on: bool = acik_mi() and not oyun.basta
	bar.visible = on
	if on:
		if not oyun.ev.acik and not oyun.konusma.visible:
			mana = minf(en_cok(), mana + 1.5 * dt)
		bar.max_value = en_cok()
		bar.value = mana
		bar_yazi.text = "Mana %d/%d" % [int(mana), int(en_cok())]
	scd = maxf(0.0, scd - dt)
	_donuk(dt)
	if shots.is_empty(): return
	queue_redraw()
	var ln: Array = oyun.canlilari_ver()
	for i in range(shots.size() - 1, -1, -1):
		var s: Dictionary = shots[i]
		var S: Dictionary = s.S
		var m: Vector2 = s.v * dt
		if randf() < float(S.get("trail", 0.7)):
			oyun.parca(s.p, Vector2(randf_range(-10, 10), randf_range(-10, 10)), 0.25, Color(S.c1) if randf() < 0.5 else Color(S.c2))
		# uzun karede atış canlının içinden geçip gitmesin: 8 piksellik adımlarla ilerler
		var hit = null
		var adim := maxi(1, int(ceil(m.length() / 8.0)))
		for st in adim:
			s.p += m / float(adim)
			for a in ln:
				if not is_instance_valid(a) or a.olu >= 0.0 or s.hs.has(a): continue
				if (a.position + Vector2(0, -6)).distance_to(s.p) < float(a.D.r) + 7.0:
					hit = a
					break
			if hit != null: break
		s.left -= m.length()
		if hit != null:
			_vur(s, hit, ln)
			shots.remove_at(i)
			continue
		if s.left <= 0.0 and S.has("agac"):
			var ag = S.agac
			if is_instance_valid(ag) and ag.meyve_cd <= 0.0:
				var A = oyun.env.G.trees.get(ag.tur, {})
				oyun.toplama.dusur(str(A.fruit), ag.position + Vector2(randf_range(-8, 8), -2))
				ag.meyve_cd = float(oyun.env.G.fruitRe)
				ag.vurulma()
			elif is_instance_valid(ag): oyun.env.mesaj("Bu ağaçta meyve kalmadı", true)
			shots.remove_at(i)
			continue
		if s.left <= 0.0 or oyun.engel(s.p + Vector2(0, 8), 1.0):
			for k in 6: oyun.parca(s.p, Vector2(randf_range(-25, 25), randf_range(-25, 25)), 0.3, Color(S.c2))
			shots.remove_at(i)

func _vur(s: Dictionary, a, ln: Array) -> void:
	var S: Dictionary = s.S
	if S.has("freeze"):
		var now := Time.get_ticks_msec() / 1000.0
		if float(a.get_meta("fimm", 0.0)) <= now:
			var fz: float = float(S.freeze) * (0.5 if a.boss else 1.0)
			a.donuk = maxf(a.donuk, fz)
			a.set_meta("fimm", now + fz + 3.0)
	var dm2: int = oyun.kritik(int(s.dm), oyun.env.elde(), a) if not S.has("sl") else int(s.dm)
	a.vuruldu(dm2, s.v.normalized())
	if S.has("efx"): a.etki_ver(str(S.efx), float(S.edm))
	if S.get("sl", "") == "Sapan" and not a.boss and (bool(a.D.get("fly", false)) or _kus(a)): a.sersem = maxf(a.sersem, 3.0)
	if S.get("sl", "") == "Bola" and not a.boss: a.yavas = 5.0
	for k in 10: oyun.parca(s.p, Vector2(randf_range(-40, 40), randf_range(-40, 40)), 0.35, Color(S.c1) if k % 2 else Color(S.c2))
	if int(S.get("chain", 0)) > 0:
		var hs: Array = s.hs.duplicate()
		hs.append(a)
		var nx = null
		var nd := 110.0
		for b in ln:
			if not is_instance_valid(b) or b.olu >= 0.0 or hs.has(b): continue
			var d: float = b.position.distance_to(a.position)
			if d < nd:
				nd = d
				nx = b
		if nx != null:
			var S2: Dictionary = S.duplicate()
			S2.chain = int(S.chain) - 1
			_ates(S2, int(round(float(s.dm) * 0.8)), nx.position + Vector2(0, -6), a.position + Vector2(0, -6), hs, 140.0)

## donmuş canlılar: buz mavisi (canli.gd donuk sürerken yerinden kıpırdamaz)
func _donuk(_dt: float) -> void:
	for a in oyun.canlilari_ver():
		if not is_instance_valid(a) or a.spr == null: continue
		a.spr.self_modulate = Color(0.7, 0.88, 1.35) if a.donuk > 0.0 else Color.WHITE

func _draw() -> void:
	var k := 0.6 + 0.4 * sin(Time.get_ticks_msec() / 1000.0 * 30.0)
	for s in shots:
		var S: Dictionary = s.S
		if S.get("line", false):
			draw_line(s.p, s.p - s.v.normalized() * 8.0, Color(S.c1), 2.0)
			continue
		var z := float(S.get("sz", 4))
		draw_circle(s.p, z, Color(S.c2))
		draw_circle(s.p, z / 2.0 + k, Color(S.c1))

func _kus(a) -> bool:
	for d in a.D.get("drops", []):
		if str(d.n).ends_with("tüyü"): return true
	return false

func kayit() -> Dictionary:
	return {m = int(round(mana)), a = acik, ok = secili_ok}

func yukle(d) -> void:
	if typeof(d) != TYPE_DICTIONARY: d = {}
	mana = float(d.get("m", 0))
	acik = bool(d.get("a", false))
	secili_ok = str(d.get("ok", ""))
