extends Node2D
## Gizli şeyler (web v330sea, v330klon, v334egg, v337; belge Sistemler › Gizli şeyler, Mor ışıkta o, Seni hatırlıyorum; ACT 1 › Denizdeki gizli yol).
## Oyunun hiçbir yerinde anlatılmaz. Denizdeki gizli yol, gece beliren sevdiğin kişi, Zümrüt'ün kazanına çöp (Görünmezlik iksiri),
## Börü'yü yumrukla yenmek (kemeri), 100. gecede yıldızlar, eski kamp ateşi, ayna, dans, inatçı balıkçı, gece 03:00, Devam ederken bir satır.

var oyun
const CIHAZ := "user://gizli.json"
const BELT := "Börü'nün kemeri"
const LINES := ["Denizin her yeri derin değildir.", "Bazı geceler ada yalnız değildir.", "Kazan bazen tarifsiz de bir şey verir.", "Su, bakana başka bir yüz gösterir.",
	"Yıldızsız Ada'nın da yıldızlı bir gecesi vardır.", "Adada senden önce de bir ateş yanmıştı.", "Yumruk da bir dildir; Börü onu anlar.",
	"Ayakların ritmi tutunca ada da seninle dans eder.", "Sabır, suyun dibindekini bile yüzeye çıkarır.", "Her yabancı düşman değildir.",
	"Gece yarısından sonra bazı yüzler yalnızca bir kez görünür."]

# kayıt yuvası
var SP := {}            # deniz yolu {i, dx, dy, n}
var hucre := {}         # yolun kareleri (Vector2i → true)
var son := Vector2i(-1, -1)
var J: Array = []       # kazana atılan çöpler (farklı)
var S := 0              # Zümrüt kaç kez kızdı
var B := 0              # Börü'ye yumruk
var BG := 0             # kemer verildi
var F := 0              # yaşlı balık görüldü
var C = null            # eski kamp ateşi (Vector2)
# cihaz
var D := {}             # {klonN, line, chars: [[look, ad, n]]}

var busy := false
var hazir := false
var INV := 0.0          # görünmezlik bitişi (sn)
var K := {gece = -100, at = -1, on = false, p = Vector2.ZERO, d0 = 0.0, yas = 0.0, sayildi = false}
var klon_spr: Sprite2D
var klon_ad: Label
var ayna_spr: Sprite2D
var MIR = null          # {p, t0}
var ayna_sonra := 0.0
var still := 0.0
var lp := Vector2.ZERO
var DANS := {on = false, seq = [], acc = 0.0, p = Vector2.ZERO}
var FS := {p = null, n = 0}
var son_vur := 0.0
var kamp_dedi := 0.0
var told3 := false
var yildiz_dedi := -1
var kat: CanvasLayer
var siyah: ColorRect
var yildiz: Control
var satir: Label
var satir_t := 0.0
var nabiz: Control

func kur(o) -> void:
	oyun = o
	z_index = 2
	_cihaz_yukle()
	# Börü'nün kemeri: gövdeye giyilen deri, 26 savunma, kanamaya %20 direnç (fiyatı 140)
	oyun.kusanma.esya[BELT] = {s = "govde", def = 26, c = "#7a5230", res = {kanama = 0.2}, mud = 0, fx = null, lamp = 0}
	oyun.pazar.P.esya[BELT] = {f = 140, s = 0, h = 0, y = 0, a = 0, t = 0}
	oyun.env.ikon[BELT] = _kemer_ikon()
	klon_spr = Sprite2D.new()
	klon_spr.hframes = 5; klon_spr.vframes = 8
	klon_spr.offset = Vector2(0, -20)
	klon_spr.visible = false
	add_child(klon_spr)
	klon_ad = Label.new()
	klon_ad.add_theme_font_size_override("font_size", 8)
	klon_ad.add_theme_color_override("font_color", Color("#e8c8ff"))
	klon_ad.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.7))
	klon_ad.add_theme_constant_override("outline_size", 3)
	klon_ad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	klon_ad.size = Vector2(80, 12); klon_ad.position = Vector2(-40, -46)
	klon_spr.add_child(klon_ad)
	# soluk mor ışık (karanlıkta görünsün diye, web 40 px)
	var li := PointLight2D.new()
	var g := GradientTexture2D.new()
	g.width = 128; g.height = 128; g.fill = GradientTexture2D.FILL_RADIAL
	g.fill_from = Vector2(0.5, 0.5); g.fill_to = Vector2(1.0, 0.5)
	var gr := Gradient.new(); gr.set_color(0, Color(0.85, 0.6, 1.0, 1)); gr.set_color(1, Color(0.6, 0.3, 0.9, 0))
	g.gradient = gr
	li.texture = g
	li.texture_scale = 80.0 / 128.0
	li.energy = 1.0
	li.position = Vector2(0, -6)
	klon_spr.add_child(li)
	ayna_spr = Sprite2D.new()
	ayna_spr.hframes = 5; ayna_spr.vframes = 8
	ayna_spr.flip_v = true
	ayna_spr.offset = Vector2(0, 20)
	ayna_spr.visible = false
	add_child(ayna_spr)
	kat = CanvasLayer.new()
	kat.layer = 25
	add_child(kat)
	yildiz = Control.new()
	yildiz.set_anchors_preset(Control.PRESET_FULL_RECT)
	yildiz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	yildiz.draw.connect(_yildiz_ciz)
	yildiz.visible = false
	kat.add_child(yildiz)
	nabiz = Control.new()
	nabiz.set_anchors_preset(Control.PRESET_FULL_RECT)
	nabiz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	nabiz.draw.connect(_nabiz_ciz)
	kat.add_child(nabiz)
	siyah = ColorRect.new()
	siyah.color = Color.BLACK
	siyah.set_anchors_preset(Control.PRESET_FULL_RECT)
	siyah.mouse_filter = Control.MOUSE_FILTER_IGNORE
	siyah.modulate.a = 0.0
	kat.add_child(siyah)
	var yz := Label.new()
	yz.name = "yazi"
	yz.add_theme_font_size_override("font_size", 22)
	yz.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	yz.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	yz.set_anchors_preset(Control.PRESET_FULL_RECT)
	siyah.add_child(yz)
	satir = Label.new()
	satir.add_theme_font_size_override("font_size", 22)
	satir.add_theme_color_override("font_color", Color("#ecdcff"))
	satir.add_theme_color_override("font_outline_color", Color(0.1, 0.02, 0.2))
	satir.add_theme_constant_override("outline_size", 6)
	satir.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	satir.set_anchors_preset(Control.PRESET_CENTER_TOP)
	satir.position = Vector2(-400, 170); satir.size = Vector2(800, 40)
	satir.modulate.a = 0.0
	kat.add_child(satir)

func _kemer_ikon() -> Texture2D:
	var im := Image.create(16, 16, false, Image.FORMAT_RGBA8)
	var p := func(x, y, w, h, c):
		for yy in h:
			for xx in w: im.set_pixel(x + xx, y + yy, Color(c))
	p.call(1, 6, 14, 4, "#1a1008"); p.call(2, 7, 12, 2, "#7a5230"); p.call(2, 7, 12, 1, "#a07040"); p.call(6, 5, 5, 6, "#1a1008")
	p.call(7, 6, 3, 4, "#c8a050"); p.call(8, 7, 1, 2, "#7a5230"); p.call(3, 8, 1, 1, "#3a2414"); p.call(12, 8, 1, 1, "#3a2414")
	return ImageTexture.create_from_image(im)

# ------------------------------------------------------------------ cihaz
func _cihaz_yukle() -> void:
	if FileAccess.file_exists(CIHAZ):
		var j = JSON.parse_string(FileAccess.get_file_as_string(CIHAZ))
		if j is Dictionary: D = j
	if not D.has("chars"): D.chars = []

func _cihaz_kaydet() -> void:
	var f := FileAccess.open(CIHAZ, FileAccess.WRITE)
	if f != null: f.store_string(JSON.stringify(D))

# ------------------------------------------------------------------ yeni oyun / kayıt
func yeni() -> void:
	J = []; S = 0; B = 0; BG = 0; F = 0
	_yol_kur({})
	_kamp_sec()

func kayit() -> Dictionary:
	return {sp = SP, j = J, s = S, b = B, bg = BG, f = F, c = [C.x, C.y] if C != null else null}

func yukle(d: Dictionary) -> void:
	hazir = true
	J = d.get("j", []); S = int(d.get("s", 0)); B = int(d.get("b", 0)); BG = int(d.get("bg", 0)); F = int(d.get("f", 0))
	var c = d.get("c", null)
	C = Vector2(float(c[0]), float(c[1])) if c is Array and c.size() == 2 else null
	_yol_kur(d.get("sp", {}))
	if C == null: _kamp_sec()

# ------------------------------------------------------------------ 1 · denizdeki gizli yol
func _deniz(x: int, y: int) -> bool:
	return oyun.tile_at(Vector2((x + 0.5) * 16, (y + 0.5) * 16)) == 4

func _yol_kur(v: Dictionary) -> void:
	SP = {}; hucre = {}; son = Vector2i(-1, -1)
	if oyun.ada != 1: return
	if v.is_empty() or not v.has("x"): v = _yol_sec()
	if v.is_empty(): return
	SP = v
	for k in int(v.n): hucre[Vector2i(int(v.x) + int(v.dx) * k, int(v.y) + int(v.dy) * k)] = true
	son = Vector2i(int(v.x) + int(v.dx) * (int(v.n) - 1), int(v.y) + int(v.dy) * (int(v.n) - 1))

func _uzak(p: Vector2) -> bool:
	for k in oyun.kopru.K:
		if p.distance_to(Vector2(float(k.cx), float(k.cy))) < 160.0: return false
	return true

func _yol_sec() -> Dictionary:
	var x0 := int(oyun.bx0); var y0 := int(oyun.by0)
	var DIR := [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]
	for tries in 4000:
		var x := x0 + randi() % int(oyun.bw)
		var y := y0 + randi() % int(oyun.bh)
		if not _deniz(x, y): continue
		var o := randi() % 4
		for q in 4:
			var d: Vector2i = DIR[(o + q) % 4]
			var n := 8 + randi() % 3
			var ok := _uzak(Vector2((x + 0.5) * 16, (y + 0.5) * 16))
			# yolun arkasında üç kara karesi: yürünebilir, Çayır ya da Orman, engelsiz
			for k in range(1, 4):
				if not ok: break
				var a := Vector2((x - d.x * k + 0.5) * 16, (y - d.y * k + 0.5) * 16)
				if oyun.su_mu(oyun.tile_at(a)) or oyun.bio_at(a) > 1 or oyun.engel(a, 5.0): ok = false
			for k in n:
				if not ok: break
				var cx := x + d.x * k; var cy := y + d.y * k
				if not _deniz(cx, cy): ok = false
				elif k > 0 and (not _deniz(cx + d.y, cy + d.x) or not _deniz(cx - d.y, cy - d.x)): ok = false
			if ok and _deniz(x + d.x * n, y + d.y * n):
				return {x = x, y = y, dx = d.x, dy = d.y, n = n}
	return {}

## bir nokta yolun karesinin üstünde mi (oyun.engel su istisnası)
func yolda(p: Vector2) -> bool:
	if hucre.is_empty(): return false
	return hucre.has(Vector2i(int(floor(p.x / 16.0)), int(floor(p.y / 16.0))))

func _kemal() -> Dictionary:
	for n in oyun.kisiler:
		if str(n.K.k) == "ekin": return n.K
	return {}

func _uyan_yeri() -> Vector2:
	var Kk := _kemal()
	var h := Vector2(float(Kk.get("x", 0)), float(Kk.get("y", 0)))
	for d in [Vector2(-22, 10), Vector2(24, 10), Vector2(0, 24), Vector2(-30, -12), Vector2(32, -12), Vector2(0, -26), Vector2(-44, 0), Vector2(44, 0)]:
		if not oyun.engel(h + d, 5.0): return h + d
	return h + Vector2(0, 30)

func _kemal_de(metin: String, secenek: Array) -> void:
	var Kk := _kemal()
	oyun.konusma.ac(Kk.get("ad", "Yaşlı Kemal"), load(Kk.portre) if Kk.get("portre", null) != null else null, metin, secenek)

func _karar(yazi: String, sure: float) -> void:
	siyah.get_node("yazi").text = yazi
	var tw := create_tween()
	tw.tween_property(siyah, "modulate:a", 1.0, 0.6)
	tw.tween_interval(sure)
	tw.tween_property(siyah, "modulate:a", 0.0, 0.8)

func _yere_dus() -> void:
	if busy: return
	busy = true
	_karar("Gözlerin karardı…", 1.6)
	await get_tree().create_timer(0.8).timeout
	oyun.oyuncu.position = _uyan_yeri()
	await get_tree().create_timer(2.6).timeout
	busy = false
	var odul := func(): oyun.basarim.bayrak("deniz")
	if oyun.konusma.visible:
		odul.call(); return
	_kemal_de("Hı?! Evlat! Sen… nereden çıktın? Az önce burada kimse yoktu, yemin ederim. Üstün başın sırılsıklam, saçından deniz suyu damlıyor… Ne oldu sana?",
		[{t = "Denizin üstünde yürüyordum… sonra gözlerim karardı.", pri = true, f = func():
			_kemal_de("Denizin… üstünde mi? Hah! Bu adada yıllardır yaşarım, böylesini ne gördüm ne duydum. Ya ben yaşlandım ya bu ada iyice tuhaflaştı. Otur şu ateşin yanına, kendine gel; ben de bir çay koyayım. Kendime de bir bardak… iki bardak.",
				[{t = "Tamam", pri = true, kapat = true, f = odul}])}])

# ------------------------------------------------------------------ 2 · Zümrüt'ün kazanına çöp
func copluk(n: String) -> bool:
	if oyun.env.adet(n) <= 0: return false
	if oyun.kusanma.esya.has(n) or oyun.toplama_veri.tools.has(n) or oyun.kusanma.silah.has(n): return false
	if oyun.el_yapimi.R.has(n) and bool(oyun.el_yapimi.R[n].place): return false
	# kemer eşyaları (yenen, içilen, iksir, meşale, mermi) hariç
	var I: Dictionary = oyun.toplama_veri.items.get(n, {})
	if float(I.get("food", 0)) > 0.0 or float(I.get("heal", 0)) > 0.0: return false
	if oyun.mesale.V.sure.has(n) or (oyun.buyu != null and oyun.buyu.asa_mi(n)): return false
	var nl := n.to_lower()
	if nl.contains("iksir") or nl.contains("merhem") or nl.ends_with(" çayı") or oyun.buyu.ok_mu(n): return false
	if not oyun.pazar.satilir(n): return false
	for r in oyun.el_yapimi.R:
		var x: Dictionary = oyun.el_yapimi.R[r]
		for p in x.i:
			if str(p[0]) == n: return false
		if x.t.has(n): return false
	return true

func copler() -> Array:
	var L := []
	for n in oyun.env.inv:
		if copluk(n): L.append(n)
	L.sort()
	return L

func cop_at(n: String) -> void:
	if not copluk(n): return
	oyun.env.eksilt(n, 1)
	if not J.has(n): J.append(n)
	oyun.env.mesaj("%s kazanda kaynadı… mor bir duman yükseldi." % n, true)
	for k in 10: oyun.parca(oyun.oyuncu.position + Vector2(randf_range(-10, 10), -20), Vector2(randf_range(-15, 15), -30), 0.8, Color("#a050e0"))
	if J.size() >= 5:
		J = []
		oyun.istasyon.pencere.visible = false
		get_tree().create_timer(0.5).timeout.connect(_kiz)

func _zumrut() -> Dictionary:
	for n in oyun.kisiler:
		if str(n.K.k) == "witch": return n.K
	return {}

func _kiz() -> void:
	S += 1
	var Z := _zumrut()
	var por = load(Z.portre) if Z.get("portre", null) != null else null
	if S == 3:
		oyun.konusma.ac(Z.get("ad", "Cadı Zümrüt"), por, "Peki, peki… Madem bu kadar meraklısın. Bak, senin çöplerinden tuhaf bir şey kaynadı. Al iç bakalım… Aaa! Neredesin evlat?!",
			[{t = "…", pri = true, kapat = true, f = _gorunmez_ol}])
		return
	var L := ["Evlat! Ne yapıyorsun? Kazanım çöp tenekesi değil! Attığın her şey duman oldu.", "Yine mi?! Bu kazan bana ninemden kaldı, evlat! Bir daha görmeyeyim."]
	oyun.konusma.ac(Z.get("ad", "Cadı Zümrüt"), por, L[0] if (S == 1 or (S > 3 and S % 2 == 0)) else L[1], [{t = "Özür dilerim", pri = true, kapat = true}])

func _gorunmez_ol() -> void:
	INV = Time.get_ticks_msec() / 1000.0 + 10.0
	oyun.basarim.bayrak("gorunmez")
	for k in 16: oyun.parca(oyun.oyuncu.position + Vector2(randf_range(-7, 7), -8 - randf() * 12), Vector2(randf_range(-15, 15), -20 - randf() * 20), 0.8, Color("#c070ff") if k % 2 else Color("#e8d8ff"))

func gorunmez() -> bool:
	return Time.get_ticks_msec() / 1000.0 < INV

# ------------------------------------------------------------------ 3 · Börü'ye elle 50 yumruk
func yumruk() -> void:
	if oyun.ada != 1: return
	var alp = null
	for n in oyun.kisiler:
		if str(n.K.k) == "alp": alp = n
	if alp == null or oyun.oyuncu.position.distance_to(alp.position) > 28.0: return
	var t := Time.get_ticks_msec() / 1000.0
	if t - son_vur < 0.2: return
	son_vur = t
	B += 1
	oyun.yazi(alp.position + Vector2(0, -18), str(B), Color("#ffd27a"), 9)
	if B < 50: return
	B = 0
	var por = load(alp.K.portre) if alp.K.get("portre", null) != null else null
	if BG == 0:
		BG = 1
		oyun.konusma.ac(alp.K.ad, por, "Tamam, tamam! Pes ediyorum! Yumrukların taş gibi olmuş evlat. Al, bu kemeri gençliğimde bir ayıdan kazanmıştım. Artık senin.",
			[{t = "Sağ ol, Börü", pri = true, kapat = true, f = func():
				oyun.env.ekle(BELT)
				oyun.almanak._ilan(BELT, "Börü pes etti")}])
	else:
		oyun.konusma.ac(alp.K.ad, por, "Yine mi? Kemerimi aldın ya! Git bir ağaca vur.", [{t = "Tamam", pri = true, kapat = true}])

# ------------------------------------------------------------------ 4 · 100. gecede yıldızlar
func yildizli() -> bool:
	var Z = oyun.zaman
	return oyun.ada == 1 and ((Z.dk >= 1200.0 and Z.gun % 100 == 0) or (Z.dk < 360.0 and Z.gun > 1 and (Z.gun - 1) % 100 == 0))

func _yildiz_ciz() -> void:
	var W := yildiz.size
	var t := Time.get_ticks_msec() / 1000.0
	for k in 120:
		var x := float((k * 733) % int(maxf(1.0, W.x)))
		var y := float((k * 389) % int(maxf(1.0, W.y)))
		var tw := 0.35 + 0.65 * absf(sin(t * (1.0 + (k % 5) * 0.3) + k))
		var z := 2.0 if k % 9 else 3.0
		yildiz.draw_rect(Rect2(x, y, z, z), Color("#ffffff" if k % 7 else "#d8b0ff", tw))

# ------------------------------------------------------------------ 5 · eski kamp ateşi
func _kamp_sec() -> void:
	C = null
	if oyun.ada != 1: return
	var Kk := _kemal()
	var h := Vector2(float(Kk.get("x", 0)), float(Kk.get("y", 0)))
	for k in 3000:
		var p := Vector2((oyun.bx0 + randi() % int(oyun.bw) + 0.5) * 16, (oyun.by0 + randi() % int(oyun.bh) + 0.5) * 16)
		if oyun.su_mu(oyun.tile_at(p)) or p.distance_to(h) < 120.0 * 16.0: continue
		if oyun.bio_at(p) < 0 or oyun.engel(p, 5.0) or oyun.engel(p + Vector2(14, 0), 5.0) or oyun.engel(p - Vector2(14, 0), 5.0): continue
		C = p
		return

# ------------------------------------------------------------------ 6 · inatçı balıkçı
func olta(p: Vector2) -> void:
	if F != 0: return
	if FS.p != null and p.distance_to(FS.p) < 24.0: FS.n += 1
	else:
		FS.p = p; FS.n = 1
	if FS.n < 100: return
	F = 1
	get_tree().create_timer(0.7).timeout.connect(func():
		for k in 14: oyun.parca(p, Vector2(randf_range(-25, 25), -30 - randf() * 40), 0.7, Color("#9fd0f0") if k % 2 else Color.WHITE)
		oyun.konusma.ac("Yaşlı balık", oyun.env.ikon_al("Alabalık"), "Yüz kez! Yüz kez aynı yere attın oltayı! Ben bu suyun en yaşlısıyım; seni artık tanıyorum. Ama beni yakalayamazsın, inatçı. Hoşça kal!", [{t = "…", pri = true, kapat = true}]))

# ------------------------------------------------------------------ 7 · gece 03:00 (cihazın saati) Kemal
func kemal_saat(metin: String) -> String:
	if told3: return metin
	if int(Time.get_datetime_dict_from_system().hour) != 3: return metin
	told3 = true
	return "Bu saatte uyanık mısın evlat? Git yat.\n\n" + metin

# ------------------------------------------------------------------ 8 · Devam ederken bir satır
func devam_satiri() -> void:
	var i := int(D.get("line", 0)) % LINES.size()
	D.line = i + 1
	_cihaz_kaydet()
	await get_tree().create_timer(2.6).timeout
	satir.text = LINES[i]
	satir_t = 4.0

# ------------------------------------------------------------------ 9 · Seni hatırlıyorum: aynı karakterle yeni oyun
## Kemal adını duyunca: 0 ilk kez, 1 ikinci kez, 2 üçüncü ve sonrası; karakter cihaza yazılır (en çok 30)
func hatirla(ad: String) -> int:
	var look := JSON.stringify(oyun.gorunus)
	var key := ad.strip_edges().to_lower()
	var n := 0
	var L: Array = D.chars
	for c in L:
		if str(c[0]) == look and str(c[1]) == key:
			n = int(c[2]); c[2] = n + 1
			_cihaz_kaydet()
			return mini(n, 2)
	L.append([look, key, 1])
	while L.size() > 30: L.pop_front()
	_cihaz_kaydet()
	return 0

# ------------------------------------------------------------------ dans
func dansta() -> bool:
	return DANS.on

var bas_once := false

## sol, sağ ×3 (basışlar arası en çok 0,6 sn, hepsi 3 sn içinde, yerinden oynamadan) dansı başlatır; başka herhangi bir basış bitirir
func _dans_girdi() -> void:
	var bas := Input.is_anything_pressed()
	var yeni_bas := bas and not bas_once
	bas_once = bas
	var sol := Input.is_action_just_pressed("sol")
	var sag := Input.is_action_just_pressed("sag")
	if DANS.on:
		if yeni_bas or sol or sag:
			DANS.on = false; DANS.seq = []
		return
	if not sol and not sag:
		if yeni_bas: DANS.seq = []
		return
	var t := Time.get_ticks_msec() / 1000.0
	var c := "L" if sol else "R"
	var L: Array = DANS.seq
	if L.size() > 0 and (t - float(L[L.size() - 1].t) > 0.6 or L[L.size() - 1].c == c): DANS.seq = []
	if DANS.seq.is_empty(): DANS.p = oyun.oyuncu.position
	DANS.seq.append({c = c, t = t})
	if DANS.seq.size() >= 6 and DANS.seq[0].c == "L" and t - float(DANS.seq[0].t) < 3.0 and oyun.oyuncu.position.distance_to(DANS.p) < 40.0:
		DANS.on = true; DANS.acc = 0.0; DANS.seq = []; DANS.p = oyun.oyuncu.position
	elif DANS.seq.size() >= 6:
		DANS.seq = DANS.seq.slice(DANS.seq.size() - 5)

# ------------------------------------------------------------------ her kare
func _process(dt: float) -> void:
	if oyun == null: return
	if satir_t > 0.0:
		satir_t -= dt
		satir.modulate.a = clampf(minf(4.0 - satir_t, satir_t), 0.0, 1.0)
	if oyun.basta or oyun.arena != null: return
	if not hazir:
		hazir = true
		if SP.is_empty(): _yol_kur({})
		if C == null: _kamp_sec()
	var P = oyun.oyuncu
	var acik_pencere: bool = oyun.konusma.visible or get_tree().paused
	# deniz yolunun sonu
	if son.x >= 0 and not busy and not acik_pencere and Vector2i(int(floor(P.position.x / 16.0)), int(floor(P.position.y / 16.0))) == son:
		_yere_dus()
	# yıldızlar
	var yl: bool = yildizli() and not oyun.magara.icinde
	yildiz.visible = yl
	if yl:
		yildiz.queue_redraw()
		if yildiz_dedi != oyun.zaman.gun and oyun.zaman.dk >= 1200.0:
			yildiz_dedi = oyun.zaman.gun
			oyun.almanak._ilan("Gökyüzünde yıldızlar…", "Yıldızsız Ada'da bir gece")
	if acik_pencere:
		DANS.on = false
		return
	_dans_girdi()
	_klon(dt)
	# eski kamp ateşi
	if C != null and P.position.distance_to(C) < 40.0 and Time.get_ticks_msec() / 1000.0 > kamp_dedi:
		kamp_dedi = Time.get_ticks_msec() / 1000.0 + 60.0
		oyun.yazi(P.position + Vector2(0, -34), "Bu taşa… benim adım kazınmış: %s. Ben buraya ne zaman geldim?" % (oyun.ad_kahraman if oyun.ad_kahraman != "" else "…"), Color("#f3ecd8"), 9)
	# ayna: 10 sn hiçbir şey yapmadan, yüzün suya dönük
	var oynadi: bool = P.position.distance_to(lp) > 0.5 or oyun.toplama.is_.size() > 0 or not oyun.balik.fish.is_empty() or Input.is_anything_pressed()
	lp = P.position
	still = 0.0 if oynadi else still + dt
	var tm := Time.get_ticks_msec() / 1000.0
	if MIR == null and still >= 10.0 and tm > ayna_sonra:
		var f: Vector2 = P.bakis
		for r in [14.0, 22.0, 30.0]:
			var w: Vector2 = P.position + f * r + (Vector2.ZERO if f.y != 0.0 else Vector2(0, 4))
			if oyun.su_mu(oyun.tile_at(w)) and not oyun.kopru.ustunde(w) and not yolda(w):
				MIR = {p = w, t0 = tm}
				ayna_sonra = tm + 120.0
				ayna_spr.texture = Karakter.sayfa(oyun.sevgili)
				ayna_spr.frame = 0
				break
	if MIR != null:
		var g: float = tm - float(MIR.t0)
		ayna_spr.visible = true
		ayna_spr.position = MIR.p + Vector2(sin(tm * 4.0) * 1.5, 10)
		ayna_spr.modulate.a = maxf(0.0, minf(minf(1.0, g / 0.6), (3.0 - g) / 0.6)) * 0.5
		if g > 3.0:
			MIR = null; ayna_spr.visible = false
	# dans
	if DANS.on and P.position.distance_to(DANS.p) > 12.0: DANS.on = false
	if DANS.on:
		DANS.acc += dt
		P.spr.rotation = sin(tm * 9.0) * 0.18
		P.spr.position.y = -absf(sin(tm * 9.0)) * 3.0
		if randf() < dt * 2.5: oyun.yazi(P.position + Vector2(randf_range(-7, 7), -22), "♪", Color("#e8d8ff"), 10)
		if DANS.acc >= 20.0: _izleyiciler(dt)
	else:
		if P.spr.rotation != 0.0 and not DANS.on and DANS.acc > 0.0:
			P.spr.rotation = 0.0; P.spr.position.y = 0.0
		if DANS.acc > 0.0:
			DANS.acc = 0.0
			for c in oyun.canlilari_ver():
				if c.has_meta("dnc"): c.remove_meta("dnc")
	queue_redraw()
	nabiz.queue_redraw()

func _izleyiciler(dt: float) -> void:
	var P = oyun.oyuncu
	var G := []
	for c in oyun.canlilari_ver():
		if c.olu >= 0.0 or c.boss or c.has_meta("ys") or c.has_meta("reis") or c.D.temper == "saldırgan": continue
		if c.has_meta("dnc") or c.position.distance_to(P.position) < 300.0: G.append(c)
	for i in G.size():
		var c = G[i]
		c.set_meta("dnc", true)
		var an := float(i) / G.size() * TAU + 0.4
		var hd: Vector2 = P.position + Vector2(cos(an) * 50.0, sin(an) * 34.0)
		var v: Vector2 = hd - c.position
		if v.length() > 2.0: c.position += v.normalized() * minf(v.length(), 60.0 * dt)
		c.face = 1 if P.position.x > c.position.x else -1

# ------------------------------------------------------------------ gece beliren sevdiğin kişi
func _gece_dk() -> float:
	var dk: float = oyun.zaman.dk
	return dk - 1260.0 if dk >= 1260.0 else (dk + 180.0 if dk < 270.0 else -1.0)

func _klon(dt: float) -> void:
	var nm := _gece_dk()
	var mesgul: bool = oyun.ada != 1 or oyun.ev.acik or oyun.magara.icinde or oyun.kuzen.yol_t >= 0.0 or oyun.cine.acik
	if nm >= 0.0:
		var key: int = oyun.zaman.gun if oyun.zaman.dk >= 1200.0 else oyun.zaman.gun - 1
		if K.gece != key:
			K.gece = key; K.at = (randi() % 440) if randf() < 0.4 else -1; K.sayildi = false
		if not K.on and K.at >= 0 and nm >= K.at and not mesgul:
			var s = _klon_yer()
			if s != null:
				K.at = -1; K.on = true; K.p = s; K.d0 = oyun.oyuncu.position.distance_to(s); K.yas = 0.0
				var L: Dictionary = oyun.sevgili.duplicate()
				L.eye = "#d070ff"
				klon_spr.texture = Karakter.sayfa(L)
				klon_ad.text = oyun.ad_sevgili
	if not K.on:
		klon_spr.visible = false
		return
	if mesgul or nm < 0.0:
		_klon_git(false); return
	K.yas += dt
	if not K.sayildi and K.yas >= 0.6:
		K.sayildi = true
		D.klonN = int(D.get("klonN", 0)) + 1
		_cihaz_kaydet()
		if int(D.klonN) >= 5: oyun.basarim.bayrak("klon")
	var d: float = oyun.oyuncu.position.distance_to(K.p)
	if d < K.d0 - 14.0 or K.yas > 25.0:
		_klon_git(true); return
	klon_spr.visible = true
	klon_spr.position = K.p
	klon_spr.modulate.a = minf(1.0, K.yas / 0.25)
	var v: Vector2 = oyun.oyuncu.position - K.p
	klon_spr.frame = 0 if absf(v.y) >= absf(v.x) and v.y > 0 else (4 * 5 if absf(v.y) >= absf(v.x) else (2 * 5 if v.x > 0 else 6 * 5))
	if randf() < dt * 6.0: oyun.parca(K.p + Vector2(randf_range(-8, 8), -4), Vector2(0, -20), 1.0, Color("#e0b0ff") if randf() < 0.5 else Color("#a050ff"))

func _klon_yer():
	var P: Vector2 = oyun.oyuncu.position
	for k in 60:
		var a := randf() * TAU
		var r := 100.0 + randf() * 40.0
		var p := P + Vector2(cos(a), sin(a)) * r
		if oyun.su_mu(oyun.tile_at(p)) or oyun.engel(p, 5.0): continue
		return p
	return null

func _klon_git(duman: bool) -> void:
	if not K.on: return
	K.on = false
	klon_spr.visible = false
	if duman:
		for k in 10: oyun.parca(K.p + Vector2(randf_range(-4, 4), -6 - randf() * 10), Vector2(randf_range(-15, 15), -10 - randf() * 20), 0.45, Color("#c070ff") if k % 2 else Color("#5a2a8a"))

## Kalp atışını ekranda göster (Ayarlar): sevdiğin kişi göründükçe 0,9 sn'de bir "güm-güm", ekranın kenarları mor nabız
func _nabiz_ciz() -> void:
	if not (K.on and Ayarlar.kalp) or get_tree().paused or oyun.konusma.visible: return
	var t := fmod(Time.get_ticks_msec() / 1000.0, 0.9)
	var k := maxf(exp(-t * 14.0), exp(-maxf(0.0, t - 0.18) * 14.0) * (1.0 if t >= 0.18 else 0.0))
	var W := nabiz.size
	var c := Color(0.6, 0.25, 0.95, 0.45 * k)
	for i in 8:
		var a := c; a.a *= 1.0 - i / 8.0
		var d := float(i) * 6.0
		nabiz.draw_rect(Rect2(d, d, W.x - 2.0 * d, W.y - 2.0 * d), a, false, 6.0)

func klon_isik() -> bool:
	return K.on

# ------------------------------------------------------------------ çizim: deniz yolu (deneme için turkuaz), eski kamp ateşi, sevdiğin kişinin halesi
func _draw() -> void:
	if oyun == null: return
	var tm := Time.get_ticks_msec() / 1000.0
	var cam: Vector2 = oyun.oyuncu.position
	for h in hucre:
		var x: float = h.x * 16.0; var y: float = h.y * 16.0
		if absf(x - cam.x) > 700.0 or absf(y - cam.y) > 500.0: continue
		draw_rect(Rect2(x, y, 16, 16), Color("#3cc8b0"))
		draw_rect(Rect2(x, y, 16, 1), Color("#7ae8d4"))
		draw_rect(Rect2(x + 3, y + 5 + ((int(tm * 2.0) + h.x + h.y) % 3) * 3, 6, 1), Color("#9af0e0"))
	if C != null and C.distance_to(cam) < 700.0:
		var x := roundf(C.x); var y := roundf(C.y)
		draw_set_transform(Vector2(x, y), 0, Vector2(1, 0.5))
		draw_circle(Vector2.ZERO, 10.0, Color(40 / 255.0, 34 / 255.0, 30 / 255.0, 0.55))
		draw_set_transform(Vector2.ZERO)
		for k in 8:
			var a := k / 8.0 * TAU
			draw_rect(Rect2(x + roundf(cos(a) * 10) - 1, y + roundf(sin(a) * 5) - 1, 3, 2), Color("#5a5650") if k % 2 else Color("#3a3632"))
		draw_rect(Rect2(x - 5, y - 1, 10, 2), Color("#2a1a10")); draw_rect(Rect2(x - 3, y - 2, 6, 1), Color("#4a3a2a")); draw_rect(Rect2(x - 1, y - 1, 2, 1), Color("#6a6a6a"))
		draw_rect(Rect2(x + 15, y - 9, 9, 10), Color("#3a3a40")); draw_rect(Rect2(x + 16, y - 10, 7, 1), Color("#5a5a62")); draw_rect(Rect2(x + 16, y - 9, 7, 9), Color("#6a6a72"))
		for k in 5: draw_rect(Rect2(x + 17 + (k % 3) * 2, y - 7 + (k / 3) * 3, 1, 2), Color("#2a2a30"))
	if K.on:
		var a2: float = minf(1.0, K.yas / 0.25) * (0.35 + 0.15 * sin(tm * 3.0))
		for i in 6:
			var kk := 1.0 - i / 6.0
			draw_circle(K.p + Vector2(0, -14), 15.0 * kk, Color(0.8, 0.45, 1.0, a2 * 0.25))
