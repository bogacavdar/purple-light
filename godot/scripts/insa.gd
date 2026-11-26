## İnşa kipi (web v365build): zemin ve yol, çit, duvar, kapı, Direk feneri; karo ızgarasına konur (N ile açılır).
extends Node2D

const T := 16
const LIM0 := 2000
const LIM1 := 600
const LIML := 24
const FENER_R := 90.0
const ORDER := ["Toprak yol", "Çakıl yol", "Ahşap parke", "Dal çit", "Çit", "Taş duvar", "Tahta kapı", "Direk feneri"]
const YLD := {"Toprak yol": 4, "Çakıl yol": 4, "Ahşap parke": 4, "Dal çit": 2, "Çit": 2}
const RESN := ["Çam reçinesi", "Ladin reçinesi", "Huş katranı"]

var oyun
var env
var V: Dictionary            # data/insa.json
var BYK := [{}, {}]          # g → k → parça adı
var G0 := {}                 # Vector2i → zemin türü (k)
var G1 := {}                 # Vector2i → {k, turn}
var LAMBA := {}              # Vector2i → {f, on, isik}
var acik := false
var sec := ""
var dondur := false
var surukle := 0             # 1 koy, 2 kaldır
var son_karo := Vector2i(-99999, -99999)
var zemin_cizim: Node2D
var duvar_dugum := {}        # Vector2i → Node2D (y sırası için nesneler'in içinde)
var hayalet: Node2D
var tex := {}
var ui: CanvasLayer
var serit: HBoxContainer
var ust_yazi: Label
var msg_yazi: Label

func kur(o) -> void:
	oyun = o
	env = o.env
	V = o._json("res://data/insa.json")
	for n in V.parca:
		BYK[int(V.parca[n].g)][int(V.parca[n].k)] = n
	zemin_cizim = Node2D.new()
	zemin_cizim.z_index = -1
	zemin_cizim.draw.connect(_zemin_ciz)
	o.add_child(zemin_cizim)
	o.move_child(zemin_cizim, o.nesneler.get_index())
	hayalet = Node2D.new()
	hayalet.z_index = 40
	hayalet.draw.connect(_hayalet_ciz)
	add_child(hayalet)
	_ui()

func _t(ad: String) -> Texture2D:
	if not tex.has(ad): tex[ad] = load("res://art/insa/%s.png" % ad)
	return tex[ad]

# ------------------------------------------------------------------ ızgara okuma
static func karo(p: Vector2) -> Vector2i:
	return Vector2i(int(floor(p.x / T)), int(floor(p.y / T)))

func _katı(c: Vector2i, canli: bool) -> bool:
	if not G1.has(c): return false
	var k: int = int(G1[c].k)
	if k == 1: return false
	if k == 4: return canli
	return true

## oyuncu (canli=false) ya da canlı (true) bu noktada duvara takılır mı
func engel(p: Vector2, half: float, canli := false) -> bool:
	if G1.is_empty(): return false
	for d in [Vector2(-half, -half), Vector2(half, -half), Vector2(-half, half), Vector2(half, half)]:
		if _katı(karo(p + d), canli): return true
	return false

func dal_cit(p: Vector2) -> bool:
	var c := karo(p)
	return G1.has(c) and int(G1[c].k) == 1

func yolda(p: Vector2) -> bool:
	var c := karo(p)
	if not G0.has(c): return false
	return int(V.parca[BYK[0][int(G0[c])]].road) == 1

func var_mi(n: String) -> bool:
	if not V.parca.has(n): return false
	var p: Dictionary = V.parca[n]
	var G: Dictionary = G0 if int(p.g) == 0 else G1
	for c in G:
		var k: int = int(G[c]) if int(p.g) == 0 else int(G[c].k)
		if k == int(p.k): return true
	return false

func _maske(c: Vector2i) -> int:
	var f := func(q: Vector2i) -> bool:
		if not G1.has(q): return false
		var k: int = int(G1[q].k)
		return k >= 1 and k <= 4
	return (1 if f.call(c + Vector2i(0, -1)) else 0) | (2 if f.call(c + Vector2i(1, 0)) else 0) | (4 if f.call(c + Vector2i(0, 1)) else 0) | (8 if f.call(c + Vector2i(-1, 0)) else 0)

func sayi0() -> int: return G0.size()
func sayi_l() -> int: return LAMBA.size()
func sayi1() -> int: return G1.size() - LAMBA.size()

# ------------------------------------------------------------------ çizim
func _zemin_ciz() -> void:
	var cam: Vector2 = oyun.kamera.get_screen_center_position()
	var vs: Vector2 = get_viewport().get_visible_rect().size / oyun.kamera.zoom
	var a := karo(cam - vs / 2.0) - Vector2i(1, 1)
	var b := karo(cam + vs / 2.0) + Vector2i(1, 1)
	for c in G0:
		if c.x < a.x or c.y < a.y or c.x > b.x or c.y > b.y: continue
		var v: int = ((c.x * 7 + c.y * 13) % 4 + 4) % 4
		zemin_cizim.draw_texture(_t("zemin_%d_%d" % [int(G0[c]), v]), Vector2(c.x * T, c.y * T))

func _duvar_tex(c: Vector2i) -> Texture2D:
	var k: int = int(G1[c].k)
	if k == 5: return _t("fener")
	if k == 4:
		var P: Vector2 = oyun.oyuncu.position
		var x := c.x * T + 8.0
		var y := c.y * T + 8.0
		var ac := absf(P.x - x) < 26.0 and absf(P.y - y) < 26.0
		return _t("kapi_%d_%d_%d" % [_maske(c), 1 if G1[c].turn else 0, 1 if ac else 0])
	return _t("duvar_%d_%d" % [k, _maske(c)])

func _duvar_yenile(c: Vector2i) -> void:
	for d in [Vector2i.ZERO, Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var q: Vector2i = c + d
		if duvar_dugum.has(q):
			if not G1.has(q):
				duvar_dugum[q].queue_free()
				duvar_dugum.erase(q)
			else:
				duvar_dugum[q].texture = _duvar_tex(q)
		elif G1.has(q):
			var s := Sprite2D.new()
			s.centered = false
			s.offset = Vector2(-8, -24)
			s.position = Vector2(q.x * T + 8, q.y * T + 16)
			s.texture = _duvar_tex(q)
			oyun.nesneler.add_child(s)
			duvar_dugum[q] = s

# ------------------------------------------------------------------ nereye konur (web why)
func neden(c: Vector2i, n: String) -> String:
	var p: Dictionary = V.parca[n]
	var x := c.x * T + 8.0
	var y := c.y * T + 8.0
	var P := Vector2(x, y)
	var tl: int = oyun.tile_at(P)
	if tl < 0 or tl > 2: return "Buraya konmaz"
	if int(p.g) == 1 and G1.has(c): return "Burada zaten bir parça var"
	if int(p.g) == 0 and G0.has(c): return "Burada zaten bir parça var"
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.visible and absf(ag.position.x - x) < 12.0 and absf(ag.position.y + 2.0 - y) < 12.0: return "Burada ağaç var"
	for d in oyun.dugumler:
		if d.canli and oyun.toplama_veri.nodes.has(d.ad) and oyun.toplama_veri.nodes[d.ad].get("mine", false) and absf(d.position.x - x) < 12.0 and absf(d.position.y - y) < 12.0: return "Burada kaya var"
	for o in oyun.yapi.kurulu:
		var f: Vector2i = oyun.yapi.ayak(o.n, o.rot)
		if c.x >= o.tx and c.x < o.tx + f.x and c.y >= o.ty and c.y < o.ty + f.y: return "Burada bir yapı var"
	var O: Vector2 = oyun.oyuncu.position
	if int(p.g) == 1 and absf(O.x - x) < 13.0 and absf(O.y - y) < 13.0: return "Önce biraz kenara çekil"
	var Z = oyun.zaman.A
	if P.distance_to(Vector2(Z.kamp.x, Z.kamp.y)) < float(Z.guvenli.kamp): return "Kemal'in kampına kurulmaz"
	for k in oyun.kisiler:
		if k.position.distance_to(P) < 6.0 * T: return "Birinin yerine çok yakın"
	for f in Z.ates:
		if Vector2(f.x, f.y).distance_to(P) < 6.0 * T: return "Birinin yerine çok yakın"
	var M = oyun.magara.M
	if Vector2(M.kapi.x, M.kapi.y).distance_to(P) < 8.0 * T: return "Bir görev yerine çok yakın"
	var I: Dictionary = oyun.toplama_veri.istasyon
	for a in [I.kazan, I.ors, I.ors2]:
		if Vector2(a.x, a.y).distance_to(P) < 8.0 * T: return "Bir görev yerine çok yakın"
	for st in oyun.istasyonlar:
		if Vector2(st.x, st.y).distance_to(P) < 8.0 * T: return "Bir görev yerine çok yakın"
	if int(p.g) == 0 and sayi0() >= LIM0: return "Zemin sınırı dolu"
	if int(p.g) == 1 and int(p.lamp) == 1 and sayi_l() >= LIML: return "Fener sınırı dolu"
	if int(p.g) == 1 and int(p.lamp) == 0 and sayi1() >= LIM1: return "Çit ve duvar sınırı dolu"
	return ""

func koy(c: Vector2i, n: String, sessiz := false) -> bool:
	if env.adet(n) <= 0:
		if not sessiz: _msg("Çantanda %s kalmadı" % n)
		return false
	var w := neden(c, n)
	if w != "":
		if not sessiz:
			_msg(w)
			oyun.yazi(Vector2(c.x * T + 8, c.y * T), w, Color("#ff9a8a"), 7)
		return false
	var p: Dictionary = V.parca[n]
	env.eksilt(n)
	if int(p.g) == 0:
		G0[c] = int(p.k)
		zemin_cizim.queue_redraw()
	else:
		G1[c] = {k = int(p.k), turn = dondur and int(p.door) == 1}
		if int(p.lamp) == 1: _lamba_ekle(c, 1)
		_duvar_yenile(c)
	# karodaki toplanabilir kalkar
	for d in oyun.dugumler:
		if d.canli and karo(d.position) == c: d.oldur(1e9)
	_serit()
	return true

func kaldir(c: Vector2i, g: int) -> bool:
	if g == 1 and G1.has(c):
		var n: String = BYK[1][int(G1[c].k)]
		G1.erase(c)
		if LAMBA.has(c):
			if LAMBA[c].isik != null: LAMBA[c].isik.queue_free()
			LAMBA.erase(c)
		_duvar_yenile(c)
		env.ekle(n)
		_serit()
		return true
	if g == 0 and G0.has(c):
		env.ekle(BYK[0][int(G0[c])])
		G0.erase(c)
		zemin_cizim.queue_redraw()
		_serit()
		return true
	return false

# ------------------------------------------------------------------ Direk feneri (web LAMPS)
func _lamba_ekle(c: Vector2i, f: int) -> void:
	var l := PointLight2D.new()
	l.texture = oyun.mesale.isik.texture
	l.texture_scale = FENER_R / 128.0 * 1.3
	l.color = Color(1.0, 0.8, 0.5)
	l.position = Vector2(c.x * T + 8, c.y * T + 2)
	l.enabled = false
	oyun.add_child(l)
	LAMBA[c] = {f = f, on = false, isik = l}

func _lambalar() -> void:
	var gece: bool = oyun.zaman.dk >= 1200.0 or oyun.zaman.dk < 360.0
	var k: float = oyun.zaman.karanlik()
	for c in LAMBA:
		var L: Dictionary = LAMBA[c]
		var once: bool = L.on
		L.on = gece and int(L.f) > 0
		if once and not gece: L.f = maxi(0, int(L.f) - 1)
		L.isik.enabled = L.on and k > 0.05 and not oyun.magara.icinde

## fenerin ışığında mor ışık gelmez
func fener_isiginda(p: Vector2) -> bool:
	for c in LAMBA:
		if LAMBA[c].on and Vector2(c.x * T + 8, c.y * T + 2).distance_to(p) < FENER_R * 0.85: return true
	return false

func yakit_yakin() -> Vector2i:
	var P: Vector2 = oyun.oyuncu.position
	var en := Vector2i(-99999, -99999)
	var bd := 26.0
	for c in LAMBA:
		if int(LAMBA[c].f) >= 6: continue
		var d := Vector2(c.x * T + 8, c.y * T + 8).distance_to(P)
		if d < bd:
			bd = d
			en = c
	return en

## F: yanındaki fenere yakıt (1 Hayvan yağı ya da 2 reçine = bir gece, en çok 6)
func yakit_koy() -> bool:
	var c := yakit_yakin()
	if c.x == -99999: return false
	var L: Dictionary = LAMBA[c]
	if env.adet("Hayvan yağı") > 0:
		env.eksilt("Hayvan yağı")
	else:
		var r := ""
		for n in RESN:
			if env.adet(n) >= 2:
				r = n
				break
		if r == "":
			env.mesaj("Yakıt yok: 1 Hayvan yağı ya da 2 reçine gerekir.", true)
			return true
		env.eksilt(r, 2)
	L.f = int(L.f) + 1
	env.mesaj("Fenerin yakıtı: %d gece" % int(L.f))
	return true

# ------------------------------------------------------------------ İnşa kipi
func _ui() -> void:
	ui = CanvasLayer.new()
	ui.layer = 5
	add_child(ui)
	var p := PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.09, 0.05, 0.94); st.border_color = Color("#4a5a3a"); st.set_border_width_all(2); st.set_content_margin_all(6)
	p.add_theme_stylebox_override("panel", st)
	ui.add_child(p)
	var v := VBoxContainer.new(); p.add_child(v)
	var h := HBoxContainer.new(); v.add_child(h)
	var t := Label.new(); t.text = "İnşa"; t.add_theme_font_size_override("font_size", 14); t.add_theme_color_override("font_color", Color("#f2c94c")); h.add_child(t)
	ust_yazi = Label.new(); ust_yazi.add_theme_font_size_override("font_size", 11); ust_yazi.size_flags_horizontal = Control.SIZE_EXPAND_FILL; h.add_child(ust_yazi)
	var b := Button.new(); b.text = "Bitti"; b.pressed.connect(kapat); h.add_child(b)
	serit = HBoxContainer.new(); v.add_child(serit)
	msg_yazi = Label.new(); msg_yazi.add_theme_font_size_override("font_size", 11); msg_yazi.add_theme_color_override("font_color", Color("#ffb69a")); v.add_child(msg_yazi)
	p.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	p.name = "kutu"
	ui.visible = false

func _bilinen(n: String) -> bool:
	return oyun.el_yapimi.bilinen.has(n) or env.adet(n) > 0

func _serit() -> void:
	if not acik: return
	for c in serit.get_children():
		serit.remove_child(c); c.queue_free()
	var var_ := false
	for n in ORDER:
		if not _bilinen(n): continue
		var_ = true
		var b := Button.new()
		b.icon = env.ikon_al(n)
		b.text = "%d\n%s" % [env.adet(n), n]
		b.add_theme_font_size_override("font_size", 10)
		b.disabled = env.adet(n) <= 0
		if sec == n: b.add_theme_color_override("font_color", Color("#f2b84b"))
		b.pressed.connect(_sec.bind(n))
		serit.add_child(b)
	if not var_:
		var l := Label.new(); l.text = "Henüz bir inşa parçan yok. Yol, çit, duvar ve kapı tariflerini kazanda öğrenip elinle yaparsın."
		l.add_theme_font_size_override("font_size", 11); serit.add_child(l)
	ust_yazi.text = "  Zemin %d / 2.000 · Çit ve duvar %d / %d · Fener %d / %d" % [sayi0(), sayi1(), LIM1, sayi_l(), LIML]
	var k: Control = ui.get_node("kutu")
	k.reset_size()
	var vs := get_viewport().get_visible_rect().size
	k.position = Vector2(floorf((vs.x - k.size.x) / 2.0), vs.y - k.size.y - 70.0)

func _sec(n: String) -> void:
	sec = n
	_serit()

func _msg(t: String) -> void:
	msg_yazi.text = t

func ac() -> void:
	if oyun.magara.icinde:
		env.mesaj("Burada inşa edilmez.", true)
		return
	acik = true
	sec = sec if env.adet(sec) > 0 else ""
	ui.visible = true
	_msg("")
	_serit()

func kapat() -> void:
	acik = false
	surukle = 0
	ui.visible = false
	hayalet.queue_redraw()

func _fare_karo() -> Vector2i:
	return karo(get_global_mouse_position())

func _hayalet_ciz() -> void:
	if not acik: return
	var c := _fare_karo()
	for y in range(c.y - 3, c.y + 4):
		for x in range(c.x - 3, c.x + 4):
			hayalet.draw_rect(Rect2(x * T + 0.5, y * T + 0.5, T - 1, T - 1), Color(1, 1, 1, 0.1), false, 1.0)
	if sec == "":
		hayalet.draw_rect(Rect2(c.x * T, c.y * T, T, T), Color(1, 1, 1, 0.5), false, 1.0)
		return
	var ok := neden(c, sec) == ""
	hayalet.draw_rect(Rect2(c.x * T, c.y * T, T, T), Color(0.43, 0.86, 0.35, 0.35) if ok else Color(0.94, 0.31, 0.24, 0.4))
	hayalet.draw_texture(env.ikon_al(sec), Vector2(c.x * T, c.y * T), Color(1, 1, 1, 0.7))

func _isle_karo(c: Vector2i) -> void:
	if surukle == 1 and sec != "": koy(c, sec)
	elif surukle == 2:
		if not kaldir(c, 1): kaldir(c, 0)
	son_karo = c

func _unhandled_input(e: InputEvent) -> void:
	if not acik:
		if e.is_action_pressed("insa") and not oyun.pencere_acik() and not oyun.yapi.yerlestiriyor():
			ac()
			get_viewport().set_input_as_handled()
		return
	if e is InputEventKey and e.pressed and not e.echo:
		if e.physical_keycode == KEY_ESCAPE or e.is_action("insa"):
			kapat()
			get_viewport().set_input_as_handled()
		elif e.physical_keycode == KEY_R:
			dondur = not dondur
			_msg("Kapı %s" % ("yan döndü" if dondur else "düz"))
			get_viewport().set_input_as_handled()
	elif e is InputEventMouseButton:
		if e.pressed and (e.button_index == MOUSE_BUTTON_LEFT or e.button_index == MOUSE_BUTTON_RIGHT):
			surukle = 1 if e.button_index == MOUSE_BUTTON_LEFT else 2
			son_karo = Vector2i(-99999, -99999)
			_isle_karo(_fare_karo())
			get_viewport().set_input_as_handled()
		elif not e.pressed:
			surukle = 0
	elif e is InputEventMouseMotion and surukle != 0:
		var c := _fare_karo()
		if c != son_karo: _isle_karo(c)
		get_viewport().set_input_as_handled()

var t := 0.0
func _process(dt: float) -> void:
	t += dt
	if acik: hayalet.queue_redraw()
	zemin_cizim.queue_redraw()
	if fmod(t, 0.25) < dt:
		_lambalar()
		# kapılar: oyuncu yaklaşınca açık görünür
		var P: Vector2 = oyun.oyuncu.position
		for c in G1:
			if int(G1[c].k) == 4 and duvar_dugum.has(c) and Vector2(c.x * T + 8, c.y * T + 8).distance_to(P) < 80.0:
				duvar_dugum[c].texture = _duvar_tex(c)

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	var a := []
	for c in G0: a.append([c.x, c.y, int(G0[c])])
	var b := []
	for c in G1: b.append([c.x, c.y, int(G1[c].k), 1 if G1[c].turn else 0, int(LAMBA[c].f) if LAMBA.has(c) else 0])
	return {g0 = a, g1 = b}

func yukle(d: Dictionary) -> void:
	for c in duvar_dugum: duvar_dugum[c].queue_free()
	duvar_dugum = {}
	for c in LAMBA:
		if LAMBA[c].isik != null: LAMBA[c].isik.queue_free()
	LAMBA = {}
	G0 = {}; G1 = {}
	for x in d.get("g0", []): G0[Vector2i(int(x[0]), int(x[1]))] = int(x[2])
	for x in d.get("g1", []):
		var c := Vector2i(int(x[0]), int(x[1]))
		G1[c] = {k = int(x[2]), turn = int(x[3]) == 1}
		if int(x[2]) == 5: _lamba_ekle(c, int(x[4]))
	for c in G1: _duvar_yenile(c)
	zemin_cizim.queue_redraw()
