## Kuzenler (web v184 meet, cousinTalk, talkC, reveal) ve pazarcı kuzenler (web v2.71 talkM). Usta Sinan'ın sözü de burada.
extends Node

var oyun
var tanis := {}       # g → true (web o.met)
const BKI := ["Çayır'daki", "Orman'daki", "Bataklık'taki", "Kayalık Dağ'daki", "Kül Diyarı'ndaki", "Mor Kristal Vadisi'ndeki"]
const TABAN := {"w": {short = "Zümrüt", q = "Zümrüt mü", ile = "Zümrüt'le"}, "s": {short = "Dursun", q = "Dursun mu", ile = "Dursun'la"}, "a": {short = "Durmuş", q = "Durmuş mu", ile = "Durmuş'la"}}
const PAZAR_SOZ := ["Nazlı ne alıyorsa ben de alırım, ne satıyorsa ben de satarım. Fiyatlar da aynı; ninemiz öyle öğretti.", "Kuzenim Nazlı iyidir ama tezgâhı hep dağınıktır. Benimkine bak!", "Bu yemeniyi ninem ördü. Nazlı'nınki mor, benimki başka; bizi böyle ayırırlar.", "Alacak bir şeyin, satacak bir şeyin var mı?"]

func kur(o) -> void:
	oyun = o

## web isMet: kuzenler ve Sinan önce tanışılır, görev sonraki konuşmada verilir
func tanisildi(g: String) -> bool:
	if g == "k_tuncay": return true
	if g.begins_with("k_") or g == "usta" or g == "toygar" or g == "denizci" or g == "k_ekin" or g in ["gok", "pervin", "tamer", "selin", "alara", "tuna"]: return tanis.has(g)
	if g == "trader": return oyun.poyraz.met
	return true

func _soyle(n, metin: String, secs: Array) -> void:
	oyun.konusma.ac(n.K.ad, load(n.K.portre) if n.K.get("portre", null) != null else null, metin, secs)

## kuzen ya da pazarcı kuzen ya da Sinan ise konuşmayı burada yürütür
func konus(n, ac_kazan := false) -> bool:
	var K: Dictionary = n.K
	if not K.has("rol"): return false
	if oyun.ogr.acik():
		_soyle(n, "Önce adanın insanlarıyla tanış evlat; sonra gel." if K.rol != "m" else "Önce adanın insanlarıyla tanış; sonra uğra, tezgâhım burada.", [{t = "Tamam", pri = true, kapat = true}])
		return true
	match K.rol:
		"m": _pazarci(n)
		"u": oyun.sinan.konus()
		"d": oyun.evcil.davut_konus(n)
		"t": _dogan(n)
		"dz": _barbaros(n)
		"ek": oyun.ciftlik.ekin_konus(n)
		"pz": oyun.poyraz.konus(n)
		"hl": oyun.halat.konus(n)
		"gk": oyun.act2.yildiz(n)
		"pv": oyun.act2.efsun(n)
		"sl": oyun.act2.tufan(n)
		"mk": oyun.act2.isin(n)
		"ej": oyun.act2.tomris(n)
		"as": oyun.act2.gokay(n)
		_: _kuzen(n, ac_kazan)
	return true

func _pazarci(n) -> void:
	var C: Dictionary = n.K.kuzen
	if not tanis.has(n.K.k):
		_soyle(n, "[i](tezgâhın arkasında; yüzü, saçı, gülüşü… tıpatıp Nazlı. Yalnızca başındaki yemeni [b]%s[/b].)[/i] Hoş geldin! Ben [b]%s[/b], Nazlı'nın kuzeniyim. Nazlı ne alıyorsa ben de alırım, ne satıyorsa ben de satarım; fiyatlar da aynı." % [C.cn, C.short],
			[{t = "Pazarı aç", pri = true, f = _pazar_ac.bind(n)}, {t = "Hoşça kal", f = _tanisti.bind(n.K.k)}])
		return
	_soyle(n, PAZAR_SOZ[randi() % PAZAR_SOZ.size()], [{t = "Pazarı aç", pri = true, f = _pazar_ac.bind(n)}, {t = "Hoşça kal", kapat = true}])

func _tanisti(g: String) -> void:
	tanis[g] = true

func _pazar_ac(n) -> void:
	tanis[n.K.k] = true
	oyun.pazar.ac("sat", n.K.ad)

## web prevOf: aynı işin bir önceki biyomdaki, tanıştığın kişisi (yoksa Çayır'daki)
func _onceki(K: Dictionary) -> Array:
	var b: int = int(K.kuzen.b)
	for bb in range(b - 1, 0, -1):
		for m in oyun.kisiler:
			var k2: Dictionary = m.K
			if k2.get("rol", "") == K.rol and k2.has("kuzen") and int(k2.kuzen.get("b", 0)) == bb and tanis.has(k2.k):
				return [bb, k2.kuzen]
	return [0, TABAN[K.rol]]

func _kuzen(n, ac_kazan: bool) -> void:
	var K: Dictionary = n.K
	if not tanis.has(K.k):
		_tanis(n)
		return
	var C: Dictionary = K.kuzen
	var about := {t = str(C.about[0]), f = _hakkinda.bind(n)}
	var soz: String = C.lines[randi() % C.lines.size()]
	match K.rol:
		"w":
			if ac_kazan:
				oyun.istasyon.ac("kazan", str(C.short))
				return
			_soyle(n, soz, [{t = "Tarif öğren", pri = true, f = func(): oyun.istasyon.ac("kazan", str(C.short))}, about, {t = "Kuzen misiniz?", f = _kuzenlik.bind(n)}, {t = "Hoşça kal", kapat = true}])
		"s":
			var ss := [{t = "Silah dök", pri = true, f = func(): oyun.istasyon.ac(K.k)}]
			var bl: Dictionary = oyun.bileme()
			if not bl.is_empty(): ss.append({t = "Aletimi bile (%d Vio)" % int(bl.ucret), f = func(): oyun.bile(K, load(K.portre) if K.get("portre", null) != null else null)})
			ss.append(about); ss.append({t = "Hoşça kal", kapat = true})
			_soyle(n, soz, ss)
		"a":
			_soyle(n, soz, [{t = "Zırh döv", pri = true, f = func(): oyun.istasyon.ac(K.k)}, about, {t = "Hoşça kal", kapat = true}])

# ------------------------------------------------------------------ Denizci Barbaros (web v75: talkDz, drawWreck; belge ACT 1 › Denizci Barbaros)
## Gemi tarifini öğrenince (Kemal'in E4 ödülü) gemisi Mor Kristal Vadisi'nin kıyısına çarpar; o zamana dek ne kendisi ne enkazı görünür.
var dz_t := 0

func dz_burada() -> bool:
	return oyun.el_yapimi.bilinen.has("Gemi")

func _barbaros(n) -> void:
	if oyun.ada == 2:
		_soyle(n, "Ben burada, gemimin başında beklerim. Yukarıdaki kayalarda, teleskobu olan yaşlı bir kadın var: [b]Yıldız[/b]. Mor ışığı benden de iyi bilir. Bir de… kızımı unutmadım; bu adada da soracağım.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])
		return
	if not tanis.has("denizci"):
		tanis["denizci"] = true
		_soyle(n, "[i](enkazın yanında, ıslak, yorgun bir adam)[/i] Kara… Toprak mı bu? Ah, başım. Ben [b]Barbaros[/b], denizciyim. Altı yıldır ada ada dolaşıp birini arıyorum. Dün gece gökten mor bir ışık indi, deniz kaynadı; gemim kayalara bindi. Kim olursan ol, yardım edersen sana borçlu kalırım.",
			[{t = "Kimi arıyorsun?", f = func(): _soyle(n, "Kızımı. [b]Meltem[/b]. Mor ışık onu altı yıl önce güverteden aldı. Seni de bir şey buraya getirmiş, gözlerinden belli.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])}, {t = "Hoşça kal", kapat = true}])
		return
	if oyun.gorev.bitti("L5"):
		if not oyun.hikaye.gordu.get("denizci", false):
			oyun.hikaye.ilk("denizci", _teklif.bind(n))
			return
		if act2:
			_soyle(n, "Gemi hazır, rüzgâr bizden yana. Bir daha açılmak istersen söyle.", [{t = "Açılalım", pri = true, f = func(): yolculuk(true)}, {t = "Hoşça kal", kapat = true}])
			return
		_teklif(n)
		return
	dz_t += 1
	var L := ["Rüzgâr dönüyor; denizci bunu kokusundan bilir.", "Enkazdan kurtardığım tek şey bu fener. Meltem'in feneri.", "Bu kıyı tuhaf: kumu kristal, gecesi mor."]
	_soyle(n, L[randi() % 3], [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])

# ------------------------------------------------------------------ ACT 1'in sonu: yeni gemi ve deniz yolculuğu (web v75 shipAct, offerVoyage, voyage)
var gemi: bool:
	get: return tanis.has("gemi")
var act2: bool:
	get: return tanis.has("act2")
var yol: CanvasLayer
var yol_r: TextureRect
var yol_y: Label
var yol_t := -1.0
var yol_tekrar := false
var yol_V: Dictionary
var yol_kart: Control

func _teklif(n) -> void:
	_soyle(n, "[i](yeni geminin dümenine dokunur)[/i] Meltem'i aramaya devam edeceğim. Mor ışığın izi bu adada bitmiyor; denizin ötesine, başka adalara uzanıyor. %s de o ışığın peşinde bir yerde. İstersen seni başka bir adaya götürebilirim. Ama bil: dönüşü kolay olmaz." % ("[b]%s[/b]" % oyun.ad_sevgili if oyun.ad_sevgili != "" else "Eşin"),
		[{t = "Götür beni", pri = true, f = func(): oyun.ani.teklif_once(func(): yolculuk(false))}, {t = "Henüz değil, hazırlanayım", kapat = true}])

func _gemi_var() -> bool:
	for x in oyun.el_yapimi.R["Gemi"].i:
		if oyun.env.adet(str(x[0])) < int(x[1]): return false
	return true

## enkazın başında F: L5 açıkken gemi malzemeleri enkaza konur (web shipAct)
func enkaz_f() -> bool:
	if oyun.enkaz == null or not oyun.enkaz.visible or gemi: return false
	if oyun.oyuncu.position.distance_to(oyun.enkaz.position) > 40.0: return false
	var G = oyun.gorev
	if G.aktif == null or G.aktif.id != "L5":
		if _gemi_var() and not tanis.has("gemi_dedi"):
			tanis["gemi_dedi"] = true
			oyun.balon("Bu enkazı ben mi onarsam? Önce Barbaros'a sormalıyım.", 3.0)
			return true
		return false
	if not _gemi_var():
		var L := []
		for x in oyun.el_yapimi.R["Gemi"].i: L.append("%d/%d %s" % [mini(oyun.env.adet(str(x[0])), int(x[1])), int(x[1]), x[0]])
		oyun.env.mesaj("Gemi için: " + " · ".join(L), true)
		return true
	oyun.konusma.onay("[b]Barbaros'un enkazı[/b]\n8 kalas, 4 halat, 3 demir levha, 6 hasır ve 2 kristal ipek enkaza konacak. Gemi kurulsun mu?", func():
		for x in oyun.el_yapimi.R["Gemi"].i: oyun.env.eksilt(str(x[0]), int(x[1]))
		tanis["gemi"] = true
		for i in 30: oyun.parca(oyun.enkaz.position + Vector2(randf_range(-30, 30), 0), Vector2(randf_range(-25, 25), -30 - randf() * 50), 0.9, Color("#c89458") if i % 2 else Color("#ffe29b"))
		oyun.balon("İşte ACT 1'in sonu… ya da başlangıcı.", 3.6), "Kur")
	return true

func yolculuk(tekrar: bool) -> void:
	if yol_t >= 0.0: return
	yol_V = oyun._json("res://data/yolculuk.json")
	if yol == null:
		yol = CanvasLayer.new(); yol.layer = 9; yol.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(yol)
		var a := ColorRect.new(); a.color = Color.BLACK; a.set_anchors_preset(Control.PRESET_FULL_RECT); yol.add_child(a)
		yol_r = TextureRect.new(); yol_r.set_anchors_preset(Control.PRESET_FULL_RECT); yol_r.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		yol_r.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; yol_r.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		yol.add_child(yol_r)
		yol_y = Label.new(); yol_y.set_anchors_preset(Control.PRESET_CENTER_BOTTOM); yol_y.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		yol_y.custom_minimum_size = Vector2(680, 0); yol_y.position = Vector2(-340, -90); yol_y.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		yol_y.add_theme_font_size_override("font_size", 20); yol_y.add_theme_color_override("font_color", Color("#f3ecd8"))
		yol_y.add_theme_color_override("font_outline_color", Color.BLACK); yol_y.add_theme_constant_override("outline_size", 4)
		yol.add_child(yol_y)
		var b := Button.new(); b.text = "Geç ›"; b.set_anchors_preset(Control.PRESET_TOP_RIGHT); b.position = Vector2(-80, 14); b.pressed.connect(_yol_gec)
		yol.add_child(b)
		yol_kart = VBoxContainer.new(); yol_kart.set_anchors_preset(Control.PRESET_CENTER); yol_kart.position = Vector2(-200, -60); yol_kart.custom_minimum_size = Vector2(400, 0)
		var k1 := Label.new(); k1.text = "ACT 2"; k1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; k1.add_theme_font_size_override("font_size", 18); k1.add_theme_color_override("font_color", Color("#b9aed6"))
		var k2 := Label.new(); k2.text = "Açık deniz"; k2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; k2.add_theme_font_size_override("font_size", 40); k2.add_theme_color_override("font_color", Color("#efe6ff"))
		yol_kart.add_child(k1); yol_kart.add_child(k2)
		yol.add_child(yol_kart)
	yol_tekrar = tekrar
	yol_t = 0.0
	yol_kart.visible = false
	yol_r.visible = true
	yol_y.text = ""
	yol.visible = true
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true

func _yol_gec() -> void:
	if yol_t >= 0.0 and yol_t < float(yol_V.sure): yol_t = float(yol_V.sure)

func _unhandled_input(e: InputEvent) -> void:
	if yol_t < 0.0 or not (e is InputEventKey) or not e.pressed or e.echo: return
	if e.keycode in [KEY_ESCAPE, KEY_ENTER, KEY_SPACE]:
		get_viewport().set_input_as_handled()
		_yol_gec()

func _yol_tik(dt: float) -> void:
	yol_t += dt
	var S := float(yol_V.sure)
	if yol_t < S:
		var k := mini(int(yol_V.kare) - 1, int(yol_t * float(yol_V.fps)))
		yol_r.texture = load("res://art/yolculuk/k_%d.png" % k)
		var y := ""
		for c in yol_V.yazilar:
			if yol_t >= float(c[0]): y = str(c[1])
		if yol_t >= float(yol_V.yazi_bitis): y = ""
		yol_y.text = y
		return
	# ACT 2 kartı (web __plAct(2, 'Açık deniz')), sonra dünya
	yol_r.visible = false
	yol_y.text = ""
	yol_kart.visible = true
	if yol_t >= S + 3.2:
		yol_t = -1.0
		yol.visible = false
		process_mode = Node.PROCESS_MODE_INHERIT
		get_tree().paused = false
		if not yol_tekrar:
			tanis["act2"] = true
			if oyun.ada == 1: oyun.seyahat(2, "land")

func _dz_tik() -> void:
	if oyun.enkaz != null:
		oyun.enkaz.visible = dz_burada()
		if gemi and oyun.enkaz.has_meta("tekne"): oyun.enkaz.position = oyun.enkaz.get_meta("tekne")
		if (gemi or oyun.ada == 2) and oyun.enkaz.visible and oyun.enkaz.position.distance_to(oyun.oyuncu.position) < 700.0: oyun.enkaz.queue_redraw()
	if dz_burada() and not tanis.has("dz_geldi"):
		tanis["dz_geldi"] = true
		oyun.env.mesaj("Denizci Barbaros: Mor Kristal Vadisi'nin kıyısına bir gemi çarptı")

## web drawWreck: kıyıdaki enkaz (gövde, kırık direk, yırtık yelken, etrafta tahtalar); gemi kurulunca yeni gemi (web drawBoat)
func enkaz_ciz(o: Node2D) -> void:
	var r := func(x: float, y: float, w: float, h: float, c: String) -> void: o.draw_rect(Rect2(x, y, w, h), Color(c))
	if gemi or oyun.ada == 2:
		var b := roundf(sin(Time.get_ticks_msec() / 1000.0 * 1.6) * 1.5)
		o.draw_rect(Rect2(-30, 4 + b, 60, 4), Color(0.04, 0.12, 0.2, 0.35))
		r.call(-28, -7 + b, 56, 11, "#7a4a28"); r.call(-26, 4 + b, 50, 3, "#4a2e18"); r.call(-28, -8 + b, 56, 2, "#a8743a")
		for i in range(-20, 21, 10): r.call(i, -4 + b, 3, 3, "#2a1a10")
		r.call(-1, -50 + b, 3, 44, "#4a3018"); r.call(2, -46 + b, 20, 34, "#f0e8d8"); r.call(-18, -40 + b, 16, 28, "#e0d8c8"); r.call(0, -54 + b, 8, 4, "#c84a3a")
		return
	o.draw_set_transform(Vector2.ZERO, -0.18)
	o.draw_circle(Vector2(0, 6), 1.0, Color(0, 0, 0, 0))
	o.draw_set_transform(Vector2(0, 6), -0.18, Vector2(32, 5))
	o.draw_circle(Vector2.ZERO, 1.0, Color(0.08, 0.16, 0.27, 0.3))
	o.draw_set_transform(Vector2.ZERO, -0.18)
	r.call(-26, -6, 40, 6, "#5a3a20"); r.call(-22, 0, 32, 3, "#3a2414"); r.call(-26, -6, 40, 1, "#7a5430"); r.call(14, -4, 8, 4, "#4a2e18"); r.call(-4, -6, 6, 6, "#2a1a10")
	r.call(-8, -30, 2, 24, "#4a3018"); r.call(-7, -30, 10, 2, "#4a3018"); r.call(-6, -28, 8, 10, "#d8ccb0"); r.call(-2, -20, 6, 6, "#c8bca0")
	o.draw_set_transform(Vector2.ZERO, 0.0)
	r.call(24, 6, 8, 2, "#6a4426"); r.call(-34, 8, 6, 2, "#6a4426"); r.call(30, -2, 2, 6, "#5a3a20")

func _process(_dt: float) -> void:
	if yol_t >= 0.0:
		_yol_tik(_dt)
		return
	if oyun != null and oyun.el_yapimi != null: _dz_tik()

# ------------------------------------------------------------------ Avcı Doğan (web talkToygar, toygarStory, dogTeach)
var dogan_t := 0

func _dogan_ogret() -> int:
	var k := 0
	for r in ["Kamış çizme", "Panzehir"]:
		if not oyun.el_yapimi.bilinen.has(r):
			oyun.el_yapimi.bilinen[r] = true
			k += 1
	return k

func _dogan(n) -> void:
	if tanis.has("toygar") and _dogan_ogret() > 0: oyun.env.mesaj("Doğan'ın tarifleri kitabında: Kamış çizme, Panzehir")
	if not tanis.has("toygar"):
		tanis["toygar"] = true
		_dogan_ogret()
		_soyle(n, "Dur! Çamura basma, yutar seni… Hah. Köprüyü onaran sen misin? Ben [b]Doğan[/b], bu bataklıkta avlanırım. Kamıştan bir [b]çizme[/b] ör; çamur seni yavaşlatmaz. Kurbağaların zehrine karşı da [b]panzehir[/b] tarifini kitabına yazdım.",
			[{t = "Burada tek başına mı yaşıyorsun?", pri = true, f = _dogan_hikaye.bind(n)}, {t = "Sonra konuşuruz", kapat = true}])
		return
	dogan_t += 1
	var L := ["Bataklıkta acele eden batar.", "Timsahı önden değil yandan vur. Kuyruğu da ısırır, haberin olsun.", "Gece kurbağalar susarsa bil ki yukarıda mor ışık dolaşıyor."]
	_soyle(n, L[dogan_t % 3], [{t = "Mor ışık ne?", f = _dogan_hikaye.bind(n)},
		{t = "Demiri nerede bulurum?", f = func(): _soyle(n, "Bataklık demiri! Kırmızımsı kayaları gördün mü? Onlar demir madeni. Taş kazma kırmaz; [b]çakmaktaşı kazma[/b] ya da daha iyisi gerekir. Üç cevher, iki kömür, bir taş: kazanda bir külçe. Kömür yoksa [b]turba[/b] da yanar.", [{t = "Sağ ol", pri = true, kapat = true}])},
		{t = "Kara ejder?", f = func(): _soyle(n, "Doğuda, Kül Diyarı'nda yaşar. Ateş tükürür, pulu kılıç geçirmez. Tunç zırh bile yanar orada. Demir giy, ateş çiçeği merhemi sür, sonra git. Bir de… ejderin yuvasının yakınında bir şey parlıyordu. Mor bir şey.", [{t = "Anladım", pri = true, kapat = true}])},
		{t = "Hoşça kal", pri = true, kapat = true}])

func _dogan_hikaye(n) -> void:
	var kadin: bool = oyun.sevgili.get("gender", "k") == "k"
	var ad: String = oyun.ad_sevgili
	var ic: String = ("[b]%s[/b] diye bağırıyordu, adını haykırıyordu" % ad) if ad != "" else "çırpınıyordu"
	_soyle(n, "Yirmi yıldır buradayım. Ama asıl bil ki… o fırtınalı gece gördüm. Gökten mor bir ışık indi, bataklığın ortasına. İçinden pelerinli biri çıktı; kollarında %s vardı, %s. Sonra ışık göğe çekildi, gitti. Çamurda izleri hâlâ durur. Sana bir şey söyleyeyim: pazara köpek satan o [b]yıldızsız adam[/b]… pelerini aynıydı." % ["bir kadın" if kadin else "bir adam", ic],
		[{t = "O adam mı?!", pri = true, f = func(): _soyle(n, "Bilmiyorum evlat. Ama izleri takip et: bataklıkta iki, Kül Diyarı'nda iki iz daha olmalı. Ne bulursan Kemal'e de anlat.", [{t = "Bulacağım", pri = true, kapat = true}])}])

func _hakkinda(n) -> void:
	_soyle(n, str(n.K.kuzen.about[1]), [{t = "Anladım", pri = true, f = _kuzen.bind(n, false)}])

func _kuzenlik(n) -> void:
	var rol: String = n.K.rol
	var ayni := [TABAN[rol].short]
	for m in oyun.kisiler:
		if m.K.get("rol", "") == rol and m.K.has("kuzen"): ayni.append(str(m.K.kuzen.short))
	for u in oyun.kisi_veri.get("ustalar", []):
		if u.rol == rol and not ayni.has(str(u.ad).split(" ")[-1]): ayni.append(str(u.ad).split(" ")[-1])
	_soyle(n, "Kuzeniz ya! Hepimiz [b]Elmas Nine[/b]'nin torunlarıyız. Çayır'dan Mor Kristal Vadisi'ne her biyomda bir kazan, iki örs: %s… Bir de öbür kollar. Hepimiz aynı kalıptan çıktık; ama kalıbın en iyisi benim, onu da bil." % ", ".join(ayni), [{t = "Anladım", pri = true, f = _kuzen.bind(n, false)}])

## web meet: "tıpatıp tanıdık" → önceki kuzenin adı → kendini tanıtır; silahçı ve zırhçı imza tariflerini kitaba yazar
func _tanis(n) -> void:
	var K: Dictionary = n.K
	var pr := _onceki(K)
	var P: Dictionary = pr[1]
	var acilis: String = {"w": "[i](kazanının başında, sırtı sana dönük; şapkası, burnu, yeşil teni… tıpatıp tanıdık)[/i] Hm? Bir misafir mi var?",
		"s": "[i](örsün başında, sırtı sana dönük; omuzları, sakalı, önlüğü… tıpatıp tanıdık)[/i] Hm? Biri mi geldi?",
		"a": "[i](zırh örsünün başında; bıyığı, tulumu, duruşu… tıpatıp tanıdık)[/i] Hoş geldin, yabancı."}[K.rol]
	var cagri: String = {"w": "%s? Senin burada ne işin var?", "s": "%s? Örsünü buraya mı taşıdın?", "a": "%s? Sen de mi buradasın?"}[K.rol] % P.short
	_soyle(n, acilis, [{t = cagri, pri = true, f = _tanis2.bind(n, pr)}])

func _tanis2(n, pr: Array) -> void:
	var K: Dictionary = n.K
	var C: Dictionary = K.kuzen
	var P: Dictionary = pr[1]
	tanis[K.k] = true
	var k := 0
	for r in C.get("imza", []):
		if not oyun.el_yapimi.verilen.has(r):
			oyun.el_yapimi.verilen[r] = true
			_duyur(r, str(C.short), k)
			k += 1
	var ek: String = str(P.ile).substr(str(P.short).length())
	_soyle(n, "%s?! %s %s kuzenim [b]%s[/b]%s tanışmışsın demek. Ben o değilim. %s" % [P.q, C.gesture, BKI[int(pr[0])], P.short, ek, C.pitch], [{t = "Kuzen misiniz gerçekten?", f = _kuzenlik.bind(n)}, {t = "Hoşça kal", kapat = true}])

func _duyur(r: String, kim: String, k: int) -> void:
	await get_tree().create_timer(0.7 + k * 2.6).timeout
	oyun.env.mesaj("%s · Tarifi kitabında: kazanda öğren, %s döver" % [r, kim])
