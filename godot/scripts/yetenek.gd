## Yetenek ağacı (web v1.83 SKT, renderCraft mode 'skills', skTip, buySkill, explainSkill). Y ile açılır.
## Üç ağaç (Savaş, Ekonomi, Dayanıklılık), her biri 30 yetenek; yerler, dallar, renkler, ikonlar ve fiyatlar web'den (data/yetenek.json).
extends CanvasLayer

var oyun
var Y: Dictionary
var L: Dictionary = {}          # id → yetenek (br eklenmiş)
var ikonlar := {}               # ikon adı → Texture2D (beyaz çizgi)
var sekme := "Savaş"
var pencere: PanelContainer
var baslik: Label
var sekmeler: HBoxContainer
var alan: Control
var ipucu: PanelContainer
var ipucu_yazi: RichTextLabel
var bilgi: PanelContainer
var bilgi_yazi: RichTextLabel
var not_yazi: RichTextLabel     # Börü'nün notu (ders sonrası)
var uzerinde := ""
var borunun_notu := false
const ND := 34.0

func kur(o) -> void:
	oyun = o
	layer = 6
	Y = JSON.parse_string(FileAccess.get_file_as_string("res://data/yetenek.json"))
	for br in Y.SKT:
		for x in Y.SKT[br]:
			var z: Dictionary = x.duplicate()
			z.br = br
			L[x.id] = z
	_arayuz()
	visible = false

func renk(br: String) -> Color:
	for a in Y.agaclar:
		if a.ad == br: return Color(a.renk)
	return Color.WHITE

func _ikon(k: String) -> Texture2D:
	if ikonlar.has(k): return ikonlar[k]
	var svg := '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="%s" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>' % str(Y.ikon.get(k, ""))
	var im := Image.new()
	var t: Texture2D = null
	if im.load_svg_from_string(svg, 2.0) == OK:
		t = ImageTexture.create_from_image(im)
	ikonlar[k] = t
	return t

func _arayuz() -> void:
	var arka := ColorRect.new()
	arka.color = Color(0, 0, 0, 0.45)
	arka.name = "arka"
	arka.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed: kapat())
	add_child(arka)
	arka.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	pencere = PanelContainer.new()
	var sb := StyleBoxFlat.new(); sb.bg_color = Color("#1c2419"); sb.border_color = Color("#0b0f0a"); sb.set_border_width_all(3); sb.set_content_margin_all(10)
	pencere.add_theme_stylebox_override("panel", sb)
	pencere.custom_minimum_size = Vector2(720, 560)
	add_child(pencere)
	var v := VBoxContainer.new()
	pencere.add_child(v)
	var ust := HBoxContainer.new()
	v.add_child(ust)
	var t := Label.new(); t.text = "Yetenekler"; t.add_theme_font_size_override("font_size", 20)
	ust.add_child(t)
	baslik = Label.new(); baslik.size_flags_horizontal = Control.SIZE_EXPAND_FILL; baslik.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	baslik.add_theme_color_override("font_color", Color("#f2b84b")); baslik.add_theme_font_size_override("font_size", 15)
	ust.add_child(baslik)
	var x := Button.new(); x.text = "✕"; x.pressed.connect(kapat)
	ust.add_child(x)
	not_yazi = RichTextLabel.new(); not_yazi.bbcode_enabled = true; not_yazi.fit_content = true
	var nsb := StyleBoxFlat.new(); nsb.bg_color = Color("#2a1c1a"); nsb.border_color = Color("#e0503c"); nsb.set_border_width_all(2); nsb.set_content_margin_all(8)
	not_yazi.add_theme_stylebox_override("normal", nsb)
	not_yazi.visible = false
	v.add_child(not_yazi)
	sekmeler = HBoxContainer.new()
	v.add_child(sekmeler)
	alan = Control.new()
	alan.size_flags_vertical = Control.SIZE_EXPAND_FILL
	alan.custom_minimum_size = Vector2(700, 440)
	alan.clip_contents = true
	alan.draw.connect(_ciz)
	alan.gui_input.connect(_alan_girdi)
	alan.mouse_exited.connect(func():
		uzerinde = ""; ipucu.visible = false)
	v.add_child(alan)
	ipucu = PanelContainer.new()
	ipucu.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ipucu.custom_minimum_size = Vector2(230, 0)
	ipucu_yazi = RichTextLabel.new(); ipucu_yazi.bbcode_enabled = true; ipucu_yazi.fit_content = true; ipucu_yazi.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ipucu_yazi.custom_minimum_size = Vector2(220, 0)
	ipucu.add_child(ipucu_yazi)
	ipucu.visible = false
	add_child(ipucu)
	bilgi = PanelContainer.new()
	var bsb := StyleBoxFlat.new(); bsb.bg_color = Color("#232d1f"); bsb.border_color = Color("#f2b84b"); bsb.set_border_width_all(3); bsb.set_content_margin_all(14)
	bilgi.add_theme_stylebox_override("panel", bsb)
	var bv := VBoxContainer.new(); bilgi.add_child(bv)
	bilgi_yazi = RichTextLabel.new(); bilgi_yazi.bbcode_enabled = true; bilgi_yazi.fit_content = true; bilgi_yazi.custom_minimum_size = Vector2(380, 0)
	bv.add_child(bilgi_yazi)
	var ok := Button.new(); ok.text = "Tamam"; ok.pressed.connect(func(): bilgi.visible = false)
	ok.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	bv.add_child(ok)
	bilgi.visible = false
	add_child(bilgi)

func sk_sayisi(br: String) -> int:
	var n := 0
	for id in L:
		if L[id].br == br and oyun.yetenekler.has(id): n += 1
	return n

func ac(sek: String = "") -> void:
	if sek != "": sekme = sek
	visible = true
	ciz()
	_yerlestir()

func _yerlestir() -> void:
	var vs := get_viewport().get_visible_rect().size
	pencere.reset_size()
	pencere.position = ((vs - pencere.size) / 2.0).floor()

func kapat() -> void:
	if not visible: return
	if bilgi.visible:
		bilgi.visible = false
		return
	visible = false
	ipucu.visible = false
	if borunun_notu:
		borunun_notu = false
		not_yazi.visible = false
		oyun.ders.agac_kapandi()

func ciz() -> void:
	var toplam := L.size()
	var benim := 0
	for id in L: if oyun.yetenekler.has(id): benim += 1
	baslik.text = "%s Vio'n var · %d/%d yetenek" % [_sayi(oyun.env.vio), benim, toplam]
	for c in sekmeler.get_children(): c.queue_free()
	for a in Y.agaclar:
		var b := Button.new()
		var n := 0
		for id in L: if L[id].br == a.ad: n += 1
		b.text = "%s %d/%d" % [a.ad, sk_sayisi(a.ad), n]
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var c := Color(a.renk)
		var st := StyleBoxFlat.new(); st.border_color = c; st.set_border_width_all(2); st.set_content_margin_all(6)
		st.bg_color = c if a.ad == sekme else Color("#1c2419")
		b.add_theme_stylebox_override("normal", st); b.add_theme_stylebox_override("hover", st); b.add_theme_stylebox_override("pressed", st)
		b.add_theme_color_override("font_color", Color("#1c2419") if a.ad == sekme else c)
		b.add_theme_color_override("font_hover_color", Color("#1c2419") if a.ad == sekme else c)
		var ad: String = a.ad
		b.pressed.connect(func():
			sekme = ad
			ciz())
		sekmeler.add_child(b)
	alan.queue_redraw()

## web skVis: kök, alınanların çocukları, alınanlar ve onlara giden yol
func gorunen() -> Dictionary:
	var V := {}
	var S: Dictionary = oyun.yetenekler
	for id in L:
		var x: Dictionary = L[id]
		if x.br != sekme: continue
		if x.p == null or S.has(x.p) or S.has(id): V[id] = true
		if S.has(id):
			var q = x
			while q != null and q.p != null:
				V[q.p] = true
				q = L.get(q.p, null)
	return V

func seviye_gerek(x: Dictionary) -> int:
	if x.get("lv", null) != null: return int(x.lv)
	return int(Y.lvreq.get(str(int(x.c)), 1))

## web skState: own · lock (önce üstündeki) · lvl · buy · poor
func durum(x: Dictionary) -> Array:
	var S: Dictionary = oyun.yetenekler
	if S.has(x.id): return ["own", "Alındı"]
	if x.p != null and not S.has(x.p): return ["lock", "Önce: " + str(L[x.p].n)]
	var lv := seviye_gerek(x)
	if oyun.env.sv < lv: return ["lvl", "Seviye %d gerekli · %s Vio" % [lv, _sayi(int(x.c))]]
	if oyun.env.vio >= int(x.c): return ["buy", "Tıkla, al · %s Vio" % _sayi(int(x.c))]
	return ["poor", "%s Vio gerekli" % _sayi(int(x.c))]

static func _sayi(v: int) -> String:
	var s := str(v)
	var out := ""
	while s.length() > 3:
		out = "." + s.substr(s.length() - 3) + out
		s = s.substr(0, s.length() - 3)
	return s + out

func _yer(x: Dictionary) -> Vector2:
	var r := alan.size
	return Vector2(float(x.x) / 100.0 * r.x, float(x.y) / 100.0 * r.y)

func _ciz() -> void:
	var c := renk(sekme)
	var r := alan.size
	# arka: ağacın renginde hafif bir ışık
	alan.draw_rect(Rect2(Vector2.ZERO, r), Color(c.r * 0.12, c.g * 0.1, c.b * 0.08))
	alan.draw_circle(Vector2(r.x * 0.5, r.y * 0.4), r.y * 0.42, Color(c.r, c.g, c.b, 0.08))
	var V := gorunen()
	var S: Dictionary = oyun.yetenekler
	for id in V:
		var x: Dictionary = L[id]
		if x.p == null or not V.has(x.p): continue
		var P: Dictionary = L[x.p]
		var a := _yer(P); var b := _yer(x)
		var my := (a.y + b.y) / 2.0
		var pts := PackedVector2Array()
		for i in 17:
			var t := i / 16.0
			var u := 1.0 - t
			pts.append(u * u * u * a + 3.0 * u * u * t * Vector2(a.x, my) + 3.0 * u * t * t * Vector2(b.x, my) + t * t * t * b)
		var w := maxf(2.5, 9.0 - float(x.d))
		alan.draw_polyline(pts, Color(c.r, c.g, c.b, 0.8) if S.has(id) else Color("#6b4a2a"), w, true)
	var zaman := Time.get_ticks_msec() / 1000.0
	for id in V:
		var x: Dictionary = L[id]
		var p := _yer(x)
		var d := durum(x)
		var dolu: bool = d[0] == "own"
		var kenar := Color("#f3ecd8") if dolu else (Color("#ffe27a") if d[0] == "buy" else Color("#5d5b52"))
		var soluk: bool = d[0] == "poor" or d[0] == "lock" or d[0] == "lvl"
		if d[0] == "buy":
			alan.draw_circle(p, ND / 2.0 + 6.0, Color(1, 0.89, 0.48, 0.25))
		if borunun_notu and id == "K1":
			alan.draw_circle(p, ND / 2.0 + 8.0 + 3.0 * sin(zaman * 6.0), Color(1, 0.4, 0.3, 0.35))
		alan.draw_circle(p, ND / 2.0, kenar)
		alan.draw_circle(p, ND / 2.0 - 2.0, c if dolu else Color("#141a12"))
		var tex := _ikon(str(x.i))
		if tex != null:
			var ic := Color("#141a12") if dolu else c
			if soluk: ic.a = 0.6
			alan.draw_texture_rect(tex, Rect2(p - Vector2(10, 10), Vector2(20, 20)), false, ic)
		for k in int(x.t):
			var ox := (k - (int(x.t) - 1) / 2.0) * 6.0
			alan.draw_circle(p + Vector2(ox, ND / 2.0 + 2.0), 2.5, Color("#0b0f0a"))
			alan.draw_circle(p + Vector2(ox, ND / 2.0 + 2.0), 2.0, c)
	if borunun_notu: alan.queue_redraw()

func _bul(m: Vector2) -> String:
	for id in gorunen():
		if _yer(L[id]).distance_to(m) <= ND / 2.0 + 2.0: return id
	return ""

func _alan_girdi(e: InputEvent) -> void:
	if e is InputEventMouseMotion:
		var id := _bul(e.position)
		if id != uzerinde:
			uzerinde = id
			_ipucu(id)
	elif e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
		var id := _bul(e.position)
		if id != "": al(id)

func _ipucu(id: String) -> void:
	if id == "":
		ipucu.visible = false
		return
	var x: Dictionary = L[id]
	var c := renk(x.br)
	var sb := StyleBoxFlat.new(); sb.bg_color = Color("#232d1f"); sb.border_color = c; sb.set_border_width_all(2); sb.set_content_margin_all(7)
	ipucu.add_theme_stylebox_override("panel", sb)
	var d := durum(x)
	ipucu_yazi.text = "[b]%s[/b]\n[color=#cfc6ae]%s[/color]\n[color=#%s][b]%s[/b][/color]" % [x.n, x.e, c.to_html(false), d[1]]
	ipucu.visible = true
	ipucu.reset_size()
	var p := alan.global_position + _yer(x)
	var vs := get_viewport().get_visible_rect().size
	var px := p.x + ND / 2.0 + 8.0
	if px + ipucu.size.x > vs.x - 4.0: px = p.x - ND / 2.0 - 8.0 - ipucu.size.x
	ipucu.position = Vector2(px, clampf(p.y - 24.0, 4.0, vs.y - ipucu.size.y - 4.0))

## web buySkill
func al(id: String) -> void:
	var x: Dictionary = L[id]
	var S: Dictionary = oyun.yetenekler
	if S.has(id): return
	if x.p != null and not S.has(x.p):
		oyun.env.mesaj("Önce %s gerekli" % L[x.p].n, true); return
	if x.get("r", null) != null and not S.has(x.r):
		oyun.env.mesaj("Önce %s gerekli" % L[x.r].n, true); return
	if oyun.env.sv < seviye_gerek(x):
		oyun.env.mesaj("Bu yetenek için seviye %d gerekli" % seviye_gerek(x), true); return
	if oyun.env.vio < int(x.c):
		oyun.env.mesaj("%s Vio daha gerekli" % _sayi(int(x.c) - oyun.env.vio), true); return
	oyun.env.vio_ekle(-int(x.c))
	S[id] = true
	oyun.env.mesaj("Yetenek açıldı: " + str(x.n))
	oyun.oyuncu.yetenek_uygula()
	if id == "K1": oyun.oyuncu.st = oyun.oyuncu.st_max
	ciz()
	_ipucu(uzerinde)
	bilgi_yazi.text = "[b][font_size=18]%s[/font_size][/b]\n[color=#cfc6ae]%s ağacı · %s[/color]\n\n%s" % [x.n, x.br, x.e, str(Y.nasil.get(id, ""))]
	bilgi.visible = true
	bilgi.reset_size()
	bilgi.position = ((get_viewport().get_visible_rect().size - bilgi.size) / 2.0).floor()

## Börü'nün dersinden sonra: ağaç Savaş'ta açılır, Koşu yanıp söner, Börü'nün notu üstte
func borunun_gosterisi() -> void:
	borunun_notu = true
	oyun.ders.katman.visible = false
	not_yazi.text = "[b]Börü:[/b] “İşte en alttaki yanıp sönen [b]Koşu[/b]. Ağaçlar aşağıdan yukarı büyür; bir yeteneği alınca üstündekiler açılır. Koşu [b]100 Vio[/b]: Nazlı'nın pazarında bir şeyler sat, [b]100 Vio biriktir[/b] ve ilk işin bunu almak olsun. Kaçmayı bilen savaşçı uzun yaşar!” [i](Kapatınca derse devam.)[/i]"
	not_yazi.visible = true
	ac("Savaş")

func _unhandled_input(e: InputEvent) -> void:
	if visible and e is InputEventKey and e.pressed and not e.echo and (e.physical_keycode == KEY_ESCAPE or e.physical_keycode == KEY_Y):
		kapat()
		get_viewport().set_input_as_handled()
		return
	if not visible and e.is_action_pressed("yetenek") and not oyun.pencere_acik():
		if oyun.ders.agac_bekliyor(): borunun_gosterisi()
		else: ac()
		get_viewport().set_input_as_handled()
