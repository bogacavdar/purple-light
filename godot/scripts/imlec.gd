extends Node
## Fare imleci (web v371el; belge Sistemler › Kontroller › Fare imleci): oyunun üstünde mor ışıkta piksel bir el. 16×16 şekil 2 kat:
## krem el, ince koyu mor kenar, mor parmak ucu, çevresinde soluk mor ışık. Toplanacak, konuşulacak ya da kullanılacak bir şeyin
## üstünde el açılır ve ışığı büyür. Dokunmatik ekranda yok; ana menüde ve pencerelerde normal ok.

const POINT := ["................", "......XX........", "......XX........", "......XX........", "......XX........", "......XX........", "......XXXXX.....", "......XXXXXXX...", "...XX.XXXXXXXX..", "...XXXXXXXXXXX..", "....XXXXXXXXXX..", ".....XXXXXXXXX..", "......XXXXXXX...", "......XXXXXXX...", "................", "................"]
const PALM := ["................", "....X.X.X.......", "....X.X.X.X.....", "....X.X.X.X.....", "....X.X.X.X.....", "....XXXXXXX.....", ".X..XXXXXXX.....", ".XX.XXXXXXX.....", "..XXXXXXXXX.....", "...XXXXXXXX.....", "....XXXXXXX.....", ".....XXXXX......", ".....XXXXX......", "................", "................", "................"]
const SC := 2
const N := 16
const HOT := Vector2(13, 2)
var oyun
var el_p: ImageTexture
var el_a: ImageTexture
var acik = false
var _t := 0.0
var etkin := true

func kur(o) -> void:
	oyun = o
	etkin = not DisplayServer.is_touchscreen_available()
	if not etkin: return
	_ipucu_kur()
	el_p = _yap(POINT, false)
	el_a = _yap(PALM, true)
	Input.set_custom_mouse_cursor(el_p, Input.CURSOR_ARROW, HOT)

func _yap(M: Array, ac: bool) -> ImageTexture:
	var im := Image.create(N * SC, N * SC, false, Image.FORMAT_RGBA8)
	var F := func(x: int, y: int) -> bool: return x >= 0 and y >= 0 and x < N and y < N and M[y][x] == "X"
	var E := func(x: int, y: int) -> bool: return not F.call(x, y) and (F.call(x + 1, y) or F.call(x - 1, y) or F.call(x, y + 1) or F.call(x, y - 1))
	var px := func(x: int, y: int, c: Color):
		for yy in SC:
			for xx in SC: im.set_pixel(x * SC + xx, y * SC + yy, c)
	var ga := 0.78 if ac else 0.5
	for y in N:
		for x in N:
			if F.call(x, y) or E.call(x, y): continue
			var near := false
			var diag := true
			for dy in [-1, 0, 1]:
				for dx in [-1, 0, 1]:
					if E.call(x + dx, y + dy):
						near = true
						if dx == 0 or dy == 0: diag = false
			if near: px.call(x, y, Color(160 / 255.0, 80 / 255.0, 1.0, ga * 0.55 if diag else ga))
	for y in N:
		for x in N:
			if E.call(x, y): px.call(x, y, Color("#3a1c5c"))
			elif F.call(x, y): px.call(x, y, Color("#dccbf0") if (not F.call(x + 1, y) or not F.call(x, y + 1)) else Color("#f6eedc"))
	if not ac:
		for k in [[8, 7], [10, 7], [12, 8]]:
			if F.call(k[0], k[1]): px.call(k[0], k[1], Color("#a98ed4"))
		px.call(6, 1, Color("#c9a0ff")); px.call(7, 1, Color("#e8d8ff"))
	else:
		for x in [4, 6, 8, 10]:
			var y := 2 if x == 10 else 1
			if F.call(x, y): px.call(x, y, Color("#d4b4ff"))
		px.call(6, 8, Color("#e8d8ff")); px.call(13, 2, Color.WHITE); px.call(2, 3, Color("#e8d8ff")); px.call(14, 6, Color("#c9a0ff"))
	return ImageTexture.create_from_image(im)

func _process(dt: float) -> void:
	if not etkin or oyun == null or oyun.oyuncu == null: return
	_t -= dt
	if _t > 0.0: return
	_t = 0.1
	if oyun.basta:
		_ipucu(null)
		if acik != null:
			Input.set_custom_mouse_cursor(null)
			acik = null
		return
	var v := false
	var w = null
	if not oyun.basta and not oyun.pencere_acik() and not oyun.konusma.visible and not oyun.sahne.acik:
		var mw: Vector2 = oyun.get_global_mouse_position()
		v = _ustunde(mw)
		if get_viewport().get_visible_rect().has_point(get_viewport().get_mouse_position()): w = _ne(mw)
	_ipucu(w)
	if acik == null or v != acik:
		acik = v
		Input.set_custom_mouse_cursor(el_a if v else el_p, Input.CURSOR_ARROW, HOT)

## farenin altında toplanacak, konuşulacak ya da kullanılacak bir şey var mı (web pickAt; su sayılmaz)
func _ustunde(w: Vector2) -> bool:
	for d in oyun.toplama.dusenler:
		if d.node.position.distance_to(w) < 10.0: return true
	for d in oyun.dugumler:
		if d.canli and d.position.distance_to(w + Vector2(0, 4)) < 12.0: return true
	for n in oyun.kisiler:
		if n.visible and n.position.distance_to(w + Vector2(0, 12)) < 14.0: return true
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.visible and ag.position.distance_to(w + Vector2(0, 14)) < 14.0: return true
	if oyun.kamp != null:
		for c in oyun.kamp.camps:
			if c.t > 0.0 and c.p.distance_to(w) < 12.0: return true
	return false

# ------------------------------------------------------------------ farenin altındakinin adı (web v146 hovtip; belge Sistemler › Kontroller › Fare)
## ağaç, maden, toplanacak şey, yerdeki eşya, kişi, canlı, kamp ateşi: kalın ad + altında soluk "ne işe yarar" satırı; fare imlecin sağ üstünde
var ip_kat: CanvasLayer
var ip_kutu: PanelContainer
var ip_ad: Label
var ip_alt: Label
var _ip_k := ""

func _ipucu_kur() -> void:
	ip_kat = CanvasLayer.new(); ip_kat.layer = 5
	add_child(ip_kat)
	ip_kutu = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#232d1f"); st.border_color = Color("#4a5a3e"); st.set_border_width_all(2)
	st.content_margin_left = 8; st.content_margin_right = 8; st.content_margin_top = 2; st.content_margin_bottom = 3
	ip_kutu.add_theme_stylebox_override("panel", st)
	ip_kutu.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var v := VBoxContainer.new(); v.add_theme_constant_override("separation", 0); v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ip_ad = Label.new(); ip_ad.add_theme_font_size_override("font_size", 14); ip_ad.add_theme_color_override("font_color", Color("#f4ecd8"))
	ip_alt = Label.new(); ip_alt.add_theme_font_size_override("font_size", 11); ip_alt.add_theme_color_override("font_color", Color(0.957, 0.925, 0.847, 0.75))
	v.add_child(ip_ad); v.add_child(ip_alt)
	ip_kutu.add_child(v)
	ip_kutu.visible = false
	ip_kat.add_child(ip_kutu)

func _ipucu(w) -> void:
	if ip_kutu == null: return
	if w == null:
		ip_kutu.visible = false; _ip_k = ""
		return
	var k: String = w[0] + "|" + w[1]
	if k != _ip_k:
		_ip_k = k
		ip_ad.text = w[0]; ip_alt.text = w[1]
		ip_kutu.reset_size()
	var m := get_viewport().get_mouse_position()
	var vs := get_viewport().get_visible_rect().size
	ip_kutu.position = Vector2(minf(m.x + 14.0, vs.x - ip_kutu.size.x - 4.0), maxf(4.0, m.y - ip_kutu.size.y * 1.2))
	ip_kutu.visible = true

func _kazma(t: int) -> String:
	var en := ""; var et := 99
	for n in oyun.env.G.tools:
		var T: Dictionary = oyun.env.G.tools[n]
		if T.kind == "pick" and int(T.tier) >= t and int(T.tier) < et:
			et = int(T.tier); en = n
	return (en + " ya da daha iyisi") if en != "" else "kazma gerekli"

func _ne(w: Vector2):
	var KE := Ayarlar.tus_adi("topla"); var KQ := Ayarlar.tus_adi("vur")
	var bd := 7.0; var bn = null
	for d in oyun.toplama.dusenler:
		var q: float = d.node.position.distance_to(w)
		if q < bd: bd = q; bn = d
	if bn != null: return [str(bn.n), "yerde · üstünden yürü ya da " + KE]
	for n in oyun.kisiler:
		if n.visible and n.position.distance_to(w + Vector2(0, 12)) < 14.0: return [str(n.K.ad), KE + " ile konuş"]
	for c in oyun.canlilari_ver():
		if c.hp > 0 and c.visible and c.position.distance_to(w + Vector2(0, 6)) < 12.0:
			var t: String = str(c.D.get("temper", ""))
			return [str(c.tur), "saldırgan · sol tık ya da %s ile vur" % KQ if t == "saldırgan" else ("zararsız" if t == "zararsız" else "kızdırırsan saldırır")]
	for d in oyun.dugumler:
		if d.canli and d.position.distance_to(w + Vector2(0, 4)) < 12.0:
			var A: Dictionary = oyun.env.G.nodes.get(d.ad, {})
			if A.get("mine", false): return [str(A.get("ad", d.ad)), _kazma(int(A.get("tier", 1)))]
			if A.get("bush", false): return [str(d.ad) + " çalısı", "%s ile topla · %d kez daha" % [KE, d.kalan]]
			return [str(d.ad), KE + " ile topla"]
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.visible and ag.position.distance_to(w + Vector2(0, 14)) < 14.0:
			var T: Dictionary = oyun.env.G.trees.get(ag.tur, {})
			var nm: String = ag.tur if ag.tur.ends_with("ağacı") else ag.tur + " ağacı"
			return [nm, "silkelenir (meyvesi düşer)" if T.get("noCut", false) else ("silkelenir · baltayla kesilir" if T.get("fruit") != null else "baltayla kesilir")]
	if oyun.kamp != null:
		for c in oyun.kamp.camps:
			if c.t > 0.0 and c.p.distance_to(w) < 12.0: return ["Kamp ateşi", KE + " ile pişir"]
	return null
