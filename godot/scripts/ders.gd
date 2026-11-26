## Börü'nün atılma ve savuşturma dersi (web v181 DL: startLesson, tickDL, strikeDone, finishLesson, quitLesson).
## Öğretici gelene kadar (1f-3b-4) ders web'deki "öğreticiyi geçmiş oyuncu" yolundadır (DL.free): oyunu durdurmaz,
## Börü'den 280 px uzaklaşınca sessizce biter. Ders kereviti hasar almaz, ısırmaz; yaklaşır, bekler, "!" ile düz bir sıçrayış yapar.
extends Node

var oyun
var acik := false
var mod := "dodge"       # dodge: yana atıl · parry: savuştur
var n := 0
var ph := ""             # idle · wind · lunge · talk
var t := 0.0
var crab = null
var h := Vector2.ZERO    # kerevitin yeri (web DL.hx, DL.hy)
var atk_t := 0.0
var w_start := 0.0
var ls := 0.0
var l0 := Vector2.ZERO
var tgt := Vector2.ZERO
var talk_t := 0.0
var yan := 1.0
var oto := false        # denetim: adrese ?oto yazılınca ders kendi kendine doğru anda basar
var katman: CanvasLayer
var buyuk: Label
var kucuk: Label

func kur(o) -> void:
	oyun = o
	katman = CanvasLayer.new()
	katman.layer = 5
	add_child(katman)
	var v := VBoxContainer.new()
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.set_anchors_preset(Control.PRESET_FULL_RECT)
	v.anchor_top = 0.30; v.anchor_bottom = 0.46
	katman.add_child(v)
	buyuk = _etiket(40); v.add_child(buyuk)
	kucuk = _etiket(18); v.add_child(kucuk)
	katman.visible = false

func _etiket(boy: int) -> Label:
	var l := Label.new()
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.add_theme_font_size_override("font_size", boy)
	l.add_theme_color_override("font_color", Color.WHITE)
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 8 if boy > 20 else 6)
	return l

static func now() -> float:
	return Time.get_ticks_msec() / 1000.0

## ders sürerken öğrenilmiş sayılan: atılma derste atılma, savuşturma derste savuşturma
func gecici(id: String) -> bool:
	if not acik: return false
	return id == "S1" or (id == "P0" and mod == "parry")

## kayda yalnızca gerçekten öğrenilenler girer (yarıda kalan ders kaydedilmez)
func kayit_yetenek() -> Array:
	return oyun.yetenekler.keys()

## derste yönsüz atılma kerevitin çizgisinden yana gider (sırayla sağa, sola)
func yana_yon(d: Vector2) -> Vector2:
	if crab == null or not is_instance_valid(crab): return d
	var e: Vector2 = oyun.oyuncu.position - crab.position
	if e.length() < 0.5: return d
	yan = -yan
	return Vector2(-e.y, e.x).normalized() * yan

func _yaz() -> void:
	if not acik or ph == "talk":
		katman.visible = false
		return
	katman.visible = true
	buyuk.text = "%s: %d/4" % ["Savuşturma" if mod == "parry" else "Sıyrılma", n]
	kucuk.text = "Kımıldama: kerevit saldıracak" if n == 0 else ""

func basla(m: String) -> void:
	if acik: return
	acik = true
	mod = "parry" if m == "parry" else "dodge"
	n = 0; ph = "idle"; t = 1.6; atk_t = now()
	var P = oyun.oyuncu
	P.st = P.st_max; P.yorgun = false
	_dogur()
	_yaz()

func _dogur() -> void:
	if crab != null and is_instance_valid(crab): crab.queue_free()
	var P: Vector2 = oyun.oyuncu.position
	var p := P + Vector2(44, 0)
	for k in 40:
		var an := randf() * TAU
		var q := P + Vector2(cos(an), sin(an)) * (44.0 + randf() * 12.0)
		if not oyun.engel(q, 5.0) and oyun.tile_at(q) <= 2 and oyun.tile_at(q) >= 0:
			p = q
			break
	crab = oyun._canli_yeni("Kerevit", p, 0)
	crab.ders = true
	crab.set_meta("ders", true)
	h = p

func _kapat_crab(fx: bool) -> void:
	if crab != null and is_instance_valid(crab):
		if fx:
			for i in 12:
				oyun.parca(crab.position + Vector2(0, -4), Vector2(randf_range(-30, 30), -10 - randf() * 30), 0.5, Color("#e8e0c8"))
		crab.queue_free()
	crab = null

## Börü'den uzaklaşınca: ders sessizce biter, öğrenilmeyen öğrenilmemiş kalır
func birak() -> void:
	acik = false; ph = ""
	_kapat_crab(false)
	_yaz()

func _yuru(c, hedef: Vector2, sp: float, dt: float) -> void:
	var dv := hedef - h
	var d := dv.length()
	if d < 1.0:
		c.ders_yuru = false
		return
	var np := h + dv * (minf(d, sp * dt) / d)
	if _bos(np): h = np
	elif _bos(Vector2(np.x, h.y)): h.x = np.x
	elif _bos(Vector2(h.x, np.y)): h.y = np.y
	c.ders_yuru = true
	c.step += dt * 8.0

func _bos(p: Vector2) -> bool:
	var tl: int = oyun.tile_at(p)
	return not oyun.engel(p, 5.0) and tl >= 0 and tl <= 2

func _process(dt: float) -> void:
	if not acik: return
	var P = oyun.oyuncu
	var alp = oyun.alp_dugum()
	if alp != null and P.position.distance_to(alp.position) > 280.0:
		birak()
		return
	if crab == null or not is_instance_valid(crab):
		_dogur()
		return
	var c = crab
	if ph == "talk":
		c.position = h; c.ders_yuru = false
		if not oyun.konusma.visible and now() - talk_t > 1.5:
			ph = "idle"; t = 1.4; P.st = P.st_max; _yaz()
		return
	if oyun.pencere_acik(): return
	var dx: float = P.position.x - c.position.x
	c.face = -1 if dx < 0 else 1
	if ph == "idle":
		c.wind = 0.0; c.lunge = {}
		var pd: float = maxf(1.0, P.position.distance_to(h))
		if pd > 46.0:
			_yuru(c, P.position + (h - P.position) / pd * 36.0, 70.0 if pd > 90.0 else 42.0, dt)
		elif pd < 22.0:
			_yuru(c, P.position + (h - P.position) / pd * 30.0, 30.0, dt)
		else:
			c.ders_yuru = false
			t -= dt
		# ders hiç takılmaz: 5 sn saldırmadıysa olduğu yerden saldırır; 8 sn uzak kaldıysa yanına gelir
		if now() - atk_t > 8.0 and pd > 60.0:
			_dogur(); atk_t = now() - 4.0
			return
		if now() - atk_t > 5.0 and pd <= 60.0: t = 0.0
		c.position = h
		if t <= 0.0:
			ph = "wind"; t = 0.08; w_start = now(); atk_t = now()
			c.renk = "r" if mod == "dodge" else c._zar()
			c.wind = 0.08
			oyun.yazi(c.position + Vector2(0, -22), "!", Color("#ff3b30") if mod == "dodge" else preload("res://scripts/canli.gd").RENK[c.renk], 16)
	elif ph == "wind":
		c.ders_yuru = false
		c.position = h + Vector2(randf_range(-1.5, 1.5), randf_range(-1, 1))
		t -= dt
		if t <= 0.0:
			c.position = h
			ph = "lunge"; t = 0.45; ls = now(); l0 = h
			var e: Vector2 = P.position - h
			tgt = P.position + e.normalized() * 8.0 if e.length() > 0.5 else P.position
			c.wind = 0.0; c.lunge = {ders = true}
	elif ph == "lunge":
		t -= dt
		var k := minf(1.0, 1.0 - t / 0.45)
		var np := l0.lerp(tgt, k)
		if not _bos(np): np = c.position
		c.position = np; h = np
		var near: float = P.position.distance_to(c.position)
		if oto:
			if mod == "parry" and near < 22.0: P.savustur()
			elif mod == "dodge" and near < 34.0: P._atil(Vector2.ZERO)
		if mod == "parry":
			if near <= 12.0:
				if P.pr_t > 0.0:
					P.savusturdu(c)
					_sonuc(true, "")
				else:
					_sonuc(false, "Takla değil, savuştur!" if P.atilma > 0.0 else ("Erken!" if P.pr_cd > 0.0 else "Değdi!"))
				return
			if t <= 0.0: _sonuc(false, "Kaçma, savuştur!")
			return
		if near <= 12.0:
			if P.atilma > 0.0 and P.son_atilma >= ls - 0.15:
				_sonuc(true, "")
			else:
				_sonuc(false, "Erken!" if (P.son_atilma >= w_start - 0.25 and P.son_atilma < ls - 0.05) else "Değdi!")
			return
		if t <= 0.0:
			var ok: bool = P.son_atilma >= ls - 0.15
			_sonuc(ok, "" if ok else "Kaçmadın!")

func _sonuc(ok: bool, neden: String) -> void:
	var P = oyun.oyuncu
	if crab != null and is_instance_valid(crab):
		crab.lunge = {}; crab.wind = 0.0
	if ok:
		n += 1
		if mod != "parry": oyun.yazi(P.position + Vector2(0, -28), "Sıyrıldın!", Color("#9fe07a"), 9)
	else:
		oyun.yazi(P.position + Vector2(0, -28), (neden + " Bir daha!") if neden != "" else "Bir daha!", Color("#e8c860"), 9)
	if n >= 4:
		if mod == "dodge":
			oyun.yetenekler["S1"] = true
			if not oyun.yetenekler.has("P0"):
				# atılmadan hemen sonra savuşturma
				mod = "parry"; n = 0; ph = "talk"; talk_t = now()
				_yaz()
				await get_tree().create_timer(0.5).timeout
				var alp = oyun.alp_dugum()
				oyun.konusma.ac(alp.K.ad if alp else "Börü", _por(alp), "Güzel kaçtın! Ama her saldırıdan kaçamazsın evlat. Şimdi [b]savuşturmayı[/b] öğren: kerevit atıldığında, sana değmeden hemen önce [b]sağ tık[/b]a (ya da [b]E[/b]'ye) bas. Doğru anda yaparsan darbeyi geri çevirirsin, kerevit sersemler. Beyaz ve sarı [b]![/b] savuşturulur; kırmızı olanı ancak taklayla atlatırsın.", [{t = "Hazırım", pri = true, f = func(): _hazir()}])
				return
		_bitir()
		return
	ph = "idle"; t = 1.3 + randf() * 0.8
	P.st = P.st_max; P.yorgun = false
	_yaz()

func _hazir() -> void:
	if not acik: return
	ph = "idle"; t = 1.4
	oyun.oyuncu.st = oyun.oyuncu.st_max
	_yaz()

func _por(alp):
	if alp == null or alp.K.portre == null: return null
	return load(alp.K.portre)

func _bitir() -> void:
	var parry := mod == "parry"
	if parry: oyun.yetenekler["P0"] = true
	acik = false; ph = ""
	_kapat_crab(true)
	_yaz()
	oyun.dl_agac = true
	var alp = oyun.alp_dugum()
	oyun.konusma.ac(alp.K.ad if alp else "Börü", _por(alp), ("Hah! Dört kez sıyrıldın, dört kez de savuşturdun; kerevit hâlâ ne olduğunu anlamaya çalışıyor." if parry else "Hah! Dört kez sıyrıldın, kerevit hâlâ ne olduğunu anlamaya çalışıyor.") + " [b]İlk ders tamam![/b] Ama kulağına küpe olsun: her kavgaya girmek akıllıca değildir evlat. Bazen en iyi hamle arkanı dönüp [b]tabanları yağlamaktır[/b]. Kaçabilmek için de hızlı koşmayı bilmen gerek.", [{t = "Anladım", pri = true, kapat = true}])
