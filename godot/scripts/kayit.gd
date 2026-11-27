## Ana menü, oyun içi menü, kayıt ve yükleme (belge: Oyun akışı › Açılış 1; Sistemler › Kayıt).
## Otomatik kayıt + 3 elle kayıt yuvası (cihazda, user://). Otomatik kayıt dakikada bir, görev değişince, menüye dönerken ve sayfa
## gizlenirken alınır; sahne, bayılma ve yükleme sırasında alınmaz. Mağaradayken kaydedilirse mağaranın önünde açılır.
## Yeni oyun, Devam et ve Yükle sahneyi baştan kurar (temiz dünya): önceki oyunun kesilen ağaçları, toplananları yeni oyuna geçmez.
class_name Kayit
extends Control

static var bekleyen := {}     # sahne yeniden kurulunca açılacak kayıt ({} ise yeni oyun)
static var devam := false     # Devam et ile girildi (gizli: bir satır)
static var dogrudan := false  # menüyü atla (Yeni oyun / Devam et / Yükle sonrası)

const YUVALAR := ["oto", "1", "2", "3"]
var oyun
var ana: Control
var ic: Control
var liste: VBoxContainer
var ic_liste: VBoxContainer
var bilgi: Label
var oto_t := 60.0
var yaratici
var onceki_pencere := false

func kur(o) -> void:
	oyun = o
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_ana_kur()
	_ic_kur()
	yaratici = preload("res://scripts/yaratici.gd").new()
	add_child(yaratici)
	yaratici.kur(self)

static func yol(y: String) -> String:
	return "user://kayit_%s.json" % y

static func oku(y: String) -> Dictionary:
	if not FileAccess.file_exists(yol(y)): return {}
	var f := FileAccess.open(yol(y), FileAccess.READ)
	if f == null: return {}
	var d = JSON.parse_string(f.get_as_text())
	return d if d is Dictionary else {}

static func en_yeni() -> String:
	var en := ""
	var t := -1.0
	for y in YUVALAR:
		var d := oku(y)
		if not d.is_empty() and float(d.get("zaman", 0)) > t:
			t = float(d.zaman); en = y
	return en

# ------------------------------------------------------------------ kaydet
func kaydedilebilir() -> bool:
	return oyun.arena == null and not oyun.basta and not oyun.cine.acik and not oyun.uyanis.acik and not oyun.sahne.acik and not oyun.oyuncu.bayildi and not oyun.magara.yukleme.visible and oyun.oyuncu.hp > 0.0

func kaydet(y: String) -> bool:
	if not kaydedilebilir(): return false
	var d: Dictionary = oyun.durum_al()
	d.zaman = Time.get_unix_time_from_system()
	d.surum = oyun.SURUM
	var f := FileAccess.open(yol(y), FileAccess.WRITE)
	if f == null: return false
	f.store_string(JSON.stringify(d))
	f.close()
	return true

func sil(y: String) -> void:
	if FileAccess.file_exists(yol(y)): DirAccess.remove_absolute(yol(y))

func _process(dt: float) -> void:
	if oyun.basta: return
	oto_t -= dt
	if oto_t <= 0.0:
		oto_t = 60.0
		kaydet("oto")
	var acik := _pencere_acik()
	if Input.is_action_just_pressed("ui_cancel"):
		if ic.visible:
			ic.visible = false
		elif not acik and not onceki_pencere:
			ic_ac()
	onceki_pencere = acik

func _pencere_acik() -> bool:
	return oyun.konusma.visible or oyun.istasyon.pencere.visible or oyun.pazar.pencere.visible or oyun.el_yapimi.acik_mi() or oyun.sahne.acik or oyun.env.canta.visible or oyun.magara.yukleme.visible or oyun.cine.acik or oyun.uyanis.ad_kutu.visible or oyun.yetenek.visible or oyun.karakter.visible or oyun.sinan.visible or oyun.atolye.visible

func _notification(w: int) -> void:
	if w == NOTIFICATION_APPLICATION_FOCUS_OUT or w == NOTIFICATION_WM_CLOSE_REQUEST:
		if oyun != null: kaydet("oto")

# ------------------------------------------------------------------ yeni oyun, yükle: sahne baştan kurulur
func yukle(y: String) -> void:
	var d := oku(y)
	if d.is_empty(): return
	bekleyen = d
	dogrudan = true
	get_tree().reload_current_scene()

# ------------------------------------------------------------------ ana menü (gece, PURPLE LIGHT, solda düğmeler)
func _ana_kur() -> void:
	ana = Control.new()
	ana.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(ana)
	var bg := TextureRect.new()
	var g := GradientTexture2D.new(); g.width = 4; g.height = 256; g.fill_from = Vector2(0, 0); g.fill_to = Vector2(0, 1)
	var gr := Gradient.new()
	gr.offsets = PackedFloat32Array([0.0, 0.35, 0.6, 0.8, 1.0])
	gr.colors = PackedColorArray([Color("#0C0720"), Color("#1C0F38"), Color("#4A2266"), Color("#93477F"), Color("#C26A92")])
	g.gradient = gr
	bg.texture = g
	bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bg.stretch_mode = TextureRect.STRETCH_SCALE
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	ana.add_child(bg)
	var gok := Control.new()
	gok.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	gok.draw.connect(_gok_ciz.bind(gok))
	gok.set_process(true)
	ana.add_child(gok)
	var baslik := Label.new()
	baslik.text = "PURPLE LIGHT"
	baslik.add_theme_font_size_override("font_size", 64)
	baslik.add_theme_color_override("font_color", Color("#CFA6F6"))
	baslik.add_theme_color_override("font_outline_color", Color("#2a1040"))
	baslik.add_theme_constant_override("outline_size", 10)
	baslik.add_theme_color_override("font_shadow_color", Color(0.71, 0.48, 1.0, 0.6))
	baslik.add_theme_constant_override("shadow_offset_x", 0); baslik.add_theme_constant_override("shadow_offset_y", 0)
	baslik.add_theme_constant_override("shadow_outline_size", 22)
	baslik.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	baslik.set_anchors_and_offsets_preset(Control.PRESET_CENTER_TOP)
	baslik.anchor_top = 0.1; baslik.offset_top = 0
	baslik.grow_horizontal = Control.GROW_DIRECTION_BOTH
	ana.add_child(baslik)
	liste = VBoxContainer.new()
	liste.add_theme_constant_override("separation", 8)
	liste.anchor_left = 0.0; liste.anchor_top = 1.0; liste.anchor_bottom = 1.0
	liste.offset_left = 40; liste.offset_bottom = -60; liste.offset_top = -360; liste.offset_right = 340
	liste.alignment = BoxContainer.ALIGNMENT_END
	ana.add_child(liste)
	var ver := Label.new()
	ver.text = oyun.SURUM
	ver.add_theme_color_override("font_color", Color("#CDB9E8"))
	ver.anchor_top = 1.0; ver.anchor_bottom = 1.0; ver.offset_left = 44; ver.offset_top = -46
	ana.add_child(ver)
	bilgi = Label.new()
	bilgi.add_theme_color_override("font_color", Color("#f0e0ff"))
	bilgi.anchor_left = 0.5; bilgi.anchor_right = 0.5; bilgi.anchor_top = 1.0; bilgi.anchor_bottom = 1.0
	bilgi.offset_top = -40; bilgi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; bilgi.grow_horizontal = Control.GROW_DIRECTION_BOTH
	ana.add_child(bilgi)
	ana_dugmeler()

func _dugme(t: String, f: Callable, dolu := false) -> Button:
	var b := Button.new()
	b.text = "  " + t
	b.alignment = HORIZONTAL_ALIGNMENT_LEFT
	b.custom_minimum_size = Vector2(300, 46)
	b.add_theme_font_size_override("font_size", 20)
	for s in ["normal", "hover", "pressed", "focus"]:
		var st := StyleBoxFlat.new()
		var vg := Color(Ayarlar.vurgu)
		st.bg_color = vg.darkened(0.45) if (dolu or s == "hover") else Color(0.2, 0.1, 0.3, 0.72)
		st.border_color = vg.lightened(0.35); st.set_border_width_all(2)
		st.set_corner_radius_all(8)
		if s == "hover": st.border_width_left = 6
		b.add_theme_stylebox_override(s, st)
	b.add_theme_color_override("font_color", Color("#FBF3FF"))
	b.pressed.connect(f)
	return b

func ana_dugmeler() -> void:
	for c in liste.get_children(): c.queue_free()
	var son := en_yeni()
	if son != "":
		liste.add_child(_dugme("Devam et", func():
			devam = true
			yukle(en_yeni()), true))
	liste.add_child(_dugme("Yeni oyun", func(): yaratici.ac(), son == ""))
	# Arena: iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır
	var acik_ar: bool = Hile.mod or oyun.basarim.got.has("iyison") or oyun.basarim.got.has("kotuson")
	var ab := _dugme("⚔ Arena" if acik_ar else "⚔ Arena · kilitli: oyunu bitir ya da hile modunu aç", func():
		if not (Hile.mod or oyun.basarim.got.has("iyison") or oyun.basarim.got.has("kotuson")):
			return
		bekleyen = {arena = true}
		get_tree().reload_current_scene(), false)
	ab.tooltip_text = "Dövüş mekaniklerini dene" if acik_ar else "Kilitli: oyunu bitir ya da hile modunu aç"
	if not acik_ar: ab.modulate = Color(1, 1, 1, 0.55)
	liste.add_child(ab)
	liste.add_child(_dugme("Ayarlar", func(): oyun.ayarlar.ac()))
	if son != "":
		liste.add_child(_dugme("Kayıttan yükle", _yukle_listesi))
	if not WebKayit.oku().is_empty():
		liste.add_child(_dugme("Web oyunundaki kaydı aç", _web_listesi))

## web oyununun kayıtları (aynı tarayıcıda); seçilen Godot kaydına çevrilip açılır, web kaydı değişmez
func _web_listesi() -> void:
	for c in liste.get_children(): c.queue_free()
	var W := WebKayit.oku()
	for y in WebKayit.YUVALAR:
		if not W.has(y[0]): continue
		var v: Dictionary = W[y[0]]
		var dt: Dictionary = v.data
		var b := _dugme("%s · Sv %d · %d Vio · Gün %d" % [y[1], int(v.get("lvl", 1)), int(v.get("coins", 0)), int(dt.get("dy", 1))], _web_ac.bind(dt))
		b.tooltip_text = WebKayit.tarih(float(v.get("t", 0)))
		liste.add_child(b)
	liste.add_child(_dugme("Geri", ana_dugmeler))

func _web_ac(dt: Dictionary) -> void:
	var K: Dictionary = oyun.toplama_veri.kisiler[0]
	bekleyen = WebKayit.cevir(dt, Vector2(K.x, K.y))
	dogrudan = true
	get_tree().reload_current_scene()

func _yukle_listesi() -> void:
	for c in liste.get_children(): c.queue_free()
	for y in YUVALAR:
		var d := oku(y)
		var ad := "Otomatik kayıt" if y == "oto" else "Kayıt %s" % y
		if d.is_empty():
			var b := _dugme(ad + " · boş", func(): pass)
			b.disabled = true
			liste.add_child(b)
		else:
			liste.add_child(_dugme("%s · Sv %d · Gün %d" % [ad, int(d.env.sv), int(d.zaman_oyun.gun)], yukle.bind(y)))
	liste.add_child(_dugme("Geri", ana_dugmeler))

var _yildiz := []
var _isik := {}
func _gok_ciz(c: Control) -> void:
	var s := c.size
	var t := Time.get_ticks_msec() / 1000.0
	if _yildiz.is_empty():
		for i in 90: _yildiz.append(Vector3(randf(), randf() * 0.6, randf() * TAU))
	for y in _yildiz:
		var a := 0.4 + 0.4 * sin(t * 1.5 + y.z)
		c.draw_rect(Rect2(y.x * s.x, y.y * s.y, 2, 2), Color(1, 1, 1, a))
	# ay, ufukta deniz, ada silueti
	c.draw_circle(Vector2(s.x * 0.78, s.y * 0.32), 26.0, Color("#EFEAF8"))
	c.draw_circle(Vector2(s.x * 0.78 + 8, s.y * 0.32 - 4), 24.0, Color(0.79, 0.75, 0.88, 0.25))
	c.draw_rect(Rect2(0, s.y * 0.72, s.x, s.y * 0.28), Color("#22204A"))
	c.draw_rect(Rect2(0, s.y * 0.86, s.x, s.y * 0.14), Color("#0B0A1F"))
	var ada := PackedVector2Array([Vector2(s.x * 0.36, s.y * 0.74), Vector2(s.x * 0.45, s.y * 0.6), Vector2(s.x * 0.55, s.y * 0.5), Vector2(s.x * 0.62, s.y * 0.56), Vector2(s.x * 0.72, s.y * 0.63), Vector2(s.x * 0.82, s.y * 0.74)])
	c.draw_colored_polygon(ada, Color("#143723"))
	# rastgele düşen mor ışık (adaya ya da denize)
	if _isik.is_empty() or t - float(_isik.t) > 3.5:
		_isik = {t = t, x = randf_range(0.3, 0.9), y = randf_range(0.55, 0.85)}
	var k := t - float(_isik.t)
	if k < 1.2:
		var a := 1.0 - k / 1.2
		var x: float = s.x * float(_isik.x); var yy: float = s.y * float(_isik.y)
		c.draw_rect(Rect2(x - 3, 0, 6, yy), Color(0.71, 0.48, 1.0, 0.5 * a))
		c.draw_rect(Rect2(x - 1, 0, 2, yy), Color(0.96, 0.91, 1.0, 0.8 * a))
		c.draw_arc(Vector2(x, yy), 10.0 + k * 40.0, 0, TAU, 32, Color(0.71, 0.48, 1.0, 0.6 * a), 2.0)
	c.queue_redraw()

func ana_goster(mesaj := "") -> void:
	ana.visible = true
	ic.visible = false
	oyun.basta = true
	oyun.oyuncu.kilit = true
	bilgi.text = mesaj
	ana_dugmeler()

func ana_gizle() -> void:
	ana.visible = false
	oyun.basta = false
	oyun.oyuncu.kilit = false

# ------------------------------------------------------------------ oyun içi menü (Esc)
func _ic_kur() -> void:
	ic = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.08, 0.05, 0.12, 0.95); st.border_color = Color("#CFA6F6"); st.set_border_width_all(2)
	st.set_corner_radius_all(8); st.set_content_margin_all(14)
	ic.add_theme_stylebox_override("panel", st)
	ic_liste = VBoxContainer.new()
	ic_liste.add_theme_constant_override("separation", 6)
	ic.add_child(ic_liste)
	add_child(ic)
	ic.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	ic.visible = false

func ic_ac() -> void:
	ic.visible = true
	_ic_ana()

func _ic_temizle(baslik: String) -> void:
	for c in ic_liste.get_children(): c.queue_free()
	var l := Label.new(); l.text = baslik; l.add_theme_font_size_override("font_size", 18); l.add_theme_color_override("font_color", Color("#CFA6F6"))
	ic_liste.add_child(l)

func _ic_ana() -> void:
	_ic_temizle("Duraklatıldı")
	ic_liste.add_child(_dugme("Devam et", func(): ic.visible = false, true))
	ic_liste.add_child(_dugme("Kaydet", _ic_kaydet))
	ic_liste.add_child(_dugme("Kayıttan yükle", _ic_yukle))
	ic_liste.add_child(_dugme("Ayarlar", func():
		ic.visible = false
		oyun.ayarlar.ac()))
	ic_liste.add_child(_dugme("Ana menüye dön", func():
		kaydet("oto")
		ic.visible = false
		dogrudan = false
		bekleyen = {}
		get_tree().reload_current_scene()))
	_ic_ortala()

func _ic_kaydet() -> void:
	_ic_temizle("Kaydet")
	for y in ["1", "2", "3"]:
		var d := oku(y)
		var ad := "Kayıt %s · %s" % [y, "boş" if d.is_empty() else "Sv %d · Gün %d" % [int(d.env.sv), int(d.zaman_oyun.gun)]]
		var h := HBoxContainer.new()
		h.add_child(_dugme(ad, _yuvaya.bind(y)))
		if not d.is_empty():
			var s := _dugme("Sil", _sil_sor.bind(y)); s.custom_minimum_size = Vector2(70, 46)
			h.add_child(s)
		ic_liste.add_child(h)
	ic_liste.add_child(_dugme("Geri", _ic_ana))
	_ic_ortala()

func _yuvaya(y: String) -> void:
	var d := oku(y)
	if d.is_empty():
		_kaydet_bildir(y)
		return
	_ic_temizle("Bu yuvada bir kayıt var (Seviye %d, Gün %d). Yeni kaydı üzerine yazayım mı?" % [int(d.env.sv), int(d.zaman_oyun.gun)])
	ic_liste.add_child(_dugme("Üzerine yaz", func(): _kaydet_bildir(y), true))
	ic_liste.add_child(_dugme("Vazgeç", _ic_kaydet))
	_ic_ortala()

func _kaydet_bildir(y: String) -> void:
	ic.visible = false
	var ok_: bool = kaydet(y)
	oyun.env.mesaj("Kaydedildi: Kayıt %s" % y if ok_ else "Şu an kaydedilemiyor.", not ok_)

func _sil_sor(y: String) -> void:
	_ic_temizle("Kayıt %s silinecek. Emin misiniz? Bu geri alınamaz." % y)
	ic_liste.add_child(_dugme("Eminim, sil", func():
		sil(y)
		_ic_kaydet()))
	ic_liste.add_child(_dugme("Vazgeç", _ic_kaydet, true))
	_ic_ortala()

func _ic_yukle() -> void:
	_ic_temizle("Kayıttan yükle")
	for y in YUVALAR:
		var d := oku(y)
		var ad := "Otomatik kayıt" if y == "oto" else "Kayıt %s" % y
		var b := _dugme(ad + (" · boş" if d.is_empty() else " · Sv %d · Gün %d" % [int(d.env.sv), int(d.zaman_oyun.gun)]), yukle.bind(y))
		b.disabled = d.is_empty()
		ic_liste.add_child(b)
	ic_liste.add_child(_dugme("Geri", _ic_ana))
	_ic_ortala()

func _ic_ortala() -> void:
	await get_tree().process_frame
	ic.reset_size()
	ic.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
