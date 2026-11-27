## Anılar (web MEMS, v318 düzeni, memUnlock/openMem/memNext/memSkip, renderMem; belge Sistemler › Anılar).
## ACT 1'in anıları sırayla gelir: kazanda öğrenilen tarif sayısı 10, 25, 50, 100, 175'i geçince; gece uyuyunca (%40), bayılınca (%60) ya da bir
## görevi bitirince (%30) (her anının en erken günü var); Zümrüt'e iki mor kıymık götürünce hemen. "Çay kıyısında söz" yalnız Barbaros'un gemisine
## binmeden hemen önce. İkinci adada aynı yollarla mor ışığın beş anısı; ustaların anıları onların işleriyle (gk3, pv3, sl4, mk3, ej4).
## Pencere: başlık, sahne (web'in kendi çiziminden kareler; oyuncu ve sevdiği kişi kendi çizimleriyle), yazı, Devam / Anıyı sakla.
## Dışına basmak ya da Esc anıyı sonuna kadar okumuş sayar. İlk gelişte +25 + 15 × sıra XP. Kitap › Anılar'dan yeniden izlenir.
extends CanvasLayer

var oyun
var D: Dictionary
var A: Array = []            # web MEMS sırası
var mems := {}               # ad → true
var tur := {}                # ad → "sleep" | "faint" | "quest"
var kuyruk: Array = []
var cur = null               # {i, line, t, again}
var son_tarif := -1
var hepsi_a1 = null
const CH := {"sleep": 0.4, "faint": 0.6, "quest": 0.3}
const MS := [10, 25, 50, 100, 175]
const USTA := {"Sahildeki ışık": "gk3", "Yıldızsız yolcular": "pv3", "Şapka": "sl4", "Mor gemi": "mk3", "Son söz": "ej4"}
const HAIRN := ["kahverengi", "siyah", "kızıl", "sarı", "beyaz", "mor", "yeşil", "pembe"]
const PROP := "Çay kıyısında söz"
var ort: ColorRect
var kutu: PanelContainer
var ad_yazi: Label
var sahne: Control
var metin: RichTextLabel
var dugme: Button
var hero_tx: Texture2D
var love_tx: Texture2D
var dok := {}
var t_chk := 0.0

func kur(o) -> void:
	oyun = o
	layer = 8
	D = o._json("res://data/ani.json")
	A = D.anilar
	ort = ColorRect.new(); ort.color = Color(0.02, 0.01, 0.05, 0.75); ort.set_anchors_preset(Control.PRESET_FULL_RECT)
	ort.gui_input.connect(func(e): if e is InputEventMouseButton and e.pressed: _atla())
	add_child(ort)
	kutu = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#140c24"); st.border_color = Color("#7a5ac8"); st.set_border_width_all(2); st.set_content_margin_all(12)
	kutu.add_theme_stylebox_override("panel", st)
	var v := VBoxContainer.new(); v.add_theme_constant_override("separation", 6)
	var b1 := Label.new(); b1.text = "Bir anı geri geldi"; b1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b1.add_theme_font_size_override("font_size", 13); b1.add_theme_color_override("font_color", Color("#c9a0ff"))
	ad_yazi = Label.new(); ad_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; ad_yazi.add_theme_font_size_override("font_size", 24); ad_yazi.add_theme_color_override("font_color", Color("#f3ecd8"))
	sahne = Control.new(); sahne.custom_minimum_size = Vector2(480, 270); sahne.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST; sahne.clip_contents = true
	sahne.size_flags_horizontal = Control.SIZE_SHRINK_CENTER; sahne.draw.connect(_ciz)
	metin = RichTextLabel.new(); metin.bbcode_enabled = true; metin.fit_content = true; metin.custom_minimum_size = Vector2(480, 0)
	metin.add_theme_font_size_override("normal_font_size", 15)
	dugme = Button.new(); dugme.text = "Devam"; dugme.size_flags_horizontal = Control.SIZE_SHRINK_CENTER; dugme.pressed.connect(_ileri)
	for c in [b1, ad_yazi, sahne, metin, dugme]: v.add_child(c)
	kutu.add_child(v)
	add_child(kutu)
	kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
	visible = false

# ------------------------------------------------------------------ sıralar
func _a1() -> Array:
	var L := []
	for a in A:
		if a.tur == "a1": L.append(a)
	L.sort_custom(func(x, y): return int(x.pos) < int(y.pos))
	return L

func sonraki_a1():
	for a in _a1():
		if a.n != PROP and not mems.has(a.n): return a
	return null

func sonraki_mor():
	for a in A:
		if a.tur == "mor" and not mems.has(a.n): return a
	return null

func _bul(n: String):
	for a in A:
		if a.n == n: return a
	return null

func getir(a, ev := "") -> bool:
	if a == null or mems.has(a.n): return false
	mems[a.n] = true
	if ev != "": tur[a.n] = ev
	kuyruk.append(int(a.i))
	return true

## web ev318: uyku, bayılma, görev
func olay(ev: String) -> void:
	if oyun.basta: return
	if randf() > float(CH[ev]): return
	if oyun.ada == 2:
		var j = sonraki_mor()
		if j != null:
			getir(j, ev)
			return
	var a = sonraki_a1()
	if a == null: return
	if oyun.zaman.gun < int(D.MIN[int(a.pos)]): return
	getir(a, ev)

## "Götür beni": önce bir kez evlilik teklifi anısı, sonra yolculuk
func teklif_once(sonra: Callable) -> void:
	var a = _bul(PROP)
	if a == null or mems.has(PROP) or cur != null:
		sonra.call()
		return
	mems[PROP] = true
	_ac(int(a.i), false, sonra)

## Zümrüt'ün kazanı: iki mor kıymık sıradaki ACT 1 anısını getirir
func kiymik_secenegi():
	if oyun.env.adet("Mor kıymık") < 2 or sonraki_a1() == null: return null
	return {t = "Mor kıymıkları göster (2)", f = func():
		var K: Dictionary = {}
		for n in oyun.kisiler:
			if n.K.k == "witch": K = n.K
		oyun.konusma.ac(K.get("ad", "Cadı Zümrüt"), load(K.portre) if K.get("portre", null) != null else null, "Ooo… bunlar gökten düşen ışığın kırıntıları. Kazanda eritirsem buharı sana unuttuğun bir şeyi hatırlatır. İki tanesi yeter. Deneyelim mi?",
			[{t = "Erit", pri = true, f = func():
				oyun.env.eksilt("Mor kıymık", 2)
				getir(sonraki_a1())}, {t = "Sonra", kapat = true}])}

func _process(dt: float) -> void:
	if oyun == null: return
	if cur != null:
		cur.t += dt
		sahne.queue_redraw()
		return
	t_chk += dt
	if t_chk >= 1.0:
		t_chk = 0.0
		_denetle()
	if not kuyruk.is_empty() and _bos():
		_ac(kuyruk.pop_front(), false, Callable())

func _bos() -> bool:
	return not oyun.basta and not oyun.konusma.visible and not oyun.el_yapimi.acik_mi() and not oyun.ev.acik and not oyun.sahne.acik \
		and not oyun.oyuncu.bayildi and not get_tree().paused and not oyun.istasyon.pencere.visible and not oyun.cine.acik

## tarif eşikleri ve ustaların anıları (web setInterval)
func _denetle() -> void:
	if oyun.basta:
		son_tarif = -1
		return
	var f: int = oyun.el_yapimi.bilinen.size()
	if son_tarif < 0: son_tarif = f
	if f > son_tarif:
		for s in MS:
			if son_tarif < s and f >= s: getir(sonraki_a1())
	son_tarif = f
	for n in USTA:
		if oyun.gorev.bitti(USTA[n]) and not mems.has(n): getir(_bul(n))
	var hep := true
	for a in _a1():
		if not mems.has(a.n): hep = false
	if hepsi_a1 == null or not hep: hepsi_a1 = hep
	elif not hepsi_a1 and kuyruk.is_empty():
		hepsi_a1 = true
		oyun.env.mesaj("ACT 1'in bütün anıları geri geldi.")

# ------------------------------------------------------------------ pencere
var _sonra: Callable

func izle(i: int) -> void:
	_ac(i, true, Callable())

func _ac(i: int, again: bool, sonra: Callable) -> void:
	_sonra = sonra
	cur = {i = i, line = 0, t = 0.0, again = again}
	hero_tx = Karakter.sayfa(oyun.gorunus)
	love_tx = Karakter.sayfa(oyun.sevgili)
	ad_yazi.text = A[i].n
	visible = true
	oyun.oyuncu.kilit = true
	_satir()

func _L(a: Dictionary) -> Array:
	var L: Array = a.L
	if a.has("L_k") and _sevgili_teklif(): L = a.L_k
	if a.n == "Kelebekli kolye" and oyun.iz != null and oyun.iz.bulunan.has("bilezik"):
		L = L.duplicate(); L.append(["", "Kumsalda bulduğun lacivert kelebekler… o kolyeydi."])
	return L

## web __plLoveProposes: kadın ve erkekte erkek, aynı cinsten ikilide oyuncu teklif eder
func _sevgili_teklif() -> bool:
	var hk: bool = str(oyun.gorunus.get("gender", "e")) == "k"
	var lk: bool = str(oyun.sevgili.get("gender", "e" if hk else "k")) == "k"
	return hk and not lk

func _satir() -> void:
	var a: Dictionary = A[cur.i]
	var L := _L(a)
	cur.line = mini(int(cur.line), L.size() - 1)
	metin.text = yazi(str(L[cur.line][1]))
	dugme.text = "Devam" if cur.line < L.size() - 1 else "Anıyı sakla"
	sahne.queue_redraw()

func _ileri() -> void:
	if cur == null: return
	var L := _L(A[cur.i])
	if cur.line < L.size() - 1:
		cur.line += 1
		_satir()
		return
	var i: int = cur.i
	var again: bool = cur.again
	cur = null
	visible = false
	oyun.oyuncu.kilit = false
	if not again:
		oyun.env.xp_ekle(25 + i * 15)
		oyun.env.mesaj("Anı defterine yazıldı: \"%s\" (Kitap › Anılar)" % A[i].n)
		if oyun.kayit != null: oyun.kayit.kaydet("oto")
	if _sonra.is_valid():
		var s := _sonra
		_sonra = Callable()
		get_tree().create_timer(0.4).timeout.connect(s)

func _atla() -> void:
	if cur == null: return
	cur.line = _L(A[cur.i]).size() - 1
	_ileri()

func _unhandled_input(e: InputEvent) -> void:
	if cur != null and e is InputEventKey and e.pressed and not e.echo and e.keycode == KEY_ESCAPE:
		get_viewport().set_input_as_handled()
		_atla()

# ------------------------------------------------------------------ yazı (web memText)
func _sac(suf: String) -> String:
	var S: Dictionary = oyun.sevgili
	var CC: Dictionary = Karakter.veri().CC
	var i := -1
	for k in CC.hair.size():
		if str(CC.hair[k][0]) == str(S.get("hair", "")): i = k
	var fem: bool = str(S.get("gender", "k")) == "k"
	var col: String = HAIRN[i] if i >= 0 and i < HAIRN.size() else ("kızıl" if fem else "kahverengi")
	var hs: String = str(S.get("hs", "short"))
	var len_: String = "uzun" if hs in ["long", "tail", "braid", "bun", "twin"] else ("küt" if hs == "bob" else "kısa")
	return "%s %s saç%s" % [len_, col, suf]

static func _buyuk(s: String) -> String:
	return s.substr(0, 1).to_upper() + s.substr(1)

func yazi(s: String) -> String:
	var amb: bool = str(oyun.sevgili.get("eye", "")) == "#a6620c"
	s = s.replace("{KGB}", "Kehribar gözlüm… " if amb else "").replace("{KG}", ", kehribar gözlüm" if amb else "")
	s = s.replace("{HAIRI}", _buyuk(_sac("ları"))).replace("{HAIR}", _buyuk(_sac("larından")))
	s = s.replace("{L}", oyun.ad_sevgili if oyun.ad_sevgili != "" else "Mavi").replace("{H}", oyun.ad_kahraman if oyun.ad_kahraman != "" else "Sen")
	return s.replace("<b>", "[b]").replace("</b>", "[/b]").replace("<i>", "[i]").replace("</i>", "[/i]").replace("<br>", "\n")

# ------------------------------------------------------------------ sahne
func _doku(h: String) -> Texture2D:
	if h == "": return null
	if not dok.has(h): dok[h] = load("res://art/ani/%s.png" % h)
	return dok[h]

func _ciz() -> void:
	if cur == null: return
	var a: Dictionary = A[cur.i]
	var rows: Array = a.kareler
	var row: Array = rows[mini(int(cur.line), rows.size() - 1)]
	var f: Dictionary = row[int(cur.t / float(D.ara)) % row.size()]
	var s := 2.0
	sahne.draw_set_transform(Vector2.ZERO, 0.0, Vector2(s, s))
	var b := _doku(str(f.a))
	if b != null: sahne.draw_texture(b, Vector2.ZERO)
	for k in f.k:
		var m: Array = k.m
		var T := Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5]))
		sahne.draw_set_transform_matrix(Transform2D.IDENTITY.scaled(Vector2(s, s)) * T)
		var fx := float(k.fx); var fy := float(k.fy)
		var r := (3 if fx > 0 else (5 if fx < 0 else 4)) if fy < 0 else (1 if fx > 0 else (7 if fx < 0 else 0))
		var tx := hero_tx if k.w == "h" else love_tx
		sahne.draw_texture_rect_region(tx, Rect2(float(k.x) - 13, float(k.y) - 35, 26, 40), Rect2(0, r * 40, 26, 40))
	sahne.draw_set_transform(Vector2.ZERO, 0.0, Vector2(s, s))
	var o := _doku(str(f.get("o", "")))
	if o != null: sahne.draw_texture(o, Vector2.ZERO)
	sahne.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	var font := ThemeDB.fallback_font
	for y in f.y:
		var tx2: String = str(y.t).replace("{L}", oyun.ad_sevgili if oyun.ad_sevgili != "" else "Mavi").replace("{H}", oyun.ad_kahraman if oyun.ad_kahraman != "" else "Sen")
		var fs := int(round(float(y.s) * s))
		var w := font.get_string_size(tx2, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
		var p := Vector2(float(y.x) * s - (w / 2.0 if y.a == "c" else 0.0), float(y.y) * s + fs * 0.35)
		var c := _renk(str(y.c))
		c.a = float(y.al)
		if str(y.sh) != "": sahne.draw_string(font, p + Vector2(1, 1), tx2, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, Color(0, 0, 0, c.a * 0.8))
		sahne.draw_string(font, p, tx2, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, c)

static func _renk(c: String) -> Color:
	if c.begins_with("rgb"):
		var p := c.replace("rgba(", "").replace("rgb(", "").replace(")", "").split(",")
		var r := Color(float(p[0]) / 255.0, float(p[1]) / 255.0, float(p[2]) / 255.0)
		if p.size() > 3: r.a = float(p[3])
		return r
	return Color(c) if c.begins_with("#") else Color.WHITE

# ------------------------------------------------------------------ Kitap › Anılar (web renderMem)
func sayi() -> int:
	return mems.size()

func liste_yaz(liste: VBoxContainer) -> void:
	var not_ := Label.new()
	not_.text = "%s ile anıların sırayla geri geliyor: kazanda yeni tarifler öğrendikçe, uykuda rüya olarak, bayılınca ya da bir görevi bitirince. Mor kıymıkları Zümrüt'e götürürsen sıradaki anı hemen döner. Her anı bir kez gelir; buradan yeniden izlersin." % (oyun.ad_sevgili if oyun.ad_sevgili != "" else "Eşin")
	not_.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; not_.custom_minimum_size = Vector2(560, 0)
	not_.add_theme_font_size_override("font_size", 11); not_.add_theme_color_override("font_color", Color("#b8b098"))
	liste.add_child(not_)
	if Ayarlar.butun_sahne: _butun_sahneler(liste)
	var a1 := _a1()
	var ka := 0
	for a in a1: if mems.has(a.n): ka += 1
	_baslik(liste, "ACT 1 · %d / %d" % [ka, a1.size()])
	var nx = sonraki_a1()
	for a in a1:
		var how := "Önceki anılar gelince"
		if a.n == PROP: how = "ACT 1'in sonunda, Barbaros'un gemisine binmeden hemen önce"
		elif nx != null and a.n == nx.n:
			how = "Sıradaki anı · tarif eşiğinde (10, 25, 50, 100, 175; şimdi %d), rüyada, bayılınca ya da bir görevi bitirince%s" % [oyun.el_yapimi.bilinen.size(), (" · en erken %d. gün" % int(D.MIN[int(a.pos)])) if int(D.MIN[int(a.pos)]) > 1 else ""]
		_sira(liste, a, how)
	_baslik(liste, "ACT 2 · Mor ışık")
	for a in A:
		if a.tur == "mor": _sira(liste, a, "ACT 2'de, ikinci adada: rüyada, bayılınca ya da bir görevi bitirince")
	for a in A:
		if a.tur == "usta": _sira(liste, a, "ACT 2'de, ikinci adanın ustalarına yardım ettikçe")

## ana menüde "love" ile açılır: her anı ve ara sahne bir kutu, basınca baştan oynar (henüz gelmemiş anılar dahil)
func _butun_sahneler(liste: VBoxContainer) -> void:
	_baslik(liste, "Bütün sahneler")
	var g := HFlowContainer.new()
	g.custom_minimum_size = Vector2(560, 0)
	liste.add_child(g)
	var kutu := func(ad: String, tx, f: Callable):
		var b := Button.new()
		b.custom_minimum_size = Vector2(108, 74)
		b.text = ad
		b.clip_text = true
		b.add_theme_font_size_override("font_size", 10)
		b.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		b.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		b.expand_icon = true
		if tx != null: b.icon = tx
		else:
			var s := StyleBoxFlat.new(); s.bg_color = Color("#3a2060"); s.border_color = Color("#c9a0ff"); s.set_border_width_all(1)
			b.add_theme_stylebox_override("normal", s)
		b.pressed.connect(func():
			oyun.el_yapimi.kapat()
			f.call())
		g.add_child(b)
	kutu.call("Açılış", null, func(): oyun.cine.oyna(oyun.zorluk == "zor", Callable()))
	kutu.call("Deniz yolculuğu", null, func(): oyun.kuzen.yolculuk(true))
	kutu.call("Roket", null, func(): oyun.roket.basla(true))
	for gk in oyun.hikaye.D.kisi:
		var S: Dictionary = oyun.hikaye.D.kisi[gk]
		if S.get("sc", null) == null and not bool(S.get("aile", false)): continue
		var gg: String = gk
		kutu.call(str(S.ad), null, func(): oyun.hikaye.oynat(gg, true))
	for a in A:
		var ii := int(a.i)
		kutu.call(str(a.n), _kucuk(a), func(): izle(ii))

func _kucuk(a: Dictionary):
	var L: Array = _L(a)
	if L.is_empty(): return null
	var p := "res://art/ani/%s.png" % str(L[0][0])
	return load(p) if ResourceLoader.exists(p) else null

func _baslik(liste: VBoxContainer, t: String) -> void:
	var l := Label.new(); l.text = t; l.add_theme_font_size_override("font_size", 13); l.add_theme_color_override("font_color", Color("#e8dcc0"))
	liste.add_child(l)

func _sira(liste: VBoxContainer, a: Dictionary, how: String) -> void:
	var h := HBoxContainer.new()
	var r := RichTextLabel.new(); r.bbcode_enabled = true; r.fit_content = true; r.custom_minimum_size = Vector2(470, 0)
	r.add_theme_font_size_override("normal_font_size", 12)
	if mems.has(a.n):
		var ilk := yazi(str(_L(a)[0][1]))
		var re := RegEx.new(); re.compile("\\[[^\\]]*\\]"); ilk = re.sub(ilk, "", true)
		var k := ""
		if tur.has(a.n): k = " [color=#c9a0ff]· %s[/color]" % {"sleep": "rüya", "faint": "bayılma", "quest": "görev"}.get(tur[a.n], "")
		r.text = "[b]%s[/b]%s\n[font_size=11]%s[/font_size]" % [a.n, k, ilk]
		h.add_child(r)
		var b := Button.new(); b.text = "İzle"; b.pressed.connect(func():
			oyun.el_yapimi.kapat()
			izle(int(a.i)))
		h.add_child(b)
	else:
		r.text = "[color=#8a8a7a][b]???[/b]\n[font_size=11]%s[/font_size][/color]" % how
		h.add_child(r)
	liste.add_child(h)

func kayit() -> Dictionary:
	return {n = mems.keys(), k = tur}

func yukle(d) -> void:
	mems = {}; tur = {}; kuyruk = []; son_tarif = -1; hepsi_a1 = null
	if typeof(d) != TYPE_DICTIONARY: return
	for n in d.get("n", []): mems[str(n)] = true
	var k: Dictionary = d.get("k", {})
	for n in k: tur[str(n)] = str(k[n])
