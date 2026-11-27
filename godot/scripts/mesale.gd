## Meşale yuvası (web v4.x torch slot; belge: Sistemler › Meşale): kemerin solundaki tek yuva; meşale yalnız oraya girer.
## " tuşu (1'in solundaki) ya da yuvaya tıklamak yakar, bir daha basmak söndürür; yalnız yanarken tükenir. Biten meşale gider,
## varsa yenisi yanar. Işığı Kaba meşale 80 px, Meşale 115 px; mağarada iki katı (belge: Mağaralar kural 5).
extends Node

const SIRA := ["Meşale", "Kaba meşale"]
var oyun
var env
var V: Dictionary          # magara.json → mesale {isik, sure}
var ts = null              # yuvadaki meşale
var yaniyor := false
var yanma := {}            # meşale adı → kalan saniye
var uyari := {}
var yuva: PanelContainer
var resim: TextureRect
var cubuk: ProgressBar
var isik: PointLight2D

func kur(o, mesale_veri: Dictionary) -> void:
	oyun = o
	env = o.env
	V = mesale_veri
	yuva = PanelContainer.new()
	yuva.custom_minimum_size = Vector2(40, 40)
	yuva.mouse_filter = Control.MOUSE_FILTER_STOP
	yuva.gui_input.connect(_tik)
	yuva.tooltip_text = "Meşale yuvası (\" tuşu: yak / söndür)"
	var c := Control.new(); c.custom_minimum_size = Vector2(36, 36); c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	resim = TextureRect.new(); resim.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST; resim.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	resim.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; resim.size = Vector2(32, 32); resim.position = Vector2(2, 1); resim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cubuk = ProgressBar.new(); cubuk.show_percentage = false; cubuk.size = Vector2(32, 4); cubuk.position = Vector2(2, 33); cubuk.max_value = 100.0
	cubuk.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cb := StyleBoxFlat.new(); cb.bg_color = Color("#2a1a10"); var cf := StyleBoxFlat.new(); cf.bg_color = Color("#ffb84a")
	cubuk.add_theme_stylebox_override("background", cb); cubuk.add_theme_stylebox_override("fill", cf)
	var u := Label.new(); u.text = "\""; u.add_theme_font_size_override("font_size", 9); oyun._golge(u); u.position = Vector2(1, -3)
	c.add_child(resim); c.add_child(cubuk); c.add_child(u)
	yuva.add_child(c)
	oyun.hud.add_child(yuva)
	isik = PointLight2D.new()
	var g := GradientTexture2D.new()
	g.width = 256; g.height = 256; g.fill = GradientTexture2D.FILL_RADIAL
	g.fill_from = Vector2(0.5, 0.5); g.fill_to = Vector2(1.0, 0.5)
	var gr := Gradient.new(); gr.set_color(0, Color(1, 0.86, 0.6, 1)); gr.set_color(1, Color(1, 0.7, 0.4, 0))
	gr.add_point(0.6, Color(1, 0.8, 0.5, 0.75))
	g.gradient = gr
	isik.texture = g
	isik.energy = 1.1
	isik.position = Vector2(4, -10)
	isik.enabled = false
	oyun.oyuncu.add_child(isik)
	_ciz()

func en_iyi():
	for n in SIRA:
		if env.adet(n) > 0: return n
	return null

func elde():    # yanan meşale (web torchHeld)
	return ts if yaniyor and ts != null and env.adet(ts) > 0 else null

func var_mi() -> bool:
	return en_iyi() != null

func degistir() -> void:
	if ts == null or env.adet(ts) <= 0:
		ts = en_iyi()
		if ts == null:
			env.mesaj("Meşalen yok: 2 dal + 2 lif + 2 yapraktan bir Kaba meşale yap (Tab).", true)
			return
	yaniyor = not yaniyor
	if yaniyor:
		for k in 8:
			oyun.parca(oyun.oyuncu.position + Vector2(6, -14), Vector2(randf_range(-7, 7), -18 - randf() * 16), 0.5, Color("#ffd27a") if k % 2 else Color("#f2902a"))
	else:
		env.mesaj("%s söndü; yuvasında bekliyor." % ts)
	_ciz()

func yaricap() -> float:
	var n = elde()
	if n == null: return 0.0
	var r := float(V.isik.get(n, 80))
	return r * (2.0 if oyun.magara.icinde else 1.0)

func _process(dt: float) -> void:
	if Input.is_action_just_pressed("mesale") and not oyun.sahne.acik:
		degistir()
	if ts == null or env.adet(ts) <= 0:
		var b = en_iyi()
		if b != ts:
			ts = b
			if ts == null: yaniyor = false
			_ciz()
	var n = elde()
	var lb: bool = n == null and oyun.isikci != null and oyun.isikci.lamba()
	isik.enabled = (n != null or lb) and oyun.magara.icinde
	if lb: isik.texture_scale = 125.0 * 2.0 / 128.0
	if n != null:
		isik.texture_scale = yaricap() / 128.0
		isik.energy = 1.05 + 0.08 * sin(Time.get_ticks_msec() * 0.012)
		var mx := float(V.sure.get(n, 170))
		var b: float = float(yanma.get(n, mx)) - (0.0 if Hile.dayan else dt * (0.75 if oyun.kesif.usta("Ateş") else 1.0))
		yanma[n] = b
		var pc := b / mx
		if pc < 0.35 and int(uyari.get(n, 0)) < 1:
			uyari[n] = 1
			env.mesaj("%s azalıyor (%%%d)" % [n, int(pc * 100)], true)
		if b <= 0.0:
			yanma.erase(n)
			uyari[n] = 0
			env.eksilt(n)
			for k in 10:
				oyun.parca(oyun.oyuncu.position + Vector2(6, -12), Vector2(randf_range(-10, 10), -15 - randf() * 20), 0.8, Color("#6a6a6a") if k % 2 else Color("#9a9a9a"))
			env.mesaj(("%s söndü; yenisini yaktın (%d kaldı)." % [n, env.adet(n)]) if env.adet(n) > 0 else ("%s söndü! Yenisini yap (Tab)." % n), true)
			if env.adet(n) <= 0:
				ts = en_iyi()
				yaniyor = ts != null and yaniyor
		_ciz()
	var k: Control = env.kemer_kutu
	yuva.position = k.position - Vector2(48, 0)

func _ciz() -> void:
	var st := StyleBoxFlat.new()
	var n = ts if ts != null and env.adet(ts) > 0 else null
	var lit: bool = elde() != null
	st.bg_color = Color(0.22, 0.12, 0.05, 0.9) if lit else Color(0.1, 0.13, 0.1, 0.85)
	st.border_color = Color("#ffb84a") if lit else Color("#2a3328")
	st.set_border_width_all(2)
	yuva.add_theme_stylebox_override("panel", st)
	resim.texture = env.ikon_al(n) if n != null else null
	resim.modulate = Color.WHITE if lit else Color(0.7, 0.7, 0.7)
	cubuk.visible = n != null
	if n != null:
		var mx := float(V.sure.get(n, 170))
		cubuk.value = clampf(float(yanma.get(n, mx)) / mx * 100.0, 0.0, 100.0)

func _tik(e: InputEvent) -> void:
	if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
		degistir()
		yuva.accept_event()
