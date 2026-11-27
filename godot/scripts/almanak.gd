extends CanvasLayer
## Almanak (web v2.13 ve sonrası; belge Sistemler › Almanak). U ile ya da küçük haritanın üstündeki kitap düğmesiyle açılır, açıkken oyun durur.
## Sol: adım bastığın biyomlar (girdiğin sırayla), Tatlı su balıkları, Deniz canlıları, Yıldızsızlar. Sağ: seçili sayfanın kartları.
## Kart ilk avına kadar siyah siluet ve ???; avlanınca resmi, huyu, değerleri, saldırıları, düşürdükleri, Reis sayacı; Reis yenilince altın.

var oyun
const CANLI := preload("res://scripts/canli.gd")
const BIO_DOSYA := ["cayir", "orman", "bataklik", "kayalik", "kul", "kristal"]
const BAD := ["Çayır", "Orman", "Bataklık", "Kayalık Dağ", "Kül Diyarı", "Mor Kristal Vadisi"]
const SU := [["Çayır · Orman", 0], ["Bataklık · Kayalık Dağ", 1], ["Kül Diyarı · Mor Kristal Vadisi", 2]]
const HUY_R := {"zararsız": "#8fe86a", "nötr": "#ffd23a", "saldırgan": "#ff6a5a"}
const IMZA_YAZI := {"tekme": "Tekme · 0,45 sn hazırlanır, ×1,1 hasar ve itme, sonra geri sıçrar (sarı)",
	"vurkac": "Vur-kaç · her ısırıktan sonra geri çekilir",
	"hucum": "Geri çekilip hücum · 0,5 sn geri adım, 1 sn düz hücum ×1,3",
	"pence": "Ayağa kalkıp iki pençe · önce sarı ×1,0, 0,4 sn sonra kırmızı ×1,4",
	"dalis": "Dalış · yükselir, senin yerine kırmızı halka, ×1,5 alan hasarı",
	"gomul": "Çamura gömülme · 1,2 sn görünmez yaklaşır, sonra ×1,5 (kırmızı)",
	"yuvarlan": "Yuvarlanma · 0,7 sn yuvarlanır, ×1,2 ve kanama (sarı)",
	"kuyruk": "Kuyruk süpürmesi · çevresine ×1,2 (sarı)",
	"igne": "Zehirli iğne · önüne uzun çizgi ×1,4 ve zehir (kırmızı)"}

var V := {}              # biyom → {canlilar: {ad: D}}
var M := []              # mağaralar: {ad, b, boss, turler, canlilar}
var bakilan := {}        # bakılmış kart anahtarları ("c:Kurt", "r:Kurt", "b:Yankı Kraliçesi", "f:Sazan", "y:Yıldızsız dev")
var boss_gor := {}       # karşılaşılan mağara boss'ları
var ilk_goster := false  # ilk avda düğme parlasın
var konuk := {}          # biyom → [tür]: kendi biyomu dışında avlanan canlılar (yan görevde başka bölgenin canlısı)
var acildi_hic := false

var dugme: Button
var rozet: Label
var pen: Control
var sol: VBoxContainer
var izgara: GridContainer
var alt_yazi: Label
var sayfa := ""
var ilan: Label
var ilan_t := 0.0
var siz_kuyruk: Array = []

func kur(o) -> void:
	oyun = o
	layer = 30
	process_mode = Node.PROCESS_MODE_ALWAYS
	for i in BIO_DOSYA.size():
		var f := "res://data/canlilar_%s.json" % BIO_DOSYA[i]
		if FileAccess.file_exists(f): V[i] = JSON.parse_string(FileAccess.get_file_as_string(f)).canlilar
	for f in ["magara", "magara_c1", "magara_c2", "magara_c3", "magara_c4", "magara_c5"]:
		var p := "res://data/%s.json" % f
		if FileAccess.file_exists(p): M.append(JSON.parse_string(FileAccess.get_file_as_string(p)))
	_arayuz()

# ------------------------------------------------------------------ veri
func _kills(k: String) -> int:
	return int(oyun.gorev.kills.get(k, 0))

func _bios() -> Array:
	var out := []
	for b in oyun.gorev.biyomlar.keys():
		if int(b) >= 0 and int(b) < 6 and not out.has(int(b)): out.append(int(b))
	# henüz gitmediğin bölgenin canlısını avladıysan o bölgenin sayfası da açılır
	for b in V:
		if out.has(b): continue
		for k in V[b]:
			if _kills(k) > 0:
				out.append(b); break
	return out

## sayfadaki kartlar: [anahtar, tür, D, durum] durum: "kapali" | "acik" | "altin" | "gordu"
func _kartlar(s: String) -> Array:
	var out := []
	if s.begins_with("b"):
		var b := int(s.substr(1))
		for k in V.get(b, {}):
			out.append(_canli_kart(k, V[b][k]))
		for C in M:
			if int(C.b) != b: continue
			for k in C.turler:
				if C.canlilar.has(k): out.append(_canli_kart(k, C.canlilar[k], str(C.ad)))
			var bk: String = C.boss
			var D: Dictionary = C.canlilar.get(bk, {})
			var dur := "altin" if _kills(bk) > 0 else ("gordu" if boss_gor.has(bk) else "kapali")
			out.append(["b:" + bk, bk, D, dur, str(C.ad)])
		for k in konuk.get(b, []):
			var eb := _ev_biyom(k)
			if eb >= 0: out.append(["k:" + k, k, V[eb][k], "acik", "Başka bölgeden"])
	elif s == "su":
		for g in SU:
			var seen := {}
			for kk in oyun.balik.FISHT[g[1]]:
				for a in oyun.balik.FISHT[g[1]][kk]:
					if seen.has(a[0]): continue
					seen[a[0]] = true
					out.append(["f:" + a[0], a[0], {}, "acik" if _balik(a[0]) > 0 else "kapali", g[0]])
	elif s == "deniz":
		for z in oyun.poyraz.ZONES:
			for a in z.fish:
				out.append(["d:" + a[0], a[0], {lv = z.lv, rod = z.rod}, "acik" if int(oyun.poyraz.caught.get(a[0], 0)) > 0 else "kapali", str(z.n)])
	elif s == "ys":
		for k in oyun.ys.YD:
			out.append(["y:" + k, k, oyun.ys.D[k], "acik" if int(oyun.ys.oldurulen.get(k, 0)) > 0 else "kapali", ""])
	return out

func _canli_kart(k: String, D: Dictionary, bolum: String = "") -> Array:
	var dur := "kapali"
	if _kills(k) > 0: dur = "altin" if bool(oyun.reis.bd.get(k, false)) else "acik"
	return ["c:" + k, k, D, dur, bolum]

func _balik(n: String) -> int:
	return int(oyun.gorev.qc.get("fish:" + n, 0))

func _yeni(K: Array) -> bool:
	var a: String = K[0]
	if a.begins_with("k:"): return false
	if K[3] == "kapali": return false
	if K[3] == "altin" and a.begins_with("c:") and not bakilan.has("r:" + K[1]): return true
	return not bakilan.has(a)

func _bak(K: Array) -> void:
	bakilan[K[0]] = true
	if K[3] == "altin" and str(K[0]).begins_with("c:"): bakilan["r:" + K[1]] = true

func _sayfalar() -> Array:
	var out := []
	if oyun.ada != 1: return out
	for b in _bios(): out.append(["b%d" % b, BAD[b]])
	var su_var := false
	for g in SU:
		for kk in oyun.balik.FISHT[g[1]]:
			for a in oyun.balik.FISHT[g[1]][kk]:
				if _balik(a[0]) > 0: su_var = true
	if su_var or _bios().size() > 0: out.append(["su", "Tatlı su balıkları"])
	if not oyun.poyraz.caught.is_empty() or int(oyun.poyraz.ph) >= 2 or sayfa == "deniz": out.append(["deniz", "Deniz canlıları"])
	if oyun.ys.sayi > 0: out.append(["ys", "Yıldızsızlar"])
	return out

func yeni_sayisi() -> int:
	var n := 0
	for s in _sayfalar():
		for K in _kartlar(s[0]):
			if _yeni(K): n += 1
	return n

# ------------------------------------------------------------------ olaylar
## bir tür ilk kez avlanınca: ortada "Almanağa eklendi · U ile bak"; oyunda ilk av ise düğme mavi parlar
func avlandi(k: String, c = null) -> void:
	if oyun.ada != 1: return
	if c != null and not oyun.magara.icinde:
		var b: int = oyun.bio_at(c.position)
		var ev := _ev_biyom(k)
		if b >= 0 and ev >= 0 and b != ev and V.has(b) and not V[b].has(k):
			var L: Array = konuk.get(b, [])
			if not L.has(k):
				L.append(k); konuk[b] = L
	if _kills(k) != 1: return
	if not _karti_var(k): return
	_ilan(k, "Almanağa eklendi · U ile bak")
	if not acildi_hic: ilk_goster = true
	_rozet()

func balik_tutuldu(n: String) -> void:
	if oyun.ada != 1 or _balik(n) != 1: return
	_ilan(n, "Almanağa eklendi · U ile bak")
	_rozet()

func boss_gordu(k: String) -> void:
	if boss_gor.has(k): return
	boss_gor[k] = true
	_rozet()

func _ev_biyom(k: String) -> int:
	for b in V:
		if V[b].has(k): return int(b)
	return -1

func _karti_var(k: String) -> bool:
	for b in V:
		if V[b].has(k): return true
	for C in M:
		if C.canlilar.has(k): return true
	return false

func _ilan(a: String, b: String) -> void:
	siz_kuyruk.append([a, b])

# ------------------------------------------------------------------ arayüz
func _stil(bg: Color, kenar: Color, k := 2) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = bg; s.border_color = kenar; s.set_border_width_all(k)
	s.content_margin_left = 8; s.content_margin_right = 8; s.content_margin_top = 6; s.content_margin_bottom = 6
	return s

func _arayuz() -> void:
	dugme = Button.new()
	dugme.text = "Almanak (U)"
	dugme.focus_mode = Control.FOCUS_NONE
	dugme.add_theme_font_size_override("font_size", 13)
	dugme.add_theme_stylebox_override("normal", _stil(Color(0.18, 0.14, 0.26, 0.9), Color("#6a5a94")))
	dugme.add_theme_stylebox_override("hover", _stil(Color(0.25, 0.2, 0.36, 0.95), Color("#c9a0ff")))
	dugme.add_theme_stylebox_override("pressed", _stil(Color(0.25, 0.2, 0.36, 0.95), Color("#c9a0ff")))
	dugme.pressed.connect(ac)
	oyun.hud.add_child(dugme)
	rozet = Label.new()
	rozet.add_theme_font_size_override("font_size", 12)
	rozet.add_theme_stylebox_override("normal", _stil(Color("#d03a2a"), Color("#3a0a08"), 1))
	rozet.position = Vector2(-10, -12)
	rozet.visible = false
	dugme.add_child(rozet)
	ilan = Label.new()
	ilan.add_theme_font_size_override("font_size", 22)
	ilan.add_theme_color_override("font_color", Color("#fff2b0"))
	ilan.add_theme_color_override("font_outline_color", Color("#1a1408"))
	ilan.add_theme_constant_override("outline_size", 6)
	ilan.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ilan.set_anchors_preset(Control.PRESET_CENTER)
	ilan.position = Vector2(-320, -120); ilan.size = Vector2(640, 60)
	ilan.modulate.a = 0.0
	oyun.hud.add_child(ilan)
	pen = ColorRect.new()
	pen.color = Color(0.03, 0.02, 0.06, 0.72)
	pen.set_anchors_preset(Control.PRESET_FULL_RECT)
	pen.visible = false
	pen.gui_input.connect(func(e):
		if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT: kapat())
	add_child(pen)
	var kutu := PanelContainer.new()
	kutu.add_theme_stylebox_override("panel", _stil(Color("#1b1726"), Color("#4a3d6a"), 3))
	kutu.set_anchors_preset(Control.PRESET_CENTER)
	kutu.custom_minimum_size = Vector2(900, 560)
	kutu.position = Vector2(-450, -280)
	kutu.gui_input.connect(func(e): kutu.accept_event())
	pen.add_child(kutu)
	var dik := VBoxContainer.new()
	kutu.add_child(dik)
	var ust := HBoxContainer.new()
	dik.add_child(ust)
	var bl := Label.new()
	bl.text = "Almanak"
	bl.add_theme_font_size_override("font_size", 18)
	ust.add_child(bl)
	alt_yazi = Label.new()
	alt_yazi.add_theme_color_override("font_color", Color("#b9aed6"))
	alt_yazi.add_theme_font_size_override("font_size", 12)
	alt_yazi.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ust.add_child(alt_yazi)
	var x := Button.new()
	x.text = "X"; x.focus_mode = Control.FOCUS_NONE
	x.pressed.connect(kapat)
	ust.add_child(x)
	var gov := HBoxContainer.new()
	gov.size_flags_vertical = Control.SIZE_EXPAND_FILL
	dik.add_child(gov)
	var sk := ScrollContainer.new()
	sk.custom_minimum_size = Vector2(200, 0)
	gov.add_child(sk)
	sol = VBoxContainer.new()
	sol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sk.add_child(sol)
	var sg := ScrollContainer.new()
	sg.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sg.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	gov.add_child(sg)
	izgara = GridContainer.new()
	izgara.columns = 3
	izgara.add_theme_constant_override("h_separation", 8)
	izgara.add_theme_constant_override("v_separation", 8)
	sg.add_child(izgara)

func acik() -> bool:
	return pen.visible

func ac(istek := "") -> void:
	if istek == "deniz":
		acildi_hic = true
		sayfa = "deniz"
		pen.visible = true
		get_tree().paused = true
		_ciz()
		return
	if oyun.ada != 1:
		oyun.env.mesaj("Almanak yalnızca Yıldızsız Ada'nın canlılarını anlatır")
		return
	acildi_hic = true
	ilk_goster = false
	pen.visible = true
	get_tree().paused = true
	var S := _sayfalar()
	if sayfa == "" or not S.any(func(a): return a[0] == sayfa):
		sayfa = S[0][0] if S.size() > 0 else ""
		for s in S:
			for K in _kartlar(s[0]):
				if _yeni(K):
					sayfa = s[0]; break
	_ciz()

func kapat() -> void:
	pen.visible = false
	get_tree().paused = false
	_rozet()

func _ciz() -> void:
	for c in sol.get_children(): c.queue_free()
	for c in izgara.get_children(): c.queue_free()
	var S := _sayfalar()
	for s in S:
		var b := Button.new()
		var K := _kartlar(s[0])
		var ac_n := 0
		var top := 0
		var yn := 0
		for k in K:
			if str(k[0]).begins_with("b:") or str(k[0]).begins_with("k:"): continue
			top += 1
			if k[3] != "kapali": ac_n += 1
			if _yeni(k): yn += 1
		b.text = "%s   %d/%d%s" % [s[1], ac_n, top, ("  · %d yeni" % yn) if yn > 0 else ""]
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.focus_mode = Control.FOCUS_NONE
		b.add_theme_font_size_override("font_size", 13)
		b.add_theme_stylebox_override("normal", _stil(Color("#3a2f55") if s[0] == sayfa else Color("#241e33"), Color("#c9a0ff") if s[0] == sayfa else Color("#3a2f55")))
		var kod: String = s[0]
		b.pressed.connect(func():
			sayfa = kod
			_ciz())
		sol.add_child(b)
	if sayfa == "":
		alt_yazi.text = "  Henüz hiçbir canlı yok"
		return
	var K := _kartlar(sayfa)
	var ac_n := 0
	var top := 0
	for k in K:
		if str(k[0]).begins_with("b:") or str(k[0]).begins_with("k:"): continue
		top += 1
		if k[3] != "kapali": ac_n += 1
	alt_yazi.text = "  %d / %d %s" % [ac_n, top, "balık" if sayfa == "su" else ("deniz canlısı" if sayfa == "deniz" else "canlı")]
	var bolum := "-"
	for k in K:
		var bb: String = str(k[4]) if k.size() > 4 else ""
		if bb != bolum and bb != "":
			# bölüm başlığı (mağara, su, deniz bölgesi): satırı tamamla, başlık koy
			while izgara.get_child_count() % izgara.columns != 0: izgara.add_child(Control.new())
			for i in izgara.columns:
				var l := Label.new()
				l.text = bb if i == 0 else ""
				l.clip_text = true
				l.custom_minimum_size = Vector2(205, 0)
				l.add_theme_color_override("font_color", Color("#c9a0ff"))
				izgara.add_child(l)
		bolum = bb
		izgara.add_child(_kart(k))

func _resim(K: Array) -> Texture2D:
	var a: String = K[0]
	var D: Dictionary = K[2]
	if a.begins_with("f:") or a.begins_with("d:"): return oyun.env.ikon_al(K[1])
	if a.begins_with("y:"):
		var at := AtlasTexture.new()
		at.atlas = D.tex; at.region = Rect2(0, 0, float(D.fw), float(D.fh))
		return at
	var f: String = str(D.get("file", D.get("png", "")))
	if f == "" or not ResourceLoader.exists(f): return null
	var t: Texture2D = load(f)
	var at2 := AtlasTexture.new()
	at2.atlas = t
	at2.region = Rect2(0, 0, float(D.get("fw", t.get_width())), float(D.get("fh", t.get_height())))
	return at2

func _kart(K: Array) -> Control:
	var a: String = K[0]
	var dur: String = K[3]
	var kart := PanelContainer.new()
	kart.custom_minimum_size = Vector2(205, 300)
	var altin := dur == "altin"
	kart.add_theme_stylebox_override("panel", _stil(Color("#3a2e10") if altin else Color("#221c2f"), Color("#f2c94c") if altin else Color("#3a2f55")))
	var v := VBoxContainer.new()
	kart.add_child(v)
	var tr := TextureRect.new()
	tr.custom_minimum_size = Vector2(0, 90)
	tr.texture = _resim(K)
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	if dur == "kapali": tr.modulate = Color(0, 0, 0, 0.9)
	v.add_child(tr)
	var ad := Label.new()
	var yeni := _yeni(K)
	ad.text = ("???" if dur == "kapali" else str(K[1])) + ("  · YENİ" if yeni else "")
	ad.add_theme_font_size_override("font_size", 15)
	ad.add_theme_color_override("font_color", Color("#ffe08a") if altin else (Color("#8d84a3") if dur == "kapali" else Color("#f3ecd8")))
	ad.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	ad.tooltip_text = str(K[1]) if dur != "kapali" else ""
	v.add_child(ad)
	var sk := ScrollContainer.new()
	sk.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sk.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	v.add_child(sk)
	var rt := RichTextLabel.new()
	rt.bbcode_enabled = true
	rt.fit_content = true
	rt.scroll_active = false
	rt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rt.add_theme_font_size_override("normal_font_size", 12)
	rt.add_theme_font_size_override("bold_font_size", 12)
	rt.text = _yazi(K)
	sk.add_child(rt)
	if yeni:
		kart.mouse_entered.connect(func():
			_bak(K)
			ad.text = str(K[1])
			_rozet())
	return kart

func _yazi(K: Array) -> String:
	var a: String = K[0]
	var k: String = K[1]
	var D: Dictionary = K[2]
	var dur: String = K[3]
	if a.begins_with("f:"):
		if dur == "kapali": return "[color=#7d7494]Henüz tutmadın.[/color]"
		return "Fiyat %d · Zorluk ×%.2f\n%s\nTuttuğun: [b]%d[/b]" % [int(oyun.pazar.fiyat(k)), float(oyun.balik.FISH_HARD.get(k, 1.0)), _tarifler(k), _balik(k)]
	if a.begins_with("d:"):
		if dur == "kapali": return "[color=#7d7494]Henüz tutmadın.[/color]\nGerekir: Sv %d · %s" % [int(D.lv), str(D.rod)]
		return "Fiyat %d · Zorluk ×%.2f\n%s\nTuttuğun: [b]%d[/b]" % [int(oyun.pazar.fiyat(k)), float(oyun.poyraz.HARD.get(k, 1.0)), _tarifler(k), int(oyun.poyraz.caught.get(k, 0))]
	if a.begins_with("b:"):
		if dur == "kapali": return "[color=#7d7494]Henüz karşılaşmadın.[/color]"
		var s := _degerler(k, D)
		return ("[color=#ffe08a]★ Yenildi[/color]\n" if dur == "altin" else "[color=#ff9a8a]Karşılaştın, henüz yenemedin[/color]\n") + s
	if dur == "kapali":
		if a.begins_with("y:"): return "[color=#7d7494]Mor ışık saldırısında yen.[/color]"
		return "[color=#7d7494]Henüz avlamadın.[/color]"
	var s2 := _degerler(k, D)
	if a.begins_with("k:"): return s2 + "\nAvladığın: [b]%d[/b]\n[color=#b9aed6]Başka bölgenin canlısı · yan görevde karşına çıktı[/color]" % _kills(k)
	if a.begins_with("y:"):
		return s2 + "\nDüşürdükleri: Vio\nYendiğin: [b]%d[/b]\n[color=#b9aed6]Can ve hasar son saldırıdaki değerleri[/color]" % int(oyun.ys.oldurulen.get(k, 0))
	s2 += "\nAvladığın: [b]%d[/b]" % _kills(k)
	if oyun.reis.uygun(k):
		var g: int = oyun.reis.gerek(k)
		if bool(oyun.reis.bd.get(k, false)): s2 += "\n[color=#ffe08a]Reis yenildi[/color]"
		else: s2 += "\nReis: %d / %d\n[color=#b9aed6]Reisin ek hamleleri: sersemleten kükreme, üçlü saldırı[/color]" % [mini(int(oyun.reis.bc.get(k, 0)), g), g]
	return s2

func _degerler(k: String, D: Dictionary) -> String:
	var tm: String = str(D.get("temper", "nötr"))
	var s := "[color=%s]%s[/color]\nCan %d · Hasar %d · Hız %d" % [HUY_R.get(tm, "#ffffff"), tm, int(D.get("hp", 0)), int(D.get("dmg", 0)), int(D.get("spd", 0))]
	var sal := []
	if int(D.get("dmg", 0)) > 0: sal.append("ısırık/vuruş %d" % int(D.dmg))
	var R = D.get("ranged", null)
	if R != null: sal.append("uzaktan %d mermi, %.1f sn'de bir" % [int(R.get("n", 1)), float(R.get("cd", 2.0))])
	if sal.size() > 0: s += "\nSaldırılar: " + ", ".join(sal)
	var fx = D.get("fx", null)
	if fx != null: s += "\nEtki: %s · saniyede ~%.1f can, %.0f sn" % [str(fx[0]), float(fx[1]), float(fx[2])]
	for t in CANLI.IMZA:
		if CANLI.IMZA[t].has(k): s += "\nÖzel hamle: " + IMZA_YAZI[t]
	if D.get("pack", null) != null: s += "\nSürüyle gezer"
	var dr := []
	for x in D.get("drops", []): dr.append(str(x.n))
	if dr.size() > 0: s += "\nDüşürdükleri: " + ", ".join(dr)
	return s

func _tarifler(n: String) -> String:
	var L := []
	for r in oyun.el_yapimi.R:
		for m in oyun.el_yapimi.R[r].get("r", []):
			if str(m[0]) == n and not L.has(r): L.append(r)
	if L.is_empty(): return ""
	return "Tariflerde: " + ", ".join(L.slice(0, 5)) + ("…" if L.size() > 5 else "")

# ------------------------------------------------------------------ düğme, rozet, nabız
func _rozet() -> void:
	var n := yeni_sayisi()
	rozet.text = " %d " % n
	rozet.visible = n > 0

func _process(dt: float) -> void:
	if oyun == null: return
	# düğmenin yeri: küçük haritanın hemen üstünde, sağa yaslı
	if oyun.kh_resim != null:
		var kh: Control = oyun.kh_resim.get_parent()
		dugme.position = Vector2(kh.position.x + kh.size.x - dugme.size.x, kh.position.y - dugme.size.y - 6)
	dugme.visible = oyun.ada == 1 and not oyun.basta and oyun.arena == null
	var tm := Time.get_ticks_msec() / 1000.0
	var nab := 0.5 + 0.5 * sin(tm * TAU / 1.8)
	if ilk_goster: dugme.modulate = Color(0.6, 0.85, 1.0).lerp(Color.WHITE, nab)
	elif rozet.visible: dugme.modulate = Color(1, 1, 1).lerp(Color(1.15, 1.05, 1.3), nab)
	else: dugme.modulate = Color.WHITE
	rozet.scale = Vector2.ONE * (1.0 + 0.08 * nab)
	if ilan_t > 0.0:
		ilan_t -= dt
		ilan.modulate.a = clampf(ilan_t, 0.0, 1.0)
	elif not siz_kuyruk.is_empty() and not get_tree().paused:
		var q: Array = siz_kuyruk.pop_front()
		ilan.text = "%s\n%s" % [q[0], q[1]]
		ilan_t = 3.0
	if Input.is_action_just_pressed("almanak") and not oyun.basta and not oyun.konusma.visible:
		if acik(): kapat()
		elif not get_tree().paused: ac()
	elif acik() and Input.is_action_just_pressed("ui_cancel"): kapat()

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	return {bak = bakilan.keys(), bg = boss_gor.keys(), a = acildi_hic, k = konuk}

func yukle(d: Dictionary) -> void:
	bakilan = {}; boss_gor = {}
	for x in d.get("bg", []): boss_gor[x] = true
	konuk = {}
	var kd = d.get("k", {})
	if kd is Dictionary:
		for b in kd: konuk[int(b)] = kd[b]
	acildi_hic = bool(d.get("a", false))
	ilk_goster = false
	if not d.has("bak"):
		# eski kayıt: o ana kadarki her şey bakılmış sayılır
		acildi_hic = true
		for s in _sayfalar():
			for K in _kartlar(s[0]):
				if K[3] != "kapali": _bak(K)
	else:
		for x in d.bak: bakilan[x] = true
	_rozet()
