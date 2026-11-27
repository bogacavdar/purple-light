## Oyuncu: web frameBody'deki yürüme, koşu, atılma ve attack() vuruşu; resim v428kahraman'dan (8 yön × duruş + 4 adım).
extends Node2D

var oyun
var V: Dictionary  # data/oyuncu.json
var spr: Sprite2D
var kavis: Node2D  # vuruş kavisi (web drawSwing)

const YONLER := ["S", "SE", "E", "NE", "N", "NW", "W", "SW"]
var yon := 0              # satır: 0 S … 7 SW
var bakis := Vector2(0, 1)  # vuruşun ve atılmanın yönü (8 yön)
var adim := 0.0           # web player.step
var yuruyor := false
var hiz_kip := 0           # 0 duruyor, 1 yürüyor, 2 koşuyor (hayvanların fark etme uzaklığı buna bağlı)
var kosu_kol := false     # L3 ile açılan koşu (çubuk bırakılınca kapanır)

var hp := 100.0
var hp_max := 100.0
var atk_cd := 0.0
var bekleyen_vurus := -1.0  # vuruş tamponu: bekleme bitince son basılan yöne vurulur (en çok 0,8 sn)
var bekleyen_yon := Vector2.ZERO
var savrulus := -1.0        # kavisin ilerlemesi (0..0,16 sn)
var savrulus_yon := Vector2(0, 1)
var savrulus_r := 16.0
var dokunulmaz := 0.0       # web pInv
var atilma := 0.0
var atilma_v := Vector2.ZERO
var atilma_cd := 0.0
var kirmizi := 0.0
var bayildi := false
var kilit := false          # görev sahnesi sürerken kontrol oyuncuda değil
var oto := Vector2.ZERO      # sahnede karakterin kendi yürüyüşü
# enerji (web st, maxSt, stRegen, runDrain; belge 1f-3b-2)
var st := 100.0
var st_max := 100.0
var yorgun := false
var st_dinlen := 0.0
var vurus_uyari := false
# savuşturma ve gard (web v110-parry: PR)
var pr_t := 0.0
var pr_cd := 0.0
var pr_flash := 0.0
var pr_n := 0
var pr_brk := 0.0
var kalkan := false
var kalkan_t0 := 0.0
var blok_fx := 0.0
var sersem := 0.0
var son_atilma := -100.0
var uyari_t := -100.0
var kosu_uyari := -100.0
# etkiler (web pfx, addFx, tickFx): zehir, kanama, yanık bir süre can yakar
var etkiler := {}             # ad → {t, dps, acc}
var etki_gorulen := {}
const ETKI := {"zehir": ["Zehir", "#9ad84a", "☠"], "kanama": ["Kanama", "#ff5a4a", "✚"], "yanık": ["Yanık", "#ffa040", "✹"]}
const BLK := {"n": 0.35, "y": 0.45, "r": 0.7}

func _ready() -> void:
	V = oyun.oyuncu_veri
	hp_max = float(V.hp)
	hp = hp_max
	spr = Sprite2D.new()
	spr.texture = load("res://art/kahraman.png")
	spr.hframes = 5
	spr.vframes = 8
	spr.centered = false
	# web heroAt: hücre (x - CW/2, y + 5 - CH) noktasına çizilir
	spr.offset = Vector2(-float(V.heroCell.w) / 2.0, 5.0 - float(V.heroCell.h))
	add_child(spr)
	kavis = Node2D.new()
	kavis.z_index = 5
	kavis.draw.connect(_kavis_ciz)
	add_child(kavis)

## yetenekler: en yüksek enerji ve can (web maxSt, maxHP); alınınca ve kayıt açılınca yeniden hesaplanır
func yetenek_uygula() -> void:
	st_max = enerji_max()
	hp_max = can_max()
	st = minf(st, st_max); hp = minf(hp, hp_max)
	oyun.can_guncelle(hp, hp_max)

## web maxHP, maxSt, stRegen (seviye puanı + yetenek + takı)
func can_max(r: int = -1) -> float:
	var S = oyun
	return roundf((S.stat("hp", r) + (350.0 if S.sk("C10") else (250.0 if S.sk("C8") else (175.0 if S.sk("C5") else (100.0 if S.sk("C3") else (50.0 if S.sk("D1") else 0.0)))))) * (1.25 if r < 0 and S.kusam.get("govde", null) == "Meka zırh" else 1.0))   # web v79: Meka zırh canı %25 artırır

func enerji_max(r: int = -1) -> float:
	var S = oyun
	return roundf(S.stat("st", r) * (1.0 + (0.75 if S.sk("K7") else (0.5 if S.sk("K5") else (0.25 if S.sk("K2") else 0.0)))))

func enerji_dolma(r: int = -1) -> float:
	var S = oyun
	return S.stat("stRe", r) * (2.0 if S.sk("K8") else (1.5 if S.sk("K3") else 1.0))

func _hp_yenile(r: int = -1) -> float:
	var S = oyun
	var tk: float = S.env.tokluk
	return S.stat("hpRe", r) * (5.0 if S.sk("C11") else (4.0 if S.sk("C9") else (3.0 if S.sk("C6") else (2.0 if S.sk("C2") else 1.0)))) * (1.5 if tk > 70.0 else (0.0 if tk <= 0.0 else 1.0)) * (1.5 if S.kesif != null and S.kesif.usta("Şifa") else 1.0)

## web weapon(): eldeki silah; elde balta ya da kazma 8 hasar; elin boşsa silah yuvasındaki; yoksa yumruk
func silah_v() -> Dictionary:
	if oyun.env == null: return V.fist
	var K: Dictionary = oyun.kusanma
	var h: String = oyun.env.elde()
	if not K.silah.has(h):
		var t: String = oyun.env.elde_tur()
		if t == "axe" or t == "pick": return {dmg = 8, reach = 20, cd = 0.5, kind = "axe"}
		h = str(oyun.kusam.get("silah", "")) if oyun.kusam.get("silah", null) != null else ""
	if h == "" or not K.silah.has(h): return V.fist
	var w: Dictionary = K.silah[h]
	if w.kind == "hunt": return {dmg = w.dmg, reach = 30, cd = 0.5, kind = "hunt", n = h}
	if h == "Işın kılıcı": return {dmg = w.dmg, reach = 32, cd = 0.3, kind = "sword", n = h}   # web v80: plazma kılıç hızlı vurur, uzağa uzanır
	if w.mace == "gurz": return {dmg = w.dmg, reach = 24, cd = 0.62, kind = "sword", n = h, mace = "gurz"}
	if w.mace != null: return {dmg = w.dmg, reach = 20, cd = 0.4, kind = "sword", n = h, mace = "topuz"}
	return {dmg = w.dmg, reach = 22, cd = 0.42, kind = "sword", n = h}

func _silah_yaz() -> void:
	var w := silah_v()
	var h: String = oyun.env.elde() if oyun.env else ""
	oyun.silah_yazi.text = "Elinde: " + (h if h != "" else "boş el") + "  (vuruş %d · menzil %d)" % [int(w.dmg), int(w.reach)]

func _draw() -> void:
	draw_set_transform(Vector2(0, 2), 0, Vector2(7, 2.5))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.28))
	draw_set_transform(Vector2.ZERO)
	if pr_flash > 0.0:
		# savuşturma tuttu: oyuncunun çevresinde açılan ışık halkası
		var k := pr_flash / 0.25
		var rr := 14.0 + (1.0 - k) * 10.0
		draw_set_transform(Vector2(0, -6), 0, Vector2(1, 0.8))
		draw_arc(Vector2.ZERO, rr, 0, TAU, 24, Color(1, 0.94, 0.67, 0.35 + 0.6 * k), 2.0 / 0.9)
		draw_set_transform(Vector2.ZERO)

func _unhandled_input(e: InputEvent) -> void:
	# sol tık her zaman tıklanan yöne vurur (çaprazlar dahil)
	if kilit:
		return
	if oyun.yapi.yerlestiriyor(): return
	if e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_RIGHT:
		if e.pressed:
			if oyun.pencere_acik(): return
			savustur(); kalkan_kaldir()
		else:
			kalkan = false
		return
	if e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_LEFT:
		var d: Vector2 = get_global_mouse_position() - (position + Vector2(0, -6))
		var y := d.normalized() if d.length() > 0.5 else bakis
		if not e.pressed:
			if oyun.ozel != null: oyun.ozel.birak()
			return
		if oyun.ozel != null: oyun.ozel.bas(y)
		else: vur(y)

func _process(dt: float) -> void:
	if kombo_t > 0.0:
		kombo_t -= dt
		if kombo_t <= 0.0: kombo = 0
	if bayildi:
		return
	atk_cd -= dt
	dokunulmaz -= dt
	atilma_cd -= dt
	pr_t = maxf(0.0, pr_t - dt); pr_cd = maxf(0.0, pr_cd - dt); pr_brk = maxf(0.0, pr_brk - dt)
	blok_fx = maxf(0.0, blok_fx - dt)
	if pr_flash > 0.0:
		pr_flash = maxf(0.0, pr_flash - dt)
		queue_redraw()
	if not kilit and not oyun.pencere_acik():
		if Input.is_action_just_pressed("savus") and not oyun.balik.e_tutar():
			savustur(); kalkan_kaldir()
	if Input.is_action_just_released("savus"):
		kalkan = false
	if kalkan and not bilir("P0"): kalkan = false
	kirmizi = maxf(0.0, kirmizi - dt)
	var g := Input.get_vector("sol", "sag", "yukari", "asagi", 0.3)
	if kilit:
		g = oto
	if Input.is_action_just_pressed("kos_kol"):
		kosu_kol = not kosu_kol
	if g == Vector2.ZERO:
		kosu_kol = false
	if sersem > 0.0:
		sersem -= dt
		g = Vector2.ZERO
	_silah_yaz()
	if Input.is_action_just_pressed("vur") and not kilit:
		if oyun.ozel != null: oyun.ozel.bas(bakis)
		else: vur(bakis)
	if Input.is_action_just_released("vur") and oyun.ozel != null: oyun.ozel.birak()
	if Input.is_action_just_pressed("atil") and not kilit and not oyun.balik.aktif():
		_atil(g)
	if bekleyen_vurus > 0.0:
		bekleyen_vurus -= dt
		if atk_cd <= 0.0:
			bekleyen_vurus = -1.0
			vur(bekleyen_yon)
	if atilma > 0.0:
		# atılma: 0,24 sn hep aynı mesafe; içindeyken hiçbir şey dokunmaz
		atilma -= dt
		_kay(atilma_v * dt)
		if randf() < 0.8:
			oyun.parca(position + Vector2(0, -6), -atilma_v * 0.1 + Vector2(0, -4), 0.3, Color(1, 1, 1, 0.7))
		g = Vector2.ZERO
	yuruyor = g != Vector2.ZERO
	var kos_ister: bool = (Input.is_action_pressed("kos") or kosu_kol) and yuruyor and not kilit
	var kos: bool = kos_ister and bilir("K1") and not yorgun and not kalkan and oyun.evcil.binilen == null
	if kos_ister and not bilir("K1"):
		var nw := Time.get_ticks_msec() / 1000.0
		if nw - kosu_uyari > 9.0:
			kosu_uyari = nw
			oyun.env.mesaj("Koşmak için yetenek ağacından Koşu'yu al (kırmızı Savaş ağacının ilk yeteneği, 100 Vio)", true)
	elif kos_ister and yorgun:
		var nw2 := Time.get_ticks_msec() / 1000.0
		if nw2 - kosu_uyari > 2.5:
			kosu_uyari = nw2
			oyun.yazi(position + Vector2(0, -28), "Soluklanıyorsun…", Color("#e8c860"), 9)
	# enerji: koşarken saniyede 18 gider; durunca 0,6 sn sonra dolar (yürürken %60'ı); bitince %30'a dolana kadar yorgun
	if kos and yuruyor:
		st -= 18.0 * (0.5 if oyun.sk("K9") else (0.7 if oyun.sk("K6") else 1.0)) * dt; st_dinlen = 0.0
		if st <= 0.0:
			st = 0.0; yorgun = true; kos = false
			oyun.yazi(position + Vector2(0, -28), "Yoruldun!", Color("#e8c860"), 9)
	else:
		st_dinlen += dt
		if st_dinlen > 0.6:
			st = minf(st_max, st + enerji_dolma() * (0.6 if yuruyor else 1.0) * dt)
	hiz_kip = 0 if not yuruyor else (2 if kos else 1)
	if not bayildi: _etkiler(dt)
	if hp < hp_max and not bayildi:
		hp = minf(hp_max, hp + _hp_yenile() * dt)
		oyun.can_guncelle(hp, hp_max)
	if yorgun and st >= st_max * 0.3: yorgun = false
	oyun.enerji_guncelle(st, st_max, yorgun)
	if yuruyor:
		var n := g.normalized()
		var sp: float = float(V.speed) * oyun.stat("move") * (1.15 if oyun.insa.yolda(position) else 1.0) * minf(1.0, g.length() * 1.15) * (float(V.runMult) if kos else 1.0) * (0.45 if kalkan else 1.0) * (0.6 if atk_cd > 0.2 and str(silah_v().get("mace", "")) == "gurz" else 1.0) * oyun.evcil.hiz() * _camur() * (1.0 + (0.4 if oyun.sk("H7") else (0.3 if oyun.sk("H3") else (0.2 if oyun.sk("H2") else (0.1 if oyun.sk("H1") else 0.0)))))
		_kay(n * sp * dt)
		_yon_sec(n)
		adim += dt * (1.7 if kos else 1.0)
		if kos and randf() < dt * 14.0:
			var c := Color("#e8d4a0") if oyun.tile_at(position) == 2 else Color("#c8d8a8")
			oyun.parca(position + Vector2(-n.x * 5 + randf_range(-2, 2), 1), Vector2(-n.x * 14, -10 - randf() * 8), 0.35, c)
	# kare: duruş 0; yürürken adımın evresine göre 1–4 (web: ph = step*10 mod 2π)
	var fr := 0
	if yuruyor:
		var ph := fposmod(adim * 10.0, TAU)
		fr = 1 + mini(3, int(floor(ph / (PI / 2.0))))
	spr.frame = yon * 5 + fr
	var a := 0.55 if atilma > 0.0 else 1.0
	# gard: çömelir, genişler, darbelere yaslanır (web v124)
	if kalkan and atilma <= 0.0:
		var up := minf(1.0, (Time.get_ticks_msec() / 1000.0 - kalkan_t0) / 0.08)
		spr.scale = Vector2(1.0 + 0.06 * up, 1.0 - 0.12 * up)
		spr.position.x = -bakis.x * (1.5 * up + (blok_fx / 0.15) * 2.0)
	else:
		spr.scale = Vector2.ONE; spr.position.x = 0.0
	if oyun.gizli != null and oyun.gizli.gorunmez(): a *= 0.18   # Görünmezlik iksiri
	spr.modulate = Color(1, 1 - kirmizi * 2.5, 1 - kirmizi * 2.5, a)
	if savrulus >= 0.0:
		savrulus += dt
		if savrulus > 0.16:
			savrulus = -1.0
		kavis.queue_redraw()

## web: x ve y ayrı ayrı denenir, engel varsa o eksende durur
func _kay(d: Vector2) -> void:
	var h: float = float(V.halfBox)
	if not oyun.engel(Vector2(position.x + d.x, position.y), h):
		position.x += d.x
	if not oyun.engel(Vector2(position.x, position.y + d.y), h):
		position.y += d.y

## 8 yön: çapraz tutulurken çapraz poz; bir eksen açıkça baskın olunca düz poz
func _yon_sec(n: Vector2) -> void:
	var ang := atan2(n.y, n.x)  # 0 = sağ (E), +y aşağı
	var k := int(round(ang / (PI / 4.0)))  # -4..4
	var tablo := {0: 2, 1: 1, 2: 0, 3: 7, 4: 6, -4: 6, -3: 5, -2: 4, -1: 3}
	yon = tablo[k]
	bakis = Vector2(cos(k * PI / 4.0), sin(k * PI / 4.0))

## Bataklık çamuru ×0,6 (çizme önler), ayaktan çamur sıçrar
func _camur() -> float:
	if oyun.evcil.binilen != null or not oyun.camur_mu(position) or oyun.camur_gecmez(): return 1.0
	if randf() < get_process_delta_time() * 8.0: oyun.parca(position + Vector2(randf_range(-3, 3), 1), Vector2(randf_range(-5, 5), -8), 0.3, Color("#4a3a22"))
	if not oyun.camur_dedi:
		oyun.camur_dedi = true
		oyun.env.mesaj("Çamura battın: yavaşlıyorsun. Kamış çizme ya da demir çizme çamurda yavaşlatmaz.")
	return 0.6

func bilir(id: String) -> bool:
	return oyun.yetenekler.has(id) or oyun.ders.gecici(id)

func _uyar(t: String) -> void:
	var now := Time.get_ticks_msec() / 1000.0
	if now - uyari_t > 4.0:
		uyari_t = now
		oyun.env.mesaj(t, true)

func _atil(g: Vector2) -> void:
	if atilma > 0.0 or atilma_cd > 0.0 or sersem > 0.0 or bayildi:
		return
	if oyun.ders.atil_engel() or oyun.yapi.yerlestiriyor(): return
	if not bilir("S1"):
		_uyar("Atılmayı henüz bilmiyorsun: Savaşçı Börü ücretsiz öğretir, onunla konuş.")
		return
	var dc := 5.0 if oyun.sk("S4") else (7.0 if oyun.sk("S3") else (9.0 if oyun.sk("S2") else 14.0))
	if str(silah_v().get("mace", "")) == "topuz": dc *= 0.7   # topuz: taklanın enerjisi %30 az
	if st < dc:
		oyun.yazi(position + Vector2(0, -28), "Yorgunsun", Color("#e8c860"), 9)
		return
	st -= dc; st_dinlen = 0.0
	kalkan = false
	var d := g.normalized() if g != Vector2.ZERO else bakis
	if g == Vector2.ZERO and oyun.ders.acik:
		d = oyun.ders.yana_yon(d)
	son_atilma = Time.get_ticks_msec() / 1000.0
	atilma = float(V.dodge.t)
	atilma_v = d * float(V.dodge.speed) * (1.25 if oyun.sk("S5") else 1.0)
	atilma_cd = 0.3 if oyun.sk("S4") else (0.38 if oyun.sk("S3") else (0.45 if oyun.sk("S2") else float(V.dodge.cd)))

func vur(d: Vector2) -> void:
	if bayildi or atilma > 0.0:
		return
	var mz = oyun.env.elde()
	if oyun.ses != null and oyun.ses.alet_mi(mz):
		if atk_cd <= 0.0:
			atk_cd = oyun.ses.alet_ara(str(mz))
			oyun.ses.alet_cal(str(mz))
		return
	if oyun.evcil.binilen != null:
		oyun.evcil.in_()
		return
	if oyun.buyu != null and oyun.buyu.asa_mi(oyun.env.elde()):
		if not kalkan and sersem <= 0.0: oyun.buyu.at()
		return
	var w := silah_v()
	if oyun.env.elde() == "" and atk_cd <= 0.0 and oyun.gizli != null: oyun.gizli.yumruk()
	if atk_cd > 0.0:
		bekleyen_vurus = 0.8
		bekleyen_yon = d
		return
	if kalkan or sersem > 0.0:
		return
	# her vuruş enerji ister (web P4K: yumruk 4, kılıç 8, mızrak 9, balta ve öteki aletler 10)
	var kt: String = str(w.get("kind", ""))
	var cost := 4.0 if kt == "" else (8.0 if kt == "sword" else (9.0 if kt == "hunt" else 10.0))
	if yorgun or st < cost:
		yorgun = true
		atk_cd = 0.35
		oyun.yazi(position + Vector2(0, -28), "Nefesin kesildi!", Color("#9ad8ff"), 9)
		if not vurus_uyari:
			vurus_uyari = true
			oyun.env.mesaj("Her vuruş enerji (yeşil çubuk) harcar. Biraz geri çekil, nefeslen; enerji dolunca yine vur.")
		return
	st -= cost; st_dinlen = 0.0
	if oyun.ses != null: oyun.ses.cal("swing", 0.6, randf_range(0.92, 1.08))
	atk_cd = float(w.cd)
	if d != Vector2.ZERO:
		_yon_sec(d)
	var f := bakis
	savrulus = 0.0
	savrulus_yon = f
	savrulus_r = float(w.reach) * 0.8
	kavis.queue_redraw()
	if str(w.get("n", "")) == "Işın kılıcı":
		var a0 := atan2(f.y, f.x)
		for k in 10:
			var a := a0 + (k / 9.0 - 0.5) * 1.6
			oyun.parca(position + Vector2(cos(a) * 22.0, -8.0 + sin(a) * 18.0), Vector2(cos(a), sin(a)) * 30.0, 0.22, Color("#7af0ff") if k % 2 else Color("#e8ffff"))
	var dm := int(round(float(w.dmg) * oyun.stat("dmg") * (1.55 if oyun.sk("W4") else (1.4 if oyun.sk("W3") else (1.25 if oyun.sk("W2") else (1.1 if oyun.sk("W1") else 1.0))))))
	var gogus := position + Vector2(0, -6)
	for a in oyun.canlilari_ver():
		var ar: float = float(a.D.r)
		var dv: Vector2 = (a.position + Vector2(0, -minf(8.0, ar))) - gogus
		var dist := dv.length()
		if dist > float(w.reach) + ar + 3.0:
			continue
		# geniş koni: vuruşun değdiği her şey vurulur, çaprazlar dahil
		if dist > ar + 6.0 and dv.dot(f) / maxf(dist, 0.001) < -0.1:
			continue
		var mc: String = str(w.get("mace", ""))
		var dmk := dm
		if mc == "topuz": dmk = int(round(dm * (1.0 + 0.1 * mini(kombo, 6))))
		a.vuruldu(oyun.kritik(dmk, str(w.get("n", "")), a), dv / maxf(dist, 1.0))
		oyun.ult_ekle(1.5)
		_silah_etki(w, a, dist)
		if mc == "gurz": _gurz(a, dmk)
		elif mc == "topuz": _topuz(a, dmk)
		if int(w.dmg) > 4:
			break

## Alevli / Zehirli / Keskin silah: yakın isabette (70 px) etkisi (taban: silahın tablo hasarı × (1 + 0,03 × (seviye − 1)))
func _silah_etki(w: Dictionary, a, dist: float) -> void:
	var n: String = str(w.get("n", ""))
	if dist > 70.0 or n == "": return
	var k := "yanık" if n.begins_with("Alevli ") else ("zehir" if n.begins_with("Zehirli ") else ("kanama" if n.begins_with("Keskin ") else ""))
	if k != "": a.etki_ver(k, float(w.dmg) * (1.0 + 0.03 * (oyun.env.sv - 1)))

# ------------------------------------------------------------------ savaş çekici ve topuzun kuralları (belge Silahlar › Silahların karakteri)
var kombo := 0
var kombo_t := 0.0
var bildi := {}

func _ilk_bildir(mc: String) -> void:
	if bildi.has(mc) or oyun.kuzen.tanis.has("bildi_" + mc): return
	bildi[mc] = true; oyun.kuzen.tanis["bildi_" + mc] = true
	if mc == "gurz": oyun.env.mesaj("Savaş çekici: çarptığı yerin çevresine de vurur, 3 isabette sersemletir, iki kat iter; savururken yavaş yürürsün ama daha az hasar alırsın.")
	else: oyun.env.mesaj("Topuz: hızlı isabetler kombo yapar (her biri +%10, en çok +%60), her 5. isabette kıvılcım sıçrar; vururken yavaşlamazsın.")

## savaş çekici: çevresindeki (36 px) öbür düşmanlara hasarın yarısı; 3 sn içinde 3 isabet 1 sn sersemletir (Reis 0,5); geri itme iki kat
func _gurz(a, dm: int) -> void:
	_ilk_bildir("gurz")
	if not a.kb.is_empty(): a.kb.v *= 2.0 if not a.boss else 1.0
	for b in oyun.canlilari_ver():
		if b != a and b.olu < 0.0 and b.position.distance_to(a.position) < 36.0: b.vuruldu(maxi(1, dm / 2), (b.position - a.position).normalized())
	for k in 8: oyun.parca(a.position + Vector2(randf_range(-10, 10), 0), Vector2(randf_range(-40, 40), -20 - randf() * 30), 0.4, Color("#8a7a60") if k % 2 else Color("#c8b898"))
	var now := Time.get_ticks_msec() / 1000.0
	var L: Array = a.get_meta("gz", [])
	L = L.filter(func(x): return now - float(x) < 3.0)
	L.append(now)
	if L.size() >= 3:
		a.sersem = maxf(a.sersem, 0.5 if a.boss else 1.0)
		L = []
	a.set_meta("gz", L)

## topuz: kombo sayacı (1,2 sn), her 5. isabette en yakın başka düşmana (120 px) kıvılcım ×0,8; geri itme yarı
func _topuz(a, dm: int) -> void:
	_ilk_bildir("topuz")
	if not a.kb.is_empty(): a.kb.v *= 0.5
	kombo += 1
	kombo_t = 1.2
	if kombo >= 2: oyun.yazi(position + Vector2(0, -36), "Kombo ×%d" % mini(kombo, 6), Color("#ffd060"), 9)
	for k in 6: oyun.parca(a.position + Vector2(0, -6), Vector2(randf_range(-50, 50), randf_range(-50, 20)), 0.25, Color("#fff2b0") if k % 2 else Color("#9ad8ff"))
	if kombo % 5 == 0:
		var en = null
		var bd := 120.0
		for b in oyun.canlilari_ver():
			if b == a or b.olu >= 0.0: continue
			var d: float = b.position.distance_to(a.position)
			if d < bd:
				bd = d; en = b
		if en != null:
			en.vuruldu(maxi(1, int(round(dm * 0.8))), (en.position - a.position).normalized())
			for k in 8: oyun.parca(a.position.lerp(en.position, k / 7.0) + Vector2(0, -6), Vector2.ZERO, 0.25, Color("#bfe8ff"))

func _kavis_ciz() -> void:
	if savrulus < 0.0:
		return
	var k := savrulus / 0.16
	var ang := atan2(savrulus_yon.y, savrulus_yon.x)
	kavis.draw_arc(Vector2(0, -6), savrulus_r, ang - 1.1 + k * 1.4, ang - 0.3 + k * 1.4, 8, Color(1, 1, 1, 1.0 - k), 1.0)

## savuşturma: 0,2 sn'lik pencere açar (web doParry)
func savustur() -> void:
	if bayildi or kilit or sersem > 0.0:
		return
	if not bilir("P0"):
		if not oyun.ders.acik:
			_uyar("Savuşturmayı henüz bilmiyorsun: Savaşçı Börü öğretir, onunla konuş.")
		return
	if pr_cd > 0.0:
		return
	if yorgun or st < 5.0:
		oyun.yazi(position + Vector2(0, -28), "Nefesin kesildi!", Color("#9ad8ff"), 9)
		pr_cd = 0.3
		return
	st -= 5.0; st_dinlen = 0.0
	pr_t = 0.2 * (1.6 if oyun.sk("V2") else (1.3 if oyun.sk("V1") else 1.0)); pr_cd = 0.6

func kalkan_kaldir() -> void:
	if not bilir("P0") or pr_brk > 0.0 or sersem > 0.0 or bayildi or kilit:
		return
	kalkan = true
	kalkan_t0 = Time.get_ticks_msec() / 1000.0

## darbe pencerede geldi: geri çevrilir (web parried)
func savusturdu(a = null) -> void:
	pr_n += 1
	if oyun.ses != null: oyun.ses.cal("clank")
	oyun.ult_ekle(10.0)
	pr_flash = 0.25
	pr_cd = minf(pr_cd, 0.15)
	st = minf(st_max, st + 6.0)
	dokunulmaz = maxf(dokunulmaz, 0.3)
	if a != null and is_instance_valid(a):
		var dv: Vector2 = (a.position - position)
		var dn := dv.normalized() if dv.length() > 0.5 else bakis
		a.savusturuldu(dn)
		var ix := position + Vector2(dn.x * 10.0, -6.0 + dn.y * 8.0)
		for i in 22:
			var an := randf() * TAU
			var sp := 40.0 + randf() * 90.0
			oyun.parca(ix, Vector2(cos(an) * sp, sin(an) * sp - 20.0), 0.25 + randf() * 0.3, Color("#9ad8ff") if i % 3 == 0 else Color("#fff2b0"))
	oyun.yazi(position + Vector2(0, -28), "Savuşturuldu!", Color("#9ad8ff"), 9)
	queue_redraw()

## web biteHit / hurt: atılırken ya da az önce ısırıldıysa dokunmaz; ısırık oyuncuyu 10 px iter.
## renk boş değilse bu bir canlının darbesidir (n beyaz, y sarı, r kırmızı): pencere açıksa savuşturulur, gardda yumuşar.
func isirildi(dmg: int, from: Vector2, a = null, renk: String = "", koru: float = 0.7) -> void:
	if atilma > 0.0 or dokunulmaz > 0.0 or bayildi:
		return
	oyun.balik.isirik()
	if renk != "" and pr_t > 0.0 and renk != "r":
		savusturdu(a)
		return
	if oyun.ses != null: oyun.ses.cal("ouch", 0.8)
	if renk != "" and oyun.evcil.binilen != null:
		oyun.evcil.binek_vuruldu(dmg)
		dokunulmaz = koru
		return
	var n := float(dmg)
	if renk != "" and kalkan and pr_brk <= 0.0:
		n *= float(BLK.get(renk, 0.35))
		blok_fx = 0.15
		var aa := atan2(bakis.y, bakis.x)
		for i in 8:
			var tt := aa + (randf() - 0.5) * 1.6
			var sp := 30.0 + randf() * 50.0
			oyun.parca(position + Vector2(cos(aa) * 9.0, -7.0 + sin(aa) * 6.0), Vector2(cos(tt) * sp, sin(tt) * sp - 10.0), 0.22, Color("#e8e8f0") if i % 2 else Color("#fff2b0"))
		st -= 6.0 + n * 0.4; st_dinlen = 0.0
		if st <= 0.0:
			st = 0.0; kalkan = false; pr_brk = 1.0; sersem = maxf(sersem, 0.5)
			oyun.yazi(position + Vector2(0, -34), "Kalkan düştü!", Color("#ff9a6a"), 9)
	# Son nefes: canın dörtte birinin altındayken fiziksel darbe %25 daha az
	if renk != "" and oyun.sk("D8") and hp < hp_max * 0.25: n *= 0.75
	if renk != "": n *= oyun.zirh_carpan()
	if renk != "" and atk_cd > 0.2 and str(silah_v().get("mace", "")) == "gurz": n *= 0.75   # savaş çekici: sağlam duruş
	kombo = 0
	dmg = maxi(1, int(round(n)))
	Ayarlar.titret(float(dmg) / maxf(1.0, hp_max) * 4.0)
	if oyun.arena != null and not oyun.arena.gercek:
		# arena: hasar ölçülür, can gitmez
		oyun.arena.aldi(dmg)
		dokunulmaz = koru
		kirmizi = 0.25
		oyun.yazi(position + Vector2(0, -24), "-%d" % dmg, Color("#ff6a5a"), 9)
		return
	dokunulmaz = koru
	hp = maxf(0.0, hp - dmg)
	kirmizi = 0.25
	oyun.yazi(position + Vector2(0, -24), "-%d" % dmg, Color("#ff6a5a"), 9)
	oyun.can_guncelle(hp, hp_max)
	var it := (position - from).normalized() * 10.0
	_kay(it)
	if hp <= 0.0:
		_bayil()

func etki_ekle(k: String, dps: float, sure: float) -> void:
	if not ETKI.has(k): return
	var S = oyun
	var res := 0.4 if S.sk("D14") else (0.6 if (k == "zehir" and S.sk("D3")) or (k == "yanık" and S.sk("D4")) or (k == "kanama" and S.sk("D6")) else 1.0)
	dps *= 1.3 * res * (1.0 - oyun.direnc(k)) * (1.0 - (1.0 - oyun.zirh_carpan()) / 2.0)
	sure *= 1.6 * (0.5 if S.sk("D9") else 1.0)
	if dps <= 0.05: return
	if etkiler.has(k):
		etkiler[k].t = maxf(etkiler[k].t, sure)
		etkiler[k].dps = maxf(etkiler[k].dps, dps)
	else:
		etkiler[k] = {t = sure, dps = dps, acc = 0.0}
	if not etki_gorulen.has(k):
		etki_gorulen[k] = true
		oyun.env.mesaj("Zehirlendin! Bir süre can yakar, sonra geçer. Yemek yiyip canını doldur; kırmızı \"!\" gördüğünde yana atıl ya da uzaklaş." if k == "zehir" else "%s! Bir süre can yakar, sonra geçer." % ETKI[k][0], true)

func _etkiler(dt: float) -> void:
	if etkiler.is_empty():
		oyun.etki_yazi.text = ""
		return
	var yaz := []
	for k in etkiler.keys():
		var f: Dictionary = etkiler[k]
		var dm: float = f.dps * dt
		hp -= dm
		f.acc += dm
		f.t -= dt
		var c := Color(ETKI[k][1])
		if f.acc >= 2.0:
			oyun.yazi(position + Vector2(randf_range(-4, 4), -20), "-%d" % int(f.acc), c, 8)
			f.acc -= floorf(f.acc)
		if randf() < dt * 6.0: oyun.parca(position + Vector2(randf_range(-4, 4), -8), Vector2(0, -14), 0.4, c)
		if f.t <= 0.0: etkiler.erase(k)
		else: yaz.append("[color=%s]%s %s %d sn[/color]" % [ETKI[k][1], ETKI[k][2], ETKI[k][0], ceili(f.t)])
	oyun.etki_yazi.text = "  ".join(yaz)
	oyun.can_guncelle(hp, hp_max)
	if hp <= 0.0:
		hp = 0.0
		etkiler.clear()
		oyun.etki_yazi.text = ""
		_bayil()

func _bayil() -> void:
	oyun.bayil("")

## sahnede karakter konuştuğu kişiye döner
func bak(d: Vector2) -> void:
	if d.length() > 0.1:
		_yon_sec(d.normalized())
		bakis = d.normalized()
