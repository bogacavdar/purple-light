extends Node
## Yemek etkileri ve yemek listesi (web eat, eatBest, v63 prof/renderEat, v2.33 kategoriler, v3.10, v3.35; belge Sistemler › Yemek).
## Her yiyeceğin tokluğu, canı, iyi etkileri (süreli), olası kötü etkileri, enerjisi, zehri web'in kendi hesabından gelir
## (tools/disa_aktar_yemek.js → data/yemek.json). Yemek 15 sn boyunca tokluğun %80'i kadar can sarar. Çiğ et %35 ihtimalle 4 can yakar.
## X'e kısa bas: en uygun yiyecek (zehirsiz, çiğ et yoksa); basılı tut: kategorili yemek listesi. Bir şeyi ilk kez yiyene kadar etkisi "Bilgim yok".

const KATLAR := ["Meyveler", "Sebze ve tahıl", "Otlar", "Mantarlar", "Etler", "Balıklar", "Yemekler", "Şifa", "Diğer"]
var oyun
var Y: Dictionary          # ad → profil
var E: Dictionary          # etki → {n, c, e}
var pb := {}               # etkin etkiler: ad → kalan sn
var KN := {}               # yenmiş (biliniyor)
var meal := 0.0
var meal_t := 0.0
var bas_t := -1.0
var pen: PanelContainer
var sekme: HBoxContainer
var liste: VBoxContainer
var bilgi: Label
var sec_kat := ""
var etki_satir: HBoxContainer
var goz_isik: PointLight2D

func kur(o) -> void:
	oyun = o
	var d: Dictionary = o._json("res://data/yemek.json")
	Y = d.yemek
	E = d.etki
	# etkin etkiler: can çubuklarının altında küçük renkli yazılar
	etki_satir = HBoxContainer.new()
	etki_satir.add_theme_constant_override("separation", 8)
	oyun.can_cubugu.get_parent().add_child(etki_satir)
	# Gece gözü: karanlıkta etrafını görürsün
	goz_isik = PointLight2D.new()
	goz_isik.texture = oyun.mesale.isik.texture
	goz_isik.texture_scale = 58.0 * 2.0 / 128.0
	goz_isik.color = Color(0.75, 0.85, 1.0)
	goz_isik.energy = 0.8
	goz_isik.enabled = false
	oyun.oyuncu.add_child(goz_isik)
	goz_isik.position = Vector2(0, -6)
	_pencere()

func yenir(n: String) -> bool:
	return Y.has(n)

func var_mi(k: String) -> bool:
	return pb.has(k)

## oyun.stat'a çarpan (web STAT.hp/hpRe/stRe/move ve vuruş güç/zayıf)
func kat(k: String) -> float:
	match k:
		"dmg": return (1.2 if pb.has("güç") else 1.0) * (0.8 if pb.has("zayıf") else 1.0)
		"move": return (1.12 if pb.has("hız") else 1.0) * (0.8 if pb.has("yavaş") else 1.0)
		"hp": return 1.2 if pb.has("dayanık") else 1.0
		"hpRe": return (3.0 if pb.has("ılık") else 1.0) * (0.0 if pb.has("bulantı") else 1.0)
		"stRe": return (1.5 if pb.has("enerji") else 1.0) * (0.5 if pb.has("halsiz") else 1.0)
	return 1.0

func ekle(k: String, sure: float) -> void:
	if not E.has(k): return
	var had := pb.has(k)
	pb[k] = maxf(sure, float(pb.get(k, 0.0)))
	if not had:
		oyun.yazi(oyun.oyuncu.position + Vector2(0, -34), str(E[k].n), Color(str(E[k].c)), 8)
		if k == "panzehir" and oyun.oyuncu.etkiler.has("zehir"): oyun.oyuncu.etkiler.erase("zehir")
	oyun.oyuncu.hp_max = oyun.oyuncu.can_max()

## bir şeyi ye (web eat + v63 eat)
func ye(n: String) -> bool:
	var env = oyun.env
	if env.adet(n) <= 0 or not Y.has(n): return false
	var P: Dictionary = Y[n]
	var O = oyun.oyuncu
	env.eksilt(n)
	var f := float(P.f)
	env.tokluk = minf(100.0, env.tokluk + f)
	if float(P.h) > 0.0:
		O.hp = minf(O.hp_max, O.hp + float(P.h))
		oyun.yazi(O.position + Vector2(0, -20), "+%d can" % int(P.h), Color("#8fd46b"), 8)
	if f > 0.0:
		meal += f * 0.8 * (1.5 if oyun.sk("D12") else 1.0)
		meal_t = 15.0
		oyun.yazi(O.position + Vector2(0, -26), "+%d tokluk" % int(f), Color("#f2b84b"), 8)
	for k in P.iy: ekle(str(k), float(P.dG))
	if int(P.en) > 0:
		O.st = minf(O.st_max, O.st + float(P.en))
		oyun.yazi(O.position + Vector2(0, -32), "+%d enerji" % int(P.en), Color("#b8e070"), 8)
	if n == "Mana iksiri" and oyun.buyu != null: oyun.buyu.iksir()
	if n == "Kök özü iksiri": ekle("enerji", 600.0)
	oyun.ogr.yedi(n)
	if oyun.ses != null: oyun.ses.cal("pick")
	var kotu: Array = P.kt
	if not kotu.is_empty() and randf() < float(P.pK):
		get_tree().create_timer(0.7).timeout.connect(func():
			for k in kotu: ekle(str(k), float(P.dB))
			if oyun.ses != null: oyun.ses.cal("bad")
			oyun.balon("Midem kalktı…" if kotu.has("bulantı") else "Başım dönüyor…", 2.4))
	if int(P.cig) == 1 and randf() < (0.05 if oyun.sk("C14") else (0.14 if oyun.sk("C7") else 0.35)):
		get_tree().create_timer(0.4).timeout.connect(func():
			O.hp = maxf(1.0, O.hp - 4.0)
			oyun.yazi(O.position + Vector2(0, -26), "-4", Color("#ff6a5a"), 9)
			env.mesaj("Çiğ et midene dokundu; pişirmek daha iyi", true))
	if not KN.has(n):
		KN[n] = true
		get_tree().create_timer(1.4).timeout.connect(func(): env.mesaj("%s: artık ne yaptığını biliyorsun (Yemek listesi)" % n))
	oyun.can_guncelle(O.hp, O.hp_max)
	if pen.visible: _liste_ciz()
	return true

## X'e kısa basış: en uygun yiyecek (web eatBest): zehir asla kendiliğinden; çiğ et ancak başka yoksa; tokluğu en az boşa harcayan
func en_iyi() -> void:
	var env = oyun.env
	var hepsi: Array = []
	for n in env.inv:
		if env.adet(n) > 0 and Y.has(n) and float(Y[n].f) > 0.0: hepsi.append(n)
	if hepsi.is_empty():
		env.mesaj("Yiyecek bir şeyin yok. Böğürtlen topla ya da yemek tarifi bul.", true)
		return
	var L: Array = hepsi.filter(func(n): return int(Y[n].z) == 0 and int(Y[n].cig) == 0)
	if L.is_empty(): L = hepsi.filter(func(n): return int(Y[n].z) == 0)
	if L.is_empty():
		env.mesaj("Elindeki yiyecekler zehirli ya da şüpheli. Bilerek yemek istersen listeden seç.", true)
		ac()
		return
	var oda: float = 100.0 - env.tokluk
	L.sort_custom(func(a, b):
		var fa := float(Y[a].f)
		var fb := float(Y[b].f)
		var wa := maxf(0.0, fa - oda)
		var wb := maxf(0.0, fb - oda)
		if wa != wb: return wa < wb
		return fa > fb)
	if ye(L[0]): env.mesaj("%s yedin" % L[0])

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	var O = oyun.oyuncu
	var dur: bool = oyun.zaman.durdu() or get_tree().paused or oyun.basta
	# X: kısa bas yer, basılı tut listeyi açar
	if not oyun.pencere_acik() or pen.visible:
		if Input.is_action_just_pressed("ye") and not pen.visible: bas_t = 0.0
		if bas_t >= 0.0:
			bas_t += dt
			if bas_t >= 0.4:
				bas_t = -1.0
				ac()
			elif Input.is_action_just_released("ye"):
				bas_t = -1.0
				en_iyi()
	if dur: return
	var degisti := false
	for k in pb.keys():
		pb[k] -= dt
		if pb[k] <= 0.0:
			pb.erase(k)
			degisti = true
	if degisti: O.hp_max = O.can_max()
	if meal_t > 0.0 and meal > 0.0:
		var a := minf(meal, meal / meal_t * dt)
		O.hp = minf(O.hp_max, O.hp + a)
		meal -= a
		meal_t -= dt
		if meal_t <= 0.0: meal = 0.0
	goz_isik.enabled = pb.has("göz") and oyun.zaman.karanlik() > 0.4 and oyun.mesale.elde() == null
	_etki_yaz()

func _sure(t: float) -> String:
	return ("%s dk" % str(snappedf(t / 60.0, 0.1)).replace(".", ",")) if t >= 60.0 else ("%d sn" % int(t))

var _ey := ""
func _etki_yaz() -> void:
	var s := ""
	for k in pb: s += "%s%d|" % [k, int(pb[k])]
	if s == _ey: return
	_ey = s
	for c in etki_satir.get_children(): c.queue_free()
	for k in pb:
		var l := Label.new()
		l.text = "%s %s" % [E[k].n, _sure(pb[k])]
		l.add_theme_font_size_override("font_size", 11)
		l.add_theme_color_override("font_color", Color(str(E[k].c)))
		l.tooltip_text = str(E[k].e)
		l.mouse_filter = Control.MOUSE_FILTER_STOP
		oyun._golge(l)
		etki_satir.add_child(l)

# ------------------------------------------------------------------ yemek listesi (kategori sekmeli)
func _pencere() -> void:
	pen = PanelContainer.new()
	pen.visible = false
	pen.custom_minimum_size = Vector2(520, 420)
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.1, 0.08, 0.06, 0.96)
	sb.border_color = Color("#c8a050")
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(6)
	sb.set_content_margin_all(12)
	pen.add_theme_stylebox_override("panel", sb)
	var v := VBoxContainer.new()
	pen.add_child(v)
	var ust := HBoxContainer.new()
	var b := Label.new()
	b.text = "Yemek"
	b.add_theme_font_size_override("font_size", 18)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ust.add_child(b)
	var x := Button.new()
	x.text = "✕"
	x.pressed.connect(kapat)
	ust.add_child(x)
	v.add_child(ust)
	bilgi = Label.new()
	bilgi.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	bilgi.add_theme_font_size_override("font_size", 12)
	v.add_child(bilgi)
	sekme = HBoxContainer.new()
	var sk := ScrollContainer.new()
	sk.custom_minimum_size = Vector2(0, 34)
	sk.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sk.add_child(sekme)
	v.add_child(sk)
	var sc := ScrollContainer.new()
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sc.custom_minimum_size = Vector2(0, 300)
	liste = VBoxContainer.new()
	liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste)
	v.add_child(sc)
	oyun.hud.add_child(pen)

func ac() -> void:
	pen.visible = true
	_liste_ciz()
	pen.set_anchors_preset(Control.PRESET_TOP_LEFT)
	pen.reset_size()
	pen.position = (pen.get_viewport_rect().size - pen.size) / 2.0

func kapat() -> void:
	pen.visible = false

func acik() -> bool:
	return pen.visible

func _input(e: InputEvent) -> void:
	if not pen.visible: return
	# dışına basmak ya da Esc kapatır (pencere seçim istemez)
	if e is InputEventMouseButton and e.pressed and not pen.get_global_rect().has_point(e.position):
		kapat()
		get_viewport().set_input_as_handled()
	elif e.is_action_pressed("ui_cancel"):
		kapat()
		get_viewport().set_input_as_handled()

func _liste_ciz() -> void:
	var env = oyun.env
	var O = oyun.oyuncu
	bilgi.text = "Tokluk %d / 100 · Can %d / %d. Bir şeyi ilk kez yiyene kadar ne yapacağını bilemezsin; yedikten sonra burada yazar. Değerli yemeklerin etkisi uzun sürer." % [ceili(env.tokluk), ceili(O.hp), int(O.hp_max)]
	var say := {}
	for n in env.inv:
		if env.adet(n) > 0 and Y.has(n):
			var k: String = str(Y[n].kat)
			say[k] = int(say.get(k, 0)) + 1
	for c in sekme.get_children(): c.queue_free()
	for c in liste.get_children(): c.queue_free()
	if say.is_empty():
		var l := Label.new()
		l.text = "Yiyecek bir şeyin kalmadı."
		liste.add_child(l)
		return
	if not say.has(sec_kat):
		for k in KATLAR:
			if say.has(k):
				sec_kat = k
				break
	for k in KATLAR:
		if not say.has(k): continue
		var b := Button.new()
		b.text = "%s %d" % [k, say[k]]
		b.toggle_mode = true
		b.button_pressed = k == sec_kat
		var kk: String = k
		b.pressed.connect(func():
			sec_kat = kk
			_liste_ciz())
		sekme.add_child(b)
	for n in env.inv:
		if env.adet(n) <= 0 or not Y.has(n) or str(Y[n].kat) != sec_kat: continue
		var P: Dictionary = Y[n]
		var r := HBoxContainer.new()
		var ik := TextureRect.new()
		ik.texture = env.ikon_al(n)
		ik.custom_minimum_size = Vector2(28, 28)
		ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		ik.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		r.add_child(ik)
		var t := RichTextLabel.new()
		t.bbcode_enabled = true
		t.fit_content = true
		t.scroll_active = false
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		t.add_theme_font_size_override("normal_font_size", 12)
		t.add_theme_font_size_override("bold_font_size", 13)
		var info := "[color=#ffffffbf]Bilgim yok[/color]"
		if KN.has(n):
			var a: Array = []
			if float(P.f) > 0.0: a.append("+%d tokluk" % int(P.f))
			if float(P.h) > 0.0: a.append("+%d can" % int(P.h))
			if int(P.en) > 0: a.append("+%d enerji" % int(P.en))
			for k in P.iy: a.append("[color=%s]%s %s[/color]" % [E[k].c, E[k].n, _sure(float(P.dG))])
			if int(P.z) == 1: a.append("[color=#9ad84a]zehirli![/color]")
			if not P.kt.is_empty():
				var ad: Array = []
				for k in P.kt: ad.append(str(E[k].n))
				a.append("[color=#ff8a6a]%s %s%s[/color]" % [", ".join(ad), _sure(float(P.dB)), "" if float(P.pK) >= 1.0 else " (olabilir)"])
			info = " · ".join(a) if not a.is_empty() else "Bir etkisi yok"
		t.text = "[b]%s[/b] ×%d\n%s" % [n, env.adet(n), info]
		r.add_child(t)
		var y := Button.new()
		y.text = "Ye"
		var nn: String = n
		y.pressed.connect(func(): ye(nn))
		r.add_child(y)
		liste.add_child(r)

func kayit() -> Dictionary:
	return {kn = KN.keys(), pb = pb.duplicate()}

func yukle(d) -> void:
	KN = {}; pb = {}; meal = 0.0; meal_t = 0.0
	if typeof(d) != TYPE_DICTIONARY: return
	for n in d.get("kn", []): KN[str(n)] = true
	var p = d.get("pb", {})
	if typeof(p) == TYPE_DICTIONARY:
		for k in p: if E.has(k): pb[k] = float(p[k])
