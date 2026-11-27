extends CanvasLayer
## Arena (web v105-arena; belge Sistemler › Arena, hileler, kayıt › Arena).
## Ana menüde "⚔ Arena": iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır. Adanın Çayır'ında boş bir halka açılır;
## solda karakter (seviye 1/10/25/50/60, her yuvaya her giyim, elde her silah, sol elde meşale), sağda iki adanın bütün canlıları ve Reisleri.
## Varsayılan olarak kimsenin canı gitmez (hasar ölçülür), enerji/mana/ok sınırsız, bütün yetenekler açık; "Gerçek dövüş" ile gerçek olur.
## Arenada hiçbir şey kaydedilmez, başarım işlemez; çıkınca ana menüye dönülür.

var oyun
const SEV := [1, 10, 25, 50, 60]
const R1 := ["Çayır", "Orman", "Bataklık", "Kayalık Dağ", "Kül Diyarı", "Mor Kristal Vadisi"]
const R2 := ["Yüzen Kayalar", "Dev Mantar Ormanı", "Hurda Çölü", "Kristal Golem Ocağı", "Ejder Volkanı", "Gök Rıhtımı"]
const YUVA := [["silah", "Elde"], ["bas", "Baş"], ["govde", "Gövde"], ["el", "Eller"], ["ayak", "Ayaklar"], ["kolye", "Boyun"], ["yuzuk", "Yüzük"]]
const HUY := {"saldırgan": "Saldırgan", "nötr": "Nötr", "zararsız": "Zararsız"}

var merkez := Vector2.ZERO
var R := 9.0 * 16.0
var gercek := false
var sv := 25
var yuva := "silah"
var ada_sek := 1
var gruplar: Array = []      # [{ada, ad, turler}]
var dealt := 0
var recv := 0
var vurus: Array = []        # [t, dm] son 5 sn
var son_rakip := ""

var pen: Control
var sol: VBoxContainer
var sag: VBoxContainer
var hud: Label
var hud_kutu: HBoxContainer
var gercek_b: CheckButton

func kur(o) -> void:
	oyun = o
	layer = 33
	process_mode = Node.PROCESS_MODE_ALWAYS

func acik_mi() -> bool:
	return pen != null and pen.visible

## arenada can gitmez (gerçek dövüş kapalıyken); yalnız arenanın rakipleri
func serbest(c) -> bool:
	return not gercek and c.has_meta("arn")

func verdi(dm: int) -> void:
	dealt += dm
	vurus.append([Time.get_ticks_msec() / 1000.0, dm])

func aldi(dm: int) -> void:
	recv += dm

# ------------------------------------------------------------------ giriş
func gir() -> void:
	oyun.zaman.gun = 1; oyun.zaman.dk = 720.0
	oyun.env.tokluk = 100.0
	for id in oyun.yetenek.L: oyun.yetenekler[id] = true
	oyun.yetenekler["S1"] = true; oyun.yetenekler["P0"] = true
	_canlilari_yukle()
	merkez = _merkez()
	_temizle()
	oyun.oyuncu.position = merkez + Vector2(0, 60)
	for c in oyun.canlilari_ver(): c.queue_free()
	_sv(sv)
	# oklar ve mermiler sınırsız: her birinden bol
	if oyun.buyu != null:
		for a in oyun.buyu.OKLAR: oyun.env.inv[str(a[0]) if a is Array else str(a.get("n", a))] = 999
	oyun.env.inv["Taş"] = 999
	_tut("Taş kılıç" if oyun.kusanma.silah.has("Taş kılıç") else "")
	_arayuz()
	ac()

## iki adanın canlıları: ikinci adanınkiler de yüklenir
func _canlilari_yukle() -> void:
	gruplar = []
	var gor := {}
	var B1 := ["cayir", "orman", "bataklik", "kayalik", "kul", "kristal"]
	for i in B1.size():
		var J = oyun._json("res://data/canlilar_%s.json" % B1[i])
		var L := []
		for k in J.canlilar:
			if bool(J.canlilar[k].get("boss", false)) or gor.has(k): continue
			gor[k] = true; L.append(k)
			if not oyun.canlilar.has(k): oyun.canlilar[k] = J.canlilar[k]
		if L.size() > 0: gruplar.append({ada = 1, ad = R1[i], turler = L})
	for i in 6:
		var p := "res://data/ada2/canlilar_%d.json" % i
		if not FileAccess.file_exists(p): continue
		var J = oyun._json(p)
		var L := []
		for k in J.canlilar:
			if bool(J.canlilar[k].get("boss", false)) or gor.has(k): continue
			gor[k] = true; L.append(k)
			if not oyun.canlilar.has(k): oyun.canlilar[k] = J.canlilar[k]
		if L.size() > 0: gruplar.append({ada = 2, ad = R2[i], turler = L})
	var Y := []
	for k in oyun.ys.YD:
		oyun.ys.guc_ayarla()
		Y.append(k)
	gruplar.append({ada = 1, ad = "Yıldızsızlar", turler = Y})

func _merkez() -> Vector2:
	var uzak := []
	for n in oyun.kisiler: uzak.append(n.position)
	var RT := 10
	var bas := Vector2(oyun.harita.spawn.x, oyun.harita.spawn.y)
	var aday := []
	for y in range(12, int(oyun.bh) - 12, 3):
		for x in range(12, int(oyun.bw) - 12, 3):
			var p := Vector2((oyun.bx0 + x + 0.5) * 16, (oyun.by0 + y + 0.5) * 16)
			if oyun.bio_at(p) != 0 or oyun.su_mu(oyun.tile_at(p)): continue
			var ok := true
			for u in uzak:
				if p.distance_to(u) < 460.0: ok = false; break
			if ok: aday.append([p, p.distance_to(bas)])
	aday.sort_custom(func(a, b): return a[1] < b[1])
	var n := 0
	for a in aday:
		n += 1
		if n > 4000: break
		var ok2 := true
		for dy in range(-RT, RT + 1):
			for dx in range(-RT, RT + 1):
				if dx * dx + dy * dy > RT * RT: continue
				var q: Vector2 = a[0] + Vector2(dx * 16, dy * 16)
				if oyun.su_mu(oyun.tile_at(q)) or oyun.bio_at(q) != 0: ok2 = false; break
			if not ok2: break
		if ok2: return a[0]
	return bas + Vector2(0, -40)

func _temizle() -> void:
	var r := R + 40.0
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.position.distance_to(merkez) < r: ag.visible = false
	for k in oyun.agac_izgara.keys():
		var L: Array = oyun.agac_izgara[k]
		for i in range(L.size() - 1, -1, -1):
			if L[i].distance_to(merkez) < r: L.remove_at(i)
	for d in oyun.dugumler:
		if is_instance_valid(d) and d.position.distance_to(merkez) < r: d.oldur(1e9)

func engel(p: Vector2) -> bool:
	return p.distance_to(merkez) > R - 6.0

func cik() -> void:
	Kayit.bekleyen = {}
	Kayit.dogrudan = false
	get_tree().paused = false
	(func(): get_tree().reload_current_scene()).call_deferred()

# ------------------------------------------------------------------ karakter
func _sv(L: int) -> void:
	sv = L
	var E = oyun.env
	E.sv = L; E.xp = 0
	oyun.puan = {}
	var keys: Array = oyun.kusanma.spk
	var deg := true
	while deg and oyun.puan_bos() > 0:
		deg = false
		for k in keys:
			if oyun.puan_bos() <= 0: break
			var r := int(oyun.puan.get(k, 0))
			if r < int(oyun.kusanma.rmax) and r < oyun.puan_tavan():
				oyun.puan[k] = r + 1; deg = true
	oyun.oyuncu.yetenek_uygula()
	oyun.oyuncu.hp = oyun.oyuncu.hp_max
	E._sv_ciz()

func _tut(n: String) -> void:
	var E = oyun.env
	for i in E.kemer.size(): E.kemer[i] = null
	if n != "":
		E.inv[n] = 1
		E.kemer[0] = n
		E.el = 0
		if E.dayan.has(n): E.dayan.erase(n)
	else:
		E.el = -1
	E.kemer_ciz()

func _giy(s: String, n: String) -> void:
	if n == "": oyun.kusam.erase(s)
	else: oyun.kusam[s] = n
	oyun.oyuncu.yetenek_uygula()
	oyun.oyuncu.hp = oyun.oyuncu.hp_max

func _silahlar() -> Array:
	var K: Dictionary = oyun.kusanma.silah
	var gr := {"Kılıçlar": [], "Savaş çekiçleri": [], "Topuzlar": [], "Mızraklar": [], "Yaylar": [], "Fırlatma": [], "Asalar": [], "Ateşli silahlar": [], "Baltalar": [], "Kazmalar": [], "Meşaleler": []}
	for n in K:
		var k: String = str(K[n].get("kind", ""))
		var m = K[n].get("mace", null)
		if m == "gurz": gr["Savaş çekiçleri"].append(n)
		elif m == "topuz": gr["Topuzlar"].append(n)
		elif k == "sword": gr["Kılıçlar"].append(n)
		elif k == "hunt": gr["Mızraklar"].append(n)
	for n in oyun.buyu.YAY: gr["Yaylar"].append(n)
	for n in oyun.buyu.SL: gr["Fırlatma"].append(n)
	for n in oyun.buyu.STAFF: gr["Asalar"].append(n)
	for n in oyun.buyu.GUNS: gr["Ateşli silahlar"].append(n)
	for n in oyun.toplama_veri.tools:
		if str(n).contains("balta"): gr["Baltalar"].append(n)
		elif str(n).contains("kazma"): gr["Kazmalar"].append(n)
	for n in oyun.mesale.V.sure: gr["Meşaleler"].append(n)
	var out := []
	for k in gr:
		if gr[k].size() > 0: out.append([k, gr[k]])
	return out

# ------------------------------------------------------------------ rakip
func dovus(k: String, reis := false) -> void:
	for c in oyun.canlilari_ver():
		if c.has_meta("arn"): c.queue_free()
	await get_tree().process_frame
	var p := merkez + Vector2(0, -50)
	var c
	if reis:
		var D: Dictionary = oyun.reis.veri(k)
		c = oyun._canli_yeni(oyun.reis.ad(k), p, 0)
		c.set_meta("reis", k)
		var s := 1.5 if oyun.reis.BUYUK.has(k) else 2.0
		c.scale = Vector2(s, s)
		c.spr.modulate = Color(0.86, 0.62, 1.0)
	else:
		c = oyun._canli_yeni(k, p, 0)
		if k.begins_with("Yıldızsız"): c.set_meta("ys", true)
	c.set_meta("arn", true)
	c.mad = true
	c.st = "chase"
	dealt = 0; recv = 0; vurus = []
	son_rakip = (oyun.reis.ad(k) if reis else k)
	kapat()

# ------------------------------------------------------------------ pencere
func _stil(bg: Color, kenar: Color, k := 2) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = bg; s.border_color = kenar; s.set_border_width_all(k)
	s.content_margin_left = 6; s.content_margin_right = 6; s.content_margin_top = 4; s.content_margin_bottom = 4
	return s

func _btn(t: String, f: Callable, on := false) -> Button:
	var b := Button.new()
	b.text = t
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 12)
	b.add_theme_stylebox_override("normal", _stil(Color("#3a2f55") if on else Color("#221c2f"), Color("#c9a0ff") if on else Color("#3a2f55"), 1))
	b.pressed.connect(f)
	return b

func _arayuz() -> void:
	hud_kutu = HBoxContainer.new()
	hud_kutu.set_anchors_preset(Control.PRESET_CENTER_TOP)
	hud_kutu.position = Vector2(-330, 6)
	add_child(hud_kutu)
	hud = Label.new()
	hud.add_theme_font_size_override("font_size", 13)
	hud.add_theme_color_override("font_outline_color", Color.BLACK)
	hud.add_theme_constant_override("outline_size", 4)
	hud_kutu.add_child(hud)
	hud_kutu.add_child(_btn("Rakip seç", ac))
	gercek_b = CheckButton.new()
	gercek_b.text = "Gerçek dövüş"
	gercek_b.focus_mode = Control.FOCUS_NONE
	gercek_b.add_theme_font_size_override("font_size", 12)
	gercek_b.toggled.connect(func(on): gercek = on)
	hud_kutu.add_child(gercek_b)
	hud_kutu.add_child(_btn("Arenadan çık", cik))
	pen = ColorRect.new()
	pen.color = Color(0.03, 0.02, 0.06, 0.78)
	pen.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(pen)
	var kutu := PanelContainer.new()
	kutu.add_theme_stylebox_override("panel", _stil(Color("#1b1726"), Color("#b56aff"), 3))
	kutu.set_anchors_preset(Control.PRESET_CENTER)
	kutu.custom_minimum_size = Vector2(920, 560)
	kutu.position = Vector2(-460, -280)
	pen.add_child(kutu)
	var dik := VBoxContainer.new()
	kutu.add_child(dik)
	var ust := HBoxContainer.new()
	dik.add_child(ust)
	var bl := Label.new()
	bl.text = "⚔ Arena · karakterini seç, bir rakip seç"
	bl.add_theme_font_size_override("font_size", 18)
	bl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ust.add_child(bl)
	ust.add_child(_btn("Kapat", kapat))
	ust.add_child(_btn("Arenadan çık", cik))
	var gov := HBoxContainer.new()
	gov.size_flags_vertical = Control.SIZE_EXPAND_FILL
	dik.add_child(gov)
	var s1 := ScrollContainer.new()
	s1.custom_minimum_size = Vector2(400, 0)
	s1.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	gov.add_child(s1)
	sol = VBoxContainer.new()
	sol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	s1.add_child(sol)
	var s2 := ScrollContainer.new()
	s2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	s2.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	gov.add_child(s2)
	sag = VBoxContainer.new()
	sag.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	s2.add_child(sag)

func ac() -> void:
	pen.visible = true
	get_tree().paused = true
	_ciz()

func kapat() -> void:
	pen.visible = false
	get_tree().paused = false

func _baslik(t: String) -> Label:
	var l := Label.new()
	l.text = t
	l.add_theme_color_override("font_color", Color("#c9a0ff"))
	l.add_theme_font_size_override("font_size", 13)
	return l

func _ikonlu(n: String, alt: String, on: bool, f: Callable) -> Button:
	var b := _btn("%s\n%s" % [n, alt] if alt != "" else n, f, on)
	b.icon = oyun.env.ikon_al(n)
	b.expand_icon = false
	b.alignment = HORIZONTAL_ALIGNMENT_LEFT
	b.custom_minimum_size = Vector2(185, 34)
	return b

func _ciz() -> void:
	for c in sol.get_children(): c.queue_free()
	for c in sag.get_children(): c.queue_free()
	# sol: seviye, yuvalar, seçici
	sol.add_child(_baslik("Seviye (puanlar bütün özelliklere eşit dağılır)"))
	var sh := HBoxContainer.new()
	for L in SEV: sh.add_child(_btn(str(L), func():
		_sv(L)
		_ciz(), L == sv))
	sol.add_child(sh)
	var P = oyun.oyuncu
	var st := Label.new()
	st.text = "Seviye %d · Can %d · Enerji %d · Savunma %d · bütün yetenekler açık" % [sv, int(P.hp_max), int(P.st_max), oyun.savunma()]
	st.add_theme_font_size_override("font_size", 11)
	sol.add_child(st)
	var yg := GridContainer.new(); yg.columns = 4
	for Y in YUVA:
		var s: String = Y[0]
		var n = oyun.env.elde() if s == "silah" else oyun.kusam.get(s, null)
		var t := "%s: %s" % [Y[1], (n if n != null and n != "" else ("Yumruk" if s == "silah" else "boş"))]
		yg.add_child(_btn(t, func():
			yuva = s
			_ciz(), yuva == s))
	sol.add_child(yg)
	var g := GridContainer.new(); g.columns = 2
	if yuva == "silah":
		sol.add_child(_baslik("Envanter · elindeki"))
		var g0 := GridContainer.new(); g0.columns = 2
		g0.add_child(_ikonlu("Yumruk", "4 hasar", oyun.env.elde() == "", func():
			_tut("")
			_ciz()))
		sol.add_child(g0)
		for gr in _silahlar():
			sol.add_child(_baslik(gr[0]))
			var gg := GridContainer.new(); gg.columns = 2
			for n in gr[1]:
				var dm = oyun.kusanma.silah.get(n, {}).get("dmg", null)
				gg.add_child(_ikonlu(n, ("%d hasar" % int(dm)) if dm != null else "", oyun.env.elde() == n, func():
					_tut(n)
					_ciz()))
			sol.add_child(gg)
		var nt := Label.new()
		nt.text = "Asalar ve ateşli silahlar elde olmalı; mana, mermi ve ok sınırsız."
		nt.add_theme_font_size_override("font_size", 11)
		sol.add_child(nt)
	else:
		sol.add_child(_baslik("Bu yuva için"))
		g.add_child(_ikonlu("Boş", "savunma yok", not oyun.kusam.has(yuva), func():
			_giy(yuva, "")
			_ciz()))
		var L := []
		for n in oyun.kusanma.esya:
			if str(oyun.kusanma.esya[n].s) == yuva: L.append(n)
		L.sort_custom(func(a, b): return int(oyun.kusanma.esya[a].def) < int(oyun.kusanma.esya[b].def))
		for n in L:
			g.add_child(_ikonlu(n, "savunma %d" % int(oyun.kusanma.esya[n].def), oyun.kusam.get(yuva, "") == n, func():
				_giy(yuva, n)
				_ciz()))
		sol.add_child(g)
	# sağ: rakipler
	var th := HBoxContainer.new()
	th.add_child(_btn("Yıldızsız Ada", func():
		ada_sek = 1
		_ciz(), ada_sek == 1))
	th.add_child(_btn("İkinci ada", func():
		ada_sek = 2
		_ciz(), ada_sek == 2))
	sag.add_child(th)
	for G in gruplar:
		if int(G.ada) != ada_sek: continue
		sag.add_child(_baslik(G.ad))
		var cg := GridContainer.new(); cg.columns = 2
		for k in G.turler: cg.add_child(_kart(k))
		sag.add_child(cg)

func _resim(k: String) -> Texture2D:
	var D: Dictionary = oyun.canlilar.get(k, {})
	if D.has("tex"):
		var a := AtlasTexture.new(); a.atlas = D.tex; a.region = Rect2(0, 0, float(D.fw), float(D.fh)); return a
	var f: String = str(D.get("file", D.get("png", "")))
	if f == "" or not ResourceLoader.exists(f): return null
	var t: Texture2D = load(f)
	var at := AtlasTexture.new(); at.atlas = t; at.region = Rect2(0, 0, float(D.get("fw", 32)), float(D.get("fh", 32)))
	return at

func _kart(k: String) -> Control:
	var D: Dictionary = oyun.canlilar.get(k, {})
	var kart := PanelContainer.new()
	kart.add_theme_stylebox_override("panel", _stil(Color("#221c2f"), Color("#3a2f55")))
	kart.custom_minimum_size = Vector2(230, 0)
	var h := HBoxContainer.new()
	kart.add_child(h)
	var tr := TextureRect.new()
	tr.texture = _resim(k)
	tr.custom_minimum_size = Vector2(52, 52)
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	h.add_child(tr)
	var v := VBoxContainer.new()
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(v)
	var ad := Label.new()
	ad.text = k
	ad.add_theme_font_size_override("font_size", 12)
	v.add_child(ad)
	var tg := []
	tg.append(HUY.get(str(D.get("temper", "")), str(D.get("temper", ""))))
	if D.get("ranged", null) != null: tg.append("Menzilli")
	if D.get("fx", null) != null: tg.append(str(D.fx[0]).capitalize())
	if bool(D.get("fly", false)): tg.append("Uçar")
	if D.get("pack", null) != null: tg.append("Sürü")
	if bool(D.get("night", false)): tg.append("Gece")
	var mt := Label.new()
	mt.text = "Can %d · hasar %d · hız %d\n%s" % [int(D.get("hp", 0)), int(D.get("dmg", 0)), int(D.get("spd", 0)), " · ".join(tg)]
	mt.add_theme_font_size_override("font_size", 10)
	v.add_child(mt)
	var bh := HBoxContainer.new()
	bh.add_child(_btn("Dövüş", func(): dovus(k)))
	var rb := _btn("♛ Reis", func(): dovus(k, true))
	rb.disabled = not oyun.reis.uygun(k) or k == "Kara ejder"
	bh.add_child(rb)
	v.add_child(bh)
	return kart

func _process(_dt: float) -> void:
	if oyun == null or hud == null: return
	var P = oyun.oyuncu
	if not gercek:
		P.hp = P.hp_max
		oyun.can_guncelle(P.hp, P.hp_max)
	P.st = P.st_max
	oyun.env.tokluk = 100.0
	if oyun.buyu != null: oyun.buyu.mana = oyun.buyu.en_cok()
	var t := Time.get_ticks_msec() / 1000.0
	while vurus.size() > 0 and t - float(vurus[0][0]) > 5.0: vurus.pop_front()
	var s5 := 0
	for v in vurus: s5 += int(v[1])
	hud.text = "%s · verdiğin hasar %d (son 5 sn %d, sn'de %.1f) · aldığın %d   " % [son_rakip if son_rakip != "" else "Rakip yok", dealt, s5, s5 / 5.0, recv]
	if Input.is_action_just_pressed("ui_cancel") and pen.visible and son_rakip != "": kapat()
