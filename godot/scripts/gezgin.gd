## Yıldızsız Gezgin ve robot köpekler (web: wiz, summonWizard, talkWizard, wizSignal, orderDog, spawnDog, tickDogs, dogDeliver, drawDog,
## drawWizard, renderCraft 'dogs'; belge Oyun akışı › Gezginler ve takvim, Sistemler › Ekonomi › Robot köpekler).
## 5. gün Gezgin yanında belirir ve bir robot köpek hediye eder; 20. günden sonra (ve gittiği günden en erken bir gün sonra) yine gelir,
## Mor sinyali verir: köpekler menüsünden Vio'yla köpek ısmarlanır (500 × 1,6^köpek, en çok 5), köpek mor ışık sütunuyla iner.
## Köpek seçtiğin malzemeyi kendi toplar, sırtında en çok 20 eşya taşır, dolunca getirir. R: köpekler menüsü (köpek yokken hiçbir şey açmaz).
extends Node2D

var oyun
var env
const DOG_MAX := 5
const GUN1 := 5
const GUN2 := 20
const ADLAR := ["Bobo", "Cıvata", "Pırpır", "Zımba", "Tik", "Fıstık", "Bulut", "Mıknatıs"]
const HIZ := 36.0
const KAP := 20
const IS_KAT := 2.0
const MATS := ["Dal", "Taş", "Lif", "Yaprak", "Kum", "Nehir çakılı", "Çakmaktaşı", "Böğürtlen", "Kuru ot", "Keten", "Kenevir", "Kekik", "Papatya", "Nane", "Isırgan", "Ahududu", "Çilek", "Yabani buğday", "Adaçayı", "Eğrelti", "Göl kili", "Kamış", "Yosun"]

var wiz := {shown = false, met = false, plan = false, gone = false, gone_day = 0, v2 = false, sig = false, x = 0.0, y = 0.0}
var kopekler: Array = []   # {ad, mat, p, st, t, dur, hedef, bag, face, ph, happy, n (Node2D)}
var mesajlar: Array = []
var isinlar: Array = []    # {p, t, done}
var wiz_n: Node2D
var isin_n: Node2D
var t := 0.0
var por: ImageTexture
var pen_kat: CanvasLayer
var pen: PanelContainer
var pen_v: VBoxContainer
var balon_t := -1.0

func kur(o) -> void:
	oyun = o
	env = o.env
	wiz_n = Node2D.new()
	wiz_n.draw.connect(_wiz_ciz)
	wiz_n.visible = false
	oyun.nesneler.add_child(wiz_n)
	isin_n = Node2D.new()
	isin_n.z_index = 5
	isin_n.draw.connect(_isin_ciz)
	oyun.add_child(isin_n)
	por = _portre()
	pen_kat = CanvasLayer.new(); pen_kat.layer = 6; pen_kat.visible = false
	add_child(pen_kat)
	var arka := ColorRect.new(); arka.color = Color(0.03, 0.04, 0.06, 0.55); arka.set_anchors_preset(Control.PRESET_FULL_RECT)
	arka.gui_input.connect(func(e): if e is InputEventMouseButton and e.pressed: kapat())
	pen_kat.add_child(arka)
	pen = PanelContainer.new()
	var sb := StyleBoxFlat.new(); sb.bg_color = Color("#1d2418"); sb.border_color = Color("#9a7ad8"); sb.set_border_width_all(2); sb.set_corner_radius_all(8)
	sb.content_margin_left = 14; sb.content_margin_right = 14; sb.content_margin_top = 10; sb.content_margin_bottom = 10
	pen.add_theme_stylebox_override("panel", sb)
	pen.custom_minimum_size = Vector2(600, 0)
	pen_kat.add_child(pen)
	var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(580, 420)
	pen.add_child(sc)
	pen_v = VBoxContainer.new(); pen_v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(pen_v)

func _portre() -> ImageTexture:
	var im := Image.create(24, 26, false, Image.FORMAT_RGBA8)
	var p := func(x: int, y: int, w: int, h: int, c: String) -> void: im.fill_rect(Rect2i(x, y, w, h), Color(c))
	# başlık ve yüz, iki kat büyük (web drawWizard'ın üst yarısı)
	p.call(2, 18, 20, 8, "#3a1e6a"); p.call(11, 18, 2, 8, "#a070e0")
	p.call(4, 8, 16, 10, "#140a26"); p.call(6, 12, 4, 2, "#c9a0ff"); p.call(14, 12, 4, 2, "#c9a0ff")
	p.call(0, 6, 24, 3, "#2a1450"); p.call(4, 2, 16, 5, "#2a1450"); p.call(9, 0, 6, 3, "#2a1450")
	p.call(6, 4, 2, 2, "#f2e46b"); p.call(16, 2, 2, 2, "#f2e46b")
	return ImageTexture.create_from_image(im)

func _soyle(metin: String, secs: Array) -> void:
	oyun.konusma.ac("Yıldızsız Gezgin", por, metin, secs)

# ------------------------------------------------------------------ Gezgin gelir, konuşur, gider
func _cagir() -> void:
	wiz.shown = true
	var P: Vector2 = oyun.oyuncu.position
	var en := P + Vector2(40, 0)
	for k in 40:
		var a := k * 0.7
		var r := 56.0 + k * 2.0
		var q := P + Vector2(cos(a), sin(a)) * r
		if oyun.engel(q) or oyun.tile_at(q) >= 3: continue
		var dolu := false
		for n in oyun.kisiler:
			if n.visible and n.position.distance_to(q) < 60.0: dolu = true
		if dolu: continue
		en = q
		break
	wiz.x = en.x; wiz.y = en.y
	wiz_n.position = en
	wiz_n.visible = true
	for i in 30: oyun.parca(en + Vector2(0, -6), Vector2.from_angle(randf() * TAU) * (20 + randf() * 50), 1.4, Color("#c9a0ff") if i % 2 else Color("#5a2aa0"))
	env.mesaj("Onunla konuş · Karanlık bir enerji yayılıyor")
	get_tree().create_timer(1.6).timeout.connect(func(): env.mesaj("Yakınında mor ışıklı biri belirdi. Yanına git ve F ile konuş."))

func _git_() -> void:
	if not wiz.shown: return
	for i in 46: oyun.parca(wiz_n.position + Vector2(randf_range(-4, 4), -6), Vector2.from_angle(randf() * TAU) * (10 + randf() * 46), 1.1 + randf() * 0.6, Color(["#b8b0a0", "#8a8478", "#d8d0c0", "#a070e0"][i % 4]))
	wiz.shown = false
	wiz.gone = true
	wiz_n.visible = false
	if not wiz.v2: wiz.gone_day = oyun.zaman.gun
	get_tree().create_timer(0.9).timeout.connect(func(): oyun.balon("Ne garip bir adam…", 3.6))

func f() -> bool:
	if not wiz.shown or oyun.oyuncu.position.distance_to(wiz_n.position) > 30.0: return false
	_konus()
	return true

func _konus() -> void:
	if wiz.plan and not (wiz.v2 and not wiz.sig):
		_soyle("Sinyali kullan, dünyalı; köpekler menüsünden bana yaz. Gemi geçerken indiririm." if wiz.sig else "Köpeğin sana alıştı mı, dünyalı? Hediye bir taneydi. Gemim beni bekliyor…", [{t = "Hoşça kal", pri = true, kapat = true}])
		return
	if wiz.v2 and not wiz.sig:
		_soyle("Yine ben, dünyalı. [i](köpeğine bakıp başını eğer)[/i] Hâlâ çalışıyor demek. İyi. Bizim orada makineler yorulmaz ama… yalnız kalınca bozulur.", [
			{t = "Bir köpek daha alabilir miyim?", pri = true, f = _sinyal},
			{t = "Neden geri geldin?", f = func(): _soyle("Gemimiz her gece adanın üstünden geçer. Bazen inerim. Bazen de… bir şey almaya.", [{t = "Ne almaya?", pri = true, f = func(): _soyle("Merak etme. Senin olanı değil. [i](gözlerini kaçırır)[/i] Artık değil.", [{t = "Bekle…", pri = true, f = _sinyal}])}])}])
		return
	if not wiz.met:
		_soyle("…Selam, dünyalı. [i](gözleri bir an bileğine kayar)[/i] Kıyıya vuran son kazazede sen misin? Hm. Yıldızların öbür yüzündeki bir gezegenden geliyorum; yolum bu adaya düştü. Sana gezegenimden bir [b]hediye[/b] getirdim.", [
			{t = "Ne hediyesi?", pri = true, f = _teklif},
			{t = "Sen de kimsin?", f = func(): _soyle("Adım yok. Bizim orada isimleri yıldızlar taşır, benimki çoktan söndü. Korkma, bu adada başına gelen en tuhaf şey ben değilim.", [{t = "Devam et", pri = true, f = _teklif}])}])
		return
	_soyle("Hâlâ buradayım, dünyalı. Hediye seni bekliyor.", [{t = "Hediyeyi göster", pri = true, f = _teklif}, {t = "Hoşça kal", kapat = true}])

func _teklif() -> void:
	wiz.met = true
	_soyle("Bir [b]robot köpek[/b]. Senin yerine dal, taş, lif, ot toplar; yorulmaz, şikâyet etmez. Hediye. Karşılığında bir şey istemem… şimdilik.", [{t = "Köpeği al", pri = true, f = _ver}, {t = "Sonra", kapat = true}])

func _ver() -> void:
	if wiz.plan: return
	wiz.plan = true
	_soyle("Al bakalım. [i](köpeğin tasmasındaki mor göze dokunur, göz bir an yanar)[/i] Biraz hırçındır ama sana alışır. Ona ne toplayacağını söyle.", [{t = "Teşekkürler", pri = true, f = func():
		_kopek_yap(Vector2.ZERO)
		get_tree().create_timer(0.7).timeout.connect(_git_)
		ac()
		env.mesaj("Önce köpeğine ne toplayacağını seç.")}])

func _sinyal() -> void:
	_soyle("Bir tane daha mı? Hm. Burada kalamam ama sana bunu bırakayım: [b]Mor sinyal[/b]. Köpekler menüsünden bana mesaj gönder; gemi geçerken köpeği [b]mor ışıkla[/b] indiririm. Ücreti… dünyalı Vio'su. Evet, onlar artık bizde bir işe yarıyor. En çok [b]%d[/b] köpek; fazlası gemiyi ağırlaştırır." % DOG_MAX, [
		{t = "Sinyali al", pri = true, f = func():
			wiz.sig = true
			env.mesaj("Mor sinyal · Köpek siparişi açıldı · köpekler menüsü (R)")
			get_tree().create_timer(0.6).timeout.connect(_git_)}])

# ------------------------------------------------------------------ köpekler
func fiyat() -> int:
	return int(round(500.0 * pow(1.6, kopekler.size()) / 10.0)) * 10

func _kopek_yap(p: Vector2):
	if kopekler.size() >= DOG_MAX:
		env.mesaj("En çok %d köpek olabilir." % DOG_MAX, true)
		return null
	var P: Vector2 = oyun.oyuncu.position
	var i := kopekler.size()
	var d := {ad = ADLAR[i % ADLAR.size()] + ((" %d" % (1 + i / ADLAR.size())) if i >= ADLAR.size() else ""), mat = "", p = (P + Vector2(10, 6)) if p == Vector2.ZERO else p,
		st = "wait", t = 0.0, dur = 0.0, hedef = null, bag = {}, face = 1, ph = randf() * 6.0, happy = 0.0}
	_dugum(d)
	kopekler.append(d)
	env.mesaj("%s · Robot köpeğin canlandı" % d.ad)
	for k in 20: oyun.parca(d.p, Vector2.from_angle(randf() * TAU) * (20 + randf() * 40), 1.0, Color("#7fe0ff") if k % 2 else Color("#c9a0ff"))
	return d

func _dugum(d: Dictionary) -> void:
	var n := Node2D.new()
	n.position = d.p
	n.draw.connect(_kopek_ciz.bind(n, d))
	oyun.nesneler.add_child(n)
	d.n = n

func _ismarla() -> void:
	var pr := fiyat()
	var bekleyen := 0
	for b in isinlar:
		if not b.done: bekleyen += 1
	if kopekler.size() + bekleyen >= DOG_MAX:
		env.mesaj("En çok %d köpek olabilir." % DOG_MAX, true)
		return
	if env.vio < pr:
		env.mesaj("%d Vio daha gerekli" % (pr - env.vio), true)
		return
	env.vio_ekle(-pr)
	mesajlar.append(["sen", "Bir köpek daha. %d Vio gönderdim." % pr])
	_yaz()
	get_tree().create_timer(0.9).timeout.connect(func():
		mesajlar.append(["o", ["Alındı. Gökyüzüne bak, dünyalı.", "Vio'lar geldi. Işığa yaklaşma.", "Tamam. Bu da hırçın, uyarayım."][randi() % 3]])
		if pen_kat.visible: _yaz()
		get_tree().create_timer(1.4).timeout.connect(func():
			kapat()
			var P: Vector2 = oyun.oyuncu.position
			var q := P + Vector2(30, 10)
			for k in 16:
				var a := k * 0.9
				var r := 26.0 + k * 3.0
				var c := P + Vector2(cos(a), sin(a)) * r
				if not oyun.engel(c) and oyun.tile_at(c) < 3:
					q = c
					break
			isinlar.append({p = q, t = 0.0, done = false})
			env.mesaj("Mor ışık · Köpeğin iniyor")))

func _torba(d: Dictionary) -> int:
	var k := 0
	for n in d.bag: k += int(d.bag[n])
	return k

func _getir(d: Dictionary) -> void:
	var L := []
	var i := 0
	for n in d.bag:
		if int(d.bag[n]) <= 0: continue
		env.ekle(n, int(d.bag[n]))
		oyun.yazi(d.p + Vector2(0, -14 - i * 7), "+%d %s" % [int(d.bag[n]), n], Color("#7fe0ff"), 6)
		L.append("+%d %s" % [int(d.bag[n]), n])
		i += 1
	d.bag = {}
	if not L.is_empty():
		env.mesaj("%s getirdi: %s" % [d.ad, ", ".join(L)])
		if pen_kat.visible: _yaz()

func _hedef_birak(d: Dictionary) -> void:
	if d.hedef != null and is_instance_valid(d.hedef): d.hedef.remove_meta("kopek")
	d.hedef = null

func _sec(d: Dictionary, m: String) -> void:
	_hedef_birak(d)
	d.mat = m
	d.st = "idle"
	if wiz.shown and wiz.plan and not wiz.v2:
		get_tree().create_timer(0.7).timeout.connect(func():
			kapat()
			get_tree().create_timer(0.35).timeout.connect(_git_))
	if pen_kat.visible: _yaz()

func _cagir_kopek(d: Dictionary) -> void:
	_hedef_birak(d)
	d.st = "called"
	env.mesaj("%s koşarak geliyor!" % d.ad)
	if pen_kat.visible: _yaz()

func _gonder(d: Dictionary) -> void:
	d.st = "idle" if d.mat != "" else "wait"
	_hedef_birak(d)
	if pen_kat.visible: _yaz()

func _sev(d: Dictionary) -> void:
	d.happy = 2.2
	for i in 8: oyun.parca(d.p + Vector2(randf_range(-5, 5), -10), Vector2(randf_range(-10, 10), -20 - randf() * 25), 1.1, Color("#ff7aa8") if i % 2 else Color("#ffb0c8"))
	oyun.yazi(d.p + Vector2(0, -16), "♥", Color("#ff7aa8"), 8)

func _git_yon(d: Dictionary, hedef: Vector2, v: float) -> void:
	var k: float = d.p.distance_to(hedef)
	if k > 1.0:
		d.face = 1 if hedef.x >= d.p.x else -1
		d.p += (hedef - d.p) / k * minf(v, k)

func _kopek_tik(dt: float) -> void:
	var P: Vector2 = oyun.oyuncu.position
	for d in kopekler:
		if d.happy > 0.0: d.happy -= dt
		match d.st:
			"home":
				_git_yon(d, P + Vector2(14, 8), HIZ * 2.2 * dt)
				if P.distance_to(d.p) < 22.0:
					_getir(d)
					d.st = "idle" if d.mat != "" else "wait"
			"wait", "called", "play":
				d.ph += dt * (2.4 if d.st == "play" else 1.0)
				var h: Vector2 = (P + Vector2(cos(d.ph) * 16, 6 + sin(d.ph) * 7)) if d.st == "play" else P + Vector2(14, 8)
				_git_yon(d, h, HIZ * (2.2 if d.st == "called" else 1.6) * dt)
				if d.st == "called" and P.distance_to(d.p) < 22.0:
					d.st = "play"
					_getir(d)
				if d.st == "play" and randf() < dt * 0.6: d.face *= -1
			"idle":
				var en = null
				var bd := 1e9
				for n in oyun.dugumler:
					if not n.canli or n.ad != d.mat or n.get_meta("gece", false): continue
					var c = n.get_meta("kopek") if n.has_meta("kopek") else null
					if c != null and c != d: continue
					var k: float = n.position.distance_to(d.p)
					if k < bd:
						bd = k
						en = n
				if en != null:
					d.hedef = en
					en.set_meta("kopek", d)
					d.st = "walk"
				elif P.distance_to(d.p) > 40.0:
					_git_yon(d, P, HIZ * dt)
			"walk":
				var n = d.hedef
				if n == null or not is_instance_valid(n) or not n.canli:
					_hedef_birak(d); d.st = "idle"
					continue
				if n.position.distance_to(d.p) < 6.0:
					d.st = "gather"; d.t = 0.0
					d.dur = float(oyun.toplama_veri.nodes.get(d.mat, {}).get("time", 1)) * IS_KAT
				else:
					_git_yon(d, n.position, HIZ * dt)
			"gather":
				var n = d.hedef
				if n == null or not is_instance_valid(n) or not n.canli:
					_hedef_birak(d); d.st = "idle"
					continue
				d.t += dt
				if d.t >= d.dur:
					var A: Dictionary = oyun.toplama_veri.nodes.get(n.ad, {})
					if A.get("bush", false):
						n.kalan -= 1
						if n.kalan <= 0: n.oldur(float(A.get("respawn", 30)))
					else:
						n.oldur(float(A.get("respawn", 30)))
					if n.has_meta("kopek"): n.remove_meta("kopek")
					d.bag[n.ad] = int(d.bag.get(n.ad, 0)) + 1
					oyun.yazi(d.p + Vector2(0, -14), "%d/%d" % [_torba(d), KAP], Color("#7fe0ff"), 6)
					d.hedef = null
					if _torba(d) >= KAP:
						d.st = "home"
						env.mesaj("Sırtı doldu: %s topladıklarını sana getiriyor" % d.ad)
					else:
						d.st = "idle"
					if pen_kat.visible: _yaz()
		if d.n != null:
			d.n.position = d.p
			d.n.queue_redraw()

# ------------------------------------------------------------------ köpekler menüsü (R)
func acik() -> bool:
	return pen_kat.visible

func ac() -> void:
	pen_kat.visible = true
	_yaz()
	pen.position = pen.get_viewport_rect().size / 2.0 - Vector2(300, 240)

func kapat() -> void:
	pen_kat.visible = false

func _etiket(s: String, boy := 13, c := Color("#f3ecd8")) -> Label:
	var l := Label.new()
	l.text = s
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size = Vector2(560, 0)
	l.add_theme_font_size_override("font_size", boy)
	l.add_theme_color_override("font_color", c)
	return l

func _durum(d: Dictionary) -> String:
	match d.st:
		"wait": return "Emir bekliyor"
		"idle": return "%s arıyor" % d.mat
		"walk": return "%s'e gidiyor" % d.mat
		"gather": return "%s topluyor" % d.mat
		"home": return "Sırtı doldu, sana geliyor"
		"called": return "Sana koşuyor"
		"play": return "Yanında oynuyor"
	return ""

func _yaz() -> void:
	for c in pen_v.get_children(): c.queue_free()
	var bas := HBoxContainer.new()
	var hl := _etiket("Robot köpekler · %d/%d" % [kopekler.size(), DOG_MAX], 17)
	hl.custom_minimum_size = Vector2(470, 0)
	bas.add_child(hl)
	var bx := Button.new(); bx.text = "Kapat"; bx.pressed.connect(kapat); bas.add_child(bx)
	pen_v.add_child(bas)
	pen_v.add_child(_etiket("Köpekler senin seçtiğin malzemeyi kendi başına toplar; sırtlarında en çok %d eşya taşırlar. Sırtı dolan köpek sana gelip topladığını teslim eder; dolmadan Yanıma çağır dersen o ana kadar topladığını getirir. Senin ilk günkü hızının yarısıyla çalışırlar; yeteneklerinden ve seviyenden etkilenmezler. Bir köpeği yanına çağırıp sevebilirsin." % KAP, 11, Color("#b8b098")))
	var mats := _malzemeler()
	for d in kopekler:
		var kutu := VBoxContainer.new()
		var bag := []
		for n in d.bag:
			if int(d.bag[n]) > 0: bag.append("%d %s" % [int(d.bag[n]), n])
		kutu.add_child(_etiket("%s · %s · taşıdığı: %d/%d%s" % [d.ad, _durum(d), _torba(d), KAP, (" · " + ", ".join(bag)) if not bag.is_empty() else ""], 13, Color("#7fe0ff")))
		var h := HBoxContainer.new()
		var ob := OptionButton.new()
		ob.add_item("Ne toplasın?")
		for m in mats: ob.add_item(m)
		ob.selected = mats.find(d.mat) + 1 if d.mat != "" else 0
		ob.item_selected.connect(func(i): if i > 0: _sec(d, mats[i - 1]))
		h.add_child(ob)
		var b1 := Button.new(); b1.text = "Yanıma çağır"; b1.pressed.connect(_cagir_kopek.bind(d)); h.add_child(b1)
		var b2 := Button.new(); b2.text = "İşe gönder"; b2.pressed.connect(_gonder.bind(d)); b2.disabled = d.mat == ""; h.add_child(b2)
		var b3 := Button.new(); b3.text = "Sev ♥"; b3.pressed.connect(_sev.bind(d)); b3.disabled = d.p.distance_to(oyun.oyuncu.position) > 40.0; h.add_child(b3)
		kutu.add_child(h)
		pen_v.add_child(kutu)
	if wiz.sig:
		pen_v.add_child(_etiket("Mor sinyal · Yıldızsız Gezgin", 14, Color("#c9a0ff")))
		var son: Array = mesajlar.slice(maxi(0, mesajlar.size() - 6))
		if son.is_empty(): pen_v.add_child(_etiket("Bir köpek daha istersen yaz, dünyalı.", 12, Color("#c9a0ff")))
		for m in son: pen_v.add_child(_etiket(("Sen: " if m[0] == "sen" else "O: ") + str(m[1]), 12, Color("#f3ecd8") if m[0] == "sen" else Color("#c9a0ff")))
		var hb := HBoxContainer.new()
		hb.add_child(_etiket("En çok %d köpek: gemi daha fazlasını taşımaz." % DOG_MAX if kopekler.size() >= DOG_MAX else "Bir köpek daha iste · %d/%d" % [kopekler.size(), DOG_MAX], 12))
		var bb := Button.new(); bb.text = "Gönder · %d Vio" % fiyat(); bb.disabled = kopekler.size() >= DOG_MAX; bb.pressed.connect(_ismarla)
		hb.get_child(0).custom_minimum_size = Vector2(380, 0)
		hb.add_child(bb)
		pen_v.add_child(hb)

## köpeğin toplayabildikleri: elle yerden toplanan her şey (kazma isteyen madenler ve mağaradakiler hariç); yalnız daha önce eline geçenler (Dal hep)
func _malzemeler() -> Array:
	var L: Array = MATS.duplicate()
	for n in oyun.toplama_veri.nodes:
		var A: Dictionary = oyun.toplama_veri.nodes[n]
		if not A.get("mine", false) and not L.has(n) and n != "Gece sefası" and n != "Mor kıymık": L.append(n)
	var out := []
	for m in L:
		if m == "Dal" or env.gorulen.has(m): out.append(m)
	return out

# ------------------------------------------------------------------ her an
func _process(dt: float) -> void:
	t += dt
	if oyun.basta: return
	if Input.is_action_just_pressed("kopek") and not oyun.oyuncu.kilit:
		if pen_kat.visible: kapat()
		elif not oyun.pencere_acik() and not kopekler.is_empty(): ac()
	if pen_kat.visible and Input.is_action_just_pressed("ui_cancel"): kapat()
	var z = oyun.zaman
	if not wiz.shown and not oyun.pencere_acik() and not (oyun.magara != null and oyun.magara.icinde):
		if not wiz.gone and not wiz.met and z.gun >= GUN1:
			_cagir()
		elif wiz.gone and not wiz.sig and not wiz.v2 and z.gun >= maxi(GUN2, int(wiz.gone_day) + 1):
			wiz.v2 = true
			wiz.gone = false
			_cagir()
	if wiz.shown: wiz_n.queue_redraw()
	if z.durdu(): return
	_kopek_tik(dt)
	for b in isinlar.duplicate():
		b.t += dt
		if b.t > 1.6 and not b.done:
			b.done = true
			_kopek_yap(b.p)
			ac()
			env.mesaj("Yeni köpeğine ne toplayacağını seç.")
		if b.t > 3.2: isinlar.erase(b)
	if not isinlar.is_empty() or isin_n.visible: isin_n.queue_redraw()

# ------------------------------------------------------------------ çizim
func _r(n: CanvasItem, x: float, y: float, w: float, h: float, c) -> void:
	n.draw_rect(Rect2(roundf(x), roundf(y), w, h), Color(c))

func _kopek_ciz(n: Node2D, d: Dictionary) -> void:
	var step := roundf(sin(t * 16)) if d.st == "walk" else 0.0
	var wag := roundf(sin(t * (14.0 if d.st == "walk" else 6.0)) * 1.5)
	var fy: int = d.face
	_r(n, -6, 3, 12, 2, Color(0, 0, 0, 0.25))
	_r(n, -5, -4, 10, 6, "#9aa7b4"); _r(n, -5, -4, 10, 1, "#c4cfda")
	_r(n, 3 if fy > 0 else -8, -9, 5, 5, "#b7c3cf"); _r(n, 5 if fy > 0 else -7, -8, 2, 2, "#7fe0ff" if int(t * 2 + d.p.x) % 7 else "#b7c3cf")
	_r(n, 4 if fy > 0 else -5, -12, 1, 3, "#5a6470"); _r(n, 4 if fy > 0 else -5, -13, 1, 1, "#e8502a" if int(t * 3) % 2 else "#ff9a7a")
	_r(n, -7 if fy > 0 else 6, -5 + wag, 2, 2, "#5a6470")
	_r(n, -4, 2, 2, 2 + step, "#5a6470"); _r(n, 2, 2, 2, 2 - step, "#5a6470")
	_r(n, -2, -2, 4, 1, "#f2b84b")
	if d.st == "gather":
		var k: float = minf(1.0, d.t / maxf(0.01, d.dur))
		_r(n, -6, -16, 12, 2, "#11170f"); _r(n, -6, -16, roundf(12 * k), 2, "#7fe0ff")

func _wiz_ciz() -> void:
	var n := wiz_n
	var fl := roundf(sin(t * 2) * 2)
	var r := 14.0 + sin(t * 3) * 2.0
	n.draw_circle(Vector2(0, -4), r + 6, Color(0.35, 0.16, 0.63, 0.18))
	n.draw_circle(Vector2(0, -4), r, Color(0.55, 0.31, 0.86, 0.18))
	for i in 5:
		var a := t * 1.6 + i * 1.26
		_r(n, cos(a) * 16, -6 + sin(a) * 6, 1, 1, "#f2e46b" if i % 2 else "#c9a0ff")
	_r(n, -6, 5, 12, 2, Color(0, 0, 0, 0.3))
	var y := fl
	_r(n, -6, y - 6, 12, 11, "#3a1e6a"); _r(n, -7, y + 2, 14, 3, "#2a1450"); _r(n, -1, y - 6, 2, 11, "#a070e0")
	_r(n, -4, y - 12, 8, 6, "#140a26"); _r(n, -3, y - 10, 2, 1, "#c9a0ff"); _r(n, 1, y - 10, 2, 1, "#c9a0ff")
	_r(n, -6, y - 14, 12, 2, "#2a1450"); _r(n, -4, y - 17, 8, 3, "#2a1450"); _r(n, -2, y - 20, 4, 3, "#2a1450"); _r(n, 0, y - 22, 2, 2, "#2a1450")
	_r(n, -3, y - 16, 1, 1, "#f2e46b"); _r(n, 2, y - 18, 1, 1, "#f2e46b")
	_r(n, 7, y - 14, 1, 19, "#5a3d22"); _r(n, 6, y - 17, 3, 3, "#c9a0ff"); _r(n, 7, y - 16, 1, 1, "#ffffff")
	if not wiz.met:
		var b := roundf(sin(t * 5) * 2)
		_r(n, -3, y - 34 + b, 6, 9, "#140a26"); _r(n, -1, y - 33 + b, 2, 5, "#c9a0ff"); _r(n, -1, y - 27 + b, 2, 1, "#c9a0ff")

func _isin_ciz() -> void:
	for b in isinlar:
		var e: float = b.t
		var a := (e / 0.4) if e < 0.4 else (maxf(0.0, (3.2 - e) / 0.8) if e > 2.4 else 1.0)
		var w := 10.0 + sin(e * 14) * 2
		var p: Vector2 = b.p
		isin_n.draw_rect(Rect2(p.x - w / 2, p.y - 400, w, 400), Color(0.69, 0.44, 1.0, 0.55 * a))
		isin_n.draw_rect(Rect2(p.x - 2, p.y - 400, 4, 400), Color(0.91, 0.82, 1.0, 0.9 * a))
		isin_n.draw_set_transform(p, 0.0, Vector2(16, 5))
		isin_n.draw_circle(Vector2.ZERO, 1.0, Color(0.79, 0.63, 1.0, 0.4 * a))
		isin_n.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	var D := []
	for d in kopekler: D.append({ad = d.ad, mat = d.mat, x = d.p.x, y = d.p.y, bag = d.bag})
	return {wiz = {shown = wiz.shown, met = wiz.met, plan = wiz.plan, gone = wiz.gone, gone_day = wiz.gone_day, v2 = wiz.v2, sig = wiz.sig, x = wiz.x, y = wiz.y}, kopek = D, mesaj = mesajlar}

func yukle(v: Dictionary) -> void:
	var w: Dictionary = v.get("wiz", {})
	for k in wiz: if w.has(k): wiz[k] = w[k]
	wiz.gone_day = int(wiz.gone_day)
	wiz_n.position = Vector2(float(wiz.x), float(wiz.y))
	wiz_n.visible = wiz.shown
	for d in kopekler:
		if d.n != null: d.n.queue_free()
	kopekler = []
	for a in v.get("kopek", []):
		var d := {ad = str(a.ad), mat = str(a.mat), p = Vector2(float(a.x), float(a.y)), st = "idle" if str(a.mat) != "" else "wait", t = 0.0, dur = 0.0, hedef = null, bag = {}, face = 1, ph = randf() * 6.0, happy = 0.0}
		var b: Dictionary = a.get("bag", {})
		for k in b: d.bag[k] = int(b[k])
		_dugum(d)
		kopekler.append(d)
	mesajlar = v.get("mesaj", [])
