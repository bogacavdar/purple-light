extends Node
## Kontrol eksikleri (belge Sistemler › Kontroller):
## - Sol tık bir kişiye, kazana/örse, kamp ateşine, toplanacak bir şeye (çalı, maden, ağaç) ya da yere düşmüş bir eşyaya: oraya yürür
##   ve varınca F'nin işini yapar (konuşur, toplar). Madene elde kazmasız, ağaca elde baltasız tıklamak yürütmez, vurur. Yürürken bir
##   yön tuşuna basmak yürüyüşü keser.
## - H: eli boşalt. Alt + Enter: tam ekran (Alt Gr de); o basış başka bir şey yapmaz.
## - Kemer yuvasına sağ tık: kemerin üstünde taşınabilir eşyaların listesi; birini seçince o yuvaya girer, "Yuvayı boşalt" da var.

var oyun
var hedef = null        # {p, tur}
var _t := 0.0
var menu: PanelContainer

func kur(o) -> void:
	oyun = o
	menu = PanelContainer.new()
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.07, 0.09, 0.07, 0.96)
	st.border_color = Color("#c9a24a")
	st.set_border_width_all(2)
	st.set_content_margin_all(6)
	menu.add_theme_stylebox_override("panel", st)
	menu.visible = false
	oyun.hud.add_child(menu)

func _input(e: InputEvent) -> void:
	if e is InputEventKey and e.pressed and not e.echo and (e.physical_keycode == KEY_ENTER or e.physical_keycode == KEY_KP_ENTER) and (e.alt_pressed or Input.is_key_pressed(KEY_ALT)):
		Ayarlar.tam_ekran = DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN
		Ayarlar.kaydet()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if Ayarlar.tam_ekran else DisplayServer.WINDOW_MODE_WINDOWED)
		get_viewport().set_input_as_handled()
		return
	if menu.visible and ((e is InputEventMouseButton and e.pressed and not menu.get_global_rect().has_point(e.position)) or (e is InputEventKey and e.pressed and e.physical_keycode == KEY_ESCAPE)):
		menu.visible = false
		get_viewport().set_input_as_handled()

# ------------------------------------------------------------------ tıkla, git
## sol tık: tıklanan yerde bir hedef varsa oraya yürür (true döner, vuruş olmaz)
func tikla(w: Vector2) -> bool:
	var h = _hedef(w)
	if h == null: return false
	var P: Vector2 = oyun.oyuncu.position
	if P.distance_to(h.p) < float(h.r):
		_yap()
		return true
	hedef = h
	return true

func _hedef(w: Vector2):
	var T = oyun.toplama
	for d in T.dusenler:
		if d.node.position.distance_to(w) < 10.0: return {p = d.node.position + Vector2(0, 2), r = 8.0}
	for n in oyun.kisiler:
		if n.visible and n.position.distance_to(w + Vector2(0, 12)) < 14.0: return {p = n.position, r = 24.0}
	var tur: String = oyun.env.elde_tur()
	for d in oyun.dugumler:
		if not d.canli or d.position.distance_to(w + Vector2(0, 4)) >= 12.0: continue
		if T.G.nodes.get(d.ad, {}).get("mine", false) and tur != "pick": return null
		return {p = d.position, r = 18.0}
	for ag in oyun.agaclar:
		if not is_instance_valid(ag) or not ag.visible or ag.position.distance_to(w + Vector2(0, 14)) >= 14.0: continue
		if tur != "axe" and T.G.trees[ag.tur].fruit == null: return null
		return {p = ag.position, r = 18.0}
	var I: Dictionary = oyun.toplama_veri.istasyon
	for q in [Vector2(I.kazan.x, I.kazan.y), Vector2(I.ors.x, I.ors.y), Vector2(I.ors2.x, I.ors2.y)]:
		if q.distance_to(w) < 14.0: return {p = q, r = 16.0}
	if oyun.kamp != null:
		for c in oyun.kamp.camps:
			if c.t > 0.0 and c.p.distance_to(w) < 12.0: return {p = c.p, r = 18.0}
	return null

## yürüyüşün yönü (oyuncu.gd, klavye yönü yokken okur)
func yon() -> Vector2:
	if hedef == null: return Vector2.ZERO
	var d: Vector2 = hedef.p - oyun.oyuncu.position
	if d.length() < float(hedef.r):
		hedef = null
		_yap.call_deferred()
		return Vector2.ZERO
	return d.normalized()

func _yap() -> void:
	oyun.oyuncu.yuruyor = false
	oyun.toplama.f_bas()

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	var O = oyun.oyuncu
	if hedef != null:
		_t += dt
		var el: Vector2 = Input.get_vector("sol", "sag", "yukari", "asagi", 0.3)
		if el != Vector2.ZERO or O.kilit or O.bayildi or oyun.pencere_acik() or _t > 12.0:
			hedef = null
	else:
		_t = 0.0
	if Input.is_action_just_pressed("eli_bosalt") and not oyun.pencere_acik():
		oyun.env.el = -1
		oyun.env._el_degisti()
		oyun.env.kemer_ciz()

# ------------------------------------------------------------------ yuvaya sağ tık: değiştir
func yuva_menu(i: int, at: Vector2) -> void:
	for c in menu.get_children(): c.queue_free()
	var v := VBoxContainer.new()
	menu.add_child(v)
	var b0 := Label.new()
	b0.text = "%d. yuvaya ne girsin?" % (i + 1)
	b0.add_theme_color_override("font_color", Color("#f2c94c"))
	v.add_child(b0)
	var env = oyun.env
	var C = env.canta
	var adlar: Array = []
	for n in env.inv:
		if env.adet(n) > 0 and C._tasinir(n): adlar.append(n)
	adlar.sort()
	for n in adlar:
		var b := Button.new()
		b.text = n + ("  (%d. yuvada)" % (env.kemer.find(n) + 1) if env.kemer.find(n) >= 0 else "")
		b.icon = env.ikon_al(n)
		b.expand_icon = false
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.add_theme_font_size_override("font_size", 12)
		var nn: String = n
		b.pressed.connect(func():
			menu.visible = false
			C.kemere_birak({esya = nn}, i))
		v.add_child(b)
	if env.kemer[i] != null:
		var x := Button.new()
		x.text = "Yuvayı boşalt"
		x.pressed.connect(func():
			menu.visible = false
			env.kemer[i] = null
			if env.el == i: env.el = -1
			env.kemer_ciz())
		v.add_child(x)
	menu.visible = true
	menu.reset_size()
	var V: Vector2 = menu.get_viewport_rect().size
	menu.position = Vector2(clampf(at.x - menu.size.x / 2.0, 4.0, V.x - menu.size.x - 4.0), maxf(4.0, at.y - menu.size.y - 12.0))
