extends Node
## Boğaç, gece beliren yazılımcı (web v330dev; belge Sistemler › Gün, gece ve mor ışık › Boğaç, gece beliren yazılımcı).
## Yalnızca cihazın gerçek saati 02:00–06:00 arasındayken, oyunun her gecesinde rastgele bir anda adanın rastgele yürünebilir
## bir yerinde belirir, 15 sn kalır (duraklatınca sayaç durur). Yanına varınca (22 px) gerçek saati söyler: "Saat 02:47 olmuş.
## Kapat oyunu artık." · Tamam → oyun kaydedilir, ana menüye dönülür. Bir kez konuşunca o kayıtta bir daha gelmez.

var oyun
var gece := -999
var an := -1
var acik := false
var konustu := false
var bitti := false
var kalan := 0.0
var yas := 0.0
var spr: Sprite2D
var ciz: Node2D
var por: Texture2D
var gozluk: Array = []     # ön karede göz pikselleri

func kur(o) -> void:
	oyun = o
	# varsayılan erkek karakter: kahve saç, açık ten, koyu gri tişört, mavi pantolon; kare gözlük
	var V := Karakter.veri()
	var g := Karakter.gorunus({g = "e", hs = str(V.HS_E[0][0]), skin = 0, hair = 0, shirt = 6, pants = 0, dress = false, eye = 0, face = 0})
	var tx := Karakter.sayfa(g)
	var at := AtlasTexture.new()
	at.atlas = tx
	at.region = Rect2(0, 0, 26, 40)
	var im: Image = tx.get_image()
	var goz := Color(str(V.EYES[0][0]))
	for y in 22:
		for x in 26:
			var c := im.get_pixel(x, y)
			if c.a > 0.5 and absf(c.r - goz.r) < 0.06 and absf(c.g - goz.g) < 0.06 and absf(c.b - goz.b) < 0.06: gozluk.append(Vector2i(x, y))
	spr = Sprite2D.new()
	spr.texture = at
	spr.centered = false
	spr.offset = Vector2(-13, -36)
	spr.visible = false
	ciz = Node2D.new()
	ciz.draw.connect(_ciz)
	spr.add_child(ciz)
	oyun.nesneler.add_child(spr)
	var pa := AtlasTexture.new()
	pa.atlas = tx
	pa.region = Rect2(0, 0, 26, 22)
	por = pa

func _gece_dk() -> float:
	var dk: float = oyun.zaman.dk
	if dk >= 1200.0: return dk - 1200.0
	if dk < 360.0: return dk + 240.0
	return -1.0

func _gece_no() -> int:
	return oyun.zaman.gun if oyun.zaman.dk >= 1200.0 else oyun.zaman.gun - 1

func _gec() -> bool:
	var h: int = Time.get_datetime_dict_from_system().hour
	return h >= 2 and h < 6

func _saat() -> String:
	var d := Time.get_datetime_dict_from_system()
	return "%02d:%02d" % [d.hour, d.minute]

func _yer():
	for k in 600:
		var x: int = randi() % int(oyun.bw) + int(oyun.bx0)
		var y: int = randi() % int(oyun.bh) + int(oyun.by0)
		var p := Vector2(x * 16 + 8, y * 16 + 8)
		if oyun.tile_at(p) >= 3 or oyun.bio_at(p) < 0: continue
		if oyun.engel(p) or oyun.engel(p + Vector2(-6, 0)) or oyun.engel(p + Vector2(6, 0)) or oyun.engel(p + Vector2(0, 6)): continue
		return p
	return null

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	if oyun.basta or oyun.arena != null or bitti:
		acik = false
		spr.visible = false
		return
	var nm := _gece_dk()
	if nm >= 0.0:
		var k := _gece_no()
		if gece != k:
			gece = k; an = randi() % 590; acik = false; konustu = false
		if not acik and an >= 0 and nm >= an and _gec() and not oyun.cine.acik and not oyun.uyanis.acik and oyun.kuzen.yol_t < 0.0 and not oyun.magara.icinde:
			an = -1
			var s = _yer()
			if s != null:
				acik = true; spr.position = s; kalan = 15.0; yas = 0.0
	spr.visible = acik
	if not acik: return
	if get_tree().paused or oyun.zaman.durdu() and not konustu: return
	if oyun.konusma.visible and konustu: return
	yas += dt
	kalan -= dt
	if kalan <= 0.0:
		acik = false
		spr.visible = false
		return
	spr.modulate.a = clampf(minf(yas / 0.5, kalan / 0.5), 0.0, 1.0)
	spr.flip_h = oyun.oyuncu.position.x > spr.position.x + 2.0
	ciz.queue_redraw()
	if not konustu and not oyun.konusma.visible and oyun.oyuncu.position.distance_to(spr.position) < 22.0: _konus()

func _konus() -> void:
	konustu = true
	oyun.konusma.ac("Boğaç", por, "Saat %s olmuş. Kapat oyunu artık." % _saat(), [{t = "Tamam", pri = true, kapat = true, f = _cik}])

func _cik() -> void:
	acik = false
	bitti = true
	oyun.kayit.kaydet("oto")
	Kayit.dogrudan = false
	Kayit.bekleyen = {}
	get_tree().reload_current_scene()

## kare gözlük ve belirirken/kaybolurken mor parıltı
func _ciz() -> void:
	var ox := -13.0
	var oy := -36.0
	if not gozluk.is_empty():
		var c := Color("#1a1a22")
		for g in gozluk:
			var gx: float = (25 - g.x) if spr.flip_h else g.x
			ciz.draw_rect(Rect2(ox + gx - 1, oy + g.y - 1, 3, 3), c, false, 1.0)
	var t := Time.get_ticks_msec() / 1000.0
	var a := 0.7 * maxf(0.0, 1.0 - minf(yas, kalan) / 0.8)
	if a > 0.0:
		for k in 6:
			var an2 := k / 6.0 * TAU + t * 3.0
			ciz.draw_rect(Rect2(cos(an2) * 9.0, -8.0 + sin(an2) * 9.0, 2, 2), Color(0.75, 0.48, 1.0, a) if k % 2 else Color(0.94, 0.85, 1.0, a))

func kayit() -> int:
	return 1 if bitti else 0

func yukle(v) -> void:
	bitti = int(v) == 1 if v != null else false
	acik = false
	gece = -999
