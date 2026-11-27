extends Node
## Dokunmatik (web v132-dokun, v50-mob; belge Sistemler › Kontroller, Telefonda sütunu). Yalnızca dokunmatik ekranda:
## - Ekranın boş yerinde parmağı sürüklemek görünmez joystick'tir (yürür); çift dokunup sürüklemek koşturur.
## - Kısa dokunuş (12 px'ten az oynamış, 0,5 sn'den kısa): bir kişiye, çalıya, eşyaya dokunmak oraya yürütüp işini yaptırır;
##   boş bir yere dokunmak oraya yürütür.
## - Sağ altta dövüş düğmeleri: Vur (yürüdüğün yöne; yakında canavar varsa ona), Atıl, Savuş (yuvarlak; basılı tutmak gard),
##   Ulti (yalnızca çubuk doluyken görünür). Eylem ipucuna dokunmak F'nin işini yapar.
## - Ayarlar › Kontroller'deki düğme boyu (%60–200) uygulanır.

var oyun
var etkin := false
var kat: Control
var dugme := {}        # ad → Control
var joy_id := -1
var joy_bas := Vector2.ZERO
var joy_v := Vector2.ZERO
var dok := {}           # parmak → {p, t}
var son_dok := -10.0
var kos := false
var tam := Vector2.INF  # dokunulan boş yere yürüyüş

static var boy := 1.0

func kur(o) -> void:
	oyun = o
	etkin = DisplayServer.is_touchscreen_available()
	if not etkin: return
	kat = Control.new()
	kat.set_anchors_preset(Control.PRESET_FULL_RECT)
	kat.mouse_filter = Control.MOUSE_FILTER_IGNORE
	oyun.hud.add_child(kat)
	# küçük haritanın üstünde, sağda
	for d in [["vur", "Vur", Vector2(-60, -262), 32], ["atil", "Atıl", Vector2(-140, -236), 24], ["savus", "Savuş", Vector2(-128, -306), 24], ["kopek", "Ulti", Vector2(-52, -336), 22]]:
		dugme[d[0]] = _dugme(d[0], d[1], d[2], d[3])
	# eylem ipucu dokunulabilir
	oyun.istem.yazi.mouse_filter = Control.MOUSE_FILTER_STOP
	oyun.istem.yazi.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed: oyun.toplama.f_bas())

func _dugme(eylem: String, yazi: String, yer: Vector2, r: float) -> Control:
	var b := Control.new()
	b.set_meta("yer", yer)
	b.set_meta("r", r)
	b.mouse_filter = Control.MOUSE_FILTER_STOP
	b.draw.connect(func():
		var R: float = b.size.x / 2.0
		if R < 4.0: return
		var basili := Input.is_action_pressed(eylem)
		b.draw_circle(Vector2(R, R), R, Color(0.08, 0.1, 0.08, 0.55 if not basili else 0.8))
		b.draw_arc(Vector2(R, R), R - 1.5, 0, TAU, 32, Color("#f2c94c") if basili else Color(1, 1, 1, 0.55), 2.5)
		var f := ThemeDB.fallback_font
		var fs := int(R * 0.42)
		var w := f.get_string_size(yazi, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
		b.draw_string(f, Vector2(R - w / 2.0, R + fs * 0.35), yazi, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, Color(1, 1, 1, 0.9)))
	b.gui_input.connect(func(e):
		if e is InputEventScreenTouch or e is InputEventMouseButton:
			if e.pressed: Input.action_press(eylem)
			else: Input.action_release(eylem)
			b.queue_redraw()
			b.accept_event())
	kat.add_child(b)
	return b

func _process(_dt: float) -> void:
	if not etkin: return
	var V: Vector2 = kat.get_viewport_rect().size
	var acik: bool = not oyun.basta and not oyun.pencere_acik() and not oyun.konusma.visible and not oyun.sahne.acik
	kat.visible = acik
	for k in dugme:
		var b: Control = dugme[k]
		var r: float = float(b.get_meta("r")) * boy
		b.size = Vector2(r * 2.0, r * 2.0)
		var y: Vector2 = b.get_meta("yer") * boy
		b.position = V + y - Vector2(r, r)
		if k == "kopek": b.visible = oyun.dovus != null and oyun.dovus.ulti_hazir()
		if k == "atil": b.visible = oyun.oyuncu.bilir("S1")
	# boş yere dokununca yürüyüş
	if tam != Vector2.INF:
		if joy_id >= 0 or oyun.oyuncu.position.distance_to(tam) < 6.0 or oyun.oyuncu.kilit: tam = Vector2.INF

## oyuncu.gd klavye yönü yokken okur
func yon() -> Vector2:
	if not etkin: return Vector2.ZERO
	if joy_id >= 0 and joy_v.length() > 8.0:
		oyun.oyuncu.kosu_kol = kos
		return joy_v.limit_length(60.0) / 60.0
	if tam != Vector2.INF: return (tam - oyun.oyuncu.position).normalized()
	return Vector2.ZERO

func _input(e: InputEvent) -> void:
	if not etkin or oyun.basta: return
	if e is InputEventScreenTouch:
		if e.pressed:
			dok[e.index] = {p = e.position, t = Time.get_ticks_msec() / 1000.0}
		else:
			var d = dok.get(e.index, null)
			dok.erase(e.index)
			if e.index == joy_id:
				joy_id = -1; joy_v = Vector2.ZERO; kos = false
			if d != null and e.position.distance_to(d.p) < 12.0 and Time.get_ticks_msec() / 1000.0 - float(d.t) < 0.5 and not _ui_ustunde(e.position):
				_dokunus(e.position)
	elif e is InputEventScreenDrag:
		var d = dok.get(e.index, null)
		if d == null or _ui_ustunde(d.p): return
		if joy_id < 0 and e.position.distance_to(d.p) >= 12.0 and not oyun.pencere_acik():
			joy_id = e.index
			joy_bas = d.p
			var simdi := Time.get_ticks_msec() / 1000.0
			kos = simdi - son_dok < 0.35   # çift dokunup sürükle: koş
			tam = Vector2.INF
			oyun.kontrol.hedef = null
		if e.index == joy_id: joy_v = e.position - joy_bas

func _ui_ustunde(p: Vector2) -> bool:
	var c = oyun.get_viewport().gui_get_hovered_control()
	if c != null and c != kat: return true
	for k in dugme:
		if dugme[k].visible and dugme[k].get_global_rect().has_point(p): return true
	return false

func _dokunus(p: Vector2) -> void:
	son_dok = Time.get_ticks_msec() / 1000.0
	if oyun.pencere_acik() or oyun.konusma.visible: return
	var w: Vector2 = oyun.get_viewport().get_canvas_transform().affine_inverse() * p
	if oyun.kontrol.tikla(w): return
	tam = w
