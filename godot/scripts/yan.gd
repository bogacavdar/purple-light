extends Node2D
## Yan görevler (web v230: Q, GATE, opened, present, talk, start, advance, complete, tick; belge 99_godot 3f ve Yan görevler).
## Yan kişiler kendi saatinde, kendi yerinde; birden çok görev alınır, biri takip edilir; adımlar: go, collect, use, bring, kill, guard, escort, back.

var oyun
var env
var V: Dictionary
var Q: Array = []
var BY := {}
var done := {}
var met := {}
var ACT: Array = []
var A = null
var kisi_n := {}
var dunya_n: Array = []
var fol: Node2D = null
var t := 0.0
var bak_t := 0.0
var soz_t := 0.0
var coo_t := 0.0
var kart: PanelContainer
var pen_kat: CanvasLayer
var pen_kutu: PanelContainer
var pen_liste: VBoxContainer
var birak_onay := ""
var kart_yazi: RichTextLabel
var tex := {}
const DAT_EK := {"a": "'a", "e": "'e", "ı": "'a", "i": "'e", "o": "'a", "ö": "'e", "u": "'a", "ü": "'e"}

func kur(o) -> void:
	oyun = o
	env = o.env
	V = o._json("res://data/yan.json")
	Q = V.yan
	z_index = 20
	for q in Q:
		BY[q.id] = q
		var n := Node2D.new()
		n.position = Vector2(q.x, q.y)
		var sp := Sprite2D.new()
		sp.texture = load(q.resim_f)
		sp.centered = false
		sp.offset = Vector2(-12, -36)
		n.add_child(sp)
		n.draw.connect(_kisi_ciz.bind(n, q))
		n.visible = false
		o.nesneler.add_child(n)
		kisi_n[q.id] = n
	_kart_kur()
	_pencere_kur()
	_dunya.call_deferred()

func _tx(k: String) -> Texture2D:
	if not tex.has(k):
		tex[k] = load(V.nesne[k].png) if V.nesne.has(k) else null
	return tex[k]

# ------------------------------------------------------------------ kim nerede, ne zaman
func _dk() -> float:
	return oyun.zaman.dk

func _pencere(w: Array) -> bool:
	var a := float(w[0]); var b := float(w[1]); var m := _dk()
	return (m >= a and m < b) if a < b else (m >= a or m < b)

func act(id: String):
	for a in ACT:
		if a.id == id: return a
	return null

func _ana_biten() -> Array:
	var L: Array = []
	for id in oyun.gorev.bitenler:
		if not str(id).begins_with("F-"): L.append(str(id))
	return L

func acik_mi(q: Dictionary) -> bool:
	var d := _ana_biten()
	var n := 0
	for x in Q:
		if int(x.b) != int(q.b): continue
		if done.has(x.id): continue
		if met.has(x.id) or act(x.id) != null:
			if x == q: return true
			n += 1
			continue
		var g: Array = x.gate
		if n < 2 and d.size() >= int(g[0]) and (g.size() < 2 or d.has(str(g[1]))):
			if x == q: return true
			n += 1
	return false

func _takipci(q: Dictionary) -> bool:
	if A == null or A.id != q.id: return false
	var s = _adim()
	return s != null and s.t == "escort" and s.get("who", "") == "self"

func var_mi(q: Dictionary) -> bool:
	if oyun.magara.icinde: return false
	if q.get("ghost", 0): return false
	if done.has(q.id): return true
	if act(q.id) != null: return not _takipci(q)
	if not acik_mi(q): return false
	return met.has(q.id) or _pencere(q.win)

func ev(q: Dictionary) -> Vector2:
	if done.has(q.id):
		if q.has("homeDone") and q.pts.has(q.homeDone): return Vector2(q.pts[q.homeDone].x, q.pts[q.homeDone].y)
		if q.id == "mina": return _kamp()
	return Vector2(q.x, q.y)

func _kamp() -> Vector2:
	return Vector2(oyun.zaman.A.kamp.x + 10, oyun.zaman.A.kamp.y + 22)

func _adim():
	if A == null: return null
	var q: Dictionary = BY[A.id]
	return q.steps[A.step] if A.step < q.steps.size() else null

# ------------------------------------------------------------------ konuşma (web talk, pages)
func f() -> bool:
	var P: Vector2 = oyun.oyuncu.position
	for q in Q:
		var n: Node2D = kisi_n[q.id]
		if n.visible and n.position.distance_to(P) < 26.0:
			_konus(q)
			return true
	return false

func _kim(q: Dictionary, k: String) -> Array:
	match k:
		"p": return ["Sen", null]
		"e":
			var K: Dictionary = oyun.toplama_veri.kisiler[0]
			return [K.ad, load(K.portre) if K.get("portre", null) != null else null]
		"x":
			var s = _adim()
			var dr: String = str(s.get("draw", "")) if s != null else ""
			if dr != "" and _tx(dr) != null: return ["—", _tx(dr)]
			return ["—", load(q.portre)]
	return [q.name, load(q.portre)]

func _bb(s: String) -> String:
	return oyun.gorev._bb(s)

func sayfalar(q: Dictionary, L: Array, son: Callable, son_dugme := "Tamam", i := 0) -> void:
	if i >= L.size():
		if A != null: A.busy = false
		son.call()
		return
	var l: Array = L[i]
	var k := _kim(q, str(l[0]))
	var metin := _bb(str(l[1]))
	if str(l[0]) == "x": metin = "[i]%s[/i]" % metin
	var dugme: String = son_dugme if i == L.size() - 1 else ("…" if q.get("quiet", 0) and str(l[0]) != "x" else "Devam")
	oyun.konusma.ac(k[0], k[1], metin, [{t = dugme, pri = true, kapat = true, f = sayfalar.bind(q, L, son, son_dugme, i + 1)}])

func _konus(q: Dictionary) -> void:
	var por = load(q.portre)
	if done.has(q.id):
		var L: Array = q.after
		if L.is_empty(): return
		oyun.konusma.ac(q.name, por, _bb(str(L[randi() % L.size()])), [{t = "Hoşça kal", pri = true, kapat = true}])
		return
	var mine = act(q.id)
	if mine != null and mine != A: _takip(mine)
	if A != null and A.id == q.id:
		var s = _adim()
		if s.t == "back":
			A.busy = true
			sayfalar(q, s.on, _bitir.bind(q), "…" if q.get("quiet", 0) else "Tamam")
			return
		if s.t == "escort" and s.get("to", "") == "npc" and fol != null and fol.position.distance_to(Vector2(q.x, q.y)) < 90.0:
			A.busy = true
			sayfalar(q, s.on, _ilerle)
			return
		if s.t == "bring":
			if _hepsi(s.items):
				for it in s.items: env.eksilt(str(it[0]), int(it[1]))
				A.busy = true
				sayfalar(q, s.on, _ilerle)
			else:
				var g: Array = []
				for it in s.items: g.append("%d/%d %s" % [mini(env.adet(str(it[0])), int(it[1])), int(it[1]), it[0]])
				oyun.konusma.ac(q.name, por, "%s\n[font_size=12]Gereken: %s[/font_size]" % [_bb(str(q.remind)), " · ".join(g)], [{t = "Getireceğim", pri = true, kapat = true}])
			return
		var r: String = str(q.get("remindUse", "")) if s.t == "use" and q.has("remindUse") else str(q.get("remind", "…"))
		oyun.konusma.ac(q.name, por, _bb(r), [{t = "Tamam", pri = true, kapat = true}])
		return
	_tanit(q, 0)

func _tanit(q: Dictionary, i: int) -> void:
	var L: Array = q.intro
	var l: Array = L[i]
	var por = load(q.portre)
	if i < L.size() - 1:
		oyun.konusma.ac(q.name, por, _bb(str(l[1])), [{t = "Devam", pri = true, kapat = true, f = _tanit.bind(q, i + 1)}])
		return
	oyun.konusma.ac(q.name, por, _bb(str(l[1])), [{t = "Yardım ederim", f = _basla.bind(q)}, {t = "Şimdi olmaz", pri = true, kapat = true}])

func _alet_var(kind: String) -> bool:
	for n in env.inv:
		if env.adet(n) > 0 and env.G.tools.has(n) and env.G.tools[n].kind == kind: return true
	return false

func _hepsi(items: Array) -> bool:
	for it in items:
		if env.adet(str(it[0])) < int(it[1]): return false
	return true

# ------------------------------------------------------------------ durum (web start, advance, complete, cancelA, park, track)
func _sifirla_adim() -> void:
	if A == null: return
	A.got = []; A.cnt = 0; A.sp = false; A.killed = 0; A.tm = 0.0; A.wt = 0.0; A.wv = 0; A.wn = 0; A.busy = false
	_canavar_sil()
	if fol != null:
		fol.queue_free()
		fol = null
	var s = _adim()
	if s == null: return
	var q: Dictionary = BY[A.id]
	if s.t == "chase":
		if not A.has("keci"): A.keci = Vector2(q.pts[s.p].x, q.pts[s.p].y)
		A.gj = null; A.gcd = 0.0
	if s.t == "escort":
		if str(s.get("who", "")) == "goat":
			fol = preload("res://scripts/yoldas.gd").new()
			fol.kur({})
			fol.katir = str(s.get("anim", q.get("anim", ""))) == "mule"
		else:
			fol = Node2D.new()
			var sp := Sprite2D.new()
			sp.texture = load(q.resim_f); sp.centered = false; sp.offset = Vector2(-12, -36)
			fol.add_child(sp)
		fol.set_meta("soz", ""); fol.set_meta("soz_t", 0.0); fol.set_meta("stk", 0.0)
		fol.draw.connect(_fol_ciz)
		fol.position = A.get("keci", Vector2(q.x, q.y)) if str(s.get("who", "")) == "goat" else Vector2(q.x, q.y)
		oyun.nesneler.add_child(fol)
		A.d0 = maxf(80.0, _hedef(s, q).distance_to(fol.position))

func _hedef(s: Dictionary, q: Dictionary) -> Vector2:
	var to: String = str(s.get("to", "npc"))
	if to == "camp": return _kamp()
	if to == "fam3": return Vector2(V.fam3.x, V.fam3.y)
	if to == "npc": return Vector2(q.x, q.y)
	return Vector2(q.pts[to].x, q.pts[to].y)

func _basla(q: Dictionary, at := 0) -> void:
	_birak_takip()
	met[q.id] = true
	A = {id = q.id, step = at}
	ACT.append(A)
	_sifirla_adim()
	env.mesaj("Yan görev: %s" % q.title)

func _ilerle() -> void:
	if A == null: return
	var q: Dictionary = BY[A.id]
	var s = _adim()
	if s != null and s.get("end", 0):
		_bitir(q)
		return
	A.step += 1
	if A.step >= q.steps.size():
		_bitir(q)
		return
	_sifirla_adim()

func _bitir(q: Dictionary) -> void:
	done[q.id] = true
	_canavar_sil()
	if fol != null:
		fol.queue_free(); fol = null
	ACT = ACT.filter(func(a): return a.id != q.id)
	A = null
	env.vio_ekle(int(q.c))
	if int(q.xp) > 0: env.xp_ekle(int(q.xp))
	env.mesaj("%s · Yan görev bitti · +%d Vio · +%d XP" % [q.title, int(q.c), int(q.xp)])
	_dunya()

func iptal(neden: String) -> void:
	if A == null: return
	var q: Dictionary = BY[A.id]
	_canavar_sil()
	if fol != null:
		fol.queue_free(); fol = null
	ACT.erase(A)
	A = null
	if neden != "": env.mesaj("%s: %s. Yeniden almak için %s ile konuş%s." % [neden, q.title, q.name, " (yalnızca gece)" if q.get("night", 0) else ""], true)

func _birak_takip() -> void:
	if A == null: return
	_canavar_sil()
	if fol != null:
		fol.queue_free(); fol = null
	A.busy = false
	var s = _adim()
	if s != null and ["escort", "kill", "guard"].has(str(s.t)): A.rs = true
	A = null

func _takip(a: Dictionary) -> void:
	if a == A: return
	_birak_takip()
	A = a
	if a.get("rs", false):
		a.rs = false
		var g: Array = a.get("got", [])
		_sifirla_adim()
		a.got = g
	elif _adim() != null and _adim().t == "escort": _sifirla_adim()

func _birak_sor() -> void:
	if A == null: return
	oyun.konusma.ac("", null, "Bu yan görevi bırakayım mı?", [{t = "Evet", f = func(): iptal("Yan görevi bıraktın")}, {t = "Hayır", pri = true, kapat = true}])

# ------------------------------------------------------------------ görev canavarları (web spawnMob, wave)
func _canavar(k: String, c: Vector2, r0: float, r1: float) -> void:
	if not oyun.canlilar.has(k): k = "Kurt"
	var D: Dictionary = oyun.canlilar[k]
	for i in 60:
		var a := randf() * TAU
		var p := c + Vector2(cos(a), sin(a)) * randf_range(r0, r1)
		if oyun.engel(p, 6.0) or oyun.zaman.kampta(p): continue
		var n := preload("res://scripts/canli.gd").new()
		n.oyun = oyun; n.tur = k; n.D = D; n.position = p
		n.set_meta("sq", A.id)
		oyun.nesneler.add_child(n)
		n.mad = true; n.st = "chase"
		return

func _dalga(n: int, c: Vector2) -> void:
	var b := clampi(oyun.bio_at(oyun.oyuncu.position), 0, 5)
	var L: Array = V.mob[b]
	for i in n: _canavar(str(L[i % L.size()]), c, 110.0, 170.0)

func _canavarlar() -> Array:
	var L: Array = []
	if A == null: return L
	for c in oyun.canlilari_ver():
		if c.get_meta("sq", "") == A.id: L.append(c)
	return L

func _canavar_sil() -> void:
	for c in oyun.canlilari_ver():
		if c.has_meta("sq"): c.queue_free()

## canlı öldü (oyun.canli_oldu): görev canavarıysa sayılır
func oldu(c) -> bool:
	if c == null or not c.has_meta("sq"): return false
	if A != null and c.get_meta("sq") == A.id:
		var s = _adim()
		if s != null and s.t == "kill": A.killed = int(A.killed) + 1
	return true

# ------------------------------------------------------------------ her kare (web tick)
func _process(dt: float) -> void:
	if oyun.basta: return
	t += dt
	bak_t -= dt
	if bak_t <= 0.0:
		bak_t = 0.4
		_bak()
	_kart_yaz()
	queue_redraw()
	if BY.has("isil"):
		var g: Dictionary = BY.isil
		if not done.has("isil") and act("isil") == null and acik_mi(g) and _pencere(g.win) and not oyun.konusma.visible and oyun.oyuncu.position.distance_to(Vector2(g.x, g.y)) < 60.0:
			_basla(g)
	if A == null or oyun.konusma.visible: return
	if oyun.oyuncu.bayildi:
		iptal("Bayıldın, yan görev yarıda kaldı")
		return
	var q: Dictionary = BY[A.id]
	var s = _adim()
	if s == null or A.busy: return
	var P: Vector2 = oyun.oyuncu.position
	match str(s.t):
		"go":
			if s.get("ghost", 0) and not _pencere(q.win): return
			var p := Vector2(q.pts[s.p].x, q.pts[s.p].y)
			if P.distance_to(p) < (34.0 if s.get("ghost", 0) else 26.0):
				if s.has("tool") and not _alet_var(str(s.tool)):
					soz_t -= dt
					if soz_t <= 0.0:
						soz_t = 3.0
						env.mesaj("%s gerekli" % ("Kazma" if s.tool == "pick" else "Alet"), true)
					return
				A.busy = true
				sayfalar(q, s.on, _ilerle)
		"collect", "use":
			var en := 1e9
			for k in s.ps:
				if A.got.has(k): continue
				var p := Vector2(q.pts[k].x, q.pts[k].y)
				var d := P.distance_to(p)
				en = minf(en, d)
				var r := 40.0 if s.t == "use" else (34.0 if s.get("hide", 0) else 26.0)
				if d < r:
					if s.t == "use" and env.adet(str(s.need)) < 1:
						soz_t -= dt
						if soz_t <= 0.0:
							soz_t = 3.0
							env.mesaj("1 %s gerekli" % s.need, true)
						return
					if s.t == "use": env.eksilt(str(s.need))
					A.got.append(k)
					var son: bool = A.got.size() >= s.ps.size()
					A.busy = true
					var ek := "" if son else "\n[font_size=12]%d/%d[/font_size]" % [A.got.size(), s.ps.size()]
					var cb := _ilerle if son else func(): A.busy = false
					oyun.konusma.ac("—", _kim(q, "x")[1], "[i]%s[/i]%s" % [_bb(str(s.lines[k])), ek], [{t = "Tamam", pri = true, kapat = true, f = cb}])
					return
			if s.get("hide", 0) and en < 260.0:
				coo_t -= dt
				if coo_t <= 0.0:
					var kk := en / 260.0
					coo_t = 0.45 + kk * 1.9
					oyun.yazi(P + Vector2(randf_range(-20, 20), -34), "guru guru…" if str(s.get("draw", "")) == "pigeon" else "♪", Color(0.9, 0.95, 1, 1.0 - kk * 0.6), 7)
		"kill":
			var p := Vector2(q.pts[s.p].x, q.pts[s.p].y)
			var dp := P.distance_to(p)
			if not A.sp and dp < 200.0:
				A.sp = true
				for i in int(s.mobs[1]):
					var mk = s.mobs[0]
					_canavar(str(mk[i % mk.size()]) if mk is Array else str(mk), p, 10.0, 50.0)
				if s.has("spawnTx"): env.mesaj(_bb(str(s.spawnTx)).replace("[b]", "").replace("[/b]", ""), true)
			if A.sp and _canavarlar().is_empty():
				if int(A.killed) >= int(s.mobs[1]):
					_ilerle()
					return
				if dp > 420.0:
					A.sp = false; A.killed = 0
		"guard":
			var dn := P.distance_to(Vector2(q.x, q.y))
			if dn < 90.0:
				A.tm += dt
				A.wt -= dt
				if A.wt <= 0.0:
					A.wt = float(s.every)
					if s.has("seq"):
						var wn := int(A.wn)
						A.wn = wn + 1
						if wn < s.seq.size():
							for k in s.seq[wn]: _canavar(str(k), Vector2(q.x, q.y), 110.0, 170.0)
					else: _dalga(int(s.n), Vector2(q.x, q.y))
			elif dn > 140.0:
				soz_t -= dt
				if soz_t <= 0.0:
					soz_t = 4.0
					env.mesaj("%s: \"%s\"" % [q.name, s.get("stay", "Gitme, yalnız bırakma beni!")], true)
			if A.tm >= float(s.dur):
				A.busy = true
				_canavar_sil()
				sayfalar(q, [["n", s.get("endTx", "Gitti hepsi… Sağ ol.")]], _ilerle)
		"escort":
			_eslik(q, s, dt)
		"chase":
			_kovala(q, s, dt)

func _eslik(q: Dictionary, s: Dictionary, dt: float) -> void:
	if fol == null: _sifirla_adim()
	var P: Vector2 = oyun.oyuncu.position
	var d := _hedef(s, q)
	var dd := P.distance_to(fol.position)
	var st: float = fol.get_meta("soz_t")
	if st > 0.0: fol.set_meta("soz_t", st - dt)
	var gece: bool = oyun.yapi.gece()
	var isik: bool = not s.get("light", 0) or not gece or oyun.mesale.elde() != null or oyun.insa.fener_isiginda(P)
	var kavga := false
	for c in _canavarlar():
		if c.position.distance_to(fol.position) < 140.0: kavga = true
	var soyle := func(x: String) -> void:
		if float(fol.get_meta("soz_t")) <= 0.0:
			fol.set_meta("soz", x); fol.set_meta("soz_t", 2.2)
	if dd > 400.0 or float(fol.get_meta("stk")) > 1.5:
		var a0 := (fol.position - P).angle()
		for k in 12:
			var a: float = a0 + (1 if k % 2 else -1) * ceilf(k / 2.0) * 0.52
			var ok := false
			for r in range(24, 60, 6):
				var p := P + Vector2(cos(a), sin(a)) * r
				if not oyun.engel(p):
					fol.position = p; fol.set_meta("stk", 0.0); ok = true
					break
			if ok: break
	elif not isik: soyle.call("Çok karanlık, ışığın yok!")
	elif kavga: soyle.call("Korkuyorum!")
	elif dd > 160.0: soyle.call("Bekle!")
	elif dd > 22.0:
		var sp := minf(float(s.spd), dd * 3.0)
		var u := (P - fol.position) / dd
		var o: Vector2 = fol.position
		var np: Vector2 = o + u * sp * dt
		if not oyun.engel(np): fol.position = np
		elif not oyun.engel(Vector2(np.x, o.y)): fol.position.x = np.x
		elif not oyun.engel(Vector2(o.x, np.y)): fol.position.y = np.y
		fol.set_meta("stk", float(fol.get_meta("stk")) + dt if fol.position.distance_to(o) < sp * dt * 0.3 else 0.0)
	if s.has("waves"):
		var prog: float = 1.0 - d.distance_to(fol.position) / float(A.d0)
		while int(A.wv) < s.waves.size() and prog >= float(s.waves[int(A.wv)][0]):
			_dalga(int(s.waves[int(A.wv)][1]), P)
			A.wv = int(A.wv) + 1
	fol.queue_redraw()
	if d.distance_to(fol.position) < 44.0:
		A.busy = true
		sayfalar(q, s.on, _ilerle)

## kovalama (web chase, goatDest, goatRun): yavru keçi 18 px'e girince "Mee!" deyip kaçar; n kez yakalanınca biter
func _kovala(q: Dictionary, s: Dictionary, dt: float) -> void:
	var g: Vector2 = A.keci
	var P: Vector2 = oyun.oyuncu.position
	if float(A.gcd) > 0.0: A.gcd = float(A.gcd) - dt
	if A.gj == null and float(A.gcd) <= 0.0 and P.distance_to(g) < 18.0:
		A.cnt = int(A.cnt) + 1
		if int(A.cnt) >= int(s.n):
			oyun.yazi(g + Vector2(0, -20), "Yakalandı!", Color("#9fe07a"), 9)
			_ilerle()
			return
		A.gcd = 1.5
		var d = oyun.evcil._keci_hedef_b(g, int(q.b))
		if d != null: A.gj = {x1 = d, t = 0.0, side = -1 if randf() < 0.5 else 1, best = 1e9, stk = 0.0, flip = 0}
		oyun.yazi(g + Vector2(0, -20), "Mee!", Color.WHITE, 9)
	if A.gj != null:
		var j: Dictionary = A.gj
		var dv: Vector2 = j.x1 - g
		var dd := dv.length()
		j.t += dt
		if dd < 10.0 or j.t > 40.0:
			A.gj = null
			return
		if dd < j.best - 3.0:
			j.best = dd; j.stk = 0.0
		else:
			j.stk += dt
			if j.stk > 1.2:
				j.stk = 0.0; j.flip += 1
				if j.flip >= 3:
					A.gj = null
					return
				j.side = -j.side
		var hz := maxf(180.0, 72.0 * oyun.stat("move") * float(oyun.oyuncu.V.runMult) * 2.5)
		var sp := minf(hz * dt, dd)
		for da in [0.0, 0.55, -0.55, 1.1, -1.1, 1.7, -1.7]:
			var a: float = dv.angle() + da * j.side
			var nq: Vector2 = g + Vector2(cos(a), sin(a)) * sp
			if not oyun.engel(nq) and not oyun.evcil._su_yakin(nq):
				A.keci = nq
				return

# ------------------------------------------------------------------ kişiler ve dünyadaki izler
func _bak() -> void:
	for q in Q:
		var n: Node2D = kisi_n[q.id]
		var v := var_mi(q)
		n.visible = v
		if v: n.position = ev(q)
		n.queue_redraw()

func _alinir(q: Dictionary) -> bool:
	return not done.has(q.id) and act(q.id) == null

func _kisi_ciz(n: Node2D, q: Dictionary) -> void:
	if not _alinir(q): return
	var y := -30.0 if q.kid else -38.0
	y += roundf(sin(t * 4.0) * 1.5)
	var c := Color("#9fd8ff")
	n.draw_rect(Rect2(-3, y - 1, 7, 10), Color("#11170f"))
	n.draw_rect(Rect2(-2, y, 5, 1), c); n.draw_rect(Rect2(1, y + 1, 1, 2), c); n.draw_rect(Rect2(0, y + 3, 1, 2), c); n.draw_rect(Rect2(-1, y + 3, 1, 1), c); n.draw_rect(Rect2(-1, y + 6, 2, 2), c)

func _fol_ciz() -> void:
	if fol == null or float(fol.get_meta("soz_t")) <= 0.0: return
	var s: String = fol.get_meta("soz")
	var fnt := ThemeDB.fallback_font
	var w := fnt.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, 6).x + 8
	var y := -42.0
	fol.draw_rect(Rect2(-w / 2 - 1, y - 1, w + 2, 11), Color("#11170f"))
	fol.draw_rect(Rect2(-w / 2, y, w, 9), Color("#e8f4ff"))
	fol.draw_string(fnt, Vector2(-w / 2 + 4, y + 7), s, HORIZONTAL_ALIGNMENT_LEFT, -1, 6, Color("#1a2a3a"))

## web entsSQ: bitenlerin dünyadaki izleri ve görevin sabit eşyaları
func _dunya() -> void:
	for n in dunya_n: n.queue_free()
	dunya_n = []
	for q in Q:
		var d: bool = done.has(q.id)
		for f in q.get("fix", []):
			var at := f[1] is String
			var w: String = str(f[4] if at else f[3])
			if (w == "done" and not d) or (w == "notdone" and d): continue
			var bp := Vector2(q.x, q.y)
			if at:
				var pk: String = str(f[1]).substr(1)
				if not q.pts.has(pk): continue
				bp = Vector2(q.pts[pk].x, q.pts[pk].y)
			_nesne(str(f[0]), bp + Vector2(float(f[2] if at else f[1]), float(f[3] if at else f[2])))
		if q.id == "sadik": _nesne("cart" if d else "cartT", Vector2(q.x + 24, q.y + 2))
		if q.id == "saniye":
			_nesne("hut", Vector2(q.x + 28, q.y - 6))
			if d: _nesne("grave", Vector2(q.x - 22, q.y + 4))
		if q.id == "isil" and d:
			_nesne("stone", Vector2(q.pts.stone.x, q.pts.stone.y)); _nesne("lantern", Vector2(q.pts.stone.x + 9, q.pts.stone.y + 1))
		if not d: continue
		var h := ev(q)
		if q.get("goatDone", 0):
			var gk = preload("res://scripts/yoldas.gd").new()
			gk.kur({}); gk.position = h + Vector2(18, 6); gk.face = -1; gk.katir = str(q.get("anim", "")) == "mule"
			oyun.nesneler.add_child(gk); dunya_n.append(gk)
		match q.id:
			"kerem":
				_nesne("coop", h + Vector2(20, -2))
				for i in 4: _nesne("pigeon", h + Vector2(-14 + i * 9, 12 + (i * 7) % 5))
			"elif": _nesne("flowers", h + Vector2(10, 6))
			"toprak":
				_nesne("nest", h + Vector2(16, 6)); _nesne("quail", h + Vector2(16, 3))
			"sabri": _nesne("embers", h + Vector2(14, 6))

func _nesne(k: String, p: Vector2) -> void:
	if not V.nesne.has(k): return
	var N: Dictionary = V.nesne[k]
	var s := Sprite2D.new()
	s.texture = _tx(k)
	s.centered = false
	s.offset = Vector2(-float(N.ox), -float(N.oy))
	s.position = p
	oyun.nesneler.add_child(s)
	dunya_n.append(s)

func _keci_ciz(p: Vector2, f: int, hop: int, katir := false) -> void:
	var y := p.y - hop
	var P := func(dx: float, dy: float, w: float, h: float, c: String) -> void:
		draw_rect(Rect2(p.x + (dx if f > 0 else -dx - w), y + dy, w, h), Color(c))
	if katir:
		# web drawMule: Ömer'in katırı Kınalı
		draw_rect(Rect2(p.x - 8, p.y + 1, 16, 2), Color(0, 0, 0, 0.22))
		P.call(-7, -10, 13, 6, "#8a5a36"); P.call(-7, -10, 13, 1, "#a8744a"); P.call(-5, -12, 8, 3, "#c8a060"); P.call(-5, -12, 8, 1, "#e0c080"); P.call(5, -14, 4, 6, "#8a5a36"); P.call(8, -11, 2, 3, "#6a4428"); P.call(7, -12, 1, 1, "#1a1008"); P.call(5, -17, 1, 3, "#6a4428"); P.call(7, -17, 1, 3, "#6a4428"); P.call(-8, -9, 1, 4, "#4a2e18")
		P.call(-6, -4, 2, 4, "#6a4428"); P.call(-2, -4, 2, 4, "#6a4428"); P.call(1, -4, 2, 4, "#6a4428"); P.call(4, -4, 2, 4, "#6a4428")
		return
	draw_rect(Rect2(p.x - 6, p.y + 1, 12, 2), Color(0, 0, 0, 0.22))
	P.call(-5, -7, 10, 5, "#f0ece4"); P.call(-5, -7, 10, 1, "#ffffff"); P.call(4, -10, 4, 4, "#f0ece4"); P.call(7, -8, 1, 1, "#2a1f08"); P.call(5, -12, 1, 2, "#b8a888")
	P.call(-4, -2, 1, 3, "#c8c0b0"); P.call(-1, -2, 1, 3, "#c8c0b0"); P.call(2, -2, 1, 3, "#c8c0b0"); P.call(4, -2, 1, 3, "#c8c0b0")

## Işıl: gece, kendi saatinde soluk ışıklı bir kız (web isil); görev sürerken ışık izinin noktasında belirir
var _isil_tex: Texture2D
func _hayalet_ciz() -> void:
	if not BY.has("isil"): return
	var q: Dictionary = BY.isil
	if done.has("isil") or not _pencere(q.win): return
	var p = null
	var ia = act("isil")
	if ia == null:
		if acik_mi(q): p = Vector2(q.x, q.y)
	elif ia == A:
		var s = _adim()
		if s != null and s.get("ghost", 0): p = Vector2(q.pts[s.p].x, q.pts[s.p].y)
	if p == null or p.distance_to(oyun.oyuncu.position) > 500.0: return
	if _isil_tex == null: _isil_tex = load(q.resim_f)
	var fl := sin(t * 2.0) * 2.0
	draw_circle(p + Vector2(0, -10), 24.0, Color(0.59, 0.75, 1, 0.12))
	draw_texture(_isil_tex, p + Vector2(-12, -36 + fl), Color(1, 1, 1, 0.45 + 0.15 * sin(t * 3.0)))

## takip edilen görevin aradığı şeyler: resmi, mavi halka ve kıvılcımlar (web curPts)
func _draw() -> void:
	if oyun.magara.icinde: return
	_hayalet_ciz()
	if A == null: return
	var q: Dictionary = BY[A.id]
	var s = _adim()
	if s == null: return
	var L: Array = []
	if s.t == "go" and s.has("draw"): L.append([s.draw, q.pts[s.p], false])
	if s.t == "collect" or s.t == "use":
		for k in s.ps:
			if not A.got.has(k): L.append([s.get("draw", ""), q.pts[k], s.get("hide", 0) == 1])
	if s.t == "kill" and s.has("draw"): L.append([s.draw, q.pts[s.p], false])
	if q.id == "elif" and A.step >= 1: L.append(["wreck", q.pts.wreck, false])
	if q.id == "saniye" and A.step >= 3:
		L.append(["cave", q.pts.cave, true])
	if s.t == "chase" and A.has("keci"): _keci_ciz(A.keci, 1 if oyun.oyuncu.position.x < A.keci.x else -1, 1 if A.gj != null and sin(t * 14.0) > 0.0 else 0, str(s.get("anim", q.get("anim", ""))) == "mule")
	for x in L:
		var p := Vector2(x[1].x, x[1].y)
		if p.distance_to(oyun.oyuncu.position) > 500.0: continue
		var k: String = x[0]
		if V.nesne.has(k):
			var N: Dictionary = V.nesne[k]
			draw_texture(_tx(k), p - Vector2(float(N.ox), float(N.oy)))
		if x[2] or k == "cave" or k == "body": continue
		var q2 := fmod(t * 1.2, 1.0)
		draw_arc(p + Vector2(0, -2), 6.0 + q2 * 10.0, 0, TAU, 24, Color(0.62, 0.85, 1, 1.0 - q2), 1.0)
		for j in 4:
			var ph := fmod(t * 1.7 + j * 0.25 + fmod(p.x, 7.0) * 0.1, 1.0)
			var an := j * 1.57 + t * 0.6
			var rr := 5.0 + j * 2.5
			var al := sin(ph * PI)
			if al < 0.15: continue
			draw_rect(Rect2(roundf(p.x + cos(an) * rr), roundf(p.y - 4 + sin(an) * rr * 0.7 - ph * 6), 1, 1), Color(0.75, 0.91, 1, al))

# ------------------------------------------------------------------ kart (web renderSQ)
func _kart_kur() -> void:
	kart = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.04, 0.06, 0.09, 0.82); st.border_color = Color("#7fc8ff"); st.set_border_width_all(1); st.set_content_margin_all(8)
	kart.add_theme_stylebox_override("panel", st)
	var h := HBoxContainer.new(); kart.add_child(h)
	kart_yazi = RichTextLabel.new(); kart_yazi.bbcode_enabled = true; kart_yazi.fit_content = true; kart_yazi.scroll_active = false
	kart_yazi.custom_minimum_size = Vector2(256, 0)
	h.add_child(kart_yazi)
	var x := Button.new(); x.text = "×"; x.flat = true; x.pressed.connect(_birak_sor); x.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	h.add_child(x)
	oyun.hud.add_child(kart)
	kart.anchor_left = 1.0; kart.anchor_right = 1.0
	kart.offset_left = -310.0; kart.offset_right = -10.0
	kart.visible = false

func adim_yazi() -> String:
	var s = _adim()
	if s == null: return ""
	var q: Dictionary = BY[A.id]
	var tx: String = str(s.get("tx", ""))
	match str(s.t):
		"collect", "use": tx += " · %d/%d" % [A.got.size(), s.ps.size()]
		"bring":
			var g: Array = []
			for it in s.items: g.append("%d/%d %s" % [mini(env.adet(str(it[0])), int(it[1])), int(it[1]), it[0]])
			tx = "%s götür: %s" % [_dat(str(q.name)), " · ".join(g)]
		"guard": tx += " · %d sn" % maxi(0, int(ceil(float(s.dur) - float(A.tm))))
		"kill":
			if A.sp: tx += " · %d/%d" % [int(A.killed), int(s.mobs[1])]
		"escort":
			if s.get("light", 0) and oyun.yapi.gece() and oyun.mesale.elde() == null: tx += " · ışık gerekli (meşale)"
	return tx

func _dat(ad: String) -> String:
	var son := ""
	for i in range(ad.length() - 1, -1, -1):
		if "aeıioöuü".contains(ad[i]):
			son = ad[i]
			break
	var ek: String = DAT_EK.get(son, "'e")
	if "aeıioöuü".contains(ad[ad.length() - 1]): ek = ek.insert(1, "y")
	return ad + ek

func _kart_yaz() -> void:
	if A == null or oyun.sahne.acik or oyun.ogr.acik():
		kart.visible = false
		return
	var q: Dictionary = BY[A.id]
	kart.visible = true
	var y := 34.0
	var k: Control = oyun.gorev.kart
	if k.visible: y = k.offset_top + k.size.y + 6.0
	var mk: Control = oyun.magara.yan_kart
	if mk.visible: y = mk.offset_top + mk.size.y + 6.0
	kart.offset_top = y
	kart_yazi.text = "[color=#7fc8ff][font_size=11]Yan görev · %s[/font_size][/color]\n[b]%s[/b]\n%s" % [q.name, q.title, adim_yazi()]

# ------------------------------------------------------------------ Görevler penceresi (G; web renderQlog)
func _pencere_kur() -> void:
	pen_kat = CanvasLayer.new(); pen_kat.layer = 6; pen_kat.visible = false
	add_child(pen_kat)
	var arka := ColorRect.new(); arka.color = Color(0.03, 0.05, 0.03, 0.55)
	arka.gui_input.connect(func(e): if e is InputEventMouseButton and e.pressed: kapat())
	pen_kat.add_child(arka); arka.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	pen_kutu = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#1c2419"); st.border_color = Color("#c9a24a"); st.set_border_width_all(2); st.set_content_margin_all(12)
	pen_kutu.add_theme_stylebox_override("panel", st)
	pen_kat.add_child(pen_kutu)
	var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(460, 420)
	pen_kutu.add_child(sc)
	pen_liste = VBoxContainer.new(); pen_liste.custom_minimum_size = Vector2(440, 0)
	sc.add_child(pen_liste)

func acik() -> bool:
	return pen_kat.visible

func ac() -> void:
	birak_onay = ""
	pen_kat.visible = true
	_pencere_yaz()

func kapat() -> void:
	pen_kat.visible = false

func _unhandled_input(e: InputEvent) -> void:
	if e is InputEventKey and e.pressed and not e.echo:
		if pen_kat.visible and (e.keycode == KEY_ESCAPE or e.keycode == KEY_G):
			kapat()
			get_viewport().set_input_as_handled()
		elif e.keycode == KEY_G and not oyun.pencere_acik() and not oyun.oyuncu.kilit and not oyun.basta:
			ac()
			get_viewport().set_input_as_handled()

func _etiket(t: String, boy := 13, renk := Color("#e8f0d8")) -> RichTextLabel:
	var l := RichTextLabel.new(); l.bbcode_enabled = true; l.fit_content = true; l.scroll_active = false
	l.custom_minimum_size = Vector2(430, 0)
	l.add_theme_font_size_override("normal_font_size", boy); l.add_theme_font_size_override("bold_font_size", boy)
	l.add_theme_color_override("default_color", renk)
	l.text = t
	return l

func _pencere_yaz() -> void:
	for c in pen_liste.get_children():
		pen_liste.remove_child(c); c.queue_free()
	var G = oyun.gorev
	pen_liste.add_child(_etiket("[b]Ana görev[/b]", 16, Color("#f2b84b")))
	if G.aktif != null:
		var t := "[b]%s[/b] · %s" % [G.aktif.t, G.ad(G.aktif.g)]
		for p in G.aktif.p: t += "\n" + G.satir(p)
		pen_liste.add_child(_etiket(t))
	else:
		pen_liste.add_child(_etiket("Şu an bir ana görevin yok. Başında ! olan kişiyle konuş.", 12, Color("#a8b898")))
	pen_liste.add_child(_etiket("[b]Yan görevler[/b]", 16, Color("#7fc8ff")))
	if ACT.is_empty():
		pen_liste.add_child(_etiket("Alınmış bir yan görevin yok. Başında mavi ? olan kişilerle konuş.", 12, Color("#a8b898")))
	for a in ACT:
		var q: Dictionary = BY[a.id]
		var izl: bool = a == A
		var yazi := "[b]%s[/b] · %s" % [q.title, q.name]
		if izl: yazi += "\n" + adim_yazi()
		else:
			var s: Dictionary = q.steps[mini(int(a.step), q.steps.size() - 1)]
			yazi += "\n" + str(s.get("tx", ""))
		pen_liste.add_child(_etiket(yazi))
		var h := HBoxContainer.new()
		var b1 := Button.new()
		b1.text = "Takip ediliyor · Görevlere gönder" if izl else "Takip et"
		b1.pressed.connect(_takip_dugme.bind(a))
		h.add_child(b1)
		var b2 := Button.new()
		b2.text = "Emin misin? Bırak" if birak_onay == a.id else "Bırak"
		b2.pressed.connect(_birak_dugme.bind(a))
		h.add_child(b2)
		pen_liste.add_child(h)
	var biten: Array = []
	for q in Q:
		if done.has(q.id): biten.append(q.title)
	pen_liste.add_child(_etiket("Bitirdiklerin: %d/%d%s" % [biten.size(), Q.size(), (" · " + ", ".join(biten)) if not biten.is_empty() else ""], 12, Color("#a8b898")))
	var k := Button.new(); k.text = "Kapat"; k.pressed.connect(kapat); pen_liste.add_child(k)
	pen_kutu.reset_size()
	var vs := get_viewport().get_visible_rect().size
	pen_kutu.position = ((vs - pen_kutu.size) / 2.0).floor()

func _takip_dugme(a: Dictionary) -> void:
	if a == A:
		var q: Dictionary = BY[a.id]
		_birak_takip()
		env.mesaj("Görevlere gönderildi: %s. Görevler'den yeniden takip edebilirsin." % q.title)
	else:
		_takip(a)
	_pencere_yaz()

func _birak_dugme(a: Dictionary) -> void:
	if birak_onay != a.id:
		birak_onay = a.id
		_pencere_yaz()
		return
	birak_onay = ""
	if a == A: iptal("Yan görevi bıraktın")
	else:
		var q: Dictionary = BY[a.id]
		ACT.erase(a)
		env.mesaj("Yan görevi bıraktın: %s. Yeniden almak için %s ile konuş." % [q.title, q.name])
	_pencere_yaz()

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	var L: Array = []
	for a in ACT: L.append({id = a.id, step = a.step, got = a.get("got", [])})
	return {done = done.keys(), met = met.keys(), act = L, a = A.id if A != null else ""}

func yukle(d: Dictionary) -> void:
	_canavar_sil()
	if fol != null:
		fol.queue_free(); fol = null
	done = {}; met = {}; ACT = []; A = null
	for id in d.get("done", []):
		if BY.has(str(id)): done[str(id)] = true
	for id in d.get("met", []): met[str(id)] = true
	for x in d.get("act", []):
		if not BY.has(str(x.id)) or done.has(str(x.id)): continue
		ACT.append({id = str(x.id), step = int(x.step), got = x.get("got", []), rs = true})
	var aid := str(d.get("a", ""))
	for a in ACT:
		if a.id == aid: _takip(a)
	_dunya()
