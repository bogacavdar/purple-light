## Görev sahnesi (web offerQ/qBeats/qLines; belge: ACT 1 › Ana görevler › Hikâyeli görev sahnesi):
## sinema şeritleri iner, karakter kişinin yanına yürür, sahne betiği adım adım oynar (anlatım, konuşma balonları, duygu,
## hareket, efekt, kamera, eşya, renk). Tık ya da bir tuş sonraki adıma geçer, Esc kalanını geçer; sonunda görev penceresi açılır.
extends Control

const QHI := ["Selam %s! Bir işin mi var?", "%s, yüzünden belli, bir derdin var.", "Merhaba %s! Yardım lazım mı?", "%s! Ne iş var bugün?"]
const QMID := ["Anlat bakalım.", "Dinliyorum.", "Hıı, sonra?", "Neye ihtiyacın var?"]
const QOK := ["Tamam, hallederim!", "Bana bırak.", "Hemen bakıyorum.", "Merak etme, getiririm."]
const FXR := {"smoke": ["#8a8a8a", "#b8b8b8"], "glow": ["#ffe7a0", "#c9a2ff"], "steam": ["#e8f0f0", "#ffffff"], "bubbles": ["#a8e08a", "#c9a2ff"],
	"embers": ["#ff9a3a", "#ffd23a"], "sparkle": ["#fff6c0", "#ffffff"], "snow": ["#ffffff", "#dfe8ff"], "coins": ["#d8b0ff", "#ffd23a"],
	"dust": ["#c8b89a", "#a89878"], "leaves": ["#7fb04a", "#c8a040"], "hearts": ["#ff7a9a", "#ffb0c0"]}
const RENK := {"sepia": Color(1.0, 0.86, 0.66), "night": Color(0.45, 0.5, 0.78), "off": Color(1, 1, 1)}

var oyun
var acik := false
var faz := ""          # "yuru" · "oyna"
var L: Array = []
var i := -1
var kalan := 0.0
var o                  # kişi düğümü
var q: Dictionary
var bitince: Callable
var t0 := 0.0
var emo := {}
var goster := ""
var goster_i := -99
var eylem := {}        # {node, baz, tur, t, D}
var hedef_yer := Vector2.ZERO

var ust: ColorRect
var alt: ColorRect
var anlatim: Label
var balon: PanelContainer
var balon_yazi: Label
var balon_ip: Label
var emo_yazi: Label
var esya: VBoxContainer
var esya_resim: TextureRect
var esya_ad: Label

func kur(oy) -> void:
	oyun = oy
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	ust = ColorRect.new(); ust.color = Color(0, 0, 0, 0.92)
	alt = ColorRect.new(); alt.color = Color(0, 0, 0, 0.92)
	add_child(ust); add_child(alt)
	anlatim = Label.new(); anlatim.autowrap_mode = TextServer.AUTOWRAP_WORD; anlatim.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	anlatim.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	anlatim.add_theme_color_override("font_color", Color("#f0e6c8")); anlatim.add_theme_font_size_override("font_size", 15)
	ust.add_child(anlatim)
	balon = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#fff6d6"); st.border_color = Color("#7a5a1a"); st.set_border_width_all(2); st.set_content_margin_all(6)
	st.corner_radius_top_left = 3; st.corner_radius_top_right = 3; st.corner_radius_bottom_left = 3; st.corner_radius_bottom_right = 3
	balon.add_theme_stylebox_override("panel", st)
	var bv := VBoxContainer.new()
	balon_yazi = Label.new(); balon_yazi.autowrap_mode = TextServer.AUTOWRAP_WORD; balon_yazi.custom_minimum_size = Vector2(300, 0)
	balon_yazi.add_theme_color_override("font_color", Color("#2a1e14")); balon_yazi.add_theme_font_size_override("font_size", 15)
	balon_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	balon_ip = Label.new(); balon_ip.text = "devam için tıkla"; balon_ip.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	balon_ip.add_theme_color_override("font_color", Color(0.4, 0.3, 0.2, 0.8)); balon_ip.add_theme_font_size_override("font_size", 10)
	bv.add_child(balon_yazi); bv.add_child(balon_ip)
	balon.add_child(bv)
	add_child(balon)
	emo_yazi = Label.new(); emo_yazi.add_theme_font_size_override("font_size", 22)
	emo_yazi.add_theme_color_override("font_outline_color", Color(0, 0, 0)); emo_yazi.add_theme_constant_override("outline_size", 6)
	add_child(emo_yazi)
	esya = VBoxContainer.new(); esya.alignment = BoxContainer.ALIGNMENT_CENTER
	esya_resim = TextureRect.new(); esya_resim.custom_minimum_size = Vector2(48, 48); esya_resim.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	esya_resim.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; esya_resim.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	esya_ad = Label.new(); esya_ad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; oyun._golge(esya_ad)
	esya.add_child(esya_resim); esya.add_child(esya_ad)
	add_child(esya)
	visible = false

## kişi yakında değilse (≈14 karodan uzak) sahne atlanır, görev doğrudan pencereyle verilir
func oyna(kisi_dugumu, gorev: Dictionary, son: Callable) -> bool:
	if acik or kisi_dugumu == null or kisi_dugumu.position.distance_to(oyun.oyuncu.position) > 220.0:
		return false
	o = kisi_dugumu
	q = gorev
	bitince = son
	L = _adimlar(gorev)
	i = -1
	acik = true
	visible = true
	faz = "yuru"
	t0 = 0.0
	emo = {}
	goster = ""
	oyun.oyuncu.kilit = true
	hedef_yer = _hedef()
	return true

func _adimlar(g: Dictionary) -> Array:
	var out := []
	if g.has("sc") and not g.sc.is_empty():
		for b in g.sc:
			if b.has("n"): out.append({w = "n", t = str(b.n)})
			elif b.has("p"): out.append({w = "p", t = str(b.p)})
			else: out.append(b)
		if out.is_empty() or out[-1].get("w", "") != "p":
			out.append({w = "p", t = QOK.pick_random()})
		return out
	# betiği olmayan görev: selam, kişinin sözleri (en çok 4 balon), tepki, kabul
	var nm: String = str(o.K.ad).split(" ")[-1]
	out.append({w = "p", t = QHI.pick_random() % nm})
	var duz: String = oyun.gorev._bb(str(g.say))
	var rx := RegEx.new(); rx.compile("\\[[^\\]]*\\]")
	duz = rx.sub(duz, "", true).replace("\n", " ")
	var parca := []
	var rs := RegEx.new(); rs.compile("[^.!?…]+[.!?…]*")
	for m in rs.search_all(duz):
		var x := m.get_string().strip_edges()
		if x == "": continue
		if not parca.is_empty() and str(parca[-1]).length() + x.length() < 120:
			parca[-1] = str(parca[-1]) + " " + x
		else:
			parca.append(x)
	while parca.size() > 4:
		var x = parca.pop_back()
		parca[-1] = str(parca[-1]) + " " + str(x)
	for k in parca.size():
		out.append({w = "n", t = parca[k]})
		if k == 0 and parca.size() > 1:
			out.append({w = "p", t = QMID.pick_random()})
	out.append({w = "p", t = QOK.pick_random()})
	return out

func _hedef() -> Vector2:
	var h: Dictionary = {}
	var G = oyun.gorev
	var eski = G.aktif
	G.aktif = q
	h = G.hedef()
	G.aktif = eski
	if h.has("kisi") and h.kisi != null: return h.kisi.position
	if h.has("nokta"): return h.nokta
	if h.has("item"):
		var en := Vector2.ZERO
		var bd := 1e18
		var p: Vector2 = oyun.oyuncu.position
		for d in oyun.dugumler:
			if d.ad == h.item and d.canli and d.position.distance_squared_to(p) < bd:
				bd = d.position.distance_squared_to(p); en = d.position
		if en == Vector2.ZERO:
			for a in oyun.agaclar:
				var A: Dictionary = oyun.toplama_veri.trees.get(a.tur, {})
				if (A.get("wood") == h.item or A.get("fruit") == h.item) and a.position.distance_squared_to(p) < bd:
					bd = a.position.distance_squared_to(p); en = a.position
		return en
	return Vector2.ZERO

func _process(dt: float) -> void:
	_seritler(dt)
	if not acik: return
	t0 += dt
	if faz == "yuru":
		var d: Vector2 = o.position - oyun.oyuncu.position
		if d.length() > 24.0 and t0 < 1.2:
			oyun.oyuncu.oto = d.normalized()
		else:
			oyun.oyuncu.oto = Vector2.ZERO
			oyun.oyuncu.bak(d)
			faz = "oyna"
			_sonraki()
	else:
		kalan -= dt
		if kalan <= 0.0:
			_sonraki()
	_eylem(dt)
	_yerlestir()

func _seritler(dt: float) -> void:
	var vs := get_viewport_rect().size
	var h := vs.y * 0.11
	var k := ust.size.y / h if h > 0.0 else 0.0
	k = move_toward(k, 1.0 if acik else 0.0, dt * 4.0)
	ust.position = Vector2.ZERO; ust.size = Vector2(vs.x, h * k)
	alt.size = Vector2(vs.x, h * k); alt.position = Vector2(0, vs.y - h * k)
	anlatim.size = ust.size - Vector2(40, 0); anlatim.position = Vector2(20, 0)
	if not acik and k <= 0.0:
		visible = false

func _input(e: InputEvent) -> void:
	if not acik or faz != "oyna": return
	if t0 < 0.35: return
	var bas: bool = (e is InputEventMouseButton and e.pressed) or (e is InputEventKey and e.pressed and not e.echo) or (e is InputEventJoypadButton and e.pressed)
	if not bas: return
	get_viewport().set_input_as_handled()
	if e is InputEventKey and e.keycode == KEY_ESCAPE:
		_bitir()
	else:
		_sonraki()

func _sonraki() -> void:
	i += 1
	if i >= L.size():
		_bitir()
		return
	if goster != "" and i - goster_i > 2:
		goster = ""
	var l: Dictionary = L[i]
	kalan = _adim(l)
	if kalan <= 0.0:
		_sonraki()

func _adim(l: Dictionary) -> float:
	balon.visible = false
	if l.has("t"):
		anlatim.text = ""
		balon_yazi.text = str(l.t)
		balon.visible = true
		balon_ip.visible = l.w == "n" or i < L.size() - 1
		var st := balon.get_theme_stylebox("panel") as StyleBoxFlat
		st.bg_color = Color("#fff6d6") if l.w == "n" else Color("#fffcf0")
		balon.reset_size()
		return clampf(0.9 + str(l.t).length() * 0.045, 1.8, 5.2)
	if l.has("nar"):
		anlatim.text = str(l.nar)
		return clampf(1.2 + str(l.nar).length() * 0.042, 2.2, 6.5)
	if l.has("emo"):
		emo = {w = l.emo, e = str(l.get("e", "!")), t = 0.0}
		return 1.0
	if l.has("act"):
		var n = oyun.oyuncu if l.get("who", "n") == "p" else o
		var D := 1.5 if l.act == "pace" else (1.1 if l.act == "look" else 0.9)
		eylem = {node = n, baz = n.position, tur = l.act, t = 0.0, D = D}
		return D + 0.1
	if l.has("fx"):
		var n = oyun.oyuncu if l.get("at", "n") == "p" else o
		var cs: Array = FXR.get(l.fx, ["#ffffff", "#ffffff"])
		for k in 18:
			var v := Vector2(randf_range(-30, 30), -20 - randf() * 40)
			if l.fx == "snow" or l.fx == "leaves": v = Vector2(randf_range(-20, 20), randf_range(10, 30))
			oyun.parca(n.position + Vector2(randf_range(-8, 8), -14 + randf_range(-8, 8)), v, 0.9, Color(cs[k % 2]))
		return 0.8
	if l.has("cam"):
		if l.cam == "n" or hedef_yer == Vector2.ZERO: return 0.2
		var p: Vector2 = hedef_yer - oyun.oyuncu.position
		if p.length() > 560.0: p = p.normalized() * 560.0
		var tw := create_tween()
		tw.tween_property(oyun.kamera, "offset", p, 1.0).set_trans(Tween.TRANS_SINE)
		tw.tween_interval(1.5)
		tw.tween_property(oyun.kamera, "offset", Vector2.ZERO, 0.8).set_trans(Tween.TRANS_SINE)
		return 2.9
	if l.has("show"):
		goster = str(l.show)
		goster_i = i
		esya_resim.texture = oyun.env.ikon_al(goster)
		esya_ad.text = goster
		return 1.7
	if l.has("tint"):
		var tw := create_tween()
		tw.tween_method(oyun.sahne_rengi, oyun.sahne_renk, RENK.get(l.tint, Color.WHITE), 0.6)
		return 0.7
	return 0.0

func _eylem(dt: float) -> void:
	if emo.has("t"):
		emo.t += dt
		if emo.t > 1.6: emo = {}
	if eylem.is_empty(): return
	eylem.t += dt
	var k: float = minf(1.0, eylem.t / eylem.D)
	var off := Vector2.ZERO
	match str(eylem.tur):
		"pace": off.x = sin(k * TAU) * 12.0
		"jump": off.y = -absf(sin(k * TAU)) * 7.0
		"bow": off.y = sin(k * PI) * 2.5
		"kneel": off.y = sin(k * PI) * 4.0
		"shake": off.x = sin(k * PI * 10.0) * 2.0 * (1.0 - k)
		"turn": off.x = sin(k * PI) * 3.0
		"look":
			if hedef_yer != Vector2.ZERO:
				off = (hedef_yer - eylem.baz).normalized() * 4.0 * sin(k * PI)
	eylem.node.position = eylem.baz + off
	if k >= 1.0:
		eylem.node.position = eylem.baz
		eylem = {}

func _yerlestir() -> void:
	var tf: Transform2D = oyun.get_viewport().get_canvas_transform()
	var vs := get_viewport_rect().size
	var bar := vs.y * 0.11
	if balon.visible and i >= 0 and i < L.size():
		var n = oyun.oyuncu if L[i].w == "p" else o
		var s: Vector2 = tf * (n.position + Vector2(0, -36))
		var bs := balon.size
		var x := clampf(s.x - bs.x / 2.0, 6.0, vs.x - bs.x - 6.0)
		var y := clampf(s.y - bs.y, bar + 4.0, vs.y - bar - bs.y - 6.0)
		balon.position = Vector2(x, y)
	emo_yazi.visible = not emo.is_empty()
	if emo_yazi.visible:
		var n = oyun.oyuncu if emo.w == "p" else o
		emo_yazi.text = emo.e
		emo_yazi.add_theme_color_override("font_color", Color("#ffd23a") if "!?…".contains(emo.e) else Color.WHITE)
		var s: Vector2 = tf * (n.position + Vector2(0, -44))
		emo_yazi.position = s - Vector2(emo_yazi.size.x / 2.0, absf(sin(minf(emo.t, 0.6) * PI / 0.6)) * 10.0)
	esya.visible = goster != ""
	if esya.visible:
		var s: Vector2 = tf * (o.position + Vector2(0, -60))
		esya.position = s - Vector2(esya.size.x / 2.0, esya.size.y)
		if balon.visible and Rect2(balon.position, balon.size).intersects(Rect2(esya.position, esya.size)):
			esya.position.y = balon.position.y - esya.size.y - 4.0

func _bitir() -> void:
	if not acik: return
	acik = false
	faz = ""
	if not eylem.is_empty():
		eylem.node.position = eylem.baz
		eylem = {}
	balon.visible = false
	emo = {}
	goster = ""
	anlatim.text = ""
	esya.visible = false
	emo_yazi.visible = false
	var tw := create_tween()
	tw.tween_method(oyun.sahne_rengi, oyun.sahne_renk, Color.WHITE, 0.4)
	oyun.kamera.offset = Vector2.ZERO
	oyun.oyuncu.kilit = false
	oyun.oyuncu.oto = Vector2.ZERO
	if bitince.is_valid():
		bitince.call()
