extends Node
## Eşinden kalan altı iz (web v44 CLUES, findClue, drawClues, clueText; belge 99_godot 3d).
## Her biri yerde mor bir parıltı; yanında F okur. Kemal'in "Eşinden kalan izler" (E4) görevi altısını ister.

var oyun
var V: Array = []
var bulunan := {}
var dugum := {}

func kur(o) -> void:
	oyun = o
	V = o._json("res://data/izler.json").izler
	for c in V:
		var n := Node2D.new()
		n.position = Vector2(c.x, c.y)
		n.draw.connect(_ciz.bind(n, str(c.id)))
		o.nesneler.add_child(n)
		dugum[c.id] = n

func sayi() -> int:
	return bulunan.size()

func _process(_dt: float) -> void:
	for id in dugum:
		var n: Node2D = dugum[id]
		n.visible = not bulunan.has(id)
		if n.visible and n.position.distance_to(oyun.oyuncu.position) < 400.0:
			n.queue_redraw()
			if randf() < 0.05: oyun.parca(n.position + Vector2(randf_range(-5, 5), -4), Vector2(0, -14), 0.7, Color(0.78, 0.59, 1, 0.8))

## F: yanındaki iz (web near 16 px)
func f() -> bool:
	for c in V:
		if bulunan.has(c.id): continue
		if oyun.oyuncu.position.distance_to(Vector2(c.x, c.y)) < 16.0:
			_bul(c)
			return true
	return false

func metin(id: String) -> String:
	var ad: String = oyun.ad_sevgili
	var L: String = ("[b]%s[/b]" % ad) if ad != "" else "eşinin"
	var H: String = oyun.ad_kahraman
	var W: bool = oyun.sevgili.get("gender", "k") == "k"
	match id:
		"bilezik":
			if W: return "Kumun içinde bir kolye parlıyor. Madalyonunun içine iki harf kazınmış: senin adının ve %s adının baş harfleri. Onun kolyesi! Zinciri kopmuş, ama kıyıya vurmuş. Demek ki o da bu sularda bir yerdeydi…" % L
			return "Kumun içinde bir bileklik parlıyor. İç yüzüne iki harf kazınmış: senin adının ve %s adının baş harfleri. Onun bilekliği! Kopmuş, ama kıyıya vurmuş. Demek ki o da bu sularda bir yerdeydi…" % L
		"defter": return "Bir kayanın dibinde, yarısı ıslanmış bir defter sayfası. %s el yazısı: [i]\"Üç gecedir geminin üstünde mor bir ışık dolaşıyor. Kaptan ona yıldız diyor; ama yıldızlar böyle peşimizden gelmez. Bugün güvertede pelerinli bir yolcu gördüm, kimse onu gemiye binerken görmemiş…\"[/i]" % L
		"metal": return "Ne taş ne ağaç: soğuk, pürüzsüz, bu dünyadan olmayan bir metal parçası. Üstünde mor bir göz işareti var. Bu işareti tanıyorsun… Yıldızsız Gezgin'in pelerininin kopçasında da aynısı vardı."
		"iz": return "Çamurda iki iz: biri yürüyen ayaklar, öbürü sürüklenen birinin topukları. İzler bataklığın ortasında birden bitiyor; sanki gökyüzü onları yutmuş. Yanında çamura gömülmüş %s: %s." % ["bir küpe" if W else "deri bir cüzdan", L]
		"harita": return "Kara bir taşa oyulmuş bir yıldız haritası. Yıldızlardan birinin çevresi mor gözle işaretlenmiş; işaretten çıkan bir ok yukarıyı, gökyüzünü gösteriyor. Bunu bir insan eli yapmamış."
		_: return "Avucuna aldığın anda mor kristal ısınıyor ve içinden bir ses yükseliyor, %s sesi: [i]\"%sBeni duyuyorsan… Gemiye çarpan fırtına değildi, onlardı. Gökten inen, adalara köpek ve fener satan o yıldızsız adamlar. Mor ışık onların gemisi. Beni yıldızlarının ötesine götürüyorlar… Beni bul.\"[/i]" % [L, (H + "! ") if H != "" else ""]

func _bul(c: Dictionary) -> void:
	bulunan[c.id] = true
	var p := Vector2(c.x, c.y)
	for i in 26:
		var an := randf() * TAU
		var sp := 20.0 + randf() * 40.0
		oyun.parca(p + Vector2(0, -4), Vector2(cos(an) * sp, sin(an) * sp - 20), 1.1, Color("#c9a0ff") if i % 2 else Color.WHITE)
	var son: bool = c.id == "kristal"
	var kalan := V.size() - bulunan.size()
	oyun.konusma.ac("Bir iz", null, "%s\n\n[font_size=12]İz %d / %d%s[/font_size]" % [metin(c.id), bulunan.size(), V.size(), "" if kalan > 0 else " · bütün izleri buldun"],
		[{t = "Seni bulacağım…" if son else "Bunu saklıyorum", pri = true, f = _sonra.bind(c, son)}])
	oyun.gorev.yenile()

func _sonra(c: Dictionary, son: bool) -> void:
	if son:
		oyun.env.mesaj("Gerçek · Eşini kaçırdılar. Mor ışık bir gemiydi; onu yıldızların ötesine götürdüler.")
	else:
		oyun.env.mesaj("%s · İz %d / %d" % [c.n, bulunan.size(), V.size()])

## kitabın İzler sayfası (web İzler sekmesi)
func liste_yaz(kutu: VBoxContainer) -> void:
	var ad: String = oyun.ad_sevgili
	var not_ := Label.new()
	not_.text = "Adada %s kalan izler. Mor parıltıları ara: ikisi yurtta, ikisi bataklıkta, ikisi Kül Diyarı'nda." % ((ad + "'den") if ad != "" else "eşinden")
	not_.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	not_.custom_minimum_size = Vector2(260, 0)
	not_.add_theme_font_size_override("font_size", 12)
	kutu.add_child(not_)
	var BAD := ["Çayır", "Orman", "Bataklık", "Kayalık Dağ", "Kül Diyarı", "Mor Kristal Vadisi"]
	for c in V:
		var ok: bool = bulunan.has(c.id)
		var l := RichTextLabel.new()
		l.bbcode_enabled = true
		l.fit_content = true
		l.custom_minimum_size = Vector2(260, 0)
		var b: int = oyun.bio_at(Vector2(c.x, c.y))
		l.text = "[b]%s[/b] [color=#a8a090]· %s[/color]\n[font_size=11]%s[/font_size]" % [c.n if ok else "???", BAD[b] if b >= 0 and b < 6 else "", metin(c.id) if ok else "Henüz bulunmadı."]
		l.modulate.a = 1.0 if ok else 0.6
		kutu.add_child(l)

func _r(n: Node2D, x: float, y: float, w: float, h: float, c: Color) -> void:
	n.draw_rect(Rect2(x, y, w, h), c)

func _ciz(n: Node2D, id: String) -> void:
	var t := Time.get_ticks_msec() / 1000.0
	var k := 0.5 + 0.5 * sin(t * 3 + n.position.x)
	n.draw_set_transform(Vector2.ZERO, 0, Vector2(10 + k * 3, 4 + k))
	n.draw_circle(Vector2.ZERO, 1.0, Color(0.75, 0.47, 1, 0.18 + 0.18 * k))
	n.draw_set_transform(Vector2.ZERO)
	match id:
		"bilezik":
			_r(n, -4, -3, 8, 4, Color("#d8c060")); _r(n, -3, -2, 1, 1, Color("#fff6c0"))
		"defter":
			_r(n, -5, -4, 10, 6, Color("#e8e0c8")); _r(n, -4, -3, 7, 1, Color("#6a6a8a")); _r(n, -4, -1, 5, 1, Color("#6a6a8a")); _r(n, 3, -4, 2, 6, Color("#c8c0a8"))
		"metal":
			_r(n, -4, -4, 8, 5, Color("#b8c0cc")); _r(n, -3, -5, 6, 1, Color("#e0e8f0")); _r(n, -1, -3, 2, 2, Color("#a050e0"))
		"iz":
			for i in 4:
				_r(n, -8 + i * 5, -1, 2, 3, Color("#2a1e12")); _r(n, -7 + i * 5, 3, 3, 1, Color("#2a1e12"))
			_r(n, 6, -3, 3, 2, Color("#c84a8a"))
		"harita":
			_r(n, -6, -8, 12, 10, Color("#2a2428")); _r(n, -6, -8, 12, 1, Color("#4a4048"))
			for a in [[-4, -6], [1, -5], [3, -3], [-2, -2], [4, -7]]: _r(n, a[0], a[1], 1, 1, Color("#f0e8ff"))
			_r(n, 2, -5, 3, 3, Color(0.75, 0.47, 1, 0.9))
		_:
			_r(n, -2, -9, 4, 9, Color("#a050e0")); _r(n, -4, -5, 2, 5, Color("#8040c0")); _r(n, 2, -6, 2, 6, Color("#c080ff")); _r(n, -1, -8, 1, 6, Color("#f0d8ff"))
	if fmod(t * 0.9 + n.position.x * 0.01, 2.4) < 0.3:
		_r(n, 5, -12, 1, 5, Color("#f0d8ff")); _r(n, 3, -10, 5, 1, Color("#f0d8ff"))

func kayit() -> Array:
	return bulunan.keys()

func yukle(d) -> void:
	bulunan = {}
	if d is Array:
		for id in d: bulunan[str(id)] = true
