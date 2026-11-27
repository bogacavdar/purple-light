## Nazlı'nın pazarı (web market; belge: Sistemler › Ekonomi, ACT 1 › Pazarcı Nazlı).
## Sat: silah, zırh, takı ve aletler dışında her şey (fiyat sabit, çok satmak düşürmez); miktar kutusu, Sat, Hepsi; tarifte kullanılan
## malzeme satılırken "Emin misin?" (bu oturumda o malzeme için bir daha sorma). Üç toplu satış: hepsini sat · kazandaki açık tariflere
## yeteni bırak · bütün tariflere yeteni bırak (ara parçalar da sayılır). Satın al: eline bir kez geçmiş doğal malzemeler ve tarifini
## öğrendiğin eşyalar, 1'li ya da 10'lu. Yetenekler gelince satış çarpanı (en çok 2,3) eklenecek.
extends Node

var oyun
var env
var ey
var P: Dictionary
var pencere: PanelContainer
var sekme := "sat"
var liste: VBoxContainer
var ust: HBoxContainer
var toplu: VBoxContainer
var sorma := {}

func kur(o) -> void:
	oyun = o
	env = o.env
	ey = o.el_yapimi
	P = o._json("res://data/pazar.json")
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.06, 0.09, 0.96); st.border_color = Color("#f2b84b"); st.set_border_width_all(2); st.set_content_margin_all(10)
	pencere.add_theme_stylebox_override("panel", st)
	pencere.custom_minimum_size = Vector2(640, 420)
	var v := VBoxContainer.new()
	ust = HBoxContainer.new()
	v.add_child(ust)
	toplu = VBoxContainer.new()
	v.add_child(toplu)
	var not_ := Label.new(); not_.text = "Fiyatlar sabit; çok satmak fiyatı düşürmez."; not_.add_theme_font_size_override("font_size", 11); not_.add_theme_color_override("font_color", Color("#b8ac90"))
	v.add_child(not_)
	var sc := ScrollContainer.new(); sc.custom_minimum_size = Vector2(620, 300); sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	liste = VBoxContainer.new(); liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(liste)
	v.add_child(sc)
	pencere.add_child(v)
	pencere.visible = false
	oyun.hud.add_child(pencere)
	pencere.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)

var baslik_ad := "Pazarcı Nazlı"

func ac(s := "sat", ad := "") -> void:
	sekme = s
	baslik_ad = ad if ad != "" else "Pazarcı Nazlı"
	pencere.visible = true
	ciz()

func _process(_d: float) -> void:
	if pencere.visible and (Input.is_action_just_pressed("ui_cancel") or oyun.oyuncu.yuruyor):
		pencere.visible = false

func _input(e: InputEvent) -> void:
	if pencere.visible and not oyun.konusma.visible and e is InputEventMouseButton and e.pressed and not pencere.get_global_rect().has_point(e.position):
		pencere.visible = false
		get_viewport().set_input_as_handled()

# ------------------------------------------------------------------ fiyat ve kurallar
func taban(n: String) -> float:
	return float(P.esya[n].f) if P.esya.has(n) else 0.0

## web sellMult: Usta tüccar I/II (+%50/+%60), "hepsini sat"ta Toptancı +%5; hepsi birlikte en çok 2,3 kat
func fiyat(n: String, toplu := false) -> float:
	var m: float = 1.0 + (0.6 if oyun.sk("E2") else (0.5 if oyun.sk("E1") else 0.0)) + (0.05 if toplu and oyun.sk("T4") else 0.0) + (oyun.kesif.satis_ek(n) if oyun.kesif != null else 0.0)
	return taban(n) * minf(2.3, m * oyun.stat("trade"))

## Şanslı müşteri: her satışta %5 (II'de %12) ihtimalle çift ödeme
func _sans(tutar: int) -> int:
	if oyun.sk("T3") and randf() < 0.05 + (0.07 if oyun.sk("T8") else 0.0):
		env.mesaj("Şanslı müşteri: çift ödedi!")
		return tutar * 2
	return tutar

func satilir(n: String) -> bool:
	return P.esya.has(n) and int(P.esya[n].s) == 1 and fiyat(n) > 0.0

func toptan(n: String) -> bool:
	return satilir(n) and int(P.esya[n].t) == 1 and not env.kemer.has(n)

## bu malzemeyi kullanan, bildiğin ya da kazanda açık tarifler
func kullanan(n: String) -> Array:
	var out := []
	for r in ey.R:
		var x: Dictionary = ey.R[r]
		var var_ := false
		for p in x.i:
			if str(p[0]) == n: var_ = true
		if var_ and (ey.bilinen.has(r) or oyun.istasyon._acik(r)): out.append(r)
	return out

# ------------------------------------------------------------------ satış
func sat(n: String, q: int, sor := true) -> void:
	q = mini(q, env.adet(n))
	if q < 1 or not satilir(n): return
	if sor and not sorma.has(n):
		var k := kullanan(n)
		if not k.is_empty():
			oyun.konusma.ac("Pazarcı Nazlı", null, "[b]Emin misin?[/b] %s şu tariflerde kullanılıyor: %s" % [n, ", ".join(k.slice(0, 6)) + ("…" if k.size() > 6 else "")],
				[{t = "Evet, sat", f = func(): sat(n, q, false)}, {t = "Bu malzeme için bir daha sorma", f = func():
					sorma[n] = true
					sat(n, q, false)}, {t = "Vazgeç", pri = true, kapat = true}])
			return
	var tutar := _sans(int(round(fiyat(n, q == env.adet(n) and q > 1) * q)))
	env.eksilt(n, q)
	env.vio_ekle(tutar)
	env.mesaj("%d %s satıldı · +%d Vio" % [q, n, tutar])
	oyun.ogr.satti([n])
	ciz()

## üç toplu satış: 0 hepsini · 1 kazandaki açık tariflere yeteni bırak · 2 bütün tariflere yeteni bırak
func _ayrilan(tur: int) -> Dictionary:
	var gerek := {}
	if tur == 0: return gerek
	for r in ey.R:
		if ey.bilinen.has(r): continue
		if tur == 1 and not oyun.istasyon._acik(r): continue
		_ihtiyac(r, 1, gerek, 0)
	return gerek

func _ihtiyac(r: String, kat: int, gerek: Dictionary, d: int) -> void:
	if d > 6 or not ey.R.has(r): return
	for p in ey.R[r].i:
		var m := str(p[0]); var q := int(p[1]) * kat
		gerek[m] = int(gerek.get(m, 0)) + q
		if ey.R.has(m) and not ey.R[m].place:
			var eks := maxi(0, q - env.adet(m))
			if eks > 0: _ihtiyac(m, eks, gerek, d + 1)

func toplu_liste(tur: int) -> Dictionary:
	var g := _ayrilan(tur)
	var out := {}
	for n in env.inv:
		if not toptan(n): continue
		var fazla: int = env.adet(n) - int(g.get(n, 0))
		if fazla > 0: out[n] = fazla
	return out

func toplu_sat(tur: int) -> void:
	var L := toplu_liste(tur)
	if L.is_empty():
		env.mesaj("Tariflerin ihtiyacından fazla satılık bir şeyin yok." if tur > 0 else "Satılık bir şeyin yok.", true)
		return
	var tutar := 0
	for n in L:
		tutar += int(round(fiyat(n, true) * L[n]))
		env.eksilt(n, L[n])
	tutar = _sans(tutar)
	env.vio_ekle(tutar)
	env.mesaj("%d çeşit%s satıldı · +%d Vio" % [L.size(), "in fazlası" if tur > 0 else "", tutar])
	oyun.ogr.satti(L.keys())
	ciz()

# ------------------------------------------------------------------ satın alma
func alinabilir() -> Array:
	var L := []
	for n in P.esya:
		var e: Dictionary = P.esya[n]
		if int(e.a) <= 0: continue
		if int(e.h) == 1 and (env.gorulen.has(n)): L.append(n)
		elif int(e.y) == 1 and ey.bilinen.has(n): L.append(n)
	L.sort_custom(func(a, b): return [int(P.esya[a].a), a] < [int(P.esya[b].a), b])
	return L

func al(n: String, q: int) -> void:
	var c: int = int(P.esya[n].a) * q
	if env.vio < c:
		env.mesaj("%d Vio daha gerekli" % (c - env.vio), true)
		return
	env.vio_ekle(-c)
	env.ekle(n, q)
	env.mesaj("%d %s satın alındı · %d Vio" % [q, n, c])
	ciz()

# ------------------------------------------------------------------ çizim
func _d(t: String, f: Callable, acik := true, renk := Color("#6a3aa8")) -> Button:
	var b := Button.new(); b.text = t; b.disabled = not acik
	b.add_theme_font_size_override("font_size", 12)
	var s := StyleBoxFlat.new(); s.bg_color = renk if acik else Color(0.2, 0.2, 0.22); s.set_corner_radius_all(4); s.content_margin_left = 6; s.content_margin_right = 6
	b.add_theme_stylebox_override("normal", s); b.add_theme_stylebox_override("hover", s); b.add_theme_stylebox_override("disabled", s)
	b.pressed.connect(f)
	return b

func ciz() -> void:
	for c in ust.get_children(): c.queue_free()
	for c in toplu.get_children(): c.queue_free()
	for c in liste.get_children(): c.queue_free()
	var bas := Label.new(); bas.text = baslik_ad + "  "; oyun._golge(bas); bas.add_theme_color_override("font_color", Color("#f2c94c"))
	ust.add_child(bas)
	ust.add_child(_d("Sat", func(): ac("sat"), true, Color("#8a6a1a") if sekme == "sat" else Color("#3a3428")))
	ust.add_child(_d("Satın al", func(): ac("al"), true, Color("#8a6a1a") if sekme == "al" else Color("#3a3428")))
	var vl := Label.new(); vl.text = "   %d Vio" % env.vio; vl.add_theme_color_override("font_color", Color("#d8b0ff"))
	ust.add_child(vl)
	if sekme == "sat":
		var adlar := ["Aletler, zırhlar ve eşyalar hariç hepsini sat", "Kazandaki açık tariflere yeteni bırak", "Bütün tariflere yeteni bırak"]
		for i in 3:
			var L := toplu_liste(i)
			var tt := 0
			for n in L: tt += int(round(fiyat(n, true) * L[n]))
			toplu.add_child(_d("%s · +%d Vio" % [adlar[i], tt], toplu_sat.bind(i), not L.is_empty(), Color("#5a4a1a")))
		var ad := []
		for n in env.inv:
			if satilir(n) and env.adet(n) > 0: ad.append(n)
		ad.sort_custom(func(a, b): return [-fiyat(a) * env.adet(a), a] < [-fiyat(b) * env.adet(b), b])
		if ad.is_empty():
			var l := Label.new(); l.text = "Satılık bir şeyin yok."; liste.add_child(l)
		for n in ad:
			var h := HBoxContainer.new()
			var ik := TextureRect.new(); ik.texture = env.ikon_al(n); ik.custom_minimum_size = Vector2(22, 22); ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; ik.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			var l := Label.new(); l.text = "%s ×%d · %s" % [n, env.adet(n), _fy(fiyat(n))]; l.size_flags_horizontal = Control.SIZE_EXPAND_FILL; l.add_theme_font_size_override("font_size", 13)
			var sp := SpinBox.new(); sp.min_value = 1; sp.max_value = env.adet(n); sp.value = 1; sp.custom_minimum_size = Vector2(80, 0)
			var sb := _d("Sat · %d" % int(round(fiyat(n))), func(): sat(n, int(sp.value)))
			sp.value_changed.connect(func(v): sb.text = "Sat · %d" % int(round(fiyat(n) * v)))
			var hb := _d("Hepsi · %d" % int(round(fiyat(n, env.adet(n) > 1) * env.adet(n))), func(): sat(n, env.adet(n)))
			h.add_child(ik); h.add_child(l); h.add_child(sp); h.add_child(sb); h.add_child(hb)
			liste.add_child(h)
	else:
		var L := alinabilir()
		if L.is_empty():
			var l := Label.new(); l.autowrap_mode = TextServer.AUTOWRAP_WORD; l.text = "Nazlı yalnızca daha önce eline geçmiş doğal malzemeleri ve tarifini öğrendiğin eşyaları satar."; liste.add_child(l)
		for n in L:
			var h := HBoxContainer.new()
			var ik := TextureRect.new(); ik.texture = env.ikon_al(n); ik.custom_minimum_size = Vector2(22, 22); ik.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; ik.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED; ik.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			var p: int = int(P.esya[n].a)
			var l := Label.new(); l.text = "%s · sende %d" % [n, env.adet(n)]; l.size_flags_horizontal = Control.SIZE_EXPAND_FILL; l.add_theme_font_size_override("font_size", 13)
			h.add_child(ik); h.add_child(l)
			h.add_child(_d("1 · %d Vio" % p, al.bind(n, 1), env.vio >= p))
			h.add_child(_d("10 · %d Vio" % (p * 10), al.bind(n, 10), env.vio >= p * 10))
			liste.add_child(h)

func _fy(v: float) -> String:
	return ("%d Vio" % int(v)) if is_equal_approx(v, roundf(v)) else ("%.1f Vio" % v).replace(".", ",")
