## Börü'nün dövüş dersleri ve Ulti (web v122 lessons, ULT; belge Sistemler › Börü'nün dövüş dersleri, Ulti).
## Ders: Börü'yle konuşup "Dövüş dersleri" (ACT 1, öğretici bittikten sonra); ücret peşin, ders bitince hamle kalıcı açılır ve XP verilir;
## o bölgenin en az 60 karesi haritada açılmış olmalı. Alıştırma canavarı kerevit dersi gibi dövüşür: bir adım uzakta durur, üstünde "!"
## çıkar, bir kez atılır; ısırığı canının %5'i, seni canının ¼'ünün altına indirmez; vuruş adımlarında saldırmaz; ölmez, XP ve ganimet vermez.
## Ulti: altın çubuk (isabet +1,5, özel vuruş +4, ritimli 2. +5, ritimli 3. +10, savuşturma +10); dolunca R; ulti boyunca hasar almazsın.
extends Node2D

var oyun
var D := {}                     # şimdiki ders
var adim := 0
var say := 0
var can_ = null                 # alıştırma canavarı
var h := Vector2.ZERO
var ph := "idle"
var t := 0.0
var l0 := Vector2.ZERO
var tgt := Vector2.ZERO
var ls := 0.0
var odendi := {}                # yarım bırakılan dersin ücreti bir kez daha alınmaz
var kutu: Label
var bar: ProgressBar
var ulti_t := 0.0
var r_kare := -1

const DERSLER := [
	{k = "dash", ad = "Takla vuruşu", sv = 3, bio = 0, ucret = 150, xp = 40, can = "Kurt", atil = true, adim = [["kac", 3, "Saldırırken takla at, kurtul"], ["dash", 4, "Takla vuruşuyla vur (takla sırasında ya da hemen sonra tık)"]]},
	{k = "double", ad = "Çift vuruş", sv = 6, bio = 1, ucret = 300, xp = 60, can = "Yaban domuzu", adim = [["double", 7, "Çift vuruşla vur (iki hızlı tık)"]]},
	{k = "c2", ad = "Ritimli 2. vuruş", sv = 12, bio = 2, ucret = 600, xp = 100, can = "Bataklık kurdu", adim = [["c2", 5, "Vuruşun hareketi bittiği an yine tıkla"]]},
	{k = "c3", ad = "Ritimli 3. vuruş", sv = 15, bio = 3, ucret = 1000, xp = 160, can = "Muflon", adim = [["savus", 3, "Savuştur"], ["c3", 3, "Ritimli 2. vuruşun bitişinde yine tıkla"]]},
	{k = "charged", ad = "Güçlü vuruş", sv = 17, bio = 3, ucret = 1200, xp = 180, can = "Yaban öküzü", adim = [["savus", 3, "Savuşturarak sersemlet"], ["charged_s", 3, "Sersem canavara güçlü vuruş (basılı tut, bırak)"]]},
	{k = "cdc", ad = "Bitirici", sv = 21, bio = 4, ucret = 2000, xp = 300, can = "Kül kurdu", atil = true, adim = [["kac", 3, "Takla ile kaç"], ["cdc", 3, "Tık → takla → tık: bitirici"]]},
	{k = "ult", ad = "Ulti", sv = 0, bio = -1, ucret = 2500, xp = 500, can = "Mağara ayısı", adim = [["ult", 3, "Çubuk dolunca R: ulti"]]}]

func kur(o) -> void:
	oyun = o
	z_index = 5
	kutu = Label.new(); kutu.position = Vector2(12, 230); kutu.add_theme_font_size_override("font_size", 13)
	kutu.add_theme_color_override("font_color", Color("#ffe7a0")); kutu.add_theme_color_override("font_outline_color", Color("#14100c")); kutu.add_theme_constant_override("outline_size", 4)
	kutu.visible = false
	o.hud.add_child(kutu)
	bar = ProgressBar.new(); bar.custom_minimum_size = Vector2(180, 8); bar.show_percentage = false; bar.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	var bg := StyleBoxFlat.new(); bg.bg_color = Color("#2a2410"); bg.border_color = Color("#0b0f0a"); bg.set_border_width_all(2)
	var fg := StyleBoxFlat.new(); fg.bg_color = Color("#f2c84b")
	bar.add_theme_stylebox_override("background", bg); bar.add_theme_stylebox_override("fill", fg); bar.tooltip_text = "Ulti (dolunca R)"
	var k: Node = o.enerji_cubugu.get_parent()
	k.add_child(bar); k.move_child(bar, o.enerji_cubugu.get_index() + 1)
	bar.visible = false

func acik() -> bool:
	return not D.is_empty()

func ulti_acik() -> bool:
	return oyun.ada == 2 or oyun.kuzen.act2 or oyun.kuzen.tanis.has("ders_ult")

# ------------------------------------------------------------------ Börü'nün ders listesi
func _bolge_acik(b: int) -> bool:
	if b < 0: return true
	var n := 0
	var K: PackedByteArray = oyun.harita_k.kesif
	for i in K.size():
		if K[i] == 1 and int(oyun.bio_arr[i]) == b:
			n += 1
			if n >= 60: return true
	return false

func _sart(L: Dictionary) -> String:
	if L.get("atil", false) and not oyun.yetenekler.has("S1"): return "önce Atılma"
	if oyun.env.sv < int(L.sv): return "Seviye %d" % int(L.sv)
	if not _bolge_acik(int(L.bio)): return "%s'ı gez" % ["Çayır", "Orman", "Bataklık", "Kayalık Dağ", "Kül Diyarı", "Mor Kristal Vadisi"][int(L.bio)]
	if L.k == "ult" and not (int(oyun.gorev.kills.get("Kara ejder", 0)) > 0 or oyun.reis.bd.has("Kristal golem")): return "Kara ejder'i ya da Kristal golem Reisi'ni yen"
	return ""

func secenek(alp) -> Dictionary:
	return {t = "Dövüş dersleri", f = func(): liste(alp)}

func liste(alp) -> void:
	var sat := []
	var ch := []
	for L in DERSLER:
		var bil: bool = oyun.kuzen.tanis.has("ders_" + L.k)
		var s := _sart(L)
		if bil: sat.append("✓ %s · öğrenildi (tekrar ücretsiz)" % L.ad)
		elif s != "": sat.append("[color=#8a8a7a]· %s · %s · %d Vio[/color]" % [L.ad, s, int(L.ucret)])
		else: sat.append("✦ %s · %d Vio · +%d XP" % [L.ad, int(L.ucret), int(L.xp)])
		if bil or s == "": ch.append({t = L.ad, f = basla.bind(L, alp)})
	ch.append({t = "Hoşça kal", pri = true, kapat = true})
	oyun.konusma.ac(alp.K.ad, _por(alp), "Her hamlenin bir dersi var evlat. Ücret peşin; ders bitince hamle senindir.\n[font_size=12]%s[/font_size]" % "\n".join(sat), ch)

func _por(alp):
	return load(alp.K.portre) if alp != null and alp.K.portre != null else null

func basla(L: Dictionary, alp) -> void:
	var bil: bool = oyun.kuzen.tanis.has("ders_" + L.k)
	if not bil and not odendi.has(L.k):
		if oyun.env.vio < int(L.ucret):
			oyun.konusma.ac(alp.K.ad, _por(alp), "Bu ders %d Vio evlat; sende %d var." % [int(L.ucret), oyun.env.vio], [{t = "Tamam", pri = true, kapat = true}])
			return
		oyun.env.vio_ekle(-int(L.ucret))
		odendi[L.k] = true
	D = L; adim = 0; say = 0; ph = "idle"; t = 1.6
	if L.k == "ult": oyun.ult = 0.0
	var P = oyun.oyuncu
	P.st = P.st_max; P.yorgun = false
	_dogur()
	_yaz()
	oyun.env.mesaj("Ders: %s · %s" % [L.ad, L.adim[0][2]])

func _dogur() -> void:
	if can_ != null and is_instance_valid(can_): can_.queue_free()
	var P: Vector2 = oyun.oyuncu.position
	var p := P + Vector2(50, 0)
	for k in 40:
		var q := P + Vector2.from_angle(randf() * TAU) * (50.0 + randf() * 12.0)
		if not oyun.engel(q, 6.0) and oyun.tile_at(q) <= 2: p = q; break
	can_ = oyun._canli_yeni(str(D.can), p, 0)
	can_.ders = true
	can_.set_meta("ders", true)
	h = p

var soruldu := false

func birak(neden := "") -> void:
	if can_ != null and is_instance_valid(can_): can_.queue_free()
	can_ = null
	if neden != "": oyun.env.mesaj(neden, true)
	D = {}
	_yaz()

func _yaz() -> void:
	kutu.visible = acik()
	if not acik(): return
	var A: Array = D.adim[adim]
	kutu.text = "Ders: %s · adım %d/%d\n%s: %d/%d" % [D.ad, adim + 1, D.adim.size(), A[2], say, int(A[1])]

## bir hamle ders canavarına değdi (ozel.gd, ulti)
func isabet(tur: String, a) -> void:
	if not acik() or a != can_: return
	var A: Array = D.adim[adim]
	var ok: bool = str(A[0]) == tur or (str(A[0]) == "charged_s" and tur == "charged" and a.sersem > 0.0)
	if ok: _say()

func _say() -> void:
	say += 1
	var A: Array = D.adim[adim]
	oyun.yazi(oyun.oyuncu.position + Vector2(0, -40), "%d/%d" % [say, int(A[1])], Color("#9fe07a"), 10)
	if say >= int(A[1]):
		adim += 1; say = 0
		if adim >= D.adim.size():
			_bitti()
			return
		oyun.env.mesaj("Ders: %s · %s" % [D.ad, D.adim[adim][2]])
	_yaz()

func _bitti() -> void:
	var L := D
	var bil: bool = oyun.kuzen.tanis.has("ders_" + L.k)
	oyun.kuzen.tanis["ders_" + L.k] = true
	odendi.erase(L.k)
	birak()
	if not bil: oyun.env.xp_ekle(int(L.xp))
	var alp = oyun.alp_dugum()
	oyun.konusma.ac(alp.K.ad if alp else "Börü", _por(alp), "Hah! [b]%s[/b] artık senin. Kavgada aklında tut evlat." % L.ad, [{t = "Teşekkürler", pri = true, kapat = true}])

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	bar.visible = ulti_acik() and not oyun.basta
	bar.value = oyun.ult
	ulti_t = maxf(0.0, ulti_t - dt)
	if Input.is_action_just_pressed("kopek") and not oyun.oyuncu.kilit and not oyun.basta and ulti_hazir():
		r_kare = Engine.get_process_frames()
		ulti()
	if ulti_t > 0.0: oyun.oyuncu.dokunulmaz = maxf(oyun.oyuncu.dokunulmaz, 0.1)
	if acik() and str(D.k) == "ult": oyun.ult_ekle(dt * 4.5)   # derste çubuk 3 kat hızlı dolar
	if not acik() or get_tree().paused: return
	var P = oyun.oyuncu
	var alp = oyun.alp_dugum()
	if alp != null and P.position.distance_to(alp.position) > 280.0 and not soruldu:
		# belge: 280 pikselden uzağa gidince oyun durur, "Derse dön / Dersi bırak" sorulur
		soruldu = true
		get_tree().paused = true
		oyun.konusma.ac(alp.K.ad, _por(alp), "Nereye evlat? Ders bitmedi!", [
			{t = "Derse dön", pri = true, f = func():
				soruldu = false
				var q: Vector2 = alp.position + Vector2(0, 140)
				for i in 12:
					var a := i * TAU / 12.0
					var w: Vector2 = alp.position + Vector2(cos(a), sin(a)) * 140.0
					if not oyun.engel(w, 5.0): q = w; break
				P.position = q
				get_tree().paused = false},
			{t = "Dersi bırak", f = func():
				soruldu = false
				var L: Dictionary = D
				if odendi.has(L.k) and not oyun.kuzen.tanis.has("ders_" + L.k):
					odendi.erase(L.k)
					oyun.env.vio_ekle(int(L.ucret))
					birak("Ders bırakıldı · %d Vio geri verildi" % int(L.ucret))
				else:
					birak("Ders bırakıldı")
				get_tree().paused = false}])
		return
	if can_ == null or not is_instance_valid(can_):
		_dogur()
		return
	var c = can_
	var A: Array = D.adim[adim]
	var saldirir: bool = str(A[0]) in ["kac", "savus"]
	c.face = -1 if P.position.x < c.position.x else 1
	if ph == "idle":
		c.wind = 0.0; c.lunge = {}
		var pd: float = maxf(1.0, P.position.distance_to(h))
		var dur := float(c.D.r) + 30.0
		if pd > dur + 16.0: _yuru(P.position + (h - P.position) / pd * dur, 70.0, dt)
		elif pd < dur - 10.0: _yuru(P.position + (h - P.position) / pd * dur, 30.0, dt)
		else:
			c.ders_yuru = false
			t -= dt
		c.position = h
		if t <= 0.0 and saldirir:
			ph = "wind"; t = 0.6
			c.renk = "n" if randf() < 0.7 else "y"
			oyun.yazi(c.position + Vector2(0, -26), "!", Color.WHITE if c.renk == "n" else Color("#ffd23a"), 16)
		elif t <= 0.0:
			t = 1.0
	elif ph == "wind":
		c.position = h + Vector2(randf_range(-1.5, 1.5), randf_range(-1, 1))
		t -= dt
		if t <= 0.0:
			c.position = h
			ph = "lunge"; t = 0.3; ls = Time.get_ticks_msec() / 1000.0; l0 = h
			var e: Vector2 = P.position - h
			tgt = P.position + e.normalized() * 8.0
			c.lunge = {ders = true}
	elif ph == "lunge":
		t -= dt
		var k := minf(1.0, 1.0 - t / 0.3)
		var np := l0.lerp(tgt, k)
		if _bos(np): c.position = np; h = np
		var near: float = P.position.distance_to(c.position)
		if near <= 14.0 or t <= 0.0:
			c.lunge = {}
			if str(A[0]) == "savus" and P.pr_t > 0.0 and near <= 20.0:
				P.savusturdu(c)
				_say()
			elif str(A[0]) == "kac" and P.atilma > 0.0:
				oyun.yazi(P.position + Vector2(0, -28), "Sıyrıldın!", Color("#9fe07a"), 9)
				_say()
			elif near <= 14.0 and P.atilma <= 0.0:
				var dm: float = maxf(1.0, P.hp_max * 0.05)
				if P.hp - dm >= P.hp_max * 0.25: P.isirildi(int(round(dm)), c.position, c, "n")
				oyun.yazi(P.position + Vector2(0, -28), "Bir daha!", Color("#e8c860"), 9)
			ph = "idle"; t = 2.2 + randf()
			P.st = maxf(P.st, P.st_max * 0.6)

func _yuru(hedef: Vector2, sp: float, dt: float) -> void:
	var dv := hedef - h
	var d := dv.length()
	if d < 1.0:
		can_.ders_yuru = false
		return
	var np := h + dv * (minf(d, sp * dt) / d)
	if _bos(np): h = np
	can_.ders_yuru = true
	can_.step += dt * 8.0

func _bos(p: Vector2) -> bool:
	var tl: int = oyun.tile_at(p)
	return not oyun.engel(p, 5.0) and tl >= 0 and tl <= 2

# ------------------------------------------------------------------ Ulti
func ulti_hazir() -> bool:
	return ulti_acik() and oyun.ult >= 100.0 and not oyun.oyuncu.bayildi

func ulti() -> void:
	if not ulti_hazir(): return
	oyun.ult = 0.0
	ulti_t = 1.6
	var g: String = oyun.ozel.grup()
	var P = oyun.oyuncu
	var yon: Vector2 = P.bakis.normalized()
	var C: Vector2 = P.position + Vector2(0, -6)
	var ad := {"sword": "Kılıç dansı", "spear": "Mızrak yağmuru", "axe": "Deprem", "gurz": "Dağ yaran", "topuz": "Gök gürültüsü", "fist": "Öfke", "torch": "Ateş fırtınası", "bow": "Ok yağmuru", "staff": "Meteor", "gun": "Kurşun yağmuru"}.get(g, "Ulti") as String
	oyun.yazi(P.position + Vector2(0, -44), ad + "!", Color("#f2c84b"), 13)
	var hedef: Vector2 = oyun.buyu._nisan() if g in ["spear", "bow", "staff", "gun"] else C + yon * 60.0
	match g:
		"sword":
			for i in 8: _ulti_vur("arc", C, Vector2.from_angle(i * PI / 4.0), 0.5, 40.0, 1.2, 0.0, i * 0.06)
			_ulti_vur("circ", C, yon, 0, 50.0, 3.0, 1.0, 0.55)
		"spear":
			for i in 12: _ulti_vur("circ", hedef + Vector2(randf_range(-40, 40), randf_range(-30, 30)), yon, 0, 18.0, 1.5, 0.0, 0.1 + i * 0.05)
		"axe":
			for i in 3: _ulti_vur("circ", C, yon, 0, 30.0 + i * 25.0, 2.4, 1.0, i * 0.2)
		"gurz":
			for dd in [Vector2(1, 1), Vector2(1, -1), Vector2(-1, 1), Vector2(-1, -1)]: _ulti_vur("line", C + yon * 40.0, dd.normalized(), 10, 120.0, 2.6, 1.4, 0.2)
			_ulti_vur("circ", C + yon * 40.0, yon, 0, 40.0, 2.0, 0.0, 0.2)
		"topuz":
			var L := []
			for a in oyun.canlilari_ver():
				if a.olu < 0.0 and a.position.distance_to(P.position) < 220.0: L.append(a)
			L.sort_custom(func(x, y): return x.position.distance_to(P.position) < y.position.distance_to(P.position))
			for i in mini(6, L.size()): _ulti_vur("circ", L[i].position + Vector2(0, -6), yon, 0, 14.0, 2.2, 0.5, i * 0.12)
			_ulti_vur("circ", C, yon, 0, 70.0, 1.5, 0.0, 0.8)
			P.kombo = 6; P.kombo_t = 1.2
		"fist":
			for i in 10: _ulti_vur("arc", C, yon, 0.9, 30.0, 1.0, 0.0, i * 0.07)
			_ulti_vur("arc", C, yon, 1.0, 34.0, 4.0, 0.6, 0.8)
		"torch":
			for i in 3: _ulti_vur("circ", C, yon, 0, 40.0 + i * 15.0, 2.0, 0.0, i * 0.2)
		"bow":
			for i in 16: _ulti_vur("circ", hedef + Vector2(randf_range(-50, 50), randf_range(-35, 35)), yon, 0, 14.0, 1.4, 0.3, 0.1 + i * 0.04)
		"staff":
			_ulti_vur("circ", hedef, yon, 0, 50.0, 5.0, 1.2, 0.3)
		"gun":
			var n := 10 if oyun.env.elde() == "Pompalı" else 20
			for i in n: _ulti_vur("line", C, (hedef - C).normalized().rotated(randf_range(-0.12, 0.12)), 6, 320.0, 1.0, 0.0, i * 0.06)

func _ulti_vur(sekil: String, merkez: Vector2, yon: Vector2, en: float, r: float, m: float, ser: float, gec: float) -> void:
	if gec > 0.0:
		await get_tree().create_timer(gec).timeout
	var dm := maxi(1, int(round(oyun.ozel._taban() * m)))
	for a in oyun.canlilari_ver():
		if a.olu >= 0.0: continue
		var q: Vector2 = a.position + Vector2(0, -6) - merkez
		var ar := float(a.D.r)
		var ok := false
		match sekil:
			"circ": ok = q.length() <= r + ar
			"arc": ok = q.length() <= r + ar and (q.length() < ar + 6.0 or absf(yon.angle_to(q)) <= maxf(en, 0.5))
			"line":
				var tt := q.dot(yon)
				ok = tt >= -ar and tt <= r + ar and absf(q.cross(yon)) <= en + ar
		if not ok: continue
		a.vuruldu(dm, q.normalized() if q.length() > 0.5 else yon)
		a.kb = {}   # ultinin vuruşları canlıyı itmez: hepsi değsin
		if ser > 0.0: a.sersem = maxf(a.sersem, ser * (0.5 if a.boss else 1.0))
		isabet("ult", a)
	var renk := Color("#f2c84b")
	match sekil:
		"circ":
			for i in 18:
				var an := i / 18.0 * TAU
				oyun.parca(merkez + Vector2(cos(an) * r, sin(an) * r * 0.6), Vector2(cos(an), sin(an)) * 30.0, 0.35, renk)
		"arc":
			for i in 8: oyun.parca(merkez + yon.rotated((i / 7.0 - 0.5) * 1.4) * r, yon * 20.0, 0.25, renk)
		"line":
			for i in 10: oyun.parca(merkez + yon * (r * i / 9.0), Vector2(0, -15), 0.3, renk)

func kayit() -> Dictionary:
	return {ult = oyun.ult, od = odendi.keys()}

func yukle(d) -> void:
	odendi = {}
	if typeof(d) != TYPE_DICTIONARY: return
	oyun.ult = float(d.get("ult", 0.0))
	for k in d.get("od", []): odendi[str(k)] = true
