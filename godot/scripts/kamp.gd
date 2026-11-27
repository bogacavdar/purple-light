extends Node
## Kamp ateşi ve ateşte pişirme (web 2 · campfire, v363fire; belge Sistemler › Işık kaynakları › Kamp ateşi; Yemek › Ateşte pişirme).
## Kamp ateşi alet kemerine girer; elindeyken vur (ya da V) önüne kurar: 330 sn yanar, 2 Dal +95 sn, 1 odun +190, 1 Kav +285, en çok 720;
## yağmurda 1,6 kat hızlı söner, sönünce 120 sn kül kalır. Yanında gece güvendesin (100 px), 64 px içinde can hızlı dolar (1,4/sn, tokken).
## Her ateşte (kamp ateşi ve kişilerin ateşleri) F: pişirme menüsü: çiğ et/balık közleme ve kazanda öğrenilmiş ateş yemekleri (128);
## Ateş ve Duman ateşten gelir; her yemek ~3 sn pişer, sıra ateşte sürer, pişen çantaya gelir; kamp ateşinde her yemek 4 sn yakıt yer.

const COOK := 3.0
var tutsu := 0.0           # Duman tütsüsü: saldırgan canavarlar 2 dk 120 px'ten fazla yaklaşamaz
var oyun
var A: Dictionary          # data/ates_pisir.json
var FIRE_R := {}
var camps: Array = []      # {p, t, ash, cq, ct, isik}
var kisi_ates: Array = []  # kişilerin ateşleri: {p, cq, ct}
var ciz: Node2D
var FO = null              # menüsü açık ateş
var pen: PanelContainer
var ust: Label
var cubuk: ProgressBar
var liste: VBoxContainer
var odun_d: Button

func kur(o) -> void:
	oyun = o
	A = o._json("res://data/ates_pisir.json")
	for r in A.fire_r: FIRE_R[str(r)] = true
	var Z = o.zaman
	kisi_ates.append({p = Vector2(float(Z.A.kamp.x) + 16.0, float(Z.A.kamp.y) + 2.0), cq = [], ct = 0.0, kisi = true})
	for f in Z.A.ates:
		if float(f.x) < -9000.0: continue
		kisi_ates.append({p = Vector2(f.x, f.y), cq = [], ct = 0.0, kisi = true})
	ciz = Node2D.new()
	ciz.z_index = 1
	ciz.draw.connect(_ciz)
	oyun.add_child(ciz)
	_pencere()

func ates_mi(r: String) -> bool:
	return FIRE_R.has(r)

# ------------------------------------------------------------------ kamp ateşi
func _yer():
	var P = oyun.oyuncu
	var f: Vector2 = P.bakis
	for q in [P.position + Vector2(f.x * 16.0, f.y * 12.0 + (0.0 if f.y != 0.0 else 5.0)), P.position + Vector2(0, 14), P.position + Vector2(16, 4), P.position + Vector2(-16, 4), P.position + Vector2(0, -12)]:
		if oyun.engel(q) or oyun.tile_at(q) >= 3: continue
		var bos := true
		for c in camps:
			if c.p.distance_to(q) < 22.0: bos = false
		for F in kisi_ates:
			if F.p.distance_to(q) < 22.0: bos = false
		if bos: return Vector2(roundf(q.x), roundf(q.y))
	return null

func yak() -> bool:
	var env = oyun.env
	if env.adet("Kamp ateşi") <= 0:
		env.mesaj("Kamp ateşin yok: malzemeleri topla, Tab ile yap." if oyun.istasyon.ey.bilinen.has("Kamp ateşi") else "Kamp ateşi tarifini önce Zümrüt'ün kazanında öğren.", true)
		return false
	if oyun.magara.icinde or oyun.kuzen.yol_t >= 0.0 or oyun.konusma.visible: return false
	var sp = _yer()
	if sp == null:
		env.mesaj("Buraya ateş yakılmaz: açık, kuru bir yer bul (ağaçtan ve sudan uzak).", true)
		return false
	env.eksilt("Kamp ateşi")
	var c := {p = sp, t = float(A.yanma), ash = 0.0, cq = [], ct = 0.0, isik = _isik(sp)}
	camps.append(c)
	if oyun.ses != null: oyun.ses.cal("craft")
	for k in 14: oyun.parca(sp + Vector2(randf_range(-3, 3), -4), Vector2(randf_range(-15, 15), -20 - randf() * 30), 0.6, Color("#ffd27a") if k % 2 else Color("#e8502a"))
	get_tree().create_timer(0.3).timeout.connect(func(): env.mesaj("Kamp ateşi yandı! Yanında gece güvendesin ve canın hızlı dolar. F: odun at ya da çiğ et ve balığı pişir."))
	return true

func _isik(p: Vector2) -> PointLight2D:
	var l := PointLight2D.new()
	l.texture = oyun.mesale.isik.texture
	l.color = Color(1.0, 0.75, 0.45)
	l.position = p + Vector2(0, -3)
	l.enabled = false
	oyun.add_child(l)
	return l

func odun() -> Array:
	var env = oyun.env
	if env.adet("Dal") >= 2: return ["Dal", 2, 1]
	for n in A.odun:
		if env.adet(n) > 0: return [n, 1, 2]
	if env.adet("Kav") > 0: return ["Kav", 1, 3]
	return []

## gece güvenli alan (web nearCamp: 100 px)
func guvende(p: Vector2) -> bool:
	for c in camps:
		if c.t > 0.0 and c.p.distance_to(p) < 100.0: return true
	return false

## ışık (web lightSources: yarıçap 46 + kalan/6, en çok 76; litAt 0,85)
func isikta(p: Vector2) -> bool:
	for c in camps:
		if c.t > 0.0 and c.p.distance_to(p + Vector2(0, 0)) < minf(76.0, 46.0 + c.t / 6.0) * 0.85: return true
	return false

func sicak(p: Vector2) -> bool:
	for c in camps:
		if c.t > 0.0 and c.p.distance_to(p) < 64.0: return true
	return false

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	ciz.queue_redraw()
	if Input.is_action_just_pressed("kamp") and not oyun.pencere_acik(): yak()
	var dur: bool = oyun.zaman.durdu() or get_tree().paused or oyun.basta
	var P = oyun.oyuncu
	var k: float = oyun.zaman.karanlik()
	for i in range(camps.size() - 1, -1, -1):
		var c: Dictionary = camps[i]
		c.isik.enabled = c.t > 0.0 and k > 0.05 and not oyun.magara.icinde
		c.isik.texture_scale = minf(76.0, 46.0 + c.t / 6.0) / 128.0 * 1.3 * (0.94 + 0.06 * sin(Time.get_ticks_msec() * 0.007 + i))
		if dur: continue
		if c.t > 0.0:
			var b: float = c.t
			var yag: bool = oyun.hava != null and oyun.hava.yagiyor() and not oyun.hava.kul_firtinasi()
			c.t -= dt * (1.6 if yag else 1.0)
			if b > 40.0 and c.t <= 40.0 and P.position.distance_to(c.p) < 160.0: oyun.env.mesaj("Kamp ateşi sönmek üzere: odun at (2 dal)!", true)
			if c.t <= 0.0:
				c.t = 0.0
				c.ash = 120.0
				_iade(c)
		else:
			c.ash -= dt
			if c.ash <= 0.0:
				c.isik.queue_free()
				camps.remove_at(i)
	if dur: return
	_tutsu(dt)
	# ateşin yanında can hızlı dolar
	if sicak(P.position) and P.hp < P.hp_max and oyun.env.tokluk > 0.0:
		P.hp = minf(P.hp_max, P.hp + dt * 1.4 * (2.0 if oyun.sk("D11") else 1.0))
	# pişirme sıraları
	for F in camps + kisi_ates:
		if F.cq.is_empty(): continue
		if not F.has("kisi") and F.t <= 0.0: continue
		F.ct += dt
		if F.ct >= COOK:
			var it = _bitir(F)
			if F.cq.is_empty() and it != null: oyun.env.mesaj("%s pişti, çantanda." % it.out)
			if pen.visible and FO == F: _menu_ciz()
	if pen.visible and FO != null: cubuk.value = clampf(FO.ct / COOK, 0.0, 1.0) * 100.0

func _iade(F: Dictionary) -> void:
	var n := 0
	for it in F.cq:
		for u in it.used:
			oyun.env.ekle(str(u[0]), int(u[1]))
			n += int(u[1])
	F.cq = []
	F.ct = 0.0
	if n > 0: oyun.env.mesaj("Ateş söndü: pişmeyen malzemeler çantana döndü.", true)

# ------------------------------------------------------------------ pişirme
func _malz(r: String) -> Array:
	var out: Array = []
	var y = A.tarif.get(r, null)
	if y == null: return out
	for p in y.i:
		if not A.bos.has(str(p[0])): out.append(p)
	return out

func yapilir(r: String) -> int:
	var env = oyun.env
	var y = A.tarif.get(r, null)
	if y == null: return 0
	for t in y.t:
		if env.adet(str(t)) <= 0: return 0
	var n := 999
	for p in _malz(r): n = mini(n, env.adet(str(p[0])) / int(p[1]))
	return mini(n, 99)

func _ates_tarifleri() -> Array:
	var out: Array = []
	for r in A.fire_r:
		if oyun.istasyon.ey.bilinen.has(str(r)): out.append(str(r))
	return out

func _cig() -> Array:
	var out: Array = []
	for n in oyun.env.inv:
		if oyun.env.adet(n) > 0 and A.koz.has(n): out.append(n)
	return out

func _sira(F: Dictionary, tur: String, ad: String, istek: int) -> int:
	var env = oyun.env
	var k := 0
	for i in istek:
		if not F.has("kisi") and F.t - 4.0 * F.cq.size() <= 4.0:
			if k == 0: env.mesaj("Ateş pişirmeye yetmiyor: odun at.", true)
			break
		if tur == "koz":
			if env.adet(ad) <= 0: break
			env.eksilt(ad)
			F.cq.append({out = str(A.koz[ad]), used = [[ad, 1]], tarif = false})
		else:
			if yapilir(ad) < 1: break
			var used := _malz(ad)
			for u in used: env.eksilt(str(u[0]), int(u[1]))
			F.cq.append({out = ad, used = used, tarif = true})
		k += 1
	if k > 0 and oyun.ses != null: oyun.ses.cal("pick")
	if k > 1: env.mesaj("%d yemek ateşte sıraya girdi" % k)
	return k

func _bitir(F: Dictionary):
	if F.cq.is_empty(): return null
	var it: Dictionary = F.cq.pop_front()
	F.ct = 0.0
	var env = oyun.env
	env.ekle(it.out)
	if it.tarif:
		var yeni: bool = not env.gorulen.has(it.out)
		env.xp_ekle(12 if yeni else 2)
		if oyun.ist != null: oyun.ist.yapilan += 1
	else:
		env.xp_ekle(1)
	if not F.has("kisi"): F.t = maxf(0.0, F.t - 4.0)
	for k in 6: oyun.parca(F.p + Vector2(randf_range(-4, 4), -6), Vector2(randf_range(-6, 6), -18 - randf() * 16), 0.8, Color(0.86, 0.86, 0.86, 0.7))
	oyun.yazi(F.p + Vector2(0, -16), "+1 " + str(it.out), Color("#f2d070"), 8)
	if oyun.ses != null: oyun.ses.cal("craft", 0.6)
	return it

## kayıt alınırken ateşte pişenler hemen pişmiş sayılır
func hepsini_pisir() -> void:
	for F in camps + kisi_ates:
		while not F.cq.is_empty(): _bitir(F)

## F: yanındaki ateş (kamp ateşi 22 px, kişilerin ateşi 18 px) → menü
func f() -> bool:
	var p: Vector2 = oyun.oyuncu.position
	for c in camps:
		if c.t > 0.0 and p.distance_to(c.p) < 22.0:
			ac(c)
			return true
	for F in kisi_ates:
		if p.distance_to(F.p) < 18.0 and (not _cig().is_empty() or not _ates_tarifleri().is_empty() or not F.cq.is_empty()):
			ac(F)
			return true
	return false

# ------------------------------------------------------------------ menü
func _pencere() -> void:
	pen = PanelContainer.new()
	pen.visible = false
	pen.custom_minimum_size = Vector2(560, 440)
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.1, 0.08, 0.06, 0.96)
	sb.border_color = Color("#e8902a")
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(6)
	sb.set_content_margin_all(12)
	pen.add_theme_stylebox_override("panel", sb)
	var v := VBoxContainer.new()
	pen.add_child(v)
	var bas := HBoxContainer.new()
	ust = Label.new()
	ust.add_theme_font_size_override("font_size", 17)
	ust.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bas.add_child(ust)
	odun_d = Button.new()
	odun_d.pressed.connect(_odun_at)
	bas.add_child(odun_d)
	var x := Button.new()
	x.text = "✕"
	x.pressed.connect(kapat)
	bas.add_child(x)
	v.add_child(bas)
	cubuk = ProgressBar.new()
	cubuk.custom_minimum_size = Vector2(0, 10)
	cubuk.show_percentage = false
	v.add_child(cubuk)
	var sc := ScrollContainer.new()
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sc.custom_minimum_size = Vector2(0, 360)
	liste = VBoxContainer.new()
	liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste)
	v.add_child(sc)
	oyun.hud.add_child(pen)

func ac(F: Dictionary) -> void:
	FO = F
	pen.visible = true
	_menu_ciz()
	pen.reset_size()
	pen.position = (pen.get_viewport_rect().size - pen.size) / 2.0

func kapat() -> void:
	pen.visible = false
	FO = null

func acik() -> bool:
	return pen.visible

func _input(e: InputEvent) -> void:
	if not pen.visible: return
	if (e is InputEventMouseButton and e.pressed and not pen.get_global_rect().has_point(e.position)) or e.is_action_pressed("ui_cancel"):
		kapat()
		get_viewport().set_input_as_handled()

func _odun_at() -> void:
	if FO == null or FO.has("kisi") or FO.t <= 0.0: return
	var w := odun()
	if w.is_empty(): return
	oyun.env.eksilt(str(w[0]), int(w[1]))
	FO.t = minf(float(A.en_cok), FO.t + float(A.odun_s) * float(w[2]))
	if oyun.ses != null: oyun.ses.cal("craft")
	for k in 8: oyun.parca(FO.p + Vector2(0, -5), Vector2(randf_range(-12, 12), -24 - randf() * 20), 0.5, Color("#ffd27a"))
	_menu_ciz()

func _menu_ciz() -> void:
	var F = FO
	if F == null: return
	var env = oyun.env
	var kampm: bool = not F.has("kisi")
	if kampm and F.t <= 0.0:
		kapat()
		return
	if kampm:
		ust.text = "Kamp ateşi · Pişirme · %s dk daha yanar" % str(snappedf(F.t / 60.0, 0.1)).replace(".", ",")
		var w := odun()
		odun_d.visible = not w.is_empty()
		if not w.is_empty(): odun_d.text = "Odun at (%d %s)" % [w[1], w[0]]
	else:
		ust.text = "Ateş · Pişirme · harıl harıl yanıyor, sönmez"
		odun_d.visible = false
	cubuk.visible = not F.cq.is_empty()
	for c in liste.get_children(): c.queue_free()
	if not F.cq.is_empty():
		var l := Label.new()
		l.text = "Pişiyor: %s%s · her yemek ~3 sn · pişen kendiliğinden çantana gelir, uzaklaşabilirsin" % [F.cq[0].out, (" · sırada %d yemek daha" % (F.cq.size() - 1)) if F.cq.size() > 1 else ""]
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.add_theme_font_size_override("font_size", 12)
		liste.add_child(l)
	var not_ := Label.new()
	not_.text = "Çiğ eti ve balığı közle; kazanda öğrendiğin ateş yemekleri de burada pişer. Ateş ve Duman ateşten gelir, harcanmaz."
	not_.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	not_.add_theme_font_size_override("font_size", 12)
	liste.add_child(not_)
	var cig := _cig()
	var tar := _ates_tarifleri()
	if cig.is_empty() and tar.is_empty():
		var l2 := Label.new()
		l2.text = "Çiğ et ya da balık getirirsen közleyebilirsin. Kazanda bir ateş yemeği (kavrulmuş, kızarmış, haşlanmış, çorba…) öğrenince burada yaparsın."
		l2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		liste.add_child(l2)
		return
	for n in cig:
		_satir(str(A.koz[n]), "1× %s (%d) · közlenmiş yemek çiğinden kat kat doyurur" % [n, env.adet(n)], "koz", n, env.adet(n))
	tar.sort_custom(func(a, b):
		var ya := yapilir(a) > 0
		var yb := yapilir(b) > 0
		if ya != yb: return ya
		return a < b)
	for r in tar:
		var parca: Array = []
		for p in A.tarif[r].i:
			var m := str(p[0])
			if A.bos.has(m): parca.append("[color=#f2b84b]%s (ateş sağlar)[/color]" % m)
			else: parca.append("[color=%s]%d× %s (%d)[/color]" % ["#8fd46b" if env.adet(m) >= int(p[1]) else "#ff8a6a", int(p[1]), m, env.adet(m)])
		var al: Array = []
		for t in A.tarif[r].t: al.append("[color=%s]%s[/color]" % ["#8fd46b" if env.adet(str(t)) > 0 else "#ff8a6a", t])
		_satir(r, ", ".join(parca) + ((" · alet: " + ", ".join(al)) if not al.is_empty() else ""), "rec", r, yapilir(r))

func _satir(cikti: String, alt: String, tur: String, ad: String, n: int) -> void:
	var r := HBoxContainer.new()
	var ik := TextureRect.new()
	ik.texture = oyun.env.ikon_al(cikti)
	ik.custom_minimum_size = Vector2(28, 28)
	ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	ik.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	r.add_child(ik)
	var t := RichTextLabel.new()
	t.bbcode_enabled = true
	t.fit_content = true
	t.scroll_active = false
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.add_theme_font_size_override("normal_font_size", 11)
	t.add_theme_font_size_override("bold_font_size", 13)
	var sende: int = oyun.env.adet(cikti)
	t.text = "[b]%s[/b]%s\n%s" % [cikti, (" [color=#b57bff]· sende %d[/color]" % sende) if sende > 0 else "", alt]
	if n <= 0: r.modulate.a = 0.55
	r.add_child(t)
	for q in [1, 5, maxi(2, n)]:
		var b := Button.new()
		b.text = "Yap" if q == 1 else ("×5" if q == 5 else ("Hepsi (%d)" % n if n > 1 else "Hepsi"))
		b.disabled = n < (1 if q == 1 else (5 if q == 5 else 2))
		var qq: int = q
		b.pressed.connect(func():
			_sira(FO, tur, ad, qq)
			_menu_ciz())
		r.add_child(b)
	liste.add_child(r)

# ------------------------------------------------------------------ resim
func _ciz() -> void:
	var t := Time.get_ticks_msec() / 1000.0
	var P: Vector2 = oyun.oyuncu.position
	if oyun.magara.icinde: return
	for i in camps.size():
		var c: Dictionary = camps[i]
		var p: Vector2 = c.p
		if absf(p.x - P.x) > 600.0 or absf(p.y - P.y) > 400.0: continue
		var px := func(x: float, y: float, w: float, h: float, col: Color): ciz.draw_rect(Rect2(p.x + x, p.y + y, w, h), col)
		if c.t > 0.0:
			px.call(-6, 1, 12, 3, Color("#5a3d22")); px.call(-5, 0, 3, 2, Color("#7a5430")); px.call(2, 0, 3, 2, Color("#7a5430"))
			for j in 5: px.call(-7 + j * 3, 3, 2, 1, Color("#6a6a70"))
			var fl := roundf(sin(t * 12.0 + i * 2.3 + 0.7))
			px.call(-2, -5 + fl, 5, 5, Color("#e8502a")); px.call(-1, -7 + fl, 3, 4, Color("#f2a03a")); px.call(0, -8, 1, 2, Color("#ffe29b"))
			if P.distance_to(p) < 46.0:
				var k := clampf(c.t / float(A.yanma), 0.0, 1.0)
				px.call(-7, 6, 14, 2, Color("#11170f"))
				px.call(-7, 6, maxf(1.0, roundf(14.0 * minf(1.0, c.t / float(A.en_cok) * 2.0))), 2, Color("#e8775a") if k < 0.2 else Color("#f2b84b"))
		else:
			var a := minf(1.0, c.ash / 30.0)
			px.call(-6, 1, 12, 3, Color(0.29, 0.29, 0.31, a)); px.call(-4, 0, 8, 2, Color(0.42, 0.42, 0.44, a)); px.call(-1, -1, 2, 1, Color(0.78, 0.29, 0.16, a))
	# pişen ateşin üstünde küçük çubuk
	for F in camps + kisi_ates:
		if F.cq.is_empty(): continue
		var q: Vector2 = F.p
		var k2 := minf(1.0, F.ct / COOK)
		ciz.draw_rect(Rect2(q.x - 8, q.y - 20, 16, 3), Color("#11170f"))
		ciz.draw_rect(Rect2(q.x - 7, q.y - 19, maxf(1.0, roundf(14.0 * k2)), 1), Color("#f2b84b"))

## haritalar: yanan kamp ateşi titreşen turuncu bir alev
func harita_ciz(cv: Control, o: Vector2, s: float, buyuk: bool) -> void:
	if oyun.magara.icinde: return
	var T := float(oyun.T)
	var t := Time.get_ticks_msec() / 1000.0
	for c in camps:
		if c.t <= 0.0: continue
		var p: Vector2 = o + c.p / T * s
		var z := 2.0 if buyuk else 1.0
		var fl := 0.8 + 0.2 * sin(t * 9.0 + c.p.x)
		cv.draw_circle(p, 3.0 * z * fl, Color(1.0, 0.55, 0.15, 0.9))
		cv.draw_circle(p + Vector2(0, -0.6 * z), 1.6 * z * fl, Color(1.0, 0.85, 0.4))
		if buyuk and cv.get_local_mouse_position().distance_to(p) < 10.0:
			cv.draw_string(ThemeDB.fallback_font, p + Vector2(8, -6), "Kamp ateşi", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color.WHITE)

func kayit() -> Array:
	var out: Array = []
	for c in camps: out.append([roundi(c.p.x), roundi(c.p.y), roundi(c.t), roundi(c.ash)])
	return out

func yukle(d) -> void:
	for c in camps: c.isik.queue_free()
	camps = []
	for F in kisi_ates:
		F.cq = []; F.ct = 0.0
	if typeof(d) != TYPE_ARRAY: return
	for a in d:
		var p := Vector2(float(a[0]), float(a[1]))
		camps.append({p = p, t = float(a[2]), ash = float(a[3]), cq = [], ct = 0.0, isik = _isik(p)})

# ------------------------------------------------------------------ duman (belge Tarifler › İşe yarayan eşyalar)
func _serbest(a) -> bool:
	return not a.boss and not a.ders and not a.has_meta("evcil") and not a.has_meta("arena")

func _puf(n: int, c: Color) -> void:
	var P: Vector2 = oyun.oyuncu.position
	for k in n: oyun.parca(P + Vector2(randf_range(-15, 15), -6 + randf_range(-7, 7)), Vector2(randf_range(-30, 30), -10 - randf() * 30), 1.0 + randf() * 0.6, c if k % 2 else Color(0.59, 0.59, 0.63, 0.7))

## eldeki Duman fişeği atılır (110 px içindekiler 3,5 sn sersemler) ya da Duman tütsüsü yakılır (2 dk)
func duman(n: String) -> void:
	var env = oyun.env
	if env.adet(n) <= 0: return
	var P: Vector2 = oyun.oyuncu.position
	if n == "Duman fişeği":
		var k := 0
		for a in oyun.canlilari_ver():
			if _serbest(a) and a.position.distance_to(P) < 110.0:
				a.sersem = maxf(a.sersem, 3.5)
				a.mad = false
				k += 1
		_puf(40, Color(0.78, 0.78, 0.78, 0.8))
		if oyun.ses != null: oyun.ses.cal("swing")
		oyun.yazi(P + Vector2(0, -26), ("%d canavar sersemledi" % k) if k > 0 else "Duman dağıldı", Color("#d8d8e0"), 9)
	else:
		tutsu = 120.0
		_puf(18, Color(0.75, 0.86, 0.67, 0.7))
		if oyun.ses != null: oyun.ses.cal("craft")
		env.mesaj("Duman tütsüsü yanıyor: saldırgan canavarlar 2 dakika sana yaklaşmaz")
	env.eksilt(n)

func _tutsu(dt: float) -> void:
	if tutsu <= 0.0: return
	tutsu -= dt
	if tutsu <= 0.0:
		tutsu = 0.0
		oyun.env.mesaj("Duman tütsüsü söndü")
		return
	var P: Vector2 = oyun.oyuncu.position
	if randf() < dt * 3.0: oyun.parca(P + Vector2(randf_range(-4, 4), -14), Vector2(randf_range(-4, 4), -14), 1.2, Color(0.75, 0.86, 0.67, 0.55))
	for a in oyun.canlilari_ver():
		if not _serbest(a) or str(a.D.get("temper", "")) != "saldırgan": continue
		var d: Vector2 = a.position - P
		var L := maxf(1.0, d.length())
		if L < 120.0:
			var q: Vector2 = a.position + d / L * 90.0 * dt
			if not oyun.engel(q): a.position = q
			a.mad = false
			a.st = "wander"

