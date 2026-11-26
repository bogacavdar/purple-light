## Gemici Poyraz ve deniz (web v234; belge ACT 1 › Gemici Poyraz ve deniz).
## İlk Olta'dan sonraki ilk 06:00'da Poyraz'ın teknesi uzak bir kumsala oturur (ph 1). G1–G4 tekneyi onarır (ph 2); sonra Poyraz seni
## denize götürür: 6 balık bölgesi (seviye + olta), deniz kendi ekranıdır (o sırada ada durur). G5–G10 deniz balığı ister.
extends Node2D

var oyun
var kapali := false       # ikinci adada Poyraz ve teknesi yoktur
var env
var V: Dictionary
const ZONES := [
	{id = 1, n = "Kıyı Suları", lv = 3, tier = 1, rod = "Olta", c = "#35b7c4", c2 = "#1f8a9a", sky = ["#9fd8f0", "#d8f0f8"], fish = [["Hamsi", 50], ["İstavrit", 33], ["Tekir", 17]]},
	{id = 2, n = "Rüzgârlı Körfez", lv = 6, tier = 2, rod = "Deniz oltası", c = "#3c8fd6", c2 = "#2a6aa8", sky = ["#8ac8f0", "#cfe8f8"], fish = [["Kefal", 50], ["Çipura", 33], ["Levrek", 17]]},
	{id = 3, n = "Mercan Sığlığı", lv = 10, tier = 3, rod = "Makaralı olta", c = "#2fb59a", c2 = "#1f8a78", sky = ["#a8e0e8", "#e8f8f0"], fish = [["Barbunya", 50], ["İstiridye", 33], ["Lüfer", 17]]},
	{id = 4, n = "Derin Mavi", lv = 14, tier = 4, rod = "Derin su oltası", c = "#1f4fa8", c2 = "#123a80", sky = ["#6aa8e0", "#b8d8f0"], fish = [["Palamut", 50], ["Mersin balığı", 33], ["Kalkan", 17]]},
	{id = 5, n = "Fırtına Denizi", lv = 18, tier = 5, rod = "Fırtına oltası", c = "#4a6a72", c2 = "#2e464c", sky = ["#4a5660", "#7a8690"], storm = true, fish = [["Kalamar", 50], ["Kılıç balığı", 33], ["Orkinos", 17]]},
	{id = 6, n = "Mor Derinlik", lv = 22, tier = 6, rod = "Yıldız oltası", c = "#5a2f8a", c2 = "#3a1a60", sky = ["#1a1030", "#3a2060"], glow = true, fish = [["Ahtapot", 50], ["Fener balığı", 33], ["Işıl balığı", 17]]}]
const HARD := {"Hamsi": 1.0, "İstavrit": 1.05, "Tekir": 1.15, "Kefal": 1.05, "Çipura": 1.15, "Levrek": 1.25, "Barbunya": 1.1, "İstiridye": 1.15, "Lüfer": 1.35,
	"Palamut": 1.2, "Mersin balığı": 1.7, "Kalkan": 1.4, "Kalamar": 1.25, "Kılıç balığı": 1.45, "Orkinos": 1.6, "Ahtapot": 1.35, "Fener balığı": 1.55, "Işıl balığı": 1.75}
const FT := {"Olta": 1, "Ağ": 1, "Kemik zıpkın": 1, "Deniz oltası": 2, "Makaralı olta": 3, "Derin su oltası": 4, "Fırtına oltası": 5, "Yıldız oltası": 6}
const GENIS := {"Ağ": 0.31, "Olta": 0.27, "Kemik zıpkın": 0.23, "Deniz oltası": 0.29, "Makaralı olta": 0.31, "Derin su oltası": 0.33, "Fırtına oltası": 0.35, "Yıldız oltası": 0.37}

var ph := 0
var gun_d := 0
var met := false
var caught := {}
var seen := {}
var koy: Dictionary
var n_kisi = null
var tekne: Node2D
var onarildi_dedi := false
# deniz
var denizde := false
var Z = null
var f = null
var log_: Array = []
var balik_g: Array = []
var sicra := -1.0
var t := 0.0
var kat: CanvasLayer
var harita: PanelContainer
var harita_liste: VBoxContainer
var deniz: Control
var d_ad: Label
var d_alt: Label
var d_yazi: Label
var d_ipucu: Label
var d_log: Label
var d_dugme: Button
var d_bar: Control
var kahraman: Sprite2D
var poyraz_s: Sprite2D

func kur(o) -> void:
	oyun = o
	env = o.env
	V = o._json("res://data/poyraz.json")
	koy = V.koy
	if o.ada == 2:
		kapali = true
		set_process(false)
		return
	process_mode = Node.PROCESS_MODE_ALWAYS
	for n in oyun.kisiler:
		if n.K.k == "trader": n_kisi = n
	tekne = Node2D.new()
	tekne.position = Vector2(koy.sx, koy.sy)
	tekne.draw.connect(_tekne_ciz)
	oyun.nesneler.add_child(tekne)
	_ui()

func ac() -> bool:
	return ph >= 1

# ------------------------------------------------------------------ kaza ve onarım
func _process(dt: float) -> void:
	t += dt
	if oyun.basta: return
	if denizde:
		_deniz_tik(dt)
		deniz.queue_redraw()
		return
	if get_tree().paused: return
	tekne.visible = ph >= 1
	tekne.queue_redraw()
	var z = oyun.zaman
	if ph == 0:
		if gun_d == 0 and (env.adet("Olta") > 0 or env.gorulen.has("Olta")):
			gun_d = z.gun if z.dk < 360.0 else z.gun + 1
		if gun_d > 0 and (z.gun > gun_d or (z.gun == gun_d and z.dk >= 360.0)) and not oyun.konusma.visible and not oyun.sahne.acik and not oyun.cine.acik:
			ph = 1
			env.mesaj("Uzak bir kıyıdan gürültü geldi · Bir tekne karaya oturmuş olmalı")
	elif ph == 1 and oyun.gorev.bitti("G4") and not oyun.konusma.visible:
		ph = 2
		env.mesaj("Deniz açıldı · Poyraz'ın teknesi onarıldı")
		get_tree().create_timer(1.2).timeout.connect(func():
			if n_kisi != null and not oyun.konusma.visible:
				_soyle("Bak hele! Yüzüyor! [i](tekneye vurup güler)[/i] Sana bir borcum var evlat. Balığa çıkmak istersen bana gel; bu sulara açılırız. Nereye istersen.", [{t = "Denize açılalım", pri = true, f = harita_ac}, {t = "Sonra", kapat = true}]))

## kaza yerindeki tekne geçilmez (web blocked)
func engel(p: Vector2) -> bool:
	if kapali: return false
	return ph >= 1 and absf(p.x - float(koy.sx)) < 26.0 and absf(p.y - float(koy.sy)) < 9.0

# ------------------------------------------------------------------ konuşma
func _soyle(metin: String, secs: Array) -> void:
	oyun.konusma.ac("Gemici Poyraz", load("res://art/kisiler/portre_poyraz.png"), metin, secs)

func konus(_n) -> void:
	if not met:
		met = true
		_soyle("Hey! Sağ mısın? Ben [b]Poyraz[/b], gemiciyim. Fırtına beni bu kıyıya fırlattı; teknem karaya oturdu, omurgası çatladı, yelkeni yırtıldı. Bu adayı hiç bilmem… Ama tekne yüzerse sana borcum olur.", [{t = "Nereden geliyorsun?", f = _hikaye}, {t = "Hoşça kal", pri = true, kapat = true}])
		return
	if ph >= 2:
		_soyle(["Rüzgâr iyi, deniz çağırıyor. Açılalım mı?", "Ağlar kurudu, olta hazır. Nereye gidiyoruz kaptan?", "Tuzlu bir sabah! Denize çıkalım mı evlat?"][randi() % 3],
			[{t = "Denize açılalım", pri = true, f = harita_ac}, {t = "Nereden geliyorsun?", f = _hikaye}, {t = "Hoşça kal", kapat = true}])
		return
	_soyle(["Tekne yüzmedikçe ben de bu kumdan kalkmam.", "Bir çivi, bir halat… Tekne yavaş yavaş toparlanıyor.", "Deniz beni buraya attı, sen de bana yardım ediyorsun. Kısmet."][randi() % 3], [{t = "Nereden geliyorsun?", f = _hikaye}, {t = "Hoşça kal", pri = true, kapat = true}])

func _hikaye() -> void:
	_soyle("Kırk yıldır denizdeyim. Ne liman sorarım ne ada; balık nerede, ben orada. Bu adanın sularını bilmem ama kokusunu aldım: dibinde hamsi, açığında kılıç balığı, en uzağında… mor bir ışık yanan bir derinlik. Teknem yüzsün, sana hepsini gösteririm.", [{t = "Anladım", pri = true, kapat = true}])

# ------------------------------------------------------------------ bölgeye erişim
func kademe() -> int:
	var k := 0
	for n in FT:
		if env.adet(n) > 0 and int(env.dayan.get(n, env.G.tools[n].dur if env.G.tools.has(n) else 1)) > 0: k = maxi(k, int(FT[n]))
	return k

func en_iyi() -> String:
	var b := ""
	var k := 0
	for n in FT:
		if env.adet(n) > 0 and int(env.dayan.get(n, env.G.tools[n].dur if env.G.tools.has(n) else 1)) > 0 and int(FT[n]) > k:
			k = int(FT[n]); b = n
	return b

func bolge_ok(z: Dictionary) -> bool:
	return ph >= 2 and env.sv >= int(z.lv) and kademe() >= int(z.tier)

func neden(z: Dictionary) -> String:
	if ph < 2: return "Poyraz'ın teknesi onarılmalı"
	if env.sv < int(z.lv): return "Seviye %d gerekli" % int(z.lv)
	if kademe() < int(z.tier): return "%s gerekli" % z.rod
	return ""

func bolge_of(n: String):
	for z in ZONES:
		for a in z.fish:
			if a[0] == n: return z
	return null

func _isteniyor() -> Dictionary:
	var out := {}
	var q = oyun.gorev.aktif
	if q == null: return out
	for p in q.p:
		if p[0] == "b" and bolge_of(str(p[1])) != null and env.adet(str(p[1])) < int(p[2]): out[str(p[1])] = true
	return out

# ------------------------------------------------------------------ arayüz: deniz haritası ve deniz ekranı
func _ui() -> void:
	kat = CanvasLayer.new()
	kat.layer = 7
	kat.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(kat)
	deniz = Control.new()
	deniz.set_anchors_preset(Control.PRESET_FULL_RECT)
	deniz.draw.connect(_deniz_ciz)
	deniz.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT: bas())
	deniz.visible = false
	kat.add_child(deniz)
	kahraman = Sprite2D.new(); kahraman.centered = false
	poyraz_s = Sprite2D.new(); poyraz_s.centered = false; poyraz_s.texture = load("res://art/kisiler/kisi_poyraz_q.png")
	deniz.add_child(poyraz_s); deniz.add_child(kahraman)
	var ust := HBoxContainer.new()
	ust.position = Vector2(10, 8)
	deniz.add_child(ust)
	var adk := VBoxContainer.new(); ust.add_child(adk)
	d_ad = _etiket(18, Color("#f3ecd8")); adk.add_child(d_ad)
	d_alt = _etiket(12, Color("#d8e4ec")); adk.add_child(d_alt)
	var b1 := Button.new(); b1.text = "Harita"; b1.pressed.connect(harita_ac); ust.add_child(b1)
	var b2 := Button.new(); b2.text = "Adaya dön"; b2.pressed.connect(don); ust.add_child(b2)
	var alt := PanelContainer.new()
	var sb := StyleBoxFlat.new(); sb.bg_color = Color(0.05, 0.08, 0.12, 0.8); sb.set_corner_radius_all(6); sb.content_margin_left = 12; sb.content_margin_right = 12; sb.content_margin_top = 6; sb.content_margin_bottom = 6
	alt.add_theme_stylebox_override("panel", sb)
	alt.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	alt.position = Vector2(-150, -120)
	alt.custom_minimum_size = Vector2(300, 0)
	deniz.add_child(alt)
	var v := VBoxContainer.new(); alt.add_child(v)
	d_yazi = _etiket(15, Color("#eaf4ff")); d_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; v.add_child(d_yazi)
	d_bar = Control.new(); d_bar.custom_minimum_size = Vector2(276, 14); d_bar.draw.connect(_bar_ciz); v.add_child(d_bar)
	d_dugme = Button.new(); d_dugme.pressed.connect(bas); v.add_child(d_dugme)
	d_ipucu = _etiket(11, Color("#b8c8d8")); d_ipucu.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; v.add_child(d_ipucu)
	d_log = _etiket(12, Color("#f3ecd8"))
	d_log.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	d_log.position = Vector2(-260, 10); d_log.custom_minimum_size = Vector2(250, 0); d_log.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	deniz.add_child(d_log)
	harita = PanelContainer.new()
	var hs := StyleBoxFlat.new(); hs.bg_color = Color(0.06, 0.1, 0.16, 0.97); hs.border_color = Color("#7fc8ff"); hs.set_border_width_all(2); hs.set_corner_radius_all(8)
	hs.content_margin_left = 14; hs.content_margin_right = 14; hs.content_margin_top = 10; hs.content_margin_bottom = 10
	harita.add_theme_stylebox_override("panel", hs)
	harita.set_anchors_preset(Control.PRESET_CENTER)
	harita.custom_minimum_size = Vector2(560, 0)
	harita.visible = false
	kat.add_child(harita)
	harita_liste = VBoxContainer.new()
	harita.add_child(harita_liste)

func _etiket(boy: int, c: Color) -> Label:
	var l := Label.new()
	l.add_theme_font_size_override("font_size", boy)
	l.add_theme_color_override("font_color", c)
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0))
	l.add_theme_constant_override("outline_size", 3)
	return l

func harita_ac() -> void:
	if not denizde:
		get_tree().paused = true
	f = null
	_harita_yaz()
	harita.visible = true
	harita.position = harita.get_viewport_rect().size / 2.0 - Vector2(280, 230)

func _harita_kapat() -> void:
	harita.visible = false
	if not denizde: get_tree().paused = false

func _harita_yaz() -> void:
	for c in harita_liste.get_children(): c.queue_free()
	var bas_ := HBoxContainer.new()
	var hl := _etiket(17, Color("#f3ecd8"))
	hl.text = "Poyraz'ın deniz haritası"
	hl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bas_.add_child(hl)
	if denizde:
		var bh := Button.new(); bh.text = "Adaya dön"; bh.pressed.connect(func(): harita.visible = false; don()); bas_.add_child(bh)
	var bx := Button.new(); bx.text = "Geri" if denizde else "Kapat"; bx.pressed.connect(_harita_kapat); bas_.add_child(bx)
	harita_liste.add_child(bas_)
	var al := _etiket(12, Color("#b8c8d8"))
	al.text = "Seviyen %d · en iyi oltan: %s" % [env.sv, en_iyi() if en_iyi() != "" else "yok"]
	harita_liste.add_child(al)
	var W := _isteniyor()
	var g := GridContainer.new(); g.columns = 2
	harita_liste.add_child(g)
	for z in ZONES:
		var ok := bolge_ok(z)
		var q := false
		for a in z.fish:
			if W.has(a[0]): q = true
		var cur: bool = denizde and Z == z
		var b := Button.new()
		b.custom_minimum_size = Vector2(262, 84)
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		var fl := []
		for a in z.fish: fl.append(a[0] if caught.has(a[0]) else "?")
		b.text = "%d. %s\nSv %d · %s%s\n%s\n%s" % [z.id, z.n, z.lv, z.rod, " (ya da Ağ, Kemik zıpkın)" if int(z.tier) == 1 else "", ", ".join(fl),
			"Buradasın" if cur else ("Görev balığı burada · Git" if q and ok else ("Git" if ok else "Kilitli: " + neden(z)))]
		var st := StyleBoxFlat.new(); st.bg_color = Color(z.c).darkened(0.0 if ok else 0.45); st.set_corner_radius_all(6)
		st.border_color = Color("#ffd23a") if q else Color(z.c2); st.set_border_width_all(3 if q else 1)
		st.content_margin_left = 8; st.content_margin_top = 4
		b.add_theme_stylebox_override("normal", st); b.add_theme_stylebox_override("hover", st); b.add_theme_stylebox_override("pressed", st)
		b.add_theme_color_override("font_color", Color.WHITE if ok else Color(0.85, 0.85, 0.85))
		b.add_theme_font_size_override("font_size", 12)
		b.pressed.connect(_bolge_sec.bind(z))
		g.add_child(b)

func _bolge_sec(z: Dictionary) -> void:
	if not bolge_ok(z):
		env.mesaj(neden(z), true)
		return
	harita.visible = false
	git(z)

func git(z: Dictionary) -> void:
	get_tree().paused = true
	Z = z
	f = null
	denizde = true
	seen[int(z.id)] = true
	balik_g = []
	for i in 5: balik_g.append({x = randf() * 400.0, y = 120.0 + randf() * 50.0, v = (-1.0 if randf() < 0.5 else 1.0) * (6.0 + randf() * 10.0), s = 0.6 + randf() * 0.8})
	kahraman.texture = oyun.oyuncu.spr.texture
	kahraman.hframes = oyun.oyuncu.spr.hframes; kahraman.vframes = oyun.oyuncu.spr.vframes
	kahraman.frame = 2 * oyun.oyuncu.spr.hframes   # sağa bakan
	deniz.visible = true
	var W := _isteniyor()
	for a in z.fish:
		if W.has(a[0]):
			_not("Görevin istediği balık bu sularda.")
			break
	_yaz()

func don() -> void:
	denizde = false
	Z = null
	f = null
	deniz.visible = false
	harita.visible = false
	get_tree().paused = false
	var o = oyun.oyuncu
	o.position = Vector2(koy.x - float(koy.dx) * 18.0, koy.y - float(koy.dy) * 18.0 + (10.0 if int(koy.dy) == 0 else 0.0))
	if oyun.engel(o.position): o.position = Vector2(koy.x, float(koy.y) + 14.0)
	env.mesaj("Adaya döndün. Poyraz teknesini kıyıya bağladı.")

func _not(s: String) -> void:
	log_.push_front(s)
	if log_.size() > 5: log_.resize(5)
	d_log.text = "\n".join(log_)

func _unhandled_input(e: InputEvent) -> void:
	if not (e is InputEventKey) or not e.pressed or e.echo: return
	if harita.visible:
		if e.keycode == KEY_ESCAPE:
			get_viewport().set_input_as_handled()
			_harita_kapat()
		return
	if not denizde: return
	get_viewport().set_input_as_handled()
	if e.keycode == KEY_E or e.keycode == KEY_SPACE or e.keycode == KEY_ENTER: bas()
	elif e.keycode == KEY_ESCAPE: harita_ac()

# ------------------------------------------------------------------ denizde balık
func _roll() -> String:
	if randf() < 0.05: return "Yosun"
	var s := 0.0
	for a in Z.fish: s += float(a[1])
	var r := randf() * s
	for a in Z.fish:
		r -= float(a[1])
		if r <= 0.0: return str(a[0])
	return str(Z.fish[0][0])

func bas() -> void:
	if Z == null: return
	if f == null:
		var gn := en_iyi()
		if gn == "" or kademe() < int(Z.tier):
			env.mesaj("%s gerekli (oltan köreldiyse Dursun'da yenile)." % Z.rod, true)
			return
		f = {st = "wait", t = 0.0, need = 2.0 + randf() * 4.0, c = _roll(), miss = 0, gear = gn, pos = 0.0, dir = 1.0, z0 = 0.0, z1 = 0.0, spd = 0.0}
		_yaz()
		return
	if f.st == "wait":
		_not("Daha vurmadı; şamandırayı izle.")
		return
	if f.st == "bite":
		var h: float = float(HARD.get(f.c, 1.0))
		var w: float = float(GENIS.get(f.gear, 0.27)) * (1.1 if oyun.sk("H4") else 1.0) / h
		var z0 := 0.08 + randf() * (0.84 - w)
		f.st = "reel"; f.t = 0.0; f.z0 = z0; f.z1 = z0 + w
		f.pos = 0.0 if randf() < 0.5 else 1.0
		f.dir = -1.0 if f.pos > 0.5 else 1.0
		f.spd = 0.85 * h
		_yaz()
		return
	var ok_: bool = f.pos >= f.z0 - 0.015 and f.pos <= f.z1 + 0.015
	var n: String = f.c
	var gear: String = f.gear
	f = null
	if not ok_:
		_not("Kaçırdın! Balık suya geri daldı.")
		_yaz()
		return
	env.alet_kullan(gear)
	env.ekle(n)
	if HARD.has(n):
		var ilk := not caught.has(n)
		caught[n] = int(caught.get(n, 0)) + 1
		oyun.gorev.qc_ekle("fish:" + n)
		env.xp_ekle(3 + int(round(oyun.pazar.fiyat(n) / 2.0)))
		_not("%s%s" % [n, " · yeni!" if ilk else ""])
		sicra = 0.0
	else:
		_not("%s takıldı" % n)
	_yaz()

func _deniz_tik(dt: float) -> void:
	if f == null: return
	f.t += dt
	if f.st == "wait" and f.t >= f.need:
		f.st = "bite"; f.t = 0.0
	elif f.st == "bite" and f.t > 1.05:
		f.miss += 1
		if f.miss >= 2:
			f = null
			_not("Balık yemi alıp kaçtı…")
		else:
			_not("Kaçırdın! Şamandırayı izle…")
			f.st = "wait"; f.t = 0.0; f.need = 1.5 + randf() * 3.0
	elif f.st == "reel":
		f.pos += f.dir * f.spd * dt
		if f.pos > 1.0: f.pos = 1.0; f.dir = -1.0
		if f.pos < 0.0: f.pos = 0.0; f.dir = 1.0
		if f.t > 6.0:
			f = null
			_not("Misina koptu, balık gitti.")
	_yaz()

func _yaz() -> void:
	if Z == null: return
	d_ad.text = "%d. %s" % [Z.id, Z.n]
	var gn := en_iyi()
	var fl := []
	for a in Z.fish: fl.append(a[0] if caught.has(a[0]) else "?")
	d_alt.text = "%s%s · %s" % [gn if gn != "" else "olta yok", (" · %d/%d" % [maxi(0, int(env.dayan.get(gn, env.G.tools[gn].dur))), int(env.G.tools[gn].dur)]) if gn != "" and env.G.tools.has(gn) else "", ", ".join(fl)]
	d_yazi.text = "Olta hazır" if f == null else ("Şamandıra suda… bekle" if f.st == "wait" else ("Vurdu! Hemen E / Boşluk!" if f.st == "bite" else "İbre yeşildeyken E / Boşluk!"))
	d_yazi.add_theme_color_override("font_color", Color("#ffd84a") if f != null and f.st == "bite" else Color("#eaf4ff"))
	d_bar.visible = f != null and f.st == "reel"
	d_dugme.text = "Olta at" if f == null else ("Bekle…" if f.st == "wait" else ("Çek!" if f.st == "bite" else "Şimdi!"))
	d_ipucu.text = "E ya da Boşluk: oltayı at" if f == null else ("Şamandıra dalınca hemen bas" if f.st == "wait" else ("Kaçırırsan balık gider" if f.st == "reel" else ""))
	d_bar.queue_redraw()

func _bar_ciz() -> void:
	if f == null or f.st != "reel": return
	var w := d_bar.size.x
	var h := d_bar.size.y
	d_bar.draw_rect(Rect2(0, 2, w, h - 4), Color("#1d2a36"))
	d_bar.draw_rect(Rect2(w * float(f.z0), 2, w * (float(f.z1) - float(f.z0)), h - 4), Color("#5ab860"))
	d_bar.draw_rect(Rect2(w * float(f.pos) - 1.5, 0, 3, h), Color("#fff2b0"))

## web draw: gökyüzü, deniz, dalgalar, balık gölgeleri, tekne, Poyraz, sen, misina ve şamandıra (320 × 180'lik sahne ekrana büyütülür)
func _deniz_ciz() -> void:
	if Z == null: return
	var S := deniz.size
	var Hc := 180.0
	var k := S.y / Hc
	var Wc := S.x / k
	deniz.draw_set_transform(Vector2.ZERO, 0.0, Vector2(k, k))
	var hz := roundf(Hc * 0.42)
	var R := func(x: float, y: float, w: float, h: float, c) -> void: deniz.draw_rect(Rect2(roundf(x), roundf(y), w, h), Color(c))
	for i in 8:
		R.call(0, hz * i / 8.0, Wc, hz / 8.0 + 1, Color(Z.sky[0]).lerp(Color(Z.sky[1]), i / 7.0))
	if Z.get("glow", false):
		for i in 40: R.call(fmod(i * 73.3, Wc), fmod(i * 31.7, hz - 6), 1, 1, "#e8d8ff" if fmod(t * 2 + i, 3.0) < 1.5 else "#9a7ad8")
	elif not Z.get("storm", false):
		R.call(Wc * 0.78, hz * 0.32, 10, 10, "#fff2b0"); R.call(Wc * 0.78 + 2, hz * 0.32 - 1, 6, 12, "#fff2b0")
		for i in 3:
			var cx := fmod(t * 4 + i * 130, Wc + 60) - 30
			R.call(cx, 12 + i * 9, 24, 4, Color(1, 1, 1, 0.75)); R.call(cx + 5, 9 + i * 9, 12, 4, Color(1, 1, 1, 0.75))
	else:
		for i in 4: R.call(fmod(t * 9 + i * 110, Wc + 80) - 40, 8 + i * 7, 40, 7, Color(0.16, 0.18, 0.2, 0.85))
	for i in 8:
		R.call(0, hz + (Hc - hz) * i / 8.0, Wc, (Hc - hz) / 8.0 + 1, Color(Z.c).lightened(0.12).lerp(Color(Z.c2), i / 7.0))
	var y := hz + 3
	while y < Hc:
		var o := sin(t * 1.4 + y * 0.3) * 6.0
		var x := -10.0 + fmod(y * 7.0, 20.0)
		while x < Wc + 10:
			R.call(x + o, y, 7, 1, Color(1, 1, 1, 0.55 if Z.get("storm", false) else 0.28))
			x += 20
		y += 6
	for F in balik_g:
		F.x += F.v * 0.016
		if F.x < -30: F.x = Wc + 20
		if F.x > Wc + 30: F.x = -20
		deniz.draw_set_transform(Vector2(F.x, F.y) * k, 0.0, Vector2(7 * F.s, 2.5 * F.s) * k)
		deniz.draw_circle(Vector2.ZERO, 1.0, Color(0.86, 0.7, 1, 0.35) if Z.get("glow", false) else Color(0.04, 0.12, 0.2, 0.28))
		deniz.draw_set_transform(Vector2.ZERO, 0.0, Vector2(k, k))
	if Z.get("storm", false):
		for i in 40:
			var x2 := fmod(i * 37 + t * 160, Wc + 20) - 10
			var y2 := fmod(i * 53 + t * 260, Hc)
			deniz.draw_line(Vector2(x2, y2), Vector2(x2 - 3, y2 + 7), Color(0.78, 0.84, 0.88, 0.45), 1.0)
	var bx := roundf(Wc * 0.42)
	var by := roundf(Hc * 0.7) + roundf(sin(t * 1.6) * 1.5)
	R.call(bx - 48, by + 6, 96, 4, Color(0, 0, 0, 0.25)); R.call(bx - 46, by - 6, 92, 12, "#7a4a28"); R.call(bx - 42, by + 6, 84, 3, "#4a2e18"); R.call(bx - 46, by - 7, 92, 2, "#a8743a")
	R.call(bx - 50, by - 9, 8, 6, "#7a4a28"); R.call(bx + 42, by - 11, 8, 8, "#7a4a28")
	R.call(bx - 2, by - 62, 3, 56, "#5a3d22"); R.call(bx - 26, by - 58, 40, 34, "#f2ecd8"); R.call(bx - 26, by - 46, 40, 5, "#9a5ae0" if Z.get("glow", false) else "#3a6ab0"); R.call(bx + 2, by - 68, 12, 6, "#3a6ab0")
	poyraz_s.position = Vector2(bx - 42, by - 42) * k; poyraz_s.scale = Vector2(k, k)
	var hx := bx + 26
	var hy := by - 6
	if kahraman.texture != null:
		var fw: float = kahraman.texture.get_width() / float(kahraman.hframes)
		var fh: float = kahraman.texture.get_height() / float(kahraman.vframes)
		var sc := 34.0 / fh
		kahraman.scale = Vector2(sc, sc) * k
		kahraman.position = Vector2(hx - fw * sc / 2.0, hy - fh * sc + 2) * k
	var fx := roundf(Wc * 0.82)
	var fy := roundf(Hc * 0.8)
	if f != null:
		var dip := (3.0 + roundf(sin(t * 30) * 2)) if f.st == "bite" else (2.0 if f.st == "reel" else roundf(sin(t * 3)))
		deniz.draw_line(Vector2(hx + 6, hy - 18), Vector2(hx + 22, hy - 34), Color("#a8713f"), 2.0)
		var pts := PackedVector2Array()
		for i in 13:
			var u := i / 12.0
			var a := Vector2(hx + 22, hy - 34); var c := Vector2(fx - 10, fy - 40); var b := Vector2(fx, fy - 2 + dip)
			pts.append(a.lerp(c, u).lerp(c.lerp(b, u), u))
		deniz.draw_polyline(pts, Color(0.94, 0.94, 0.94, 0.85), 1.0)
		R.call(fx - 2, fy - 4 + dip, 4, 3, "#e8402a"); R.call(fx - 2, fy - 1 + dip, 4, 2, "#ffffff")
		if f.st == "bite":
			for i in 4: R.call(fx - 6 + i * 4, fy - 2 - absf(sin(t * 20 + i)) * 4, 1, 1, "#cfe8ff")
	if sicra >= 0.0:
		sicra += 0.016
		for i in 10:
			var a2 := i / 10.0 * TAU
			R.call(fx + cos(a2) * sicra * 30, fy - absf(sin(a2)) * sicra * 24, 2, 2, "#ffffff")
		if sicra > 0.5: sicra = -1.0
	if oyun.zaman.gece_mi() and not Z.get("glow", false):
		R.call(0, 0, Wc, Hc, Color(0.024, 0.04, 0.12, 0.45))
	deniz.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

# ------------------------------------------------------------------ tekne (web drawBoat): kırık tekne ya da onarılmış, yelkenli
func _tekne_ciz() -> void:
	var fyon := -1 if int(koy.dx) < 0 else 1
	var bob := roundf(sin(t * 1.6) * 1.2) if ph >= 2 else 0.0
	var P := func(dx: float, dy: float, w: float, h: float, c) -> void:
		tekne.draw_rect(Rect2((dx if fyon > 0 else -dx - w), dy + bob, w, h), Color(c))
	if ph == 1:
		tekne.draw_set_transform(Vector2.ZERO, -0.18 * fyon)
		tekne.draw_rect(Rect2(-28, 3, 56, 5), Color(0.04, 0.12, 0.2, 0.35))
		P.call(-26, -8, 52, 11, "#6a4325"); P.call(-24, 3, 46, 3, "#4a2e18"); P.call(-26, -9, 52, 2, "#8a5a2e")
		P.call(-6, -6, 3, 9, "#2a1a10"); P.call(4, -7, 5, 10, "#2a1a10"); P.call(-1, -30, 3, 22, "#5a3d22"); P.call(-1, -34, 3, 4, "#3a2a16")
		P.call(2, -28, 12, 8, "#e8dcc0"); P.call(6, -24, 6, 6, "#d0c4a8"); P.call(10, -26, 3, 2, "#b0a488")
		for i in 4: P.call(-30 + i * 7, 6 + (i % 2), 5, 2, "#8a5a2e")
		tekne.draw_set_transform(Vector2.ZERO, 0.0)
	else:
		tekne.draw_rect(Rect2(-28, 4 + bob, 56, 4), Color(0.04, 0.12, 0.2, 0.35))
		P.call(-26, -7, 52, 11, "#7a4a28"); P.call(-24, 4, 46, 3, "#4a2e18"); P.call(-26, -8, 52, 2, "#a8743a")
		for i in range(-18, 19, 9): P.call(i, -4, 3, 3, "#2a1a10")
		P.call(-1, -44, 3, 38, "#5a3d22"); P.call(-16, -41, 30, 24, "#f2ecd8"); P.call(-16, -33, 30, 4, "#3a6ab0"); P.call(-16, -41, 30, 2, "#ffffff"); P.call(2, -50, 10, 5, "#3a6ab0")

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	return {ph = ph, D = gun_d, m = met, c = caught, z = seen.keys()}

func yukle(d: Dictionary) -> void:
	ph = int(d.get("ph", 0)); gun_d = int(d.get("D", 0)); met = bool(d.get("m", false))
	caught = {}
	var c: Dictionary = d.get("c", {})
	for k in c: caught[k] = int(c[k])
	seen = {}
	for k in d.get("z", []): seen[int(k)] = true
