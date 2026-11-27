## Ada halkı hikâyeleri (web v59: ST_, storyChoice, tell, playScene, Kitap › Ada halkı; aile sahnesi web __plFam;
## belge Sistemler › Ada halkı hikâyeleri).
## Her kişi görevleri ilerledikçe bu adaya nasıl geldiğini parça parça anlatır: kendi konuşmasında "Sen bu adaya nasıl geldin?" /
## "Hikâyenin devamını anlat" seçeneği. Bütün parçalar duyulunca "O geceyi anlat": kısa bir sahne (+40 XP).
## Zümrüt, Dursun, Durmuş ve 15 kuzen tek bir aile sahnesini paylaşır (hepsinin görevleri bitince; +XP aile).
extends Node

var oyun
var D: Dictionary
var duydu := {}       # g → kaç parça
var gordu := {}       # g → sahne görüldü
var aile_gordu := false
var ad_g := {}
const BYE := ["Hoşça kal", "Sonra", "Sonra konuşuruz", "Sonra gelirim", "Teşekkürler", "Tamam", "Ne demek"]
const AD_EK := {"Çiftçi Ekin": "farmer"}
# sahne oynatıcı
var kat: CanvasLayer
var resim: TextureRect
var ad_l: Label
var yazi: RichTextLabel
var dugme: Button
var cur = null        # {g, sahne, n, line, t, again}
var kareler := {}

func kur(o) -> void:
	oyun = o
	D = o._json("res://data/hikaye.json")
	for g in D.kisi: ad_g[str(D.kisi[g].ad)] = g
	for a in AD_EK: ad_g[a] = AD_EK[a]
	process_mode = Node.PROCESS_MODE_ALWAYS
	kat = CanvasLayer.new(); kat.layer = 8; kat.visible = false; kat.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(kat)
	var arka := ColorRect.new(); arka.color = Color(0.03, 0.02, 0.06, 0.86); arka.set_anchors_preset(Control.PRESET_FULL_RECT)
	arka.gui_input.connect(func(e): if e is InputEventMouseButton and e.pressed: _atla())
	kat.add_child(arka)
	var v := VBoxContainer.new()
	v.set_anchors_preset(Control.PRESET_CENTER)
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	kat.add_child(v)
	var ust := Label.new(); ust.text = "Ada halkı"; ust.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ust.add_theme_font_size_override("font_size", 12); ust.add_theme_color_override("font_color", Color("#c9a0ff"))
	v.add_child(ust)
	ad_l = Label.new(); ad_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ad_l.add_theme_font_size_override("font_size", 19); ad_l.add_theme_color_override("font_color", Color("#f3ecd8"))
	v.add_child(ad_l)
	resim = TextureRect.new()
	resim.custom_minimum_size = Vector2(720, 405)
	resim.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	resim.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	resim.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	v.add_child(resim)
	yazi = RichTextLabel.new(); yazi.bbcode_enabled = true; yazi.fit_content = true; yazi.custom_minimum_size = Vector2(720, 56)
	yazi.add_theme_font_size_override("normal_font_size", 16); yazi.add_theme_color_override("default_color", Color("#f3ecd8"))
	v.add_child(yazi)
	dugme = Button.new(); dugme.pressed.connect(_ileri); dugme.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	v.add_child(dugme)
	v.position = Vector2(-370, -270)

func _bb(s: String) -> String:
	return s.replace("<b>", "[b]").replace("</b>", "[/b]").replace("<i>", "[i]").replace("</i>", "[/i]").replace("<br>", "\n").replace("“", "\"").replace("”", "\"")

func _bitti(id: String) -> bool:
	return oyun.gorev.bitti(id) or (oyun.yan != null and oyun.yan.done.has(id))

## kaç parça açıldı (Kemal: bitirdiği ana görev sayısı 2, 4, 6 … olunca)
func acik(g: String) -> int:
	var S: Dictionary = D.kisi[g]
	if g == "npc":
		var n := 0
		for id in oyun.gorev.bitenler:
			var q = oyun.gorev.QI.get(id, null)
			if q != null and q.g == "npc": n += 1
		var c := 0
		for a in S.at:
			if n >= int(a): c += 1
		return c
	var c := 0
	for id in S.ids:
		if _bitti(str(id)): c += 1
	return c

func _aile_bitti() -> bool:
	for g in D.kisi:
		if not D.kisi[g].aile: continue
		for id in D.kisi[g].ids:
			if not _bitti(str(id)): return false
	return true

func _hepsi(g: String) -> bool:
	return int(duydu.get(g, 0)) >= D.kisi[g].F.size()

func _sahne_acik(g: String) -> bool:
	if D.kisi[g].aile: return D.aile != null and _aile_bitti() and not aile_gordu
	return D.kisi[g].sc != null and not gordu.get(g, false)

func secenek(g: String, por):
	var u := acik(g)
	var h := int(duydu.get(g, 0))
	if h < u:
		return {t = "Hikâyenin devamını anlat" if h > 0 else "Sen bu adaya nasıl geldin?", f = anlat.bind(g, por)}
	if _hepsi(g) and _sahne_acik(g):
		return {t = "O geceyi anlat", f = oynat.bind(g, false)}
	return null

## konuşma penceresi açılırken: kişinin kendi menüsüne hikâye seçeneği eklenir (bir veda seçeneği varsa, son seçenekten önce)
func ekle(kim: String, por, secs: Array) -> Array:
	if not ad_g.has(kim) or oyun.ogr.acik(): return secs
	var g: String = ad_g[kim]
	if not D.kisi.has(g): return secs
	var var_ := false
	for s in secs:
		if s.get("hk", false): return secs
		if BYE.has(str(s.t)): var_ = true
	if not var_: return secs
	var c = secenek(g, por)
	if c == null: return secs
	c.hk = true
	var L := secs.duplicate()
	L.insert(maxi(0, L.size() - 1), c)
	return L

func anlat(g: String, por) -> void:
	var S: Dictionary = D.kisi[g]
	var i := int(duydu.get(g, 0))
	duydu[g] = i + 1
	var h := i + 1
	var daha := h < acik(g)
	var son := _hepsi(g) and _sahne_acik(g)
	var m := _bb(str(S.F[i])) + "\n[color=#c9a0ff][font_size=12]Hikâye %d/%d%s[/font_size][/color]" % [h, S.F.size(), " · tamamlandı" if _hepsi(g) else ""]
	var secs := []
	if daha: secs = [{t = "Devam et", pri = true, hk = true, f = anlat.bind(g, por)}, {t = "Sonra", kapat = true, hk = true}]
	elif son: secs = [{t = "…", pri = true, hk = true, f = func(): oynat.call_deferred(g, false)}]
	else: secs = [{t = "Anladım", pri = true, kapat = true, hk = true}]
	oyun.konusma.ac(str(S.ad), por, m, secs)

# ------------------------------------------------------------------ sahne
func oynat(g: String, again: bool) -> void:
	var aile: bool = D.kisi[g].aile
	var sc = D.aile if aile else D.kisi[g].sc
	if sc == null: return
	cur = {g = g, sahne = "aile" if aile else g, sc = sc, line = 0, t = 0.0, again = again}
	ad_l.text = str(sc.n)
	kat.visible = true
	get_tree().paused = true
	_satir()

func _satir() -> void:
	yazi.text = "[center]" + _bb(str(cur.sc.L[cur.line])) + "[/center]"
	dugme.text = "Devam" if cur.line < cur.sc.L.size() - 1 else "Kapat"
	cur.t = 0.0

func _kare(s: String, i: int, k: int) -> Texture2D:
	var key := "%s_%d_%d" % [s, i, k]
	if not kareler.has(key): kareler[key] = load("res://art/hikaye/%s.png" % key)
	return kareler[key]

func _process(dt: float) -> void:
	if cur == null: return
	cur.t += dt
	var k := mini(int(D.kare) - 1, int(cur.t / float(D.ara)))
	if cur.t > float(D.ara) * int(D.kare) * 2.0: k = int(fmod(cur.t / float(D.ara), 2.0)) + int(D.kare) - 2
	resim.texture = _kare(cur.sahne, int(cur.line), k)

func _unhandled_input(e: InputEvent) -> void:
	if cur == null or not (e is InputEventKey) or not e.pressed or e.echo: return
	get_viewport().set_input_as_handled()
	if e.keycode in [KEY_ENTER, KEY_SPACE, KEY_E]: _ileri()
	elif e.keycode == KEY_ESCAPE: _atla()

## dışına basmak / Esc = sonuna kadar izlemiş say (web skipSc)
func _atla() -> void:
	if cur == null: return
	cur.line = cur.sc.L.size() - 1
	_ileri()

func _ileri() -> void:
	if cur == null: return
	if cur.line < cur.sc.L.size() - 1:
		cur.line += 1
		_satir()
		return
	var g: String = cur.g
	var again: bool = cur.again
	var aile: bool = D.kisi[g].aile
	cur = null
	kat.visible = false
	get_tree().paused = false
	if again: return
	if aile:
		aile_gordu = true
		for x in D.kisi:
			if D.kisi[x].aile: gordu[x] = true
		oyun.env.xp_ekle(int(D.aile.xp))
		oyun.env.mesaj("Elmas Nine: ailenin sırrı çözüldü (Kitap › Ada halkı)")
	else:
		gordu[g] = true
		oyun.env.xp_ekle(40)
		oyun.env.mesaj("%s: hikâye tamamlandı (Kitap › Ada halkı)" % D.kisi[g].lost)
	if sonra.has(g):
		var f: Callable = sonra[g]
		sonra.erase(g)
		f.call_deferred()

var sonra := {}       # sahne kapanınca çağrılacak (Barbaros'un yolculuk teklifi gibi)

## bütün parçaları duymuş say ve sahneyi oynat (web __plStory.first)
func ilk(g: String, ardindan: Callable = Callable()) -> void:
	duydu[g] = D.kisi[g].F.size()
	if ardindan.is_valid(): sonra[g] = ardindan
	oynat(g, false)

# ------------------------------------------------------------------ Kitap › Ada halkı
func sayi() -> int:
	var n := 0
	for g in D.kisi:
		if int(duydu.get(g, 0)) > 0: n += 1
	return n

func liste_yaz(liste: VBoxContainer) -> void:
	var not_ := Label.new()
	not_.text = "Adadaki herkes buraya mor ışık yüzünden geldi ve ışık her birinden birini aldı. Görevlerini yaptıkça hikâyelerini anlatırlar; hepsini bitirince o geceyi görürsün."
	not_.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; not_.custom_minimum_size = Vector2(560, 0)
	not_.add_theme_font_size_override("font_size", 11); not_.add_theme_color_override("font_color", Color("#b8b098"))
	liste.add_child(not_)
	for g in D.kisi:
		var S: Dictionary = D.kisi[g]
		var h := int(duydu.get(g, 0))
		var r := RichTextLabel.new(); r.bbcode_enabled = true; r.fit_content = true; r.custom_minimum_size = Vector2(560, 0)
		r.add_theme_font_size_override("normal_font_size", 12)
		if h == 0:
			r.text = "[color=#8a8a7a][b]%s[/b]\nGörevlerini yaptıkça sana bu adaya nasıl geldiğini anlatır (%d parça).[/color]" % [S.ad, S.F.size()]
			liste.add_child(r)
			continue
		var parca := []
		for i in h: parca.append(_bb(str(S.F[i])))
		r.text = "[b]%s[/b] [color=#c9a0ff]· %s · %d/%d[/color]\n%s" % [S.ad, S.lost, h, S.F.size(), "\n".join(parca)]
		liste.add_child(r)
		if (aile_gordu if S.aile else gordu.get(g, false)):
			var b := Button.new(); b.text = "Sahneyi yeniden izle"; b.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
			b.pressed.connect(func():
				oyun.el_yapimi.kapat()
				oynat(g, true))
			liste.add_child(b)
	if oyun.sise != null: oyun.sise.liste_yaz(liste)

func kayit() -> Dictionary:
	return {h = duydu, s = gordu.keys(), aile = aile_gordu}

func yukle(d: Dictionary) -> void:
	duydu = {}
	var h: Dictionary = d.get("h", {})
	for k in h: duydu[k] = int(h[k])
	gordu = {}
	for k in d.get("s", []): gordu[k] = true
	aile_gordu = bool(d.get("aile", false))
