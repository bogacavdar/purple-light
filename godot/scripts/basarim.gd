extends CanvasLayer
## Başarımlar (web v71 ve sonrası; belge Başarımlar). 49 başarım, cihaza kaydedilir (bütün kayıt yuvaları için ortak: user://basarim.json).
## Kazanılınca kart ekranın ortasında 3,6 sn kalır (tıklayınca hemen kaybolur, sıradaki gelir). Küçük haritanın üstündeki "Başarımlar"
## düğmesi listeyi açar: gizliler kazanılana kadar ???; ötekiler adı, ne yapılacağı ve ilerlemesiyle soluk; kazanılınca altın, bakılmadıysa "Yeni".

var oyun
const YOL := "user://basarim.json"
# [id, ad, nasıl, simge]
const ACH := [
	["tarif1", "İlk tarif", "Kazanda ilk tarifini öğren.", "Keskin taş"],
	["gece1", "İlk gün", "İlk günü ve geceyi hayatta atlat.", "Meşale"],
	["tarif25", "Meraklı çırak", "25 tarif bul.", "Kaba meşale"],
	["av1", "İlk av", "Bir hayvan avla.", "Yaban domuzu dişi"],
	["kopru", "Köprücü", "Bir köprüyü onar.", "Sert odun kalası"],
	["hafta", "Bir hafta", "7. güne ulaş.", "Hasır yatak"],
	["kopek", "Sadık dost", "Bir robot köpeğin olsun.", "Kemik"],
	["balik", "Balıkçı", "10 balık tut.", "Alabalık"],
	["lvl10", "Tecrübeli", "Seviye 10 ol.", "Ametist"],
	["gorev10", "Yardımsever", "10 yan görev bitir.", "İp"],
	["zengin", "Kesesi dolu", "Aynı anda 1000 Vio'n olsun.", "Gümüş külçesi"],
	["tarif100", "Kazan ustası", "100 tarif bul.", "Ay otu"],
	["kurt", "Kurt avcısı", "10 kurt avla.", "Kurt dişi"],
	["kesif", "Kâşif", "Adanın yarısını keşfet.", "Buğday"],
	["iz", "İz sürücü", "Eşinden kalan bütün izleri bul.", "Mor kıymık"],
	["ani", "Hatırladım", "Bütün anılarını geri getir.", "Mor sarmaşık"],
	["ani1", "İlk anı", "Bir anını geri getir.", "Papatya"],
	["ani11", "Anılar dönüyor", "ACT 1'in 11 anısını geri getir.", "Lavanta"],
	["ani22", "Tanıştığımız günden beri", "ACT 1'in 22 anısının hepsini geri getir.", "Gece zambağı"],
	["ay", "Adada bir ay", "30. güne ulaş.", "Ay taşı"],
	["ejder", "Ejder avcısı", "Kül Diyarı'nın kara ejderini yen.", "Ejder kemiği"],
	["lvl25", "Ada efsanesi", "Seviye 25 ol.", "Altın külçesi"],
	["tarif250", "Yaşayan ansiklopedi", "250 tarif bul.", "Kristal"],
	["levent", "Kazazede", "Denizci Barbaros'un yeni gemisini kur.", "Halat"],
	["roket", "Gökyüzüne", "Gökay ile roketi fırlat.", "Roket"],
	["act2", "Açık deniz", "Barbaros'un gemisiyle adadan ayrıl: ACT 2.", "Kristal ipek"],
	["olum1", "İlk düşüş", "Bir kez bayıl.", "Kül"],
	["olum5", "İnatçı", "5 kez bayıl, yine de devam et.", "Gölge otu"],
	["reis1", "İlk reis", "Bir reis öldür.", "Kemik miğfer"],
	["reis5", "Reis avcısı", "5 farklı reis öldür.", "Tunç miğfer"],
	["reis10", "Reislerin korkusu", "10 farklı reis öldür.", "Demir miğfer"],
	["reis20", "Reis yiyen", "20 farklı reis öldür.", "Demir zırh"],
	["reishep", "Bütün reisler", "Oyunda öldürülebilecek bütün reisleri öldür.", "Ejder zırhı"],
	["kaya", "Yol açıcı", "Doğu geçidindeki kayaları patlat.", "Kaya patlatıcı"],
	["tariftum", "Her şeyi bilen", "Bütün tarifleri bul.", "Kristal çiçeği"],
	["toplatum", "Toplayıcı", "İki adada yerden toplanabilen her çeşitten en az birini topla.", "Böğürtlen"],
	["iyison", "Yeniden birlikte", "Oyunu iyi sonla bitir.", "Yıldız çiçeği"],
	["kotuson", "Yalnız dönüş", "Oyunu kötü sonla bitir.", "Gece zambağı"],
	["madentum", "Maden kâşifi", "İki adadaki her madenden en az birini kaz.", "Bakır cevheri"],
	["agactum", "Oduncu", "İki adadaki her ağaç türünden en az birini kes.", "Taş balta"],
	["canlitum", "Avcıların avcısı", "İki adadaki her canlı türünden en az birini öldür.", "Kürk yelek"],
	["dusentum", "Ganimet avcısı", "Canlılardan düşebilecek her eşyayı en az bir kez elde et.", "Tavşan derisi"],
	["hile", "Oyunlardaki gibi", "Ana menüde \"cheat\" yazdın: hile modu açıldı.", "Mor pusula"],
	["klon", "Mor ışıkta o", "Gece beliren sevdiğin kişiyi 5 farklı gecede gördün.", "Gece zambağı"],
	["gorunmez", "Görünmezlik iksiri", "Zümrüt'ün sabrını üç kez taşırdın.", "Mor yosun"],
	["konuk", "Konuk", "Mor ışığın konuklarına dokunmadın.", "Mor kıymık"],
	["deniz", "Denizde yürüyen", "Denizin üstünde yürüdün.", "Mor yosun"],
	["kehribar", "Kehribar gözlüm", "Sevdiğin kişiyi kehribar gözlü yarat ve ACT 1'i tamamla.", "Kehribar kolye"],
	["platin", "Platin", "Bütün başarımları kazan.", "*platin"]]
const NOPLAT := ["platin", "kehribar", "deniz"]
const GIZLI := ["iz", "ani", "ejder", "levent", "roket", "act2", "iyison", "kotuson", "hile", "kaya", "kopru", "kehribar", "deniz", "klon", "gorunmez", "konuk"]

var got := {}            # id → true (cihaz)
var seen := {}           # bakılmış (cihaz)
var KS := {}             # öldürülen türler (cihaz)
var IS := {}             # elde edilen eşyalar (cihaz)
var TS := {}             # kesilen ağaç türleri (cihaz)
var GS := {}             # yerden toplanan çeşitler (cihaz)
var bayraklar := {}      # hile, klon, gorunmez, konuk, deniz, iyison (cihaz)
var PB := {}             # en iyi ilerleme (cihaz)
var bayilma := 0         # bu kayıttaki bayılma sayısı
var L_anim: Array = []
var L_boss: Array = []
var L_ore: Array = []
var L_tree: Array = []
var L_gath: Array = []
var L_drop: Array = []

var dugme: Button
var rozet: Label
var kart: PanelContainer
var kart_ic: Label
var kart_ad: Label
var kart_tr: TextureRect
var kart_t := 0.0
var kuyruk: Array = []
var pen: ColorRect
var izgara: GridContainer
var ust_yazi: Label
var t_chk := 0.0
var degisti := false
var plat_tx: Texture2D

func kur(o) -> void:
	oyun = o
	layer = 31
	process_mode = Node.PROCESS_MODE_ALWAYS
	_yukle_cihaz()
	_listeler()
	plat_tx = _platin()
	_arayuz()

# ------------------------------------------------------------------ iki adanın listeleri (veriden)
func _json(p: String):
	if not FileAccess.file_exists(p): return null
	return JSON.parse_string(FileAccess.get_file_as_string(p))

func _listeler() -> void:
	var anim := {}
	var drops := {}
	var dosyalar := []
	for b in ["cayir", "orman", "bataklik", "kayalik", "kul", "kristal"]: dosyalar.append("res://data/canlilar_%s.json" % b)
	for i in 6: dosyalar.append("res://data/ada2/canlilar_%d.json" % i)
	for f in dosyalar:
		var J = _json(f)
		if J == null: continue
		for k in J.canlilar:
			var D: Dictionary = J.canlilar[k]
			if bool(D.get("boss", false)): continue
			anim[k] = true
			for d in D.get("drops", []): drops[str(d.n)] = true
	L_anim = anim.keys()
	for k in L_anim:
		if k != "Kara ejder": L_boss.append(k)
	L_drop = drops.keys()
	var ores := {}
	var gath := {}
	var trees := {}
	for f in ["res://data/toplama.json", "res://data/ada2/toplama_ek.json"]:
		var J = _json(f)
		if J == null: continue
		for n in J.nodes:
			gath[n] = true
			if bool(J.nodes[n].get("mine", false)): ores[n] = true
		for t in J.trees:
			if not bool(J.trees[t].get("noCut", false)): trees[t] = true
	L_ore = ores.keys(); L_gath = gath.keys(); L_tree = trees.keys()

# ------------------------------------------------------------------ kancalar
func oldurdu(k: String) -> void:
	if not KS.has(k): KS[k] = true; degisti = true

func esya(n: String) -> void:
	if not IS.has(n): IS[n] = true; degisti = true

func agac(n: String) -> void:
	if not TS.has(n): TS[n] = true; degisti = true

func topladi(n: String) -> void:
	if not GS.has(n): GS[n] = true; degisti = true

func bayildi() -> void:
	bayilma += 1

func bayrak(k: String) -> void:
	if not bayraklar.has(k):
		bayraklar[k] = true; degisti = true
	_denetle()

# ------------------------------------------------------------------ koşullar
func _found() -> int:
	return oyun.el_yapimi.bilinen.size()

func _fish() -> int:
	var n := 0
	for b in oyun.balik.BALIKLAR: n += int(oyun.gorev.qc.get("fish:" + b, 0))
	for k in oyun.poyraz.caught: n += int(oyun.poyraz.caught[k])
	return n

func _reis_n() -> int:
	var n := 0
	for k in oyun.reis.bd:
		if bool(oyun.reis.bd[k]): n += 1
	return n

func _a1() -> int:
	var n := 0
	for a in oyun.ani._a1():
		if oyun.ani.mems.has(a.n): n += 1
	return n

func _say(L: Array, S: Dictionary) -> int:
	var n := 0
	for x in L:
		if S.has(x): n += 1
	return n

func _gath_ok(n: String) -> bool:
	return GS.has(n)

## [şimdi, hedef] ya da boş
func ilerleme(id: String) -> Array:
	var fl := _found()
	var gun: int = oyun.zaman.gun
	match id:
		"tarif1": return [fl, 1]
		"tarif25": return [fl, 25]
		"tarif100": return [fl, 100]
		"tarif250": return [fl, 250]
		"tariftum": return [fl, oyun.el_yapimi.R.size()]
		"gece1": return [gun - 1, 1]
		"hafta": return [gun, 7]
		"ay": return [gun, 30]
		"lvl10": return [int(oyun.env.sv), 10]
		"lvl25": return [int(oyun.env.sv), 25]
		"balik": return [_fish(), 10]
		"kurt": return [int(oyun.gorev.kills.get("Kurt", 0)), 10]
		"gorev10": return [oyun.yan.done.size(), 10]
		"zengin": return [int(oyun.env.vio), 1000]
		"kesif": return [int(oyun.harita.yuzde()), 50]
		"iz": return [oyun.iz.sayi(), 6]
		"ani": return [oyun.ani.mems.size(), oyun.ani.A.size()]
		"ani1": return [mini(1, oyun.ani.mems.size()), 1]
		"ani11": return [mini(11, _a1()), 11]
		"ani22": return [_a1(), 22]
		"olum1": return [bayilma, 1]
		"olum5": return [bayilma, 5]
		"reis1": return [_reis_n(), 1]
		"reis5": return [_reis_n(), 5]
		"reis10": return [_reis_n(), 10]
		"reis20": return [_reis_n(), 20]
		"reishep":
			var n := 0
			for k in L_boss:
				if bool(oyun.reis.bd.get(k, false)): n += 1
			return [n, L_boss.size()]
		"toplatum": return [_say(L_gath, GS), L_gath.size()]
		"madentum": return [_say(L_ore, GS), L_ore.size()]
		"agactum": return [_say(L_tree, TS), L_tree.size()]
		"canlitum": return [_say(L_anim, KS), L_anim.size()]
		"dusentum": return [_say(L_drop, IS), L_drop.size()]
		"platin":
			var a := 0
			var b := 0
			for A in ACH:
				if NOPLAT.has(A[0]): continue
				b += 1
				if got.has(A[0]): a += 1
			return [a, b]
	return []

func _kosul(id: String) -> bool:
	match id:
		"av1": return not oyun.gorev.kills.is_empty()
		"kopru":
			for k in oyun.kopru.K:
				if bool(k.fixed): return true
			return false
		"kopek": return oyun.gezgin.kopekler.size() > 0
		"zengin": return int(oyun.env.vio) >= 1000 and not bool(oyun.get_meta("sonsuz_vio", false))
		"ejder": return int(oyun.gorev.kills.get("Kara ejder", 0)) > 0
		"levent": return oyun.yan.done.has("dz4")
		"roket": return oyun.kuzen.tanis.has("roket")
		"act2": return oyun.ada == 2
		"kaya": return bool(oyun.gecit.acik)
		"iyison", "hile", "klon", "gorunmez", "konuk", "deniz": return bayraklar.has(id)
		"kotuson": return false
		"kehribar": return str(oyun.sevgili.get("eye", "")) == "#a6620c" and oyun.ada == 2
	var p: Array = ilerleme(id)
	if not p.is_empty(): return int(p[1]) > 0 and int(p[0]) >= int(p[1])
	return false

func _denetle() -> void:
	if oyun.basta or (oyun.has_method("arena_mi") and oyun.arena_mi()): return
	if oyun.ys.konuk: bayraklar["konuk"] = true
	if oyun.roket.faz == "son": bayraklar["iyison"] = true
	for A in ACH:
		var id: String = A[0]
		if got.has(id): continue
		if _kosul(id): kazan(id)
	# en iyi ilerleme cihazda kalır
	for A in ACH:
		var p: Array = ilerleme(A[0])
		if p.is_empty(): continue
		var b = PB.get(A[0], null)
		if b == null or int(p[0]) > int(b[0]):
			PB[A[0]] = [int(p[0]), int(p[1])]; degisti = true

func kazan(id: String) -> void:
	if got.has(id): return
	got[id] = Time.get_unix_time_from_system()
	degisti = true
	for A in ACH:
		if A[0] == id: kuyruk.append(A)
	_rozet()
	_kaydet_cihaz()

# ------------------------------------------------------------------ cihaz kaydı
func _yukle_cihaz() -> void:
	var J = _json(YOL)
	if J == null: return
	for k in J.get("got", {}): got[k] = J.got[k]
	for k in J.get("seen", []): seen[k] = true
	for k in J.get("kill", []): KS[k] = true
	for k in J.get("items", []): IS[k] = true
	for k in J.get("tree", []): TS[k] = true
	for k in J.get("gath", []): GS[k] = true
	for k in J.get("bayrak", []): bayraklar[k] = true
	PB = J.get("pb", {})

func _kaydet_cihaz() -> void:
	degisti = false
	var f := FileAccess.open(YOL, FileAccess.WRITE)
	if f == null: return
	f.store_string(JSON.stringify({got = got, seen = seen.keys(), kill = KS.keys(), items = IS.keys(), tree = TS.keys(), gath = GS.keys(), bayrak = bayraklar.keys(), pb = PB}))

func kayit() -> Dictionary:
	return {f = bayilma}

func yukle(d: Dictionary) -> void:
	bayilma = int(d.get("f", 0))

# ------------------------------------------------------------------ arayüz
func _stil(bg: Color, kenar: Color, k := 2) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = bg; s.border_color = kenar; s.set_border_width_all(k)
	s.content_margin_left = 6; s.content_margin_right = 6; s.content_margin_top = 4; s.content_margin_bottom = 4
	return s

func _platin() -> Texture2D:
	var im := Image.create(16, 16, false, Image.FORMAT_RGBA8)
	var C := [Color("#8a96b8"), Color("#e8eef8"), Color("#c8d2e8")]
	for y in 16:
		for x in 16:
			var c = null
			if y < 5 and (x in [3, 4, 5, 10, 11, 12]): c = C[0]
			elif y >= 2 and y < 11 and x >= 4 and x < 12: c = C[1] if (x + y) % 5 else C[2]
			elif y >= 11 and y < 13 and x >= 7 and x < 9: c = C[0]
			elif y >= 13 and x >= 4 and x < 12: c = C[0]
			if c != null: im.set_pixel(x, y, c)
	return ImageTexture.create_from_image(im)

func _ikon(A: Array) -> Texture2D:
	if A[3] == "*platin": return plat_tx
	return oyun.env.ikon_al(A[3])

func _arayuz() -> void:
	dugme = Button.new()
	dugme.text = "Başarımlar"
	dugme.focus_mode = Control.FOCUS_NONE
	dugme.add_theme_font_size_override("font_size", 13)
	dugme.add_theme_stylebox_override("normal", _stil(Color(0.24, 0.19, 0.05, 0.9), Color("#a87a1a")))
	dugme.add_theme_stylebox_override("hover", _stil(Color(0.32, 0.25, 0.07, 0.95), Color("#f2c84b")))
	dugme.add_theme_stylebox_override("pressed", _stil(Color(0.32, 0.25, 0.07, 0.95), Color("#f2c84b")))
	dugme.pressed.connect(ac)
	oyun.hud.add_child(dugme)
	rozet = Label.new()
	rozet.add_theme_font_size_override("font_size", 12)
	rozet.add_theme_stylebox_override("normal", _stil(Color("#d03a2a"), Color("#3a0a08"), 1))
	rozet.position = Vector2(-10, -12)
	rozet.visible = false
	dugme.add_child(rozet)
	# kazanınca ortada çıkan kart
	kart = PanelContainer.new()
	kart.add_theme_stylebox_override("panel", _stil(Color("#2a2008"), Color("#f2c84b"), 3))
	kart.set_anchors_preset(Control.PRESET_CENTER)
	kart.custom_minimum_size = Vector2(200, 180)
	kart.position = Vector2(-100, -150)
	kart.pivot_offset = Vector2(100, 90)
	kart.visible = false
	kart.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed:
			kart_t = 0.0
			kart.accept_event())
	add_child(kart)
	var kv := VBoxContainer.new()
	kv.alignment = BoxContainer.ALIGNMENT_CENTER
	kart.add_child(kv)
	kart_tr = TextureRect.new()
	kart_tr.custom_minimum_size = Vector2(64, 64)
	kart_tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	kart_tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	kart_tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kv.add_child(kart_tr)
	kart_ic = Label.new()
	kart_ic.text = "BAŞARIM KAZANILDI"
	kart_ic.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	kart_ic.add_theme_color_override("font_color", Color("#f2c84b"))
	kart_ic.add_theme_font_size_override("font_size", 11)
	kv.add_child(kart_ic)
	kart_ad = Label.new()
	kart_ad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	kart_ad.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	kart_ad.add_theme_color_override("font_color", Color("#ffe7a0"))
	kart_ad.add_theme_font_size_override("font_size", 17)
	kv.add_child(kart_ad)
	# liste
	pen = ColorRect.new()
	pen.color = Color(0.02, 0.03, 0.02, 0.72)
	pen.set_anchors_preset(Control.PRESET_FULL_RECT)
	pen.visible = false
	pen.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT: kapat())
	add_child(pen)
	var kutu := PanelContainer.new()
	kutu.add_theme_stylebox_override("panel", _stil(Color("#1a2216"), Color("#f2c84b"), 3))
	kutu.set_anchors_preset(Control.PRESET_CENTER)
	kutu.custom_minimum_size = Vector2(700, 540)
	kutu.position = Vector2(-350, -270)
	kutu.gui_input.connect(func(_e): kutu.accept_event())
	pen.add_child(kutu)
	var dik := VBoxContainer.new()
	kutu.add_child(dik)
	var ust := HBoxContainer.new()
	dik.add_child(ust)
	var bl := Label.new()
	bl.text = "Başarımlar"
	bl.add_theme_color_override("font_color", Color("#f2c84b"))
	bl.add_theme_font_size_override("font_size", 20)
	ust.add_child(bl)
	ust_yazi = Label.new()
	ust_yazi.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ust_yazi.add_theme_font_size_override("font_size", 13)
	ust.add_child(ust_yazi)
	var x := Button.new()
	x.text = "X"; x.focus_mode = Control.FOCUS_NONE
	x.pressed.connect(kapat)
	ust.add_child(x)
	var sk := ScrollContainer.new()
	sk.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sk.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	dik.add_child(sk)
	izgara = GridContainer.new()
	izgara.columns = 5
	izgara.add_theme_constant_override("h_separation", 8)
	izgara.add_theme_constant_override("v_separation", 8)
	sk.add_child(izgara)

func acik() -> bool:
	return pen.visible

func ac() -> void:
	_denetle()
	pen.visible = true
	get_tree().paused = true
	_ciz()

func kapat() -> void:
	pen.visible = false
	get_tree().paused = false
	_rozet()

func _yeni(id: String) -> bool:
	return got.has(id) and not seen.has(id)

func _ciz() -> void:
	for c in izgara.get_children(): c.queue_free()
	ust_yazi.text = "   %d / %d kazanıldı" % [got.size(), ACH.size()]
	for A in ACH:
		var id: String = A[0]
		var on := got.has(id)
		var gizli := GIZLI.has(id) and not on
		var c := PanelContainer.new()
		c.custom_minimum_size = Vector2(124, 124)
		c.add_theme_stylebox_override("panel", _stil(Color("#3a2c08") if on else Color("#202a1c"), Color("#f2c84b") if on else Color("#3a4a32")))
		var v := VBoxContainer.new()
		v.alignment = BoxContainer.ALIGNMENT_CENTER
		c.add_child(v)
		var tr := TextureRect.new()
		tr.custom_minimum_size = Vector2(40, 40)
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		if not gizli: tr.texture = _ikon(A)
		if not on: tr.modulate = Color(0.75, 0.75, 0.75, 0.5)
		v.add_child(tr)
		var ad := Label.new()
		ad.text = "???" if gizli else (str(A[1]) + ("  · Yeni" if _yeni(id) else ""))
		ad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ad.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		ad.add_theme_font_size_override("font_size", 12)
		ad.add_theme_color_override("font_color", Color("#f2c84b") if on else Color("#c8c0a8"))
		v.add_child(ad)
		var p: Array = ilerleme(id)
		var b = PB.get(id, null)
		if not p.is_empty() and b != null and int(b[0]) > int(p[0]): p = b
		if not on and not gizli and not p.is_empty() and int(p[1]) > 1:
			var pr := ProgressBar.new()
			pr.custom_minimum_size = Vector2(100, 6)
			pr.max_value = int(p[1]); pr.value = clampi(int(p[0]), 0, int(p[1]))
			pr.show_percentage = false
			v.add_child(pr)
			var pl := Label.new()
			pl.text = "%d / %d" % [clampi(int(p[0]), 0, int(p[1])), int(p[1])]
			pl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			pl.add_theme_font_size_override("font_size", 10)
			v.add_child(pl)
		c.tooltip_text = "Gizli başarım" if gizli else str(A[2])
		if _yeni(id):
			c.mouse_entered.connect(func():
				seen[id] = true
				ad.text = str(A[1])
				_kaydet_cihaz()
				_rozet())
		izgara.add_child(c)

func _rozet() -> void:
	var n := 0
	for A in ACH:
		if _yeni(A[0]): n += 1
	rozet.text = " %d " % n
	rozet.visible = n > 0

func _process(dt: float) -> void:
	if oyun == null: return
	var alm = oyun.almanak
	if alm != null and alm.dugme != null:
		dugme.size.y = alm.dugme.size.y
		dugme.position = Vector2(alm.dugme.position.x - dugme.size.x - 6, alm.dugme.position.y)
	dugme.visible = not oyun.basta and oyun.arena == null
	var nab := 0.5 + 0.5 * sin(Time.get_ticks_msec() / 1000.0 * TAU / 1.8)
	dugme.modulate = Color.WHITE.lerp(Color(1.2, 1.1, 0.8), nab) if rozet.visible else Color.WHITE
	t_chk -= dt
	if t_chk <= 0.0 and not get_tree().paused:
		t_chk = 1.0
		_denetle()
		if degisti: _kaydet_cihaz()
	# kart: 3,6 sn, hafifçe büyüyerek belirir
	if kart.visible:
		kart_t -= dt
		var gec := 3.6 - kart_t
		kart.scale = Vector2.ONE * (0.9 + 0.1 * minf(1.0, gec / 0.3))
		kart.modulate.a = clampf(minf(gec / 0.3, kart_t / 0.3), 0.0, 1.0)
		if kart_t <= 0.0: kart.visible = false
	elif not kuyruk.is_empty() and not oyun.basta:
		var A: Array = kuyruk.pop_front()
		kart_tr.texture = _ikon(A)
		kart_ad.text = str(A[1])
		kart_t = 3.6
		kart.visible = true
	if acik() and Input.is_action_just_pressed("ui_cancel"): kapat()
