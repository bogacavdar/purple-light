## Gün, gece ve mor ışık (web tickClock, darkness, lightSources, zifiri karanlık; belge: Sistemler › Gün, gece ve mor ışık).
## Gündüz 06:00–20:00 = 8 dk, gece 20:00–06:00 = 2,5 dk. 19:00'dan kararır, 21:00–04:30 tam karanlık. Bir pencere ya da sahne açıkken
## dünya durur. Gece ışıksız (meşale, ateş, kamp, ocak, kazan yanında değilsen) kalınca sayaç: 3,5 sn "Kim var orada?!", 6,5 sn
## "Bir şey yaklaşıyor…", 8. sn mor ışık iner, bayılırsın (ilk gece 2,5 kat yavaş: 20 sn). İlk kez meşalesiz yakalanınca biri bir Kaba meşale atar.
extends Node

const GECE := Color(0.05, 0.05, 0.13)
const ZIFIRI := 0.7

var oyun
var A: Dictionary          # ates.json
var dk := 360.0            # günün dakikası (web dayT)
var gun := 1
var karanlik_t := 0.0
var mesale_verildi := false
var isin := {}             # mor ışık: {t, p}
var saat_yazi: Label
var isiklar: Array = []    # [PointLight2D]
var ates_dugum: Node2D
var uyari_gunu := 0

func kur(o) -> void:
	oyun = o
	A = o._json("res://data/ates.json")
	dk = float(A.gunBasi)
	saat_yazi = Label.new()
	oyun._golge(saat_yazi)
	oyun.can_cubugu.get_parent().add_child(saat_yazi)
	oyun.can_cubugu.get_parent().move_child(saat_yazi, 0)
	# ateşler: kişilerin ateşleri, Kemal'in kampı (web drawFireAt) ve gece ışıkları
	ates_dugum = Node2D.new()
	ates_dugum.draw.connect(_ates_ciz)
	ates_dugum.z_index = 1
	oyun.add_child(ates_dugum)
	_isik(Vector2(float(A.kamp.x) + 16.0, float(A.kamp.y) + 2.0), float(A.isik.kamp))
	_isik(Vector2(A.ocak.x, float(A.ocak.y) - 6.0), float(A.isik.ocak))
	_isik(Vector2(A.kazan.x, A.kazan.y), float(A.isik.kazan))
	for f in A.ates:
		if float(f.x) < -9000.0: continue
		_isik(Vector2(f.x, float(f.y) - 3.0), float(A.isik.ates))
	_saat_yaz()

func _isik(p: Vector2, r: float) -> void:
	var l := PointLight2D.new()
	l.texture = oyun.mesale.isik.texture
	l.texture_scale = r / 128.0 * 1.3
	l.color = Color(1.0, 0.75, 0.45)
	l.energy = 1.0
	l.position = p
	l.enabled = false
	oyun.add_child(l)
	isiklar.append(l)

## web darkness(): 0 gündüz … 0,985 tam gece
func karanlik() -> float:
	var m := dk
	var D := 0.985
	if m >= 1140.0 and m < 1260.0: return (m - 1140.0) / 120.0 * D
	if m >= 1260.0 or m < 270.0: return D
	if m < 360.0: return (360.0 - m) / 90.0 * D
	return 0.0

func gece_mi() -> bool:
	return dk >= 1200.0 or dk < 360.0

func ilk_gece() -> bool:
	return gun == 1 and gece_mi()

func durdu() -> bool:
	return oyun.konusma.visible or oyun.istasyon.pencere.visible or oyun.pazar.pencere.visible or oyun.el_yapimi.acik_mi() or oyun.sahne.acik or oyun.menu_acik() or oyun.cine.acik or oyun.uyanis.acik

func _process(dt: float) -> void:
	if oyun.basta: return
	var dur := durdu()
	if not dur:
		var b := dk
		dk += ((840.0 / 480.0) if (dk >= 360.0 and dk < 1200.0) else (600.0 / float(A.geceSn))) * dt
		if dk >= 1440.0: dk -= 1440.0
		if b < 360.0 and dk >= 360.0:
			gun += 1
			oyun.env.mesaj("Gün %d" % gun)
		if gun <= 3 and b < 1050.0 and dk >= 1050.0 and uyari_gunu != gun:
			uyari_gunu = gun
			oyun.env.mesaj("Hava kararıyor: gece için bir meşale ya da ateş lazım.", true)
	_saat_yaz()
	var k := karanlik()
	if not oyun.magara.icinde:
		oyun.taban_renk = Color.WHITE.lerp(GECE, k / 0.985)
		if oyun.ys != null and oyun.ys.ortu.modulate.a > 0.0: oyun.taban_renk = oyun.taban_renk.lerp(Color(0.86, 0.74, 1.0), oyun.ys.ortu.modulate.a * k)
		oyun.renk_guncelle()
	for l in isiklar: l.enabled = k > 0.05 and not oyun.magara.icinde
	ates_dugum.queue_redraw()
	if not dur and not oyun.ev.acik: _zifiri(dt, k)

func _saat_yaz() -> void:
	var m := int(dk)
	saat_yazi.text = "Gün %d · %02d:%02d" % [gun, m / 60, m % 60]

## ışık var mı (web litAt + nearCamp + meşale)
func isikta(p: Vector2) -> bool:
	if oyun.ys != null and oyun.ys.aktif(): return true   # saldırıda bütün ada mor ışıkla aydınlık
	if oyun.mesale.elde() != null: return true
	if oyun.isikci != null and oyun.isikci.lamba(): return true
	if oyun.insa.fener_isiginda(p): return true
	if oyun.balik.koruyor(p): return true
	if oyun.ciftlik.adada(p): return true
	return kampta(p)

## ateşlerin güvenli yarıçapı (web campFor): saldırganlar orada doğmaz ve saldırmaz
func kampta(p: Vector2) -> bool:
	if p.distance_to(Vector2(A.kamp.x, A.kamp.y)) < float(A.guvenli.kamp): return true
	if p.distance_to(Vector2(A.ocak.x, A.ocak.y)) < float(A.guvenli.ocak): return true
	if p.distance_to(Vector2(A.kazan.x, A.kazan.y)) < float(A.guvenli.kazan): return true
	for f in A.ates:
		if p.distance_to(Vector2(f.x, f.y)) < float(A.guvenli.ates): return true
	return false

func _zifiri(dt: float, k: float) -> void:
	var P = oyun.oyuncu
	if not isin.is_empty():
		isin.t += dt
		if isin.t >= 1.5 and not isin.get("bitti", false):
			isin.bitti = true
			oyun.bayil("gece")
		if isin.t > 2.2: isin = {}
		return
	var acik: bool = k >= ZIFIRI and not oyun.magara.icinde and not P.bayildi and not isikta(P.position - Vector2(0, 6))
	if not acik:
		if karanlik_t > 0.0:
			if oyun.mesale.elde() != null and karanlik_t > 1.0: oyun.balon("Işık… iyi ki varsın.", 3.0)
			karanlik_t = 0.0
		return
	if karanlik_t == 0.0 and not oyun.mesale.var_mi() and not mesale_verildi:
		mesale_verildi = true
		oyun.env.ekle("Kaba meşale")
		oyun.balon("Biri bana bir meşale attı!", 3.5)
		oyun.env.mesaj("Karanlıkta bir ateşin başından biri sana bir kaba meşale fırlattı. Bir dahaki gece kendin yap!")
		return
	if karanlik_t == 0.0:
		var var_: bool = oyun.mesale.var_mi()
		oyun.balon("Zifiri karanlık… meşalem!" if var_ else "Ne… ne oluyor? Hiçbir şey göremiyorum!", 3.4)
		if var_: oyun.env.mesaj("Karanlıktasın! Meşaleni hemen yak: \" tuşu. Işıksız kalırsan bir şey gelir…", true)
	var b := karanlik_t
	var yavas := 2.5 if gun == 1 else 1.0
	karanlik_t += dt / yavas
	if b < 3.5 and karanlik_t >= 3.5: oyun.balon("Kim var orada?!", 3.0)
	if b < 6.5 and karanlik_t >= 6.5: oyun.balon("Bir şey yaklaşıyor…", 2.0)
	if karanlik_t >= 8.0:
		karanlik_t = 0.0
		isin = {t = 0.0, p = P.position}
		P.hp = 0.0
		oyun.can_guncelle(0.0, P.hp_max)
		oyun.yazi(P.position + Vector2(0, -26), "-%d" % int(ceil(P.hp_max)), Color("#d07aff"), 14)

func _ates_ciz() -> void:
	var t := Time.get_ticks_msec() / 1000.0
	var L := [Vector2(float(A.kamp.x) + 16.0, float(A.kamp.y) + 2.0)]
	for f in A.ates:
		if float(f.x) > -9000.0: L.append(Vector2(f.x, f.y))
	var P: Vector2 = oyun.oyuncu.position
	for i in L.size():
		var p: Vector2 = L[i]
		if absf(p.x - P.x) > 600.0 or absf(p.y - P.y) > 400.0: continue
		var px := func(x: float, y: float, w: float, h: float, c: Color): ates_dugum.draw_rect(Rect2(p.x + x, p.y + y, w, h), c)
		px.call(-6, 1, 12, 3, Color("#5a3d22")); px.call(-5, 0, 3, 2, Color("#7a5430")); px.call(2, 0, 3, 2, Color("#7a5430"))
		for j in 5: px.call(-7 + j * 3, 3, 2, 1, Color("#6a6a70"))
		var fl := roundf(sin(t * 12.0 + i))
		px.call(-2, -5 + fl, 5, 5, Color("#e8502a")); px.call(-1, -7 + fl, 3, 4, Color("#f2a03a")); px.call(0, -8, 1, 2, Color("#ffe29b"))
	# mor ışık iniyor
	if not isin.is_empty():
		var k: float = clampf(isin.t / 0.4, 0.0, 1.0)
		var a: float = clampf(1.0 - (isin.t - 1.5) / 0.7, 0.0, 1.0) if isin.t > 1.5 else 1.0
		var q: Vector2 = isin.p
		ates_dugum.draw_rect(Rect2(q.x - 10, q.y - 400 * k, 20, 400 * k), Color(0.75, 0.45, 1.0, 0.35 * a))
		ates_dugum.draw_rect(Rect2(q.x - 4, q.y - 400 * k, 8, 400 * k), Color(0.95, 0.85, 1.0, 0.7 * a))
		ates_dugum.draw_circle(q, 18.0 * k, Color(0.8, 0.5, 1.0, 0.4 * a))
