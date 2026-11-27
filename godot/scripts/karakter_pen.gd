## Karakter penceresi (C): yedi kuşanma yuvası ve seviye puanları (web mode 'char': dollHTML, wear, unwear, ROWS, spplus).
extends CanvasLayer

var oyun
var pencere: PanelContainer
var sol: VBoxContainer
var sag: VBoxContainer
var secim := ""      # açık yuva (web eqPick)
var sekme := "k"     # "k" karakter · "st" istatistikler
const ROWS := [
	["gather", "Toplama hızı", "Dal, taş, bitki, odun ve maden toplarken daha hızlı olursun."],
	["move", "Hareket hızı", "Daha hızlı yürür ve koşarsın."],
	["trade", "Satış değeri", "Sattığın her şey daha çok Vio eder."],
	["luck", "Şans (tüm ihtimallere)", "Ganimet, nadir düşüş ve bütün ihtimaller artar."],
	["hp", "En yüksek can", "Bayılmadan önce dayanabileceğin hasar."],
	["hpRe", "Can yenilenmesi", "Canın kendiliğinden daha hızlı dolar."],
	["st", "En yüksek enerji", "Koşu, atılma, savuşturma ve vuruş için daha çok enerjin olur."],
	["stRe", "Enerji yenilenmesi", "Enerjin daha hızlı dolar."],
	["dmg", "Güç", "Silahla, okla ve asayla vurduğun hasar artar."],
	["zirh", "Zırh", "Aldığın hasar azalır; giysisiz de bir zırhın vardır."],
	["mana", "En yüksek mana", "Asaların büyüleri için daha çok manan olur."]]
const GRUP := [["Ekonomi", ["gather", "trade", "luck"]], ["Savaş", ["dmg", "move", "st", "stRe", "mana"]], ["Dayanıklılık", ["hp", "hpRe", "zirh"]]]

func kur(o) -> void:
	oyun = o
	layer = 6
	var arka := ColorRect.new()
	arka.color = Color(0, 0, 0, 0.45)
	add_child(arka)
	arka.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	arka.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed: kapat())
	pencere = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color("#1c2419"); st.border_color = Color("#0b0f0a"); st.set_border_width_all(3); st.set_content_margin_all(12)
	pencere.add_theme_stylebox_override("panel", st)
	add_child(pencere)
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	pencere.add_child(h)
	sol = VBoxContainer.new(); sol.custom_minimum_size = Vector2(300, 0)
	sag = VBoxContainer.new(); sag.custom_minimum_size = Vector2(430, 0)
	h.add_child(sol); h.add_child(sag)
	visible = false

func ac() -> void:
	secim = ""
	visible = true
	ciz()

func kapat() -> void:
	visible = false

func _lbl(t: String, boy := 13, renk := Color("#e8e2cc"), gen := 0.0) -> Label:
	var l := Label.new(); l.text = t; l.add_theme_font_size_override("font_size", boy); l.add_theme_color_override("font_color", renk)
	if gen > 0.0:
		l.autowrap_mode = TextServer.AUTOWRAP_WORD
		l.custom_minimum_size = Vector2(gen, 0)
	return l

func _rtl(t: String, boy := 12) -> RichTextLabel:
	var r := RichTextLabel.new(); r.bbcode_enabled = true; r.fit_content = true; r.scroll_active = false; r.text = t
	r.custom_minimum_size = Vector2(290, 0)
	r.add_theme_font_size_override("normal_font_size", boy); r.add_theme_font_size_override("bold_font_size", boy)
	return r

static func _x(v: float) -> String:
	return ("%.2f" % v).replace(".", ",")

func _deger(k: String, r: int) -> String:
	var S = oyun
	match k:
		"gather", "move", "trade": return _x(S.stat(k, r))
		"luck": return "+%" + ("%.1f" % (S.stat(k, r) * 100.0)).replace(".", ",")
		"hp": return str(int(S.oyuncu.can_max(r)))
		"hpRe": return _x(S.oyuncu._hp_yenile(r)) + "/sn"
		"st": return str(int(S.oyuncu.enerji_max(r)))
		"stRe": return _x(S.oyuncu.enerji_dolma(r)) + "/sn"
		"dmg": return _x(S.stat(k, r)) + "×"
		"zirh": return str(S.zirh_deger(r))
		"mana": return str(int(round(S.stat(k, r))))
	return ""

func ciz() -> void:
	for c in sol.get_children():
		sol.remove_child(c); c.queue_free()
	for c in sag.get_children():
		sag.remove_child(c); c.queue_free()
	var S = oyun
	# --- sekmeler: Karakter · İstatistikler
	var th := HBoxContainer.new()
	for a in [["k", "Karakter"], ["st", "İstatistikler"]]:
		var tb0 := Button.new()
		tb0.text = a[1]
		tb0.focus_mode = Control.FOCUS_NONE
		if sekme == a[0]: tb0.add_theme_color_override("font_color", Color("#f2c94c"))
		var kk: String = a[0]
		tb0.pressed.connect(func():
			sekme = kk
			ciz())
		th.add_child(tb0)
	sol.add_child(th)
	if sekme == "st":
		_istatistik()
		_yerles.call_deferred()
		return
	# --- yuvalar
	sol.add_child(_lbl("Kuşanma", 18, Color("#f2c94c")))
	for y in S.kusanma.yuvalar:
		var k: String = y[0]
		var n = S.kusam.get(k, null)
		var b := Button.new()
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.custom_minimum_size = Vector2(290, 28)
		b.icon = S.env.ikon_al(n) if n != null else null
		b.text = "%s: %s%s" % [y[1], n if n != null else "boş", ("  · " + S.esya_yazi(n)) if n != null else ""]
		b.add_theme_font_size_override("font_size", 12)
		if secim == k: b.add_theme_color_override("font_color", Color("#f2c94c"))
		b.pressed.connect(_yuva.bind(k))
		sol.add_child(b)
		if secim == k: _secim_listesi(k, y[1])
	var cut := int(round((1.0 - S.zirh_carpan()) * 100.0))
	sol.add_child(_rtl("Zırh [b]%d[/b] (seviye puanı + yetenek) · Savunma [b]%d[/b] (giydiklerin) · hayvan ve canavar hasarı [b]%%%d[/b] azalır. Silah yuvasındaki silah, elin boşken vuruşlarda kullanılır." % [S.zirh_deger(), S.savunma(), cut], 12))
	# --- özellikler
	var need: int = int(S.env.G.xpNeed[mini(S.env.sv - 1, S.env.G.xpNeed.size() - 1)])
	sag.add_child(_lbl("%sSeviye %d" % [(S.ad_kahraman + " · ") if S.ad_kahraman != "" else "", S.env.sv], 18, Color("#f2c94c")))
	sag.add_child(_lbl("%d / %d XP · sonraki seviyeye %d XP" % [S.env.xp, need, need - S.env.xp], 12, Color("#b8ac90")))
	var bos: int = S.puan_bos()
	if bos > 0:
		var p := PanelContainer.new()
		var ps := StyleBoxFlat.new(); ps.bg_color = Color("#3a2e10"); ps.border_color = Color("#f2c94c"); ps.set_border_width_all(2); ps.set_content_margin_all(6)
		p.add_theme_stylebox_override("panel", ps)
		p.add_child(_lbl("%d verilmemiş seviye puanın var" % bos, 13, Color("#ffe27a")))
		sag.add_child(p)
	var cap: int = S.puan_tavan()
	var tb := GridContainer.new(); tb.columns = 5
	tb.add_theme_constant_override("h_separation", 10)
	tb.add_theme_constant_override("v_separation", 1)
	sag.add_child(tb)
	var R := {}
	for w in ROWS: R[w[0]] = w
	for g in GRUP:
		for i in 5:
			var l := _lbl(g[0] if i == 0 else "", 13, Color("#7fb8e0"))
			tb.add_child(l)
		for k in g[1]:
			var w: Array = R[k]
			var r: int = int(S.puan.get(k, 0))
			var tam: bool = r >= int(S.kusanma.rmax)
			tb.add_child(_lbl(w[1], 12))
			tb.add_child(_lbl(_deger(k, r), 12, Color("#fff2c0")))
			var pb := ProgressBar.new(); pb.custom_minimum_size = Vector2(70, 8); pb.max_value = float(S.kusanma.rmax); pb.value = r; pb.show_percentage = false
			pb.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			var pbg := StyleBoxFlat.new(); pbg.bg_color = Color("#0b0f0a"); var pfg := StyleBoxFlat.new(); pfg.bg_color = Color("#7fb8e0")
			pb.add_theme_stylebox_override("background", pbg); pb.add_theme_stylebox_override("fill", pfg)
			pb.tooltip_text = "%d / %d puan" % [r, int(S.kusanma.rmax)]
			tb.add_child(pb)
			tb.add_child(_lbl("tam" if tam else _deger(k, r + 1), 12, Color("#a8e08a")))
			if not tam and r >= cap:
				tb.add_child(_lbl("Sv %d'de açılır" % (3 * r), 11, Color("#b8ac90")))
			else:
				var b := Button.new(); b.text = "+"; b.tooltip_text = w[2]
				b.custom_minimum_size = Vector2(24, 20); b.add_theme_font_size_override("font_size", 12)
				b.disabled = bos <= 0 or tam or r >= cap
				b.pressed.connect(_ver.bind(k))
				tb.add_child(b)
	sag.add_child(_lbl("Verilmemiş seviye puanı: %d" % bos, 12, Color("#ffe27a") if bos > 0 else Color("#b8ac90")))
	if cap < int(S.kusanma.rmax): sag.add_child(_lbl("Bu seviyede bir özellik en çok %d puan alabilir (her 3 seviyede 1 artar)." % cap, 11, Color("#b8ac90"), 430))
	sol.add_child(_lbl("Her seviye atlayışta seviye puanı kazanırsın (10. seviyeye kadar 2, 30. seviyeye kadar 3, sonra 4); dilediğin özelliğe + ile verirsin. Her özellik en çok %d puan alır; 60. seviyede hepsi tam dolar." % int(S.kusanma.rmax), 11, Color("#b8ac90"), 290))
	_yerles.call_deferred()

func _kart(v: String, l: String) -> Control:
	var p := PanelContainer.new()
	var s := StyleBoxFlat.new(); s.bg_color = Color("#232d1f"); s.border_color = Color("#3a4a32"); s.set_border_width_all(1); s.set_content_margin_all(6)
	p.add_theme_stylebox_override("panel", s)
	p.custom_minimum_size = Vector2(138, 0)
	var v2 := VBoxContainer.new()
	p.add_child(v2)
	v2.add_child(_lbl(v, 16, Color("#fff2c0")))
	v2.add_child(_lbl(l, 11, Color("#b8ac90")))
	return p

func _istatistik() -> void:
	var S = oyun
	var I = S.ist
	var ks := []
	var tot := 0
	for k in S.gorev.kills:
		if str(k).ends_with(" Reisi") or int(S.gorev.kills[k]) <= 0: continue
		ks.append(k); tot += int(S.gorev.kills[k])
	var reis := 0
	for k in S.reis.bd:
		if bool(S.reis.bd[k]): reis += 1
	var g := GridContainer.new(); g.columns = 2
	g.add_theme_constant_override("h_separation", 6); g.add_theme_constant_override("v_separation", 6)
	for a in [[str(S.zaman.gun), "gün hayatta kaldın"], [I.sure_yaz(I.aktif), "aktif oyun süresi"], [I.sure_yaz(I.menu), "menüde geçen süre"], [I.yol_yaz(I.yol), "yürüdüğün yol"],
			[str(tot), "avlanan canlı"], [str(reis), "yenilen reis"], [str(S.basarim._fish()), "tutulan balık"], [str(I.yapilan), "yapılan eşya"],
			["%d / %d" % [S.el_yapimi.bilinen.size(), S.el_yapimi.R.size()], "öğrenilen tarif"], [str(I.kazanilan), "kazanılan Vio"], [str(I.harcanan), "harcanan Vio"],
			[str(S.basarim.bayilma), "bayılma"], [str(I.toplanan), "toplanan malzeme"]]:
		g.add_child(_kart(a[0], a[1]))
	sol.add_child(g)
	sag.add_child(_lbl("Avlanan canlılar", 16, Color("#f2c94c")))
	if ks.is_empty():
		sag.add_child(_lbl("Henüz hiçbir canlı avlamadın. Bir türden yeterince avlarsan sürünün reisi ortaya çıkar.", 12, Color("#b8ac90"), 420))
		return
	ks.sort_custom(func(a, b): return int(S.gorev.kills[a]) > int(S.gorev.kills[b]))
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(430, 380)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	var L := VBoxContainer.new()
	L.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(L)
	sag.add_child(sc)
	for k in ks:
		var h := HBoxContainer.new()
		var ad := _lbl("%s · %d avlandı%s" % [k, int(S.gorev.kills[k]), "  ♛ reis yenildi" if bool(S.reis.bd.get(k, false)) else ""], 12)
		ad.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.add_child(ad)
		if S.canlilar.has(k) and S.reis.uygun(k):
			var need: int = S.reis.gerek(k)
			var c := mini(need, int(S.reis.bc.get(k, 0)))
			var pb := ProgressBar.new(); pb.custom_minimum_size = Vector2(90, 8); pb.max_value = need; pb.value = c; pb.show_percentage = false
			pb.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			pb.tooltip_text = "%s: %d / %d" % [S.reis.ad(k), c, need]
			h.add_child(pb)
			h.add_child(_lbl("Reis %d/%d" % [c, need], 11, Color("#b8ac90")))
		else:
			h.add_child(_lbl("reisi yok", 11, Color("#8a8a80")))
		L.add_child(h)

func _yerles() -> void:
	pencere.reset_size()
	pencere.position = ((get_viewport().get_visible_rect().size - pencere.size) / 2.0).floor().max(Vector2.ZERO)

func _secim_listesi(k: String, ad: String) -> void:
	var S = oyun
	var kutu := VBoxContainer.new()
	kutu.add_child(_lbl(ad + " için", 12, Color("#f2c94c")))
	var var_ := false
	for n in S.env.inv:
		if S.env.adet(n) > 0 and S.yuva_of(n) == k:
			var_ = true
			var b := Button.new(); b.alignment = HORIZONTAL_ALIGNMENT_LEFT; b.icon = S.env.ikon_al(n)
			b.text = "%s  · %s" % [n, S.esya_yazi(n)]; b.add_theme_font_size_override("font_size", 12)
			b.pressed.connect(_giy.bind(n))
			kutu.add_child(b)
	if not var_: kutu.add_child(_lbl("Bu yuvaya uyan bir şeyin yok. Giysiler kazanda, silahlar örste yapılır.", 11, Color("#b8ac90"), 290))
	if S.kusam.get(k, null) != null:
		var c := Button.new(); c.text = "Çıkar"; c.pressed.connect(_cikar.bind(k))
		kutu.add_child(c)
	sol.add_child(kutu)

func _yuva(k: String) -> void:
	secim = "" if secim == k else k
	ciz()

func _giy(n: String) -> void:
	oyun.giy(n)
	secim = ""
	ciz()

func _cikar(k: String) -> void:
	oyun.cikar(k)
	secim = ""
	ciz()

func _ver(k: String) -> void:
	oyun.puan_ver(k)
	ciz()

func _unhandled_input(e: InputEvent) -> void:
	if visible and e is InputEventKey and e.pressed and not e.echo and (e.physical_keycode == KEY_ESCAPE or e.physical_keycode == KEY_C):
		kapat()
		get_viewport().set_input_as_handled()
		return
	if not visible and e.is_action_pressed("karakter") and not oyun.pencere_acik():
		ac()
		get_viewport().set_input_as_handled()
