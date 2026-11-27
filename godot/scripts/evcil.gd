extends Node2D
## Evcil hayvanlar ve Çoban Davut (web v342pet, v230 husnu kovalamacası; belge 99_godot 2f).
## Ağıl kurulunca Davut'un anlattığı hayvan sevdiği yiyecekle evcilleşir: binekler yetişkin, savaşçılar ininden yavru.
## Yanında 1 binek + 2 savaşçı; savaşçı ölürse adı ağıldaki taşa yazılır; binek bayılıp ağıla döner.

const YoldasS := preload("res://scripts/yoldas.gd")
const DSOZ := ["Bir hayvanın güvenini kazanmak sabır ister. Acele edenin atı olmaz.", "Hayvan, yüzüne değil eline bakar evlat.", "Pamuk yine bir şeyler çiğniyor. Benim hasır şapkam olmasın da…", "Ağılın temiz olsun; hayvan da insan gibi yuvasını sever."]
const IN_BIYOM := {"kurt": 1, "timsah": 2, "kertenkele": 4}

var oyun
var kapali := false       # evcil hayvanlar ve Davut şimdilik Yıldızsız Ada'da kalır; durumları kayıtta korunur
var ham = null
var env
var V: Dictionary
var SP: Dictionary
var PT := {}
var FD: Array = []           # yere bırakılan yiyecek: {sp, p, t, a, age}
var PUP := {}                # sp → {n: yoldas, g: Vector2, t, gizli}
var binilen = null
var keci := {}               # Pamuk: {n, durum ("", kac, izle, davut), cnt, gcd, gj, stk, soz}
var in_dugum := {}
var gizli := false
var urk_t := 0.0
var t := 0.0
var dav_t := 0.0
var son_fx := 1
var kat: CanvasLayer
var pen_kutu: PanelContainer
var pen_liste: VBoxContainer
var ad_kutu: PanelContainer
var ad_giris: LineEdit
var ad_cb: Callable

func kur(o) -> void:
	oyun = o
	env = o.env
	V = o._json("res://data/evcil.json")
	SP = V.sp
	z_index = 30
	_sifirla()
	var k = YoldasS.new()
	k.kur({})
	k.visible = false
	o.nesneler.add_child(k)
	keci.n = k
	if o.ada == 2:
		kapali = true
		_arayuz()
		return
	for sp in V["in"]:
		var p = V["in"][sp]
		if p == null: continue
		var d = Node2D.new()
		d.position = Vector2(p.x, p.y)
		d.draw.connect(_in_ciz.bind(d, str(sp)))
		d.visible = false
		o.nesneler.add_child(d)
		in_dugum[sp] = d
		_temizle(Vector2(p.x, p.y))
	for p in V.dav_yer:
		if p != null: _temizle(Vector2(p.x, p.y))
	_arayuz()

func _sifirla() -> void:
	for p in PT.get("pets", []):
		if p.get("n", null) != null and is_instance_valid(p.n): p.n.queue_free()
	for sp in PUP:
		if is_instance_valid(PUP[sp].n): PUP[sp].n.queue_free()
	PT = {pets = [], tr = {}, trT = {}, ever = {}, den = {}, dead = [], no = {}, mom = {}, nid = 1, dav = "", ipucu = false, bin_ipucu = false}
	FD = []
	PUP = {}
	binilen = null
	keci.durum = ""; keci.cnt = 0; keci.gcd = 0.0; keci.gj = null; keci.stk = 0.0; keci.soz = 0.0

## web spotIn: Davut'un ve inlerin yerindeki ağaçlar ve düğümler kalkar
func _temizle(p: Vector2) -> void:
	for a in oyun.agaclar:
		if absf(a.position.x - p.x) < 40 and absf(a.position.y - p.y) < 34 and a.visible:
			a.visible = false
			var k = Vector2i(int(floor(a.position.x / 32.0)), int(floor(a.position.y / 32.0)))
			if oyun.agac_izgara.has(k): oyun.agac_izgara[k].erase(a.position)
	for d in oyun.dugumler:
		if d.canli and absf(d.position.x - p.x) < 30 and absf(d.position.y - p.y) < 26: d.oldur(1e9)

# ------------------------------------------------------------------ yardımcılar
func simdi() -> float:
	var dk: float = oyun.zaman.dk
	return oyun.zaman.gun * 1440.0 + dk + (1440.0 if dk < 360.0 else 0.0)

func bitti(id: String) -> bool:
	return oyun.gorev.bitti(id)

func suren() -> String:
	return str(oyun.gorev.aktif.id) if oyun.gorev.aktif != null else ""

func agil():
	for o in oyun.yapi.kurulu:
		if o.n == "Ağıl": return o
	return null

func agil_merkez():
	var o = agil()
	if o == null: return null
	var f: Vector2i = oyun.yapi.ayak(o.n, o.rot)
	return Vector2((o.tx + f.x / 2.0) * 16, (o.ty + f.y / 2.0) * 16)

func yasayan(sp: String) -> Array:
	var L: Array = []
	for p in PT.pets:
		if p.sp == sp: L.append(p)
	return L

func yaninda(binek: bool) -> int:
	var k = 0
	for p in PT.pets:
		if p.at == "with" and SP[p.sp].has("m") == binek: k += 1
	return k

func ever(sp: String) -> bool:
	return PT.ever.has(sp)

func etiket(sp: String) -> String:
	return str(SP[sp].lab) if SP.has(sp) else sp

func evcillesir(sp: String) -> bool:
	if agil() == null or not oyun.canlilar.has(str(SP[sp].anim)): return false
	var cb: String = V.cb[sp]
	if not (suren() == cb or bitti(cb)): return false
	if SP[sp].has("m"): return yasayan(sp).is_empty()
	return yasayan(sp).is_empty() and simdi() >= float(PT.den.get(sp, 0))

func _vahsi(sp: String, r: float):
	var k: String = SP[sp].anim
	var en = null
	var bd = r
	for a in oyun.canlilari_ver():
		if a.tur != k or a.mad: continue
		var d: float = a.position.distance_to(oyun.oyuncu.position)
		if d < bd:
			bd = d
			en = a
	return en

func hedef(sp: String, r: float):
	if SP[sp].has("pup"):
		var u = PUP.get(sp, null)
		return u.n if u != null and not u.gizli and u.n.position.distance_to(oyun.oyuncu.position) < r else null
	return _vahsi(sp, r)

func _yaz(p: Vector2, s: String, c := Color.WHITE) -> void:
	oyun.yazi(p + Vector2(0, -20), s, c, 9)

# ------------------------------------------------------------------ Çoban Davut
func davut():
	for n in oyun.kisiler:
		if n.K.k == "k_davut": return n
	return null

func davut_b() -> int:
	if not bitti("CB3"): return 0
	var k = 0
	for id in ["CB4", "CB5", "CB6", "CB7", "CB8"]:
		if bitti(id): k += 1
	return mini(5, 1 + k)

func davut_konus(n) -> void:
	var por = load(n.K.portre)
	if not oyun.kuzen.tanis.has("k_davut"):
		oyun.kuzen.tanis["k_davut"] = true
		oyun.konusma.ac(n.K.ad, por, "Hoş geldin evlat! Ben [b]Davut[/b], çobanım. Kırk yıldır hayvan güderim; bir bakışta anlarım, kim hayvan sever kim sevmez.", [{t = "Tanıştığıma sevindim", pri = true, kapat = true}])
		return
	if PT.dav != "":
		var ad: String = PT.dav
		PT.dav = ""
		oyun.konusma.ac(n.K.ad, por, "[i](Şapkasını çıkarıp bir süre susuyor.)[/i] [b]%s[/b]… Duydum. İyi bir hayvandı, seni sonuna kadar korudu. İninde yeni bir yavru doğacak; ama onu unutma." % ad, [{t = "Unutmam", pri = true, kapat = true}])
		return
	oyun.konusma.ac(n.K.ad, por, DSOZ[randi() % DSOZ.size()], [{t = "Hoşça kal", pri = true, kapat = true}])

# ------------------------------------------------------------------ F: yere bırak, bin
func f() -> bool:
	if kapali: return false
	for sp in SP:
		if not evcillesir(sp) or env.adet(str(SP[sp].food)) <= 0: continue
		var var_ = false
		for x in FD:
			if x.sp == sp: var_ = true
		if var_ or hedef(sp, 140.0) == null: continue
		_birak(sp)
		return true
	var m = _binek()
	if m != null and binilen == null and m.n.position.distance_to(oyun.oyuncu.position) < 26.0:
		bin()
		return true
	return false

func ipucu() -> String:
	for sp in SP:
		if evcillesir(sp) and env.adet(str(SP[sp].food)) > 0 and hedef(sp, 140.0) != null:
			var var_ = false
			for x in FD:
				if x.sp == sp: var_ = true
			if not var_: return "F · Yere bırak: %s (%s)" % [SP[sp].food, SP[sp].lab]
	return ""

func _birak(sp: String) -> void:
	var S: Dictionary = SP[sp]
	if simdi() < float(PT.trT.get(sp, 0)):
		env.mesaj("%s henüz tok; biraz sonra yeniden dene." % S.lab)
		return
	if int(PT.no.get(sp, -1)) == int(oyun.zaman.gun):
		env.mesaj("%s bugün sana yaklaşmaz." % S.lab, true)
		return
	env.eksilt(str(S.food))
	var b: Vector2 = oyun.oyuncu.bakis
	FD.append({sp = sp, p = oyun.oyuncu.position + Vector2(b.x * 12, b.y * 10 + 4), t = 0.0, a = hedef(sp, 160.0), age = 0.0})
	if not PT.ipucu:
		PT.ipucu = true
		env.mesaj("Birkaç adım geri çekil ve bekle; koşma, üstüne yürüme.")

# ------------------------------------------------------------------ binmek (web mount, dismount)
func _binek():
	for p in PT.pets:
		if p.at == "with" and SP[p.sp].has("m"): return p
	return null

func bin() -> void:
	var m = _binek()
	if m == null or binilen != null or oyun.magara.icinde or oyun.ev.acik: return
	if m.n.position.distance_to(oyun.oyuncu.position) > 70.0: return
	binilen = m
	if not PT.bin_ipucu:
		PT.bin_ipucu = true
		env.mesaj("%s sırtında hızlısın. B ile inersin; toplamaya ya da vurmaya basınca kendiliğinden inersin." % m.name)

func in_() -> void:
	if binilen == null: return
	var m = binilen
	binilen = null
	oyun.oyuncu.spr.position.y = 0.0
	var P: Vector2 = oyun.oyuncu.position
	m.n.position = P + Vector2(14, 4)
	if oyun.engel(m.n.position): m.n.position = P + Vector2(-14, 4)
	m.n.olcek = 0.6 if float(m.grow) > 0.0 else 1.0

func hiz() -> float:
	if binilen == null: return 1.0
	var S: Dictionary = SP[binilen.sp]
	if S.has("spdHome") and oyun.bio_at(oyun.oyuncu.position) == int(S.b): return float(S.spdHome)
	return float(S.spd)

## binerken gelen darbe bineğe gider
func binek_vuruldu(n: int) -> void:
	var m = binilen
	m.hp -= n
	_yaz(oyun.oyuncu.position, "-%d" % n, Color("#ffb0a0"))
	if m.hp <= 0:
		m.hp = 0.0
		in_()
		m.at = "down"
		env.mesaj("%s yaralandı, yere düştün; ağıla döndü. Ağılda sevdiği yiyecekten 3 tane verirsen ayağa kalkar." % m.name, true)

# ------------------------------------------------------------------ evcilleşme, ölüm
func _evcillestir(sp: String, a) -> void:
	var S: Dictionary = SP[sp]
	var pos: Vector2 = a.position if a != null else oyun.oyuncu.position + Vector2(16, 6)
	if a != null and is_instance_valid(a): a.queue_free()
	if PUP.has(sp):
		PUP[sp].n.queue_free()
		PUP.erase(sp)
	var p = {id = PT.nid, sp = sp, name = S.nm, hp = float(S.hp), at = "with" if yaninda(S.has("m")) < (1 if S.has("m") else 2) else "pen", grow = simdi() + 2880.0 if S.has("pup") else 0.0, atk = 0.0, ht = 0.0}
	PT.nid += 1
	PT.pets.append(p)
	PT.ever[sp] = true
	PT.tr[sp] = 0
	_dugum(p, pos)
	for i in 18: oyun.parca(pos + Vector2(0, -8), Vector2(randf_range(-25, 25), -20 - randf() * 30), 0.7, Color("#ff7aa0") if i % 2 else Color("#f2e8c8"))
	oyun.gorev.yenile()
	await get_tree().create_timer(0.5).timeout
	ad_sor(str(S.nm), _adlandi.bind(p))

func _adlandi(v: String, p: Dictionary) -> void:
	var S: Dictionary = SP[p.sp]
	p.name = v if v != "" else str(S.nm)
	p.n.ad = p.name
	env.mesaj("%s · %s seninle · %s" % [p.name, S.anim, "B ile binersin" if S.has("m") else ("2 gün içinde büyür, sonra seni korur" if S.has("pup") else "seni korur")])

func _dugum(p: Dictionary, pos: Vector2) -> void:
	var n = YoldasS.new()
	n.kur(oyun.canlilar[str(SP[p.sp].anim)])
	n.position = pos
	n.ad = p.name
	oyun.nesneler.add_child(n)
	p.n = n

func _ol(p: Dictionary) -> void:
	PT.pets.erase(p)
	PT.dead.append({n = p.name, sp = p.sp})
	PT.den[p.sp] = simdi() + 3 * 1440.0
	PT.dav = p.name
	for k in 14: oyun.parca(p.n.position + Vector2(0, -6), Vector2(randf_range(-20, 20), -20 - randf() * 20), 0.8, Color("#e8e0c8"))
	p.n.queue_free()
	env.mesaj("%s öldü… Adı ağıldaki taşa yazıldı." % p.name, true)

# ------------------------------------------------------------------ her kare
func _process(dt: float) -> void:
	if oyun.basta or kapali: return
	t += dt
	var hid: bool = oyun.magara.icinde or oyun.ev.acik
	if hid:
		if binilen != null: in_()
		if not gizli:
			gizli = true
			for p in PT.pets: p.n.visible = false
		return
	if gizli:
		gizli = false
		var k = 0
		for p in PT.pets:
			p.n.visible = true
			if p.at == "with":
				p.n.position = oyun.oyuncu.position + Vector2(14 + k * 10, 10)
				k += 1
	if Input.is_action_just_pressed("bin") and not oyun.pencere_acik() and not oyun.oyuncu.kilit:
		if binilen != null: in_()
		else: bin()
	dav_t -= dt
	if dav_t <= 0.0:
		dav_t = 1.0
		var dn = davut()
		if dn != null:
			var y = V.dav_yer[davut_b()]
			if y != null: dn.position = Vector2(y.x, y.y)
	_keci(dt)
	_yavrular(dt)
	_yemler(dt)
	_yoldaslar(dt)
	if binilen != null:
		var P = oyun.oyuncu
		P.st = maxf(P.st, P.st_max * 0.5)
		P.spr.position.y = -14.0
		if absf(P.bakis.x) > 0.1: son_fx = 1 if P.bakis.x > 0 else -1
		var m = binilen.n
		m.position = P.position + Vector2(-son_fx * 2, -1)
		m.spr.position.y = 5.0
		m.olcek = 1.6
		m.face = son_fx
		m.yuruyor = P.yuruyor
		m.etiket = false
	queue_redraw()

# ------------------------------------------------------------------ Pamuk (web v230 husnu: chase, escort)
func _keci(dt: float) -> void:
	var k = keci.n
	var dn = davut()
	if bitti("CB1") or keci.durum == "davut":
		k.visible = dn != null
		if dn != null:
			k.position = dn.position + Vector2(22, 6)
			k.face = -1
			k.hop = 1 if sin(t * 6.0) > 0.92 else 0
		return
	if suren() != "CB1":
		k.visible = false
		return
	k.visible = true
	var P: Vector2 = oyun.oyuncu.position
	if keci.durum == "":
		keci.durum = "kac"
		k.position = Vector2(V.keci.x, V.keci.y)
	if keci.soz > 0.0: keci.soz -= dt
	if keci.durum == "kac":
		if keci.gcd > 0.0: keci.gcd -= dt
		if keci.gj == null and keci.gcd <= 0.0 and P.distance_to(k.position) < 18.0:
			keci.cnt += 1
			if keci.cnt >= 3:
				_yaz(k.position, "Yakalandı!", Color("#9fe07a"))
				keci.durum = "izle"
				keci.stk = 0.0
				oyun.gorev.yenile()
				return
			keci.gcd = 1.5
			var d = _keci_hedef(k.position)
			if d != null: keci.gj = {x1 = d, t = 0.0, side = -1 if randf() < 0.5 else 1, best = 1e9, stk = 0.0, flip = 0}
			_yaz(k.position, "Mee!")
		if keci.gj != null: _keci_kos(k, keci.gj, dt)
		k.hop = 1 if keci.gj != null and sin(t * 14.0) > 0.0 else 0
		k.face = 1 if P.x < k.position.x else -1
		return
	# izle: seninle Davut'a
	var dd = P.distance_to(k.position)
	k.hop = 0
	if dd > 400.0 or keci.stk > 1.5: _yanina(k)
	elif dd > 160.0:
		if keci.soz <= 0.0:
			keci.soz = 2.2
			_yaz(k.position, "Bekle!")
	elif dd > 22.0:
		var sp = minf(80.0, dd * 3.0)
		var u: Vector2 = (P - k.position) / dd
		var o: Vector2 = k.position
		var np: Vector2 = k.position + u * sp * dt
		if not oyun.engel(np): k.position = np
		elif not oyun.engel(Vector2(np.x, o.y)): k.position.x = np.x
		elif not oyun.engel(Vector2(o.x, np.y)): k.position.y = np.y
		keci.stk = keci.stk + dt if k.position.distance_to(o) < sp * dt * 0.3 else 0.0
		k.hop = 1 if sin(t * 14.0) > 0.0 else 0
		if absf(u.x) > 0.2: k.face = 1 if u.x > 0 else -1
	if dn != null and k.position.distance_to(dn.position) < 44.0:
		keci.durum = "davut"
		var por = load(dn.K.portre)
		var L: Array = V.husnu.steps[1].on
		oyun.konusma.ac(dn.K.ad, por, str(L[0][1]), [{t = "Devam", pri = true, f = func(): oyun.konusma.ac(dn.K.ad, por, str(L[1][1]), [{t = "Tamam", pri = true, kapat = true}])}])
		oyun.gorev.yenile()

## kayıkla geçişte (Bereket Adası) yanındaki yoldaşlar ve binek de gelir (belge ACT 1 › Bereket Adası'na gitmek)
func yanina() -> void:
	var P: Vector2 = oyun.oyuncu.position
	var k := 0
	for p in PT.pets:
		if p.at != "with" or p.get("n", null) == null: continue
		var q := P + Vector2(14 + k * 10, 10)
		for i in 8:
			if not oyun.engel(q): break
			q = P + Vector2(cos(i * 0.8) * (16 + i * 4), sin(i * 0.8) * (16 + i * 4))
		p.n.position = q
		k += 1

func _yanina(k) -> void:
	var P: Vector2 = oyun.oyuncu.position
	var a0: float = (k.position - P).angle()
	for i in 12:
		var a: float = a0 + (1 if i % 2 else -1) * ceilf(i / 2.0) * 0.52
		for r in range(24, 60, 6):
			var q = P + Vector2(cos(a), sin(a)) * r
			if not oyun.engel(q):
				k.position = q
				keci.stk = 0.0
				return

func _su_yakin(p: Vector2) -> bool:
	for d in [Vector2(7, 0), Vector2(-7, 0), Vector2(0, 7), Vector2(0, -7)]:
		if oyun.su_mu(oyun.tile_at(p + d)): return true
	return false

func _keci_hedef(g: Vector2):
	return _keci_hedef_b(g, 0)

func _keci_hedef_b(g: Vector2, bio: int):
	var P: Vector2 = oyun.oyuncu.position
	for lo in [420.0, 320.0, 220.0, 130.0]:
		for i in 70:
			var a = randf() * TAU
			var r: float = lo + randf() * 280.0
			var q = (g + Vector2(cos(a), sin(a)) * r).round()
			if lo > 200.0 and (q - g).dot(g - P) <= 0.0: continue
			if oyun.bio_at(q) != bio or oyun.tile_at(q) > 1 or oyun.engel(q) or _su_yakin(q): continue
			var ok = true
			var dd = 16.0
			while dd < r and ok:
				var m = g + (q - g) * dd / r
				if oyun.tile_at(m) > 1 or _su_yakin(m): ok = false
				dd += 16.0
			if ok: return q
	return null

func _keci_kos(k, j: Dictionary, dt: float) -> void:
	var d: Vector2 = j.x1 - k.position
	var dd = d.length()
	j.t += dt
	if dd < 10.0 or j.t > 40.0:
		keci.gj = null
		return
	if dd < j.best - 3.0:
		j.best = dd; j.stk = 0.0
	else:
		j.stk += dt
		if j.stk > 1.2:
			j.stk = 0.0
			j.flip += 1
			if j.flip >= 3:
				keci.gj = null
				return
			j.side = -j.side
	var P = oyun.oyuncu
	var hz = maxf(180.0, 72.0 * oyun.stat("move") * float(P.V.runMult) * 2.5)
	var sp = minf(hz * dt, dd)
	var ang = d.angle()
	for da in [0.0, 0.55, -0.55, 1.1, -1.1, 1.7, -1.7]:
		var a: float = ang + da * j.side
		var q: Vector2 = k.position + Vector2(cos(a), sin(a)) * sp
		if not oyun.engel(q) and not _su_yakin(q):
			k.position = q
			return

# ------------------------------------------------------------------ inler ve yavrular
func _in_goster(sp: String) -> bool:
	var cb: String = V.cb[sp]
	return bitti(cb) or suren() == cb

func _yavrular(dt: float) -> void:
	for sp in in_dugum:
		in_dugum[sp].visible = _in_goster(sp)
	for sp in SP:
		var S: Dictionary = SP[sp]
		if not S.has("pup"): continue
		if not evcillesir(sp) or not in_dugum.has(sp):
			if PUP.has(sp):
				PUP[sp].n.queue_free()
				PUP.erase(sp)
			continue
		var d: Vector2 = in_dugum[sp].position
		if not PUP.has(sp):
			var n = YoldasS.new()
			n.kur(oyun.canlilar[str(S.anim)])
			n.olcek = 0.55
			n.position = d + Vector2(10, 12)
			oyun.nesneler.add_child(n)
			PUP[sp] = {n = n, g = n.position, t = 0.0, gizli = false}
		var u: Dictionary = PUP[sp]
		u.gizli = oyun.yapi.gece()
		u.n.visible = not u.gizli
		u.n.kalp = float(PT.tr.get(sp, 0)) if int(PT.tr.get(sp, 0)) > 0 else -1.0
		if u.gizli:
			if oyun.oyuncu.position.distance_to(d) < 90.0 and int(PT.mom.get(sp, -1)) != int(oyun.zaman.gun):
				PT.mom[sp] = int(oyun.zaman.gun)
				_anne(str(S.anim), d)
			continue
		var yem = false
		for x in FD:
			if x.sp == sp: yem = true
		if yem: continue
		u.t -= dt
		if u.t <= 0.0:
			u.t = 1.5 + randf() * 2.0
			var an = randf() * TAU
			u.g = d + Vector2(cos(an) * 26, 12 + sin(an) * 14)
		u.n.yuruyor = _adim(u.n, u.g, 18.0, dt) > 1.0

func _anne(k: String, d: Vector2) -> void:
	var c = preload("res://scripts/canli.gd").new()
	c.oyun = oyun
	c.tur = k
	c.D = oyun.canlilar[k]
	c.position = d + Vector2(0, 6)
	oyun.nesneler.add_child(c)
	c.mad = true
	c.st = "chase"
	env.mesaj("Anne %s inin başında!" % k.to_lower(), true)

func _adim(n, hedef_p: Vector2, hz: float, dt: float) -> float:
	var d: Vector2 = hedef_p - n.position
	var L := d.length()
	if L < 1.0: return L
	var q: Vector2 = n.position + d / L * minf(L, hz * dt)
	if not oyun.engel(Vector2(q.x, n.position.y), 4.0): n.position.x = q.x
	if not oyun.engel(Vector2(n.position.x, q.y), 4.0): n.position.y = q.y
	if absf(d.x) > 0.5: n.face = 1 if d.x > 0 else -1
	return L

# ------------------------------------------------------------------ yere bırakılan yiyecek: hayvan gelir, yer, güven artar
func _yemler(dt: float) -> void:
	urk_t -= dt
	var P = oyun.oyuncu
	for i in range(FD.size() - 1, -1, -1):
		var f: Dictionary = FD[i]
		var S: Dictionary = SP[f.sp]
		var a = f.a
		if a != null and (not is_instance_valid(a) or (a.has_method("vuruldu") and a.olu >= 0.0)): a = null
		if a == null: a = hedef(f.sp, 260.0)
		f.a = a
		if a == null or a.position.distance_to(f.p) > 320.0 or not evcillesir(f.sp):
			f.age += dt
			if f.age > 120.0: FD.remove_at(i)
			continue
		var vahsi: bool = a.has_method("vuruldu")
		if vahsi: a.set_meta("yem", true)
		var pd: float = P.position.distance_to(a.position)
		if P.yuruyor and Input.is_action_pressed("kos") and pd < 160.0 and urk_t <= 0.0:
			urk_t = 2.0
			PT.tr[f.sp] = maxi(0, int(PT.tr.get(f.sp, 0)) - 30)
			if vahsi: a.kb = {v = (a.position - P.position).normalized() * 160.0, t = 0.35}
			_yaz(a.position, "ürktü!", Color("#ffb0a0"))
			continue
		if vahsi and a.flash > 0.0:
			PT.tr[f.sp] = 0
			PT.no[f.sp] = int(oyun.zaman.gun)
			a.remove_meta("yem")
			FD.remove_at(i)
			env.mesaj("%s canı yanınca güvenini yitirdi; bugün yaklaşmaz." % S.lab, true)
			continue
		if P.position.distance_to(f.p) < 80.0:
			a.yuruyor = false if not vahsi else a.yuruyor
			continue
		var d: float
		if vahsi:
			a.mad = false
			d = a.position.distance_to(f.p)
			if d > 4.0:
				a._git((f.p - a.position) / d * 34.0, dt)
				a.step += dt
				a._gorun(true)
		else:
			d = _adim(a, f.p, 26.0, dt)
			a.yuruyor = d > 1.0
		if d < 7.0:
			f.t += dt
			if randf() < dt * 3.0: oyun.parca(f.p + Vector2(0, -2), Vector2(randf_range(-5, 5), -10), 0.4, Color("#e8d0a0"))
			if f.t >= 2.0:
				FD.remove_at(i)
				if vahsi: a.remove_meta("yem")
				PT.tr[f.sp] = mini(100, int(PT.tr.get(f.sp, 0)) + 25)
				PT.trT[f.sp] = simdi() + 60.0
				_yaz(a.position, "♥ güven %%%d" % int(PT.tr[f.sp]), Color("#ff9ac0"))
				if int(PT.tr[f.sp]) >= 100: _evcillestir(f.sp, a if vahsi else null)

## canlı yiyeceğe yürürken kendi aklıyla gitmez
func yem_hedefi(a) -> bool:
	for f in FD:
		if f.a == a: return true
	return false

# ------------------------------------------------------------------ yanındakiler (web petTick)
func _dusman():
	var P: Vector2 = oyun.oyuncu.position
	var en = null
	var bd = 170.0
	for a in oyun.canlilari_ver():
		if not (a.mad or a.st == "chase") or a.has_meta("yem") or a.ders: continue
		var d: float = a.position.distance_to(P)
		if d < bd:
			bd = d
			en = a
	return en

func _yoldaslar(dt: float) -> void:
	var en = _dusman()
	var P = oyun.oyuncu
	var tn = simdi()
	var fi = 0
	var pc = agil_merkez()
	var k = 0
	for p in PT.pets.duplicate():
		var S: Dictionary = SP[p.sp]
		var n = p.n
		if float(p.grow) > 0.0 and tn >= float(p.grow):
			p.grow = 0.0
			env.mesaj("%s büyüdü! Artık seninle savaşır." % p.name)
		n.olcek = 0.6 if float(p.grow) > 0.0 else 1.0
		n.hp_oran = float(p.hp) / float(S.hp)
		n.soluk = p.at == "down"
		if p.at != "with":
			n.etiket = false
			n.yuruyor = false
			if pc == null:
				n.visible = false
				continue
			n.visible = true
			var a = k * 2.1 + t * 0.15
			n.position = pc + Vector2(cos(a) * 12, sin(a) * 8)
			k += 1
			continue
		n.visible = true
		if p == binilen: continue
		n.spr.position.y = 0.0
		n.etiket = n.position.distance_to(P.position) > 26.0
		var yavru = float(p.grow) > 0.0
		if not S.has("m") and not yavru and en != null and en.position.distance_to(P.position) < 170.0:
			var hd: Vector2 = en.position + Vector2(-14 if en.position.x > n.position.x else 14, 0)
			var d = _adim(n, hd, 110.0, dt)
			n.yuruyor = d > 1.0
			p.atk -= dt
			if d < 24.0 and p.atk <= 0.0:
				p.atk = float(S.cd)
				en.vuruldu(int(S.dmg), (en.position - n.position).normalized())
				if S.has("grip"): en.kb = {v = Vector2.ZERO, t = 1.5}
				if en.hp <= 0.0: continue
			p.ht -= dt
			if d < 26.0 and p.ht <= 0.0:
				p.ht = 1.2
				p.hp -= roundf(float(en.D.get("dmg", 5)) * 0.7)
				_yaz(n.position, "-%d" % int(roundf(float(en.D.get("dmg", 5)) * 0.7)), Color("#ffb0a0"))
				if p.hp <= 0.0:
					_ol(p)
					break
		else:
			var off = Vector2(-22, 10) if S.has("m") else Vector2(20 if fi % 2 else -20, 18 + floorf(fi / 2.0) * 10)
			if not S.has("m"): fi += 1
			var fx: float = P.bakis.x if absf(P.bakis.x) > 0.1 else 1.0
			var hd = P.position + Vector2(off.x * signf(fx) * -1.0, off.y)
			var d = n.position.distance_to(hd)
			if d > 320.0: n.position = P.position + off
			elif d > 18.0:
				_adim(n, hd, minf(150.0, 60.0 + d), dt)
				n.yuruyor = true
			else: n.yuruyor = false
			if en == null: p.hp = minf(float(S.hp), p.hp + 0.5 * dt)

# ------------------------------------------------------------------ çizim: inler, yiyecekler, vahşi hayvanın kalbi
func _r(n: CanvasItem, x: float, y: float, w: float, h: float, c: String) -> void:
	n.draw_rect(Rect2(x, y, w, h), Color(c))

func _in_ciz(n: Node2D, sp: String) -> void:
	match sp:
		"kurt":
			_r(n, -14, -6, 28, 12, "#5a4430"); _r(n, -12, -8, 24, 4, "#6a5038"); _r(n, -7, -3, 14, 8, "#1a120c"); _r(n, -5, -5, 10, 3, "#2a1e14"); _r(n, -16, 4, 6, 3, "#7a6a4a"); _r(n, 10, 4, 7, 3, "#7a6a4a")
		"timsah":
			_r(n, -15, -4, 30, 10, "#4a4028"); _r(n, -12, -7, 24, 5, "#5a5030")
			for i in 6: _r(n, -13 + i * 5, -11 - (i % 2) * 3, 1, 6, "#6a8a3a")
			_r(n, -4, -2, 8, 4, "#2a2414")
		_:
			_r(n, -14, -8, 28, 14, "#2a2626"); _r(n, -12, -10, 24, 4, "#3a3434"); _r(n, -6, -4, 12, 8, "#140c0a"); _r(n, -4, 1, 8, 2, "#ff6a1a"); _r(n, -10, -9, 2, 8, "#ff5a1a")

func _draw() -> void:
	for f in FD:
		var ic: Texture2D = env.ikon_al(str(SP[f.sp].food))
		if ic != null: draw_texture_rect(ic, Rect2(f.p.x - 5, f.p.y - 8, 10, 10), false)
	for sp in SP:
		if SP[sp].has("pup") or int(PT.tr.get(sp, 0)) <= 0 or not evcillesir(sp): continue
		var a = _vahsi(sp, 400.0)
		if a != null: YoldasS.kalp_ciz(self, a.position + Vector2(0, -float(a.D.get("top", 14)) - 6), float(PT.tr[sp]))
	var pc = agil_merkez()
	if pc != null and not PT.dead.is_empty():
		var s: Vector2 = pc + Vector2(18, 14)
		_r(self, s.x - 3, s.y - 7, 6, 8, "#8a8a90"); _r(self, s.x - 2, s.y - 8, 4, 1, "#a0a0a8"); _r(self, s.x - 1, s.y - 5, 2, 1, "#5a5a60"); _r(self, s.x - 4, s.y + 1, 8, 2, "#00000040")

# ------------------------------------------------------------------ ağıl penceresi ve ad penceresi
func _arayuz() -> void:
	kat = CanvasLayer.new(); kat.layer = 6; kat.visible = false
	add_child(kat)
	var arka = ColorRect.new(); arka.color = Color(0.03, 0.05, 0.03, 0.55)
	arka.gui_input.connect(_arka_tik)
	kat.add_child(arka); arka.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	pen_kutu = _kutu()
	kat.add_child(pen_kutu)
	pen_liste = VBoxContainer.new(); pen_kutu.add_child(pen_liste)
	ad_kutu = _kutu()
	kat.add_child(ad_kutu)
	var v = VBoxContainer.new(); ad_kutu.add_child(v)
	var b = Label.new(); b.text = "Adını koy"; b.add_theme_font_size_override("font_size", 18); b.add_theme_color_override("font_color", Color("#f2b84b")); v.add_child(b)
	var l = Label.new(); l.text = "Yeni dostuna bir ad ver."; v.add_child(l)
	ad_giris = LineEdit.new(); ad_giris.max_length = 12; ad_giris.custom_minimum_size = Vector2(300, 0)
	ad_giris.text_submitted.connect(func(_s): _ad_bitti())
	v.add_child(ad_giris)
	var ok = Button.new(); ok.text = "Tamam"; ok.pressed.connect(_ad_bitti); v.add_child(ok)

func _kutu() -> PanelContainer:
	var p = PanelContainer.new()
	var st = StyleBoxFlat.new(); st.bg_color = Color("#1c2419"); st.border_color = Color("#7a9a4a"); st.set_border_width_all(3); st.set_content_margin_all(12)
	p.add_theme_stylebox_override("panel", st)
	p.visible = false
	return p

func _ortala(p: Control) -> void:
	p.reset_size()
	var vs = get_viewport().get_visible_rect().size
	p.position = ((vs - p.size) / 2.0).floor()

func _arka_tik(e: InputEvent) -> void:
	if e is InputEventMouseButton and e.pressed:
		if ad_kutu.visible: _ad_bitti()
		else: kapat()

func acik() -> bool:
	return kat.visible

func kapat() -> void:
	kat.visible = false
	pen_kutu.visible = false

func _unhandled_input(e: InputEvent) -> void:
	if kat.visible and e is InputEventKey and e.pressed and e.keycode == KEY_ESCAPE:
		if ad_kutu.visible: _ad_bitti()
		else: kapat()
		get_viewport().set_input_as_handled()

func ad_sor(oneri: String, cb: Callable) -> void:
	ad_cb = cb
	pen_kutu.visible = false
	ad_kutu.visible = true
	kat.visible = true
	ad_giris.text = oneri
	_ortala.call_deferred(ad_kutu)
	ad_giris.grab_focus.call_deferred()
	ad_giris.select_all.call_deferred()

func _ad_bitti() -> void:
	if not ad_kutu.visible: return
	var v = ad_giris.text.replace("<", "").replace(">", "").replace("&", "").replace("\"", "").strip_edges().substr(0, 12)
	ad_kutu.visible = false
	kat.visible = false
	var cb = ad_cb
	ad_cb = Callable()
	if cb.is_valid(): cb.call(v)

func agil_ac() -> void:
	if binilen != null: in_()
	ad_kutu.visible = false
	pen_kutu.visible = true
	kat.visible = true
	_agil_yaz()

func _agil_yaz() -> void:
	for c in pen_liste.get_children():
		pen_liste.remove_child(c); c.queue_free()
	var b = Label.new(); b.text = "Ağıl"; b.add_theme_font_size_override("font_size", 18); b.add_theme_color_override("font_color", Color("#f2b84b")); pen_liste.add_child(b)
	if PT.pets.is_empty():
		pen_liste.add_child(_yazi("Ağıl boş. Çoban Davut sana hayvanları anlatır; evcilleştirdiklerin burada yaşar.", Color("#e8f0d8")))
	for p in PT.pets:
		var S: Dictionary = SP[p.sp]
		var h = HBoxContainer.new(); h.custom_minimum_size = Vector2(420, 0)
		var yer: String = " · baygın" if p.at == "down" else (" · yanında" if p.at == "with" else " · ağılda")
		var L := _yazi("%s\n%s · %s%s · can %d/%d%s" % [p.name, S.anim, "binek" if S.has("m") else "savaşçı", " · yavru" if float(p.grow) > simdi() else "", int(round(p.hp)), int(S.hp), yer], Color("#e8f0d8"))
		L.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.add_child(L)
		var btn = Button.new()
		if p.at == "down":
			btn.text = "Ayağa kaldır · 3 %s (%d)" % [S.food, env.adet(str(S.food))]
			btn.disabled = env.adet(str(S.food)) < 3
			btn.pressed.connect(_kaldir.bind(p))
		elif p.at == "with":
			btn.text = "Ağılda bıraksın"
			btn.pressed.connect(_birak_agil.bind(p))
		else:
			btn.text = "Yanıma alayım"
			btn.disabled = yaninda(S.has("m")) >= (1 if S.has("m") else 2)
			btn.pressed.connect(_yanima.bind(p))
		h.add_child(btn)
		pen_liste.add_child(h)
	pen_liste.add_child(_yazi("Yanında en çok 1 binek ve 2 savaşçı dolaşır; öbürleri ağılda bekler.", Color("#a8b898")))
	if not PT.dead.is_empty():
		var ad: Array = []
		for d in PT.dead: ad.append(d.n)
		pen_liste.add_child(_yazi("Ağılın köşesindeki taşta yazanlar: " + ", ".join(ad), Color("#a8b898")))
	var k = Button.new(); k.text = "Kapat"; k.pressed.connect(kapat); k.size_flags_horizontal = Control.SIZE_SHRINK_END; pen_liste.add_child(k)
	_ortala.call_deferred(pen_kutu)

func _yazi(s: String, c: Color) -> Label:
	var l = Label.new(); l.text = s; l.add_theme_font_size_override("font_size", 13); l.add_theme_color_override("font_color", c)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; l.custom_minimum_size = Vector2(300, 0)
	return l

func _kaldir(p: Dictionary) -> void:
	var S: Dictionary = SP[p.sp]
	if env.adet(str(S.food)) < 3: return
	env.eksilt(str(S.food), 3)
	p.hp = float(S.hp)
	p.at = "pen"
	env.mesaj("%s ayağa kalktı." % p.name)
	_agil_yaz()

func _birak_agil(p: Dictionary) -> void:
	if binilen == p: in_()
	p.at = "pen"
	_agil_yaz()

func _yanima(p: Dictionary) -> void:
	var S: Dictionary = SP[p.sp]
	if yaninda(S.has("m")) >= (1 if S.has("m") else 2): return
	p.at = "with"
	p.n.position = oyun.oyuncu.position + Vector2(12, 8)
	_agil_yaz()

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	if kapali and ham != null: return ham
	var L: Array = []
	for p in PT.pets:
		L.append({id = p.id, sp = p.sp, name = p.name, hp = p.hp, at = p.at, grow = p.grow})
	return {pets = L, tr = PT.tr, trT = PT.trT, ever = PT.ever, den = PT.den, dead = PT.dead, no = PT.no, mom = PT.mom, nid = PT.nid, dav = PT.dav, ipucu = PT.ipucu, bin_ipucu = PT.bin_ipucu, keci = keci.durum, keci_n = keci.cnt}

func yukle(d: Dictionary) -> void:
	if kapali:
		ham = d
		keci.durum = str(d.get("keci", keci.durum))
		return
	if binilen != null: in_()
	_sifirla()
	for k in ["tr", "trT", "ever", "den", "no", "mom"]:
		if d.has(k): PT[k] = d[k]
	if d.has("dead"): PT.dead = d.dead
	PT.nid = int(d.get("nid", 1))
	PT.dav = str(d.get("dav", ""))
	PT.ipucu = bool(d.get("ipucu", false))
	PT.bin_ipucu = bool(d.get("bin_ipucu", false))
	keci.durum = str(d.get("keci", ""))
	if keci.durum == "kac" or keci.durum == "izle": keci.durum = ""
	keci.cnt = 0
	for x in d.get("pets", []):
		if not SP.has(str(x.sp)): continue
		var p = {id = int(x.id), sp = str(x.sp), name = str(x.name), hp = float(x.hp), at = str(x.at), grow = float(x.grow), atk = 0.0, ht = 0.0}
		PT.pets.append(p)
		_dugum(p, oyun.oyuncu.position + Vector2(12, 8))
