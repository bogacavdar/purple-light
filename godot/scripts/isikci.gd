## Yıldızsız Işıkçı ve Kafa lambası (web lampman, checkLampman, drawLampman, talkLamp, lampVanish; belge Oyun akışı › Gezginler ve takvim,
## ACT 1 › Yan görevler: "Hiç bitmeyen ışık" biyomun 2 yan görev sınırına sayılmaz).
## 15. günden sonra her akşam 18:00–05:30 Çayır'da sabit bir yerde durur. 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi karşılığında
## Kafa lambası verir (baş yuvası, geceleri kendiliğinden yanar, hiç bitmez), sonra bir daha gelmez.
extends Node2D

var oyun
var kapali := false       # Işıkçı yalnız Yıldızsız Ada'ya gelir (web v1.76)
var env
var V: Dictionary
var shown := false
var met := false
var gone := false
var n: Node2D
var t := 0.0
var por: ImageTexture

func kur(o) -> void:
	oyun = o
	env = o.env
	V = o._json("res://data/isikci.json")
	if o.ada == 2:
		kapali = true
		set_process(false)
		return
	var P := Vector2(V.x, V.y)
	# yerinin çevresi açık (web: 34 px içindeki ağaçlar, 24 px içindeki düğümler kalkar)
	for ag in oyun.agaclar.duplicate():
		if ag.position.distance_to(P) < 34.0:
			oyun.agaclar.erase(ag)
			var k := Vector2i(int(floor(ag.position.x / 32.0)), int(floor(ag.position.y / 32.0)))
			if oyun.agac_izgara.has(k): oyun.agac_izgara[k].erase(ag.position)
			ag.queue_free()
	for d in oyun.dugumler.duplicate():
		if d.position.distance_to(P) < 24.0:
			oyun.dugumler.erase(d)
			d.queue_free()
	n = Node2D.new()
	n.position = P
	n.visible = false
	n.draw.connect(_ciz)
	oyun.nesneler.add_child(n)
	var im := Image.create(24, 26, false, Image.FORMAT_RGBA8)
	var p := func(x: int, y: int, w: int, h: int, c: String) -> void: im.fill_rect(Rect2i(x, y, w, h), Color(c))
	p.call(2, 18, 20, 8, "#2a1a4a"); p.call(11, 18, 2, 8, "#7fe0ff")
	p.call(4, 6, 16, 12, "#140a26"); p.call(6, 12, 4, 2, "#9fe8ff"); p.call(14, 12, 4, 2, "#9fe8ff")
	p.call(2, 2, 20, 6, "#3a2a5a"); p.call(8, 0, 8, 4, "#e8fbff")
	por = ImageTexture.create_from_image(im)
	_yan_kur.call_deferred()

## yan görev olarak "Hiç bitmeyen ışık" (yan.gd bizden sonra kurulur)
func _yan_kur() -> void:
	# yan görev olarak "Hiç bitmeyen ışık" (web Q.push isikci, ext): Işıkçı'yla konuşunca alınır, takasla biter
	var Y = oyun.yan
	var q := {id = "isikci", name = "Yıldızsız Işıkçı", title = "Hiç bitmeyen ışık", b = 0, ext = 1, prize = "Kafa lambası", win = [1080, 330], c = 0, xp = 0,
		intro = [], remind = "", steps = [{t = "bring", items = V.ister, tx = "Işıkçı'ya gecenin verdiklerini götür"}], after = [], x = V.x, y = V.y, pts = {}, gate = [0], portre = ""}
	Y.Q.append(q)
	Y.BY["isikci"] = q
	var bos := Node2D.new()
	bos.visible = false
	Y.kisi_n["isikci"] = bos
	Y.add_child(bos)

func aksam() -> bool:
	var z = oyun.zaman
	return z.gun >= int(V.gun) and (z.dk >= 1080.0 or z.dk < 330.0)

func _process(dt: float) -> void:
	t += dt
	if oyun.basta or gone: return
	var ak := aksam()
	if ak and not shown:
		shown = true
		n.visible = true
		for i in 30: oyun.parca(n.position + Vector2(0, -6), Vector2.from_angle(randf() * TAU) * (20 + randf() * 50), 1.4, Color("#9fe8ff") if i % 2 else Color("#5a2aa0"))
		env.mesaj("Mavi ışık yine yandı · Yıldızsız Işıkçı seni bekliyor" if met else "Uzakta mavi bir ışık · Gece bitmeden yanına git; yetişemezsen yarın akşam yine yanar.")
	elif not ak and shown:
		shown = false
		n.visible = false
		if oyun.konusma.visible and oyun.konusma.ad.text == "Yıldızsız Işıkçı": oyun.konusma.visible = false
		env.mesaj("Mavi ışık gün doğarken söndü. Akşam yine orada olacak." if met else "Mavi ışık söndü; yetişemedin. Bu akşam yine yanabilir.", true)
	if shown: n.queue_redraw()

func f() -> bool:
	if kapali: return false
	if not shown or oyun.oyuncu.position.distance_to(n.position) > 30.0: return false
	_konus()
	return true

func _var() -> bool:
	for a in V.ister:
		if env.adet(str(a[0])) < int(a[1]): return false
	return true

func _soyle(metin: String, secs: Array) -> void:
	oyun.konusma.ac("Yıldızsız Işıkçı", por, metin, secs)

func _konus() -> void:
	var ilk := not met
	met = true
	var L := []
	for a in V.ister:
		var h: int = env.adet(str(a[0]))
		L.append("[b]%d %s[/b] [color=%s](sende %d)[/color]" % [int(a[1]), a[0], "#8fd46b" if h >= int(a[1]) else "#ff8a6a", h])
	var secs := []
	if _var():
		secs.append({t = "Takas et", pri = true, f = _takas})
	else:
		secs.append({t = "Bunları bulacağım", pri = true, f = func():
			var Y = oyun.yan
			if not Y.done.has("isikci") and Y.act("isikci") == null: Y._basla(Y.BY.isikci)
			_soyle("Gece çiçeklerini ve mor kıymıkları ancak karanlıkta bulursun; meşaleni tazelemeyi unutma. Ben her akşam buradayım, gün doğana dek.", [{t = "Tamam", pri = true, kapat = true}])})
	secs.append({t = "Neden yardım ediyorsun?", f = func(): _soyle("Yardım mı? Ticaret, dünyalı. Biz yıldızsızlar alır, satar, toplarız. Bazen eşya… bazen başka şeyler. [i](bir an duraklar)[/i] Bazen de insanları.", [{t = "Ne demek istiyorsun?", pri = true, f = func(): _soyle("Hiç. Hiçbir şey. Lambaya bak sen.", [{t = "Hmm", pri = true, f = _konus}])}])})
	secs.append({t = "Sonra", kapat = true})
	var bas := "Ssst… dünyalı. Sonunda geldin. Gecenin seni ne kadar yorduğunu gördüm; meşaleler, yağmur, korku… Bak: bir [b]kafa lambası[/b]. Başına tak, ellerin boş kalsın; ışığı [b]hiç bitmez[/b]. Vio istemem, sizin Vio'nuz bizde bir işe yaramaz. Bana gecenin verdiklerini getir:\n" if ilk else "Yine sen. Getirdin mi?\n"
	_soyle(bas + " · ".join(L), secs)

func _takas() -> void:
	for a in V.ister: env.eksilt(str(a[0]), int(a[1]))
	env.ekle("Kafa lambası")
	var Y = oyun.yan
	if not Y.done.has("isikci"):
		var a = Y.act("isikci")
		if a == null:
			Y._basla(Y.BY.isikci)
			a = Y.act("isikci")
		if a != Y.A: Y._takip(a)
		Y._bitir(Y.BY.isikci)
	_soyle("Güzel. [i](kıymıkları avucunda tartar, gözleri bir an mor yanar)[/i] Bunlar bizim orada yakıttır, bilir misin? Lambayı [b]baş[/b] yuvasına tak; geceleri kendiliğinden yanar, hiç bitmez. [i](lambanın arkasındaki mor göz işaretini parmağıyla örter)[/i] Bunu kimseye gösterme, olur mu?",
		[{t = "Teşekkürler", pri = true, f = func():
			if oyun.kusam.get("bas", null) == null:
				oyun.giy("Kafa lambası")
				env.mesaj("Kafa lambası başında: geceleri kendiliğinden yanar")
			get_tree().create_timer(0.7).timeout.connect(_git)}])

func _git() -> void:
	for i in 46: oyun.parca(n.position + Vector2(randf_range(-4, 4), -6), Vector2.from_angle(randf() * TAU) * (10 + randf() * 46), 1.2, Color(["#9fe8ff", "#5a2aa0", "#d8d0c0", "#a070e0"][i % 4]))
	shown = false
	gone = true
	n.visible = false
	get_tree().create_timer(0.9).timeout.connect(func(): oyun.balon("Bu da ötekine benziyordu…", 3.6))

## kafa lambası takılıysa ışık var (web lampOn)
func lamba() -> bool:
	return oyun.kusam.get("bas", null) == "Kafa lambası"

func _r(x: float, y: float, w: float, h: float, c) -> void:
	n.draw_rect(Rect2(x, y, w, h), Color(c))

func _ciz() -> void:
	var fl := sin(t * 4)
	_r(-7, 4, 14, 3, Color(0, 0, 0, 0.28)); _r(-6, -4, 12, 9, "#2a1a4a"); _r(-7, 2, 14, 3, "#1e1238"); _r(-1, -4, 2, 9, "#7fe0ff")
	_r(-4, -12, 8, 8, "#140a26"); _r(-3, -9, 2, 1, "#9fe8ff"); _r(1, -9, 2, 1, "#9fe8ff")
	_r(-5, -14, 10, 3, "#3a2a5a"); _r(-2, -15, 4, 2, "#e8fbff" if fl > 0 else "#9fe8ff")
	_r(6, -6, 2, 8, "#4a4a5a"); _r(5, -9, 4, 3, "#7fe0ff")
	n.draw_colored_polygon(PackedVector2Array([Vector2(0, -14), Vector2(-14, 16), Vector2(14, 16)]), Color(0.62, 0.91, 1.0, 0.25 + 0.15 * fl))
	if not met:
		var b := roundf(sin(t * 5) * 2)
		_r(-3, -32 + b, 6, 9, "#232d1f"); _r(-1, -31 + b, 2, 5, "#7fe0ff"); _r(-1, -25 + b, 2, 1, "#7fe0ff")

func kayit() -> Dictionary:
	return {met = met, gone = gone}

func yukle(d: Dictionary) -> void:
	met = bool(d.get("met", false))
	gone = bool(d.get("gone", false))
	shown = false
	if n != null: n.visible = false
