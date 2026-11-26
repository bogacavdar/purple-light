## Özel vuruşlar (web v122 combo, CB; belge Sistemler › Özel vuruşlar). Girişler: çift tık (0,18 sn) → Çift vuruş; basılı tut (0,22 + 0,55 sn halka
## dolar), bırak → Güçlü vuruş; takla sırasında ya da hemen sonra (0,3 sn) tık → Takla vuruşu (3,5 sn'de bir); tık → takla (0,9 sn) → tık → Bitirici;
## vuruşun hareketi bittiği an tık (−0,08 … +0,26 sn) → Ritimli 2. vuruş, onun bitişinde yine tık → Ritimli 3. vuruş. Her silahın kendi hamleleri.
## ACT 1'de her hamle Börü'nün dersine kadar kapalıdır (kapalı hamle normal vuruş olur); ACT 2'de hepsi açık.
extends Node2D

var oyun
var P                       # oyuncu
var son_bas := 0.0          # lastDown
var son_tik := 0.0          # lastTap
var son_tur := ""           # lastTapType
var tik_once := 0.0         # tapBeforeDash
var takla_bas := 0.0
var takla_bit := -1e9
var tut = null              # {t0, full}
var cd := 0.0
var rh = null               # {stage, open}
var takla_cd_t := -1e9
var takla_msg := 0.0
var once_atilma := false
var aktif_tur := ""
const DBL := 0.18
const HOLD0 := 0.22
const FULL := 0.55
const AFTER := 0.3
const BEFORE := 0.9
const RW := 0.26
const RE := 0.08
const DASH_CD := 3.5
const DERS := {"dash": "Takla vuruşu", "double": "Çift vuruş", "c2": "Ritimli 2. vuruş", "c3": "Ritimli 3. vuruş", "charged": "Güçlü vuruş", "cdc": "Bitirici"}

## hamleler: n ad, st enerji, h vuruşlar [şekil, açı yarısı ya da en, menzil ekle, çarpan, gecikme sn, sersem], p itme px (eksi: geri)
const M := {
	"sword": {
		"c2": {n = "Ters kesik", st = 6, h = [["arc", 1.35, 8, 1.5, 0.0, 0.0]]},
		"c3": {n = "Ağır kesik", st = 10, h = [["arc", 1.1, 12, 2.6, 0.07, 0.5]]},
		"double": {n = "Çift kesik", st = 10, h = [["arc", 1.25, 6, 0.85, 0.0, 0.0], ["arc", 1.25, 6, 0.95, 0.12, 0.0]]},
		"charged": {n = "Dönen kesik", st = 18, h = [["circ", 0, 12, 2.2, 0.0, 0.0]]},
		"dash": {n = "Hamle", st = 12, p = 26, h = [["line", 8, 28, 1.6, 0.0, 0.0]]},
		"cdc": {n = "Kılıç fırtınası", st = 22, h = [["arc", 1.1, 8, 0.9, 0.0, 0.0], ["arc", 1.1, 8, 0.9, 0.08, 0.0], ["arc", 1.1, 8, 0.9, 0.16, 0.0], ["circ", 0, 14, 2.1, 0.3, 0.6]]}},
	"spear": {
		"c2": {n = "Derin dürtme", st = 6, h = [["line", 6, 24, 1.5, 0.0, 0.0]]},
		"c3": {n = "Delip geçme", st = 10, p = 14, h = [["line", 7, 44, 2.6, 0.0, 0.4]]},
		"double": {n = "Çifte dürtme", st = 10, h = [["line", 5, 14, 0.9, 0.0, 0.0], ["line", 5, 18, 1.15, 0.12, 0.0]]},
		"charged": {n = "Mızrak fırlatma", st = 18, h = [["line", 8, 240, 2.4, 0.0, 0.0]]},
		"dash": {n = "Koşarak saplama", st = 12, p = 30, h = [["line", 6, 34, 1.8, 0.0, 0.0]]},
		"cdc": {n = "Sırıkla sıçrama", st = 22, p = 38, h = [["circ", 0, 38, 2.2, 0.26, 1.0]]}},
	"axe": {
		"c2": {n = "Yan savuruş", st = 7, h = [["arc", 1.4, 8, 1.6, 0.0, 0.0]]},
		"c3": {n = "Kafa kıran", st = 11, h = [["arc", 0.7, 10, 3.0, 0.09, 0.8]]},
		"double": {n = "Geri savuruş", st = 10, h = [["arc", 1.5, 8, 1.25, 0.0, 0.0]]},
		"charged": {n = "Yere vurma", st = 18, h = [["circ", 0, 42, 2.6, 0.06, 1.0]]},
		"dash": {n = "Dönerek biçme", st = 12, h = [["circ", 0, 8, 1.5, 0.0, 0.0]]},
		"cdc": {n = "Ezici darbe", st = 22, h = [["arc", 0.65, 10, 3.2, 0.09, 0.6]]}},
	"gurz": {
		"c2": {n = "Yandan ezme", st = 8, h = [["arc", 1.3, 8, 1.7, 0.0, 0.0]]},
		"c3": {n = "Kafa ezen", st = 12, h = [["krater", 26, 16, 3.0, 0.1, 1.0]]},
		"double": {n = "Çifte ezme", st = 11, h = [["arc", 1.2, 6, 1.0, 0.0, 0.0], ["line", 8, 40, 1.3, 0.15, 0.0]]},
		"charged": {n = "Yer yarığı", st = 20, h = [["line", 10, 110, 2.4, 0.08, 1.2]]},
		"dash": {n = "Ezerek atılma", st = 13, p = 26, h = [["krater", 30, 0, 1.8, 0.16, 0.4]]},
		"cdc": {n = "Deprem çekici", st = 24, h = [["krater", 22, 20, 1.2, 0.0, 0.0], ["krater", 26, 45, 1.6, 0.15, 0.0], ["krater", 30, 70, 2.4, 0.3, 1.2]]}},
	"topuz": {
		"c2": {n = "Hızlı darbe", st = 5, h = [["arc", 0.9, 6, 1.4, 0.0, 0.0]]},
		"c3": {n = "Çan çalan", st = 8, h = [["arc", 0.9, 8, 2.2, 0.05, 0.7]]},
		"double": {n = "Üçlü darbe", st = 9, h = [["arc", 0.6, 4, 0.7, 0.0, 0.0], ["arc", 0.6, 4, 0.7, 0.08, 0.0], ["arc", 0.6, 4, 0.7, 0.16, 0.0]]},
		"charged": {n = "Bumerang", st = 16, h = [["line", 8, 200, 1.6, 0.0, 0.0], ["line", 8, 200, 1.6, 0.45, 0.0]]},
		"dash": {n = "Zikzak", st = 10, p = 20, h = [["yakin", 40, 0, 1.2, 0.0, 0.0], ["yakin", 40, 0, 1.2, 0.15, 0.0]]},
		"cdc": {n = "Kombo patlatma", st = 20, h = [["patlat", 0.9, 8, 1.5, 0.0, 0.0]]}},
	"fist": {
		"c2": {n = "Kroşe", st = 5, h = [["arc", 1.0, 8, 1.5, 0.0, 0.0]]},
		"c3": {n = "Aparkat", st = 9, h = [["arc", 0.8, 10, 2.6, 0.0, 0.6]]},
		"double": {n = "Çifte yumruk", st = 8, h = [["line", 6, 4, 0.85, 0.0, 0.0], ["line", 6, 6, 0.95, 0.1, 0.0]]},
		"charged": {n = "Güçlü yumruk", st = 16, h = [["arc", 0.8, 10, 3.0, 0.0, 0.6]]},
		"dash": {n = "Omuz atma", st = 10, p = 26, h = [["line", 8, 8, 1.3, 0.0, 0.0]]},
		"cdc": {n = "Tekme kombosu", st = 20, h = [["arc", 0.9, 8, 0.75, 0.0, 0.0], ["arc", 0.9, 8, 0.75, 0.07, 0.0], ["arc", 0.9, 8, 0.75, 0.14, 0.0], ["arc", 0.9, 8, 0.75, 0.21, 0.0], ["arc", 1.0, 12, 1.7, 0.32, 0.5]]}},
	"torch": {
		"c2": {n = "Kor savuruşu", st = 7, h = [["arc", 1.3, 8, 1.6, 0.0, 0.0]]},
		"c3": {n = "Alev kesiği", st = 11, h = [["circ", 36, 0, 2.4, 0.0, 0.0]]},
		"double": {n = "Alev savuruşu", st = 10, h = [["arc", 1.3, 8, 1.5, 0.0, 0.0]]},
		"charged": {n = "Ateş çemberi", st = 18, h = [["circ", 40, 0, 2.4, 0.0, 0.0]]},
		"dash": {n = "Ateşli hamle", st = 12, p = 24, h = [["line", 7, 24, 1.8, 0.0, 0.0]]},
		"cdc": {n = "Alev patlaması", st = 22, h = [["circ", 52, 0, 3.0, 0.12, 0.6]]}},
	"bow": {
		"c2": {n = "Hızlı atış", st = 5, a = [[0.9, 0.0, 0.0], [0.9, 0.0, 0.11]]},
		"c3": {n = "Delici ok", st = 8, a = [[2.6, 0.0, 0.0]], spd = 1.3},
		"double": {n = "Çift ok", st = 8, a = [[1.0, -0.08, 0.0], [1.0, 0.08, 0.0]]},
		"charged": {n = "Gergin atış", st = 14, a = [[3.0, 0.0, 0.0]], spd = 1.2, rng = 1.3},
		"dash": {n = "Geri sıçrayıp atış", st = 10, p = -24, a = [[1.5, 0.0, 0.0]]},
		"cdc": {n = "Ok yelpazesi", st = 18, a = [[0.9, -0.4, 0.0], [0.9, -0.2, 0.0], [0.9, 0.0, 0.0], [0.9, 0.2, 0.0], [0.9, 0.4, 0.0]]}},
	"staff": {
		"c2": {n = "İkiz atış", mana = 1.4, a = [[1.2, -0.08, 0.0], [1.2, 0.08, 0.0]]},
		"c3": {n = "Güç topu", mana = 2.2, a = [[2.8, 0.0, 0.0]], sz = 1.8},
		"double": {n = "Üçlü atış", mana = 2.0, a = [[1.0, -0.22, 0.0], [1.0, 0.0, 0.0], [1.0, 0.22, 0.0]]},
		"charged": {n = "Büyük büyü", mana = 3.0, a = [[3.0, 0.0, 0.0]], sz = 2.2, spd = 0.8, rng = 1.2},
		"dash": {n = "Kaçarken atış", mana = 1.5, a = [[0.9, -0.12, 0.0], [0.9, 0.12, 0.0]]},
		"cdc": {n = "Büyü halkası", mana = 4.0, a = [[1.1, 0.0, 0.0], [1.1, 0.785, 0.0], [1.1, 1.571, 0.0], [1.1, 2.356, 0.0], [1.1, 3.142, 0.0], [1.1, 3.927, 0.0], [1.1, 4.712, 0.0], [1.1, 5.498, 0.0]]}},
	"gun": {
		"c2": {n = "Seri atış", ammo = 2, a = [[1.1, 0.0, 0.0], [1.1, 0.0, 0.09]]},
		"c3": {n = "Delici mermi", ammo = 1, a = [[3.2, 0.0, 0.0]], spd = 1.48, rng = 1.65},
		"double": {n = "Çift atış", ammo = 2, a = [[1.0, 0.0, 0.0], [1.0, 0.0, 0.11]]},
		"charged": {n = "Nişanlı atış", ammo = 1, a = [[3.0, 0.0, 0.0]], spd = 1.4, rng = 1.53},
		"dash": {n = "Kayarak atış", ammo = 3, a = [[0.9, -0.2, 0.0], [0.9, 0.0, 0.0], [0.9, 0.2, 0.0]]},
		"cdc": {n = "Şarjör boşaltma", ammo = 5, a = [[0.9, 0.0, 0.0], [0.9, 0.05, 0.08], [0.9, -0.05, 0.16], [0.9, 0.03, 0.24], [0.9, -0.03, 0.32]]}}}

func kur(o) -> void:
	oyun = o
	P = o.oyuncu
	z_index = 5

static func simdi() -> float:
	return Time.get_ticks_msec() / 1000.0

## eldekine göre hamle grubu (web kindOf)
func grup() -> String:
	var h: String = oyun.env.elde()
	var B = oyun.buyu
	if B != null:
		if B.STAFF.has(h): return "staff"
		if B.GUNS.has(h): return "gun"
		if B.YAY.has(h): return "bow"
		if B.SL.has(h): return ""
	var w: Dictionary = P.silah_v()
	var mc: String = str(w.get("mace", ""))
	if mc != "": return mc
	match str(w.get("kind", "")):
		"sword": return "sword"
		"hunt": return "spear"
		"axe": return "axe"
	if oyun.mesale != null and oyun.mesale.elde() != null: return "torch"
	return "fist"

func acik(tur: String) -> bool:
	if oyun.ada == 2 or oyun.kuzen.act2: return true
	if oyun.dovus != null and oyun.dovus.acik():
		var k: String = str(oyun.dovus.D.k)
		if k == tur or (k == "c3" and tur == "c2"): return true   # derste o hamle (ve ritim zincirinin öncesi) açık
	return oyun.kuzen.tanis.has("ders_" + tur)

## vuruş tuşuna basıldı (web pointerdown / Q)
func bas(d: Vector2) -> void:
	var t := simdi()
	var takla: bool = P.atilma > 0.0
	var sonra := t - takla_bit
	tut = {t0 = t, full = false}
	if cd > 0.0 and t - son_bas > 0.05:
		son_bas = t; rh = null
		return
	if rh != null and not takla and sonra >= AFTER:
		var R = rh
		rh = null
		if t >= R.open - RE and t <= R.open + RW:
			var ty: String = "c2" if R.stage == 1 else "c3"
			var rec := hamle(ty, d)
			if rec > 0.0:
				son_bas = t; son_tik = t; son_tur = ty
				if ty == "c2": rh = {stage = 2, open = t + rec}
				oyun.ult_ekle(5.0 if ty == "c2" else 10.0)
				return
		elif t < R.open - RE and t - son_tik >= DBL:
			son_bas = t
			return
	var tur := "tap"
	if takla or sonra < AFTER: tur = "cdc" if (tik_once > 0.0 and takla_bas - tik_once < BEFORE) else "dash"
	elif t - son_tik < DBL and son_tur == "tap": tur = "double"
	son_bas = t
	if tur == "tap":
		P.vur(d)
		son_tik = t; son_tur = "tap"
		rh = {stage = 1, open = t + _sure()}
		return
	if tur == "cdc": tik_once = 0.0
	if tur == "dash":
		if t - takla_cd_t < DASH_CD:
			if t - takla_msg > 0.8:
				takla_msg = t
				oyun.yazi(P.position + Vector2(0, -26), "%s %d sn" % [_ad("dash"), int(ceil(DASH_CD - (t - takla_cd_t)))], Color("#b8c0b0"), 9)
			P.vur(d)
			return
		takla_cd_t = t
	if hamle(tur, d) <= 0.0: P.vur(d)
	son_tik = t; son_tur = tur

func birak() -> void:
	if tut == null: return
	var full: bool = tut.full
	tut = null
	if full: hamle("charged", P.bakis)

func _ad(tur: String) -> String:
	var g := grup()
	if M.has(g) and M[g].has(tur): return str(M[g][tur].n)
	return DERS.get(tur, "")

## web tapDur: normal vuruşun süresi (ritim penceresi bunun bitişinde açılır)
func _sure() -> float:
	var g := grup()
	var B = oyun.buyu
	var h: String = oyun.env.elde()
	if g == "staff": return float(B.STAFF[h].cd)
	if g == "gun": return float(B.GUNS[h].cd)
	if g == "bow": return float(B.YAY[h].cd)
	return float(P.silah_v().cd)

func _process(dt: float) -> void:
	if P == null: return
	cd = maxf(0.0, cd - dt)
	var at: bool = P.atilma > 0.0
	if at and not once_atilma:
		var t := simdi()
		takla_bas = t
		tik_once = son_tik if (t - son_tik < BEFORE and son_tur == "tap") else 0.0
		tut = null
	if once_atilma and not at: takla_bit = simdi()
	once_atilma = at
	if tut != null and not tut.full and acik("charged") and simdi() - tut.t0 >= HOLD0 + FULL:
		tut.full = true
		for i in 14:
			var a := i / 14.0 * TAU
			oyun.parca(P.position + Vector2(cos(a) * 12.0, -6.0 + sin(a) * 9.0), Vector2(cos(a) * 20.0, sin(a) * 14.0), 0.35, Color("#ffe7a0"))
	queue_redraw()

func _draw() -> void:
	# basılı tutarken halka dolar
	if tut != null and acik("charged"):
		var k := clampf((simdi() - tut.t0 - HOLD0) / FULL, 0.0, 1.0)
		if k > 0.0:
			var c: Vector2 = P.position + Vector2(0, -6)
			draw_arc(c, 13.0, -PI / 2, -PI / 2 + TAU * k, 24, Color("#ffe7a0") if k >= 1.0 else Color(1, 0.9, 0.6, 0.7), 2.0)

# ------------------------------------------------------------------ hamleyi oynat
func hamle(tur: String, d: Vector2) -> float:
	var g := grup()
	if g == "" or not M.has(g) or not M[g].has(tur): return 0.0
	if not acik(tur): return 0.0
	var H: Dictionary = M[g][tur]
	if H.has("mana"):
		var S = oyun.buyu.STAFF.get(oyun.env.elde(), null)
		if S == null: return 0.0
		var c: float = float(S.cost) * float(H.mana)
		if oyun.buyu.mana < c:
			oyun.yazi(P.position + Vector2(0, -28), "Mana yetmiyor", Color("#c9a0ff"), 9)
			return 0.0
		oyun.buyu.mana -= c
	elif H.has("ammo"):
		var G = oyun.buyu.GUNS[oyun.env.elde()]
		if oyun.env.adet(str(G.ammo)) < 1:
			oyun.yazi(P.position + Vector2(0, -28), "%s yok" % G.ammo, Color("#ffb060"), 9)
			return 0.0
	else:
		var st := float(H.get("st", 10))
		if g == "bow" and oyun.buyu._ok().is_empty():
			oyun.yazi(P.position + Vector2(0, -28), "Ok yok", Color("#ffb060"), 9)
			return 0.0
		if P.yorgun or P.st < st:
			oyun.yazi(P.position + Vector2(0, -28), "Nefesin kesildi!", Color("#9ad8ff"), 9)
			return 0.0
		P.st -= st; P.st_dinlen = 0.0
	var yon: Vector2 = d.normalized() if d.length() > 0.1 else P.bakis.normalized()
	aktif_tur = tur
	P._yon_sec(yon)
	if H.has("p"): P._kay(yon * float(H.p))
	if H.has("a"): _atislar(g, H, yon)
	else:
		var once := {}
		for v in H.h:
			if float(v[4]) <= 0.0: _alan(g, v, yon, once if tur in ["dash"] else {})
			else: get_tree().create_timer(float(v[4])).timeout.connect(_alan.bind(g, v, yon, once if tur in ["dash"] else {}))
	oyun.yazi(P.position + Vector2(0, -34), str(H.n), Color("#ffd040") if tur == "cdc" else (Color("#ffb0ff") if tur == "charged" else Color("#ffe7a0")), 9)
	var rec := {"c2": 0.34, "c3": 0.55, "double": 0.4, "charged": 0.55, "dash": 0.4, "cdc": 0.7}.get(tur, 0.4) as float
	cd = rec
	P.atk_cd = maxf(P.atk_cd, rec * 0.8)
	oyun.ult_ekle(4.0)
	return rec

func _taban() -> float:
	var w: Dictionary = P.silah_v()
	return float(w.dmg) * oyun.stat("dmg") * (1.55 if oyun.sk("W4") else (1.4 if oyun.sk("W3") else (1.25 if oyun.sk("W2") else (1.1 if oyun.sk("W1") else 1.0))))

## yakın dövüş hamlesinin bir vuruşu: şekle giren her canlıya
func _alan(g: String, v: Array, yon: Vector2, once: Dictionary) -> void:
	var sekil: String = v[0]
	var w: Dictionary = P.silah_v()
	var reach := float(w.reach)
	var C: Vector2 = P.position + Vector2(0, -6)
	var m := float(v[3])
	if sekil == "patlat":
		m = 1.5 + 0.5 * P.kombo
	var dm := maxi(1, int(round(_taban() * m)))
	var vurulan := []
	for a in oyun.canlilari_ver():
		if a.olu >= 0.0 or once.has(a): continue
		var r: float = float(a.D.r) * (a.scale.x if a.scale.x > 0 else 1.0)
		var q: Vector2 = a.position + Vector2(0, -6) - C
		var dist := q.length()
		var ok := false
		match sekil:
			"arc", "patlat":
				var R := reach + float(v[2])
				ok = dist <= R + r + 3.0 and (dist < r + 6.0 or absf(yon.angle_to(q)) <= float(v[1]))
			"circ":
				ok = dist <= (float(v[1]) if float(v[1]) > 0.0 else reach + float(v[2])) + r
			"line":
				var L := reach + float(v[2])
				var tt := q.dot(yon)
				ok = tt >= -r and tt <= L + r and absf(q.cross(yon)) <= float(v[1]) + r
			"krater":
				var mrk: Vector2 = C + yon * float(v[2])
				ok = (a.position + Vector2(0, -6)).distance_to(mrk) <= float(v[1]) + r
			"yakin":
				ok = dist <= float(v[1]) + r and vurulan.is_empty()
		if not ok: continue
		once[a] = true
		vurulan.append(a)
		if oyun.dovus != null: oyun.dovus.isabet(aktif_tur, a)
		a.vuruldu(oyun.kritik(dm, str(w.get("n", "")), a), q.normalized() if dist > 0.5 else yon)
		P._silah_etki(w, a, dist)
		if float(v[5]) > 0.0 and not a.boss: a.sersem = maxf(a.sersem, float(v[5]))
		elif float(v[5]) > 0.0: a.sersem = maxf(a.sersem, float(v[5]) * 0.5)
	if sekil == "patlat":
		if P.kombo >= 3:
			var k := 0
			for b in oyun.canlilari_ver():
				if k >= 2 or vurulan.has(b) or b.olu >= 0.0 or vurulan.is_empty(): continue
				if b.position.distance_to(vurulan[0].position) < 120.0:
					b.vuruldu(maxi(1, dm / 2), (b.position - vurulan[0].position).normalized()); k += 1
		P.kombo = 0
	elif g == "topuz" and not vurulan.is_empty():
		P.kombo += 1; P.kombo_t = 1.2
	_iz(sekil, v, yon, C, reach)
	if not vurulan.is_empty(): oyun.ult_ekle(1.5)

## hamlenin izi (toz, kıvılcım, alev)
func _iz(sekil: String, v: Array, yon: Vector2, C: Vector2, reach: float) -> void:
	var renk := Color("#ffe7a0")
	var g := grup()
	if g == "gurz": renk = Color("#c8b898")
	elif g == "topuz": renk = Color("#bfe8ff")
	elif g == "torch": renk = Color("#ff8a3a")
	match sekil:
		"arc", "patlat":
			for i in 12:
				var a := yon.angle() + (i / 11.0 - 0.5) * 2.0 * float(v[1])
				oyun.parca(C + Vector2.from_angle(a) * (reach + float(v[2])), Vector2.from_angle(a) * 20.0, 0.2, renk)
		"circ":
			var R := float(v[1]) if float(v[1]) > 0.0 else reach + float(v[2])
			for i in 20:
				var a := i / 20.0 * TAU
				oyun.parca(C + Vector2(cos(a) * R, sin(a) * R * 0.6), Vector2(cos(a), sin(a)) * 30.0, 0.3, renk)
		"line":
			var L := reach + float(v[2])
			for i in 10: oyun.parca(C + yon * (L * i / 9.0), Vector2(randf_range(-10, 10), -10), 0.25, renk)
		"krater":
			var mrk: Vector2 = C + yon * float(v[2])
			for i in 16:
				var a := i / 16.0 * TAU
				oyun.parca(mrk + Vector2(cos(a) * float(v[1]), sin(a) * float(v[1]) * 0.5), Vector2(cos(a) * 40.0, -20.0), 0.4, Color("#8a7a60") if i % 2 else renk)

## uzaktan hamleler: yay, asa, ateşli (her atış kendi okunu / manasını / mermisini harcar)
func _atislar(g: String, H: Dictionary, yon: Vector2) -> void:
	for x in H.a:
		if float(x[2]) <= 0.0: _at(g, H, yon, float(x[0]), float(x[1]))
		else: get_tree().create_timer(float(x[2])).timeout.connect(_at.bind(g, H, yon, float(x[0]), float(x[1])))

func _at(g: String, H: Dictionary, yon: Vector2, m: float, da: float) -> void:
	var B = oyun.buyu
	var h: String = oyun.env.elde()
	var s: Vector2 = P.position + Vector2(0, -10)
	var t: Vector2 = B._nisan()
	var a0 := (t - s).angle() + da
	var hedef := s + Vector2.from_angle(a0) * 100.0
	var lv: float = B._carpan()
	if g == "bow":
		if not B.YAY.has(h): return
		var Y: Dictionary = B.YAY[h]
		var A: Array = B._ok()
		if A.is_empty(): return
		oyun.env.eksilt(str(A[0]), 1)
		var S := {c1 = str(A[2]), c2 = "#e8d8b0", spd = float(Y.spd) * float(H.get("spd", 1.0)), range = float(Y.rng) * float(H.get("rng", 1.0)), line = true, trail = 0.04}
		if A[3] != null:
			S.efx = str(A[3]); S.edm = float(Y.dmg) * float(A[1]) * lv
		B._ates(S, maxi(1, int(round(float(Y.dmg) * float(A[1]) * m * lv))), hedef, s, [], float(S.range))
	elif g == "staff":
		if not B.STAFF.has(h): return
		var S2: Dictionary = B.STAFF[h].duplicate()
		if H.has("sz"): S2.sz = float(S2.get("sz", 3)) * float(H.sz)
		S2.spd = float(S2.spd) * float(H.get("spd", 1.0)); S2.range = float(S2.range) * float(H.get("rng", 1.0))
		B._ates(S2, maxi(1, int(round(float(S2.dmg) * m * lv))), hedef, s, [], float(S2.range))
	elif g == "gun":
		if not B.GUNS.has(h): return
		var G: Dictionary = B.GUNS[h]
		if oyun.env.adet(str(G.ammo)) < 1: return
		oyun.env.eksilt(str(G.ammo), 1)
		var S3: Dictionary = G.S.duplicate()
		S3.spd = float(S3.spd) * float(H.get("spd", 1.0)); S3.range = float(S3.range) * float(H.get("rng", 1.0))
		for i in int(G.n):
			var ds := 0.0 if int(G.n) == 1 else (float(i) / (int(G.n) - 1) - 0.5) * 2.0 * float(G.spread)
			B._ates(S3, maxi(1, int(round(float(G.dmg) * m * lv))), s + Vector2.from_angle(a0 + ds) * 100.0, s, [], float(S3.range))
