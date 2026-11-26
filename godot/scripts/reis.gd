## Reisler (web v2.83/v4.27 P4: bossNeed, makeBoss, bossCheck, tickBossQ, spawnBoss, tickBosses; belge Sistemler › Almanak › Reis sayacı ve
## Canavarlar nasıl savaşır). Her türden (mağara canlıları ve Yıldızsızlar hariç) yeter sayıda avlayınca sürünün Reis'i son avın yanına öfkeyle gelir.
## Reis: türün kendi vuruşu, can ×4 (hızlı türler, Timsah, Mağara ayısı, Yaban öküzü ×3; ACT 1'de en az 100 can, 10 vuruş), menzil ×1,35, iri ve
## mor; uzaktan atan bir mermi fazla atar, %20 daha sık; etkisi ×1,5; XP türünkünün 6 katı + 20; düşürdükleri iki kat. Kendi hamlesi: şahlanır,
## yerde kırmızı halka dolar, sonra yere vurur (halkanın içindeysen ve atılmıyorsan türün vuruşunun %75'i). 600 pikselden uzaklaşırsan ya da
## bayılırsan geri çekilir; sayaç bir eksik kalır (bir tane daha avlayınca yeniden gelir). Her türün Reis'i yalnız bir kez yenilir.
extends Node2D

var oyun
var bc := {}             # tür → sayaç
var bd := {}             # tür → yenildi
var kuyruk: Array = []   # {k, t, p, b}
var bekle := 0.0         # bayıldıktan sonra 60 sn Reis gelmez
const AB := {"Tavşan": 3, "Sincap": 2, "Keklik": 2, "Ördek": 3, "Kerevit": 1, "Geyik": 3.5, "Karaca": 3, "Yaban öküzü": 2.5, "Yaban domuzu": 3, "Kurt": 7,
	"Dikenli kirpi": 1, "Engerek": 1, "Zehirli kurbağa": 3, "Bataklık kurdu": 3, "Timsah": 2, "Kül kurdu": 3, "Lav kertenkelesi": 3, "Kül cini": 2,
	"Bıldırcın": 2, "Kunduz": 1, "Yaban kazı": 2, "Yaban atı": 3, "Dağ keçisi": 3, "Muflon": 2.5, "Oklu kirpi": 1, "Su samuru": 1, "Turna kuşu": 2, "Mağara ayısı": 1}
const FIX := {"Kerevit": 10, "Geyik": 15}
const YOK := ["Kara ejder"]
const BUYUK := ["Mağara ayısı", "Timsah", "Yaban öküzü", "Yaban atı"]
const UZAK := 600.0

func kur(o) -> void:
	oyun = o

static func _bas(k: String) -> String:
	var a := []
	for w in k.split(" "): a.append(w.substr(0, 1).to_upper() + w.substr(1))
	return " ".join(a)

func ad(k: String) -> String:
	return _bas(k) + " Reisi"

func uygun(k: String) -> bool:
	if not oyun.canlilar.has(k) or YOK.has(k): return false
	var D: Dictionary = oyun.canlilar[k]
	return not bool(D.get("boss", false)) and str(D.get("kind", "")) == "" and not bool(D.get("ys", false))

func gerek(k: String) -> int:
	if FIX.has(k): return int(FIX[k])
	var n := int(round(5.0 + 2.2 * float(AB.get(k, 1.5))))
	if float(oyun.canlilar[k].hp) >= 150.0: n -= 2
	return clampi(n, 5, 15)

## Reis'in verisi (web makeBoss)
func veri(k: String) -> Dictionary:
	var nm := ad(k)
	if oyun.canlilar.has(nm): return oyun.canlilar[nm]
	var D: Dictionary = oyun.canlilar[k]
	var hizli: bool = float(D.spd) >= 90.0 or k in ["Timsah", "Mağara ayısı", "Yaban öküzü"]
	var B: Dictionary = D.duplicate(true)
	var a1: bool = oyun.ada == 1
	B.temper = "saldırgan"; B.still = false; B.boss = true; B.base = k
	B.hp = maxf(100.0 if a1 else 0.0, round(float(D.hp) * (3.0 if hizli else 4.0)))
	B.spd = round(maxf(float(D.spd), 34.0)) if bool(D.get("fly", false)) else round(minf(64.0, maxf(float(D.spd), 34.0) * 1.08))
	B.aggro = maxf(float(D.get("aggro", 0)), 170.0)
	B.dmg = round(maxf(10.0 if a1 else 5.0, float(D.get("dmg", 3))))
	B.r = round(float(D.r) * 1.6); B.reach = round(float(D.get("reach", 26)) * 1.35); B.wind = maxf(0.3, float(D.get("wind", 0.42)))
	B.xp = round(float(D.get("xp", 0)) * 6.0 + 20.0); B.night = false; B.minLv = 0
	var dr := []
	for d in D.drops: dr.append({n = d.n, min = maxi(1, int(d.min) * 2), max = int(d.max) * 2 + 1, p = 1.0})
	B.drops = dr
	B.pack = null
	if D.get("ranged", null) != null:
		var R: Dictionary = D.ranged.duplicate()
		R.n = int(R.get("n", 1)) + 1; R.cd = float(R.get("cd", 1.5)) * 0.8
		B.ranged = R
	if D.get("fx", null) != null: B.fx = [D.fx[0], float(D.fx[1]) * 1.5, D.fx[2]]
	oyun.canlilar[nm] = B
	return B

func _canli(k: String):
	for c in oyun.canlilari_ver():
		if c.has_meta("reis") and str(c.get_meta("reis")) == k: return c
	return null

## bir canlı avlandı (oyun.canli_oldu)
func oldu(k: String, c) -> void:
	if c != null and c.has_meta("reis"):
		var b: String = str(c.get_meta("reis"))
		bd[b] = true
		oyun.env.mesaj("%s yenildi!" % ad(b))
		return
	if not uygun(k) or bd.has(k) or (c != null and (c.ders or c.has_meta("ders"))): return
	bc[k] = int(bc.get(k, 0)) + 1
	if int(bc[k]) < gerek(k) or _canli(k) != null or bekle > 0.0: return
	for q in kuyruk:
		if q.k == k: return
	var p: Vector2 = c.position if c != null else oyun.oyuncu.position
	kuyruk.append({k = k, t = 0.35, p = p, b = oyun.bio_at(p)})
	oyun.env.mesaj("%s · Bir reis geliyor! %d %s avladın: sürünün reisi öfkeyle geliyor. Kırmızı halkaya dikkat et, Boşluk ile kaç." % [ad(k), int(bc[k]), k], true)

func _dus(k: String, neden: String) -> void:
	var n := gerek(k)
	if int(bc.get(k, 0)) >= n: bc[k] = n - 1
	oyun.env.mesaj("%s %s. Reis sayacı %d / %d: bir %s daha avlarsan yeniden gelir." % [ad(k), neden, n - 1, n, k])

## bayılınca: sahadaki ve gelmekte olan Reisler çekilir, 60 sn Reis gelmez
func bayildi() -> void:
	bekle = 60.0
	for q in kuyruk: _dus(q.k, "seni yendi, sürüsüne döndü")
	kuyruk = []
	for c in oyun.canlilari_ver():
		if c.has_meta("reis"):
			_dus(str(c.get_meta("reis")), "seni yendi, sürüsüne döndü")
			c.queue_free()

func _yer(D: Dictionary, q: Dictionary):
	var P: Vector2 = oyun.oyuncu.position
	for gec in 2:
		for i in 40:
			var p: Vector2 = q.p + Vector2.from_angle(randf() * TAU) * ((60.0 if gec else 90.0) + randf() * 70.0)
			if oyun.engel(p, 6.0) or oyun.bio_at(p) != int(q.b) or p.distance_to(P) < 70.0: continue
			if gec == 0 and not D.landTiles.has(float(oyun.tile_at(p))): continue
			return p
	return null

func _cagir(q: Dictionary) -> bool:
	var D := veri(q.k)
	var p = _yer(D, q)
	if p == null: return false
	var c = oyun._canli_yeni(ad(q.k), p, 0)
	c.set_meta("reis", q.k)
	c.mad = true
	c.st = "chase"
	var s := 1.5 if BUYUK.has(q.k) else 2.0
	c.scale = Vector2(s, s)
	c.set_meta("slam_t", 2.5)
	c.spr.modulate = Color(0.86, 0.62, 1.0)
	for i in 22:
		var a := i / 22.0 * TAU
		oyun.parca(p + Vector2(cos(a) * 6.0, -2), Vector2(cos(a) * 55.0, sin(a) * 25.0 - 20.0), 0.7, Color(0.78, 0.59, 1.0) if i % 3 else Color.WHITE)
	return true

var slamlar := {}        # canlı → {t, T, R}

func _process(dt: float) -> void:
	if oyun == null or oyun.basta: return
	bekle = maxf(0.0, bekle - dt)
	var P: Vector2 = oyun.oyuncu.position
	for i in range(kuyruk.size() - 1, -1, -1):
		var q: Dictionary = kuyruk[i]
		q.t -= dt
		if q.p.distance_to(P) > UZAK:
			kuyruk.remove_at(i)
			_dus(q.k, "seni bulamadı, sürüsüne döndü")
			continue
		if q.t > 0.0: continue
		if _cagir(q) or _canli(q.k) != null: kuyruk.remove_at(i)
		else: q.t = 0.6
	for c in oyun.canlilari_ver():
		if not c.has_meta("reis") or c.olu >= 0.0: continue
		if c.position.distance_to(P) > UZAK:
			_dus(str(c.get_meta("reis")), "seni kaybetti, geri çekildi")
			c.queue_free()
			continue
		if randf() < dt * 6.0: oyun.parca(c.position + Vector2(randf_range(-7, 7), -4 - randf() * 10), Vector2(0, -12), 0.6, Color(0.75, 0.47, 1.0, 0.8))
		_slam(c, dt, P)
	queue_redraw()

## Reis'in hamlesi (web tickBosses p4slam): yakındayken şahlanır, kırmızı halka 0,9 sn'de dolar, yere vurur
func _slam(c, dt: float, P: Vector2) -> void:
	var D: Dictionary = c.D
	if slamlar.has(c):
		var S: Dictionary = slamlar[c]
		S.t += dt
		c.wind = 0.0; c.lunge = {}
		if S.t >= S.T:
			slamlar.erase(c)
			for i in 26:
				var a := i / 26.0 * TAU
				oyun.parca(c.position + Vector2(cos(a) * S.R * 0.6, sin(a) * S.R * 0.3), Vector2(cos(a) * 70.0, sin(a) * 30.0 - 25.0), 0.55, Color("#c8b898") if i % 2 else Color("#8a7a60"))
			if P.distance_to(c.position) < S.R:
				oyun.oyuncu.isirildi(int(round(float(D.dmg) * 0.75)), c.position, c, "r")
				if D.get("fx", null) != null: oyun.oyuncu.etki_ekle(str(D.fx[0]), float(D.fx[1]), float(D.fx[2]))
		return
	var t: float = float(c.get_meta("slam_t", 0.0)) - dt
	c.set_meta("slam_t", t)
	if D.get("ranged", null) == null and t <= 0.0 and c.position.distance_to(P) < 78.0 and c.wind <= 0.0 and c.lunge.is_empty():
		slamlar[c] = {t = 0.0, T = 0.9, R = 40.0 + float(D.r)}
		c.set_meta("slam_t", 5.0 + randf() * 2.5)

func _draw() -> void:
	for c in slamlar.keys():
		if not is_instance_valid(c):
			slamlar.erase(c)
			continue
		var S: Dictionary = slamlar[c]
		var k: float = clampf(S.t / S.T, 0.0, 1.0)
		var p: Vector2 = c.position
		draw_set_transform(p, 0.0, Vector2(1.0, 0.5))
		draw_circle(Vector2.ZERO, S.R * k, Color(1, 0.2, 0.15, 0.22))
		draw_arc(Vector2.ZERO, S.R, 0, TAU, 40, Color(1, 0.25, 0.2, 0.8), 2.0)
		draw_set_transform(Vector2.ZERO)

func kayit() -> Dictionary:
	return {bc = bc, bd = bd.keys()}

func yukle(d) -> void:
	bc = {}; bd = {}; kuyruk = []; slamlar = {}
	if typeof(d) != TYPE_DICTIONARY: return
	var b: Dictionary = d.get("bc", {})
	for k in b: bc[str(k)] = int(b[k])
	for k in d.get("bd", []): bd[str(k)] = true
