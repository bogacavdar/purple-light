extends Node
## Kıyıya vuran şişeler (web v368sise; belge Sistemler › İzler ve anılar › Kıyıya vuran şişeler).
## Fırtına dinince %60 ihtimalle oyuncunun 10–32 kare çevresinde denize değen bir kum karesine bir Şişedeki mektup vurur
## (yeri gösterilmez). Kıyıda bir şişe dururken (en çok 2 gün) yenisi gelmez. Alınınca mektup hemen okunur, çantada kalmaz;
## dokuz mektup, her biri bir kez, Kitap › Ada halkı'nın altında saklanır. Arenada şişe gelmez.

const N := "Şişedeki mektup"
const LET := [
	["kemal", "Yaşlı Kemal", "Saliha", ["Saliha'm, bu sabah da kumsalı yürüdüm. Ayak izlerin yok, ama ben yine senin yanından yürür gibi yürüyorum.", "Çayı hâlâ iki bardak koyuyorum; biri hep soğuyor. Işık seni nereye götürdüyse, orada da sabah olsun."], "Kemal"],
	["zumrut", "Cadı Zümrüt", "Ayşen", ["Ayşen, kazanı her akşam senin sevdiğin otla tütsülüyorum; kokusunu duyarsın diye.", "Tariflerin yarısını hâlâ senin el yazından okuyorum. Bir gün dönersen kazan ikimize de yeter."], "Ablan Zümrüt"],
	["nazli", "Pazarcı Nazlı", "Cem", ["Cem, tezgâhta senin köşen hâlâ boş; kimseye vermiyorum.", "Müşteriler \"kardeşin nerede\" diye sorunca \"pazara gitti\" diyorum. Çabuk dön; pazarlığı sensiz beceremiyorum."], "Nazlı"],
	["boru", "Savaşçı Börü", "Kaan", ["Ağabey, ilk gecemde sen yoktun; ateşi kendim yaktım.", "O günden beri her gece yakıyorum. Belki dumanını görürsün, belki ışığı seni bırakır da yolunu bulursun."], "Börü"],
	["demir", "Demirci Dursun ve Zırhçı Durmuş", "Demirhan Usta", ["Baba, örsün başında hâlâ senin çekicinin izi var.", "Dursun demiri, Durmuş zırhı dövüyor; ikimiz bir sen etmiyoruz ama çalışıyoruz. Körük her soluduğunda seni duyar gibiyiz."], "Oğulların Dursun ve Durmuş"],
	["sinan", "Usta Sinan", "Zeynep", ["Zeynep'im, sana bir ev yapıyorum. Pencereleri denize bakıyor, kapısı hep açık.", "Her çiviyi çakarken \"bunu o beğenir mi\" diye soruyorum. Gel de bir kere otur içinde."], "Baban"],
	["dogan", "Avcı Doğan", "Ayaz", ["Ayaz, izini her yerde arıyorum: bataklıkta, kayalarda, karda.", "Avcı babanın bulamadığı tek iz seninki. Ama ben izi bırakmam; sen de beni bırakma."], "Baban Doğan"],
	["barbaros", "Denizci Barbaros", "Meltem", ["Meltem, kendime yeni bir gemi yapacağıma söz verdim.", "Rüzgâr senden yana eserse bu şişe seni bulur. Bulamazsa da dalgalar adını öğrensin diye her sabah denize söylüyorum."], "Baban Barbaros"],
	["elmas", "Zümrüt, Dursun, Durmuş ve kuzenleri", "Elmas Nine", ["Nine, on sekiz ocaktan duman yükseliyor artık.", "Hangisine bakarsan bak, başında bir torunun bekliyor. Gör bizi."], "Torunların"]]

var oyun
var bulunan := {}
var out := -1          # şişenin kıyıya vurduğu gün
var onceki := ""
var _t := 0.0

func kur(o) -> void:
	oyun = o
	# şişenin resmi (web: yeşil cam, mantar tıpa, içinde kâğıt)
	var im := Image.create(16, 16, false, Image.FORMAT_RGBA8)
	var R := func(x: int, y: int, w: int, h: int, c: Color):
		for yy in h:
			for xx in w: im.set_pixel(x + xx, y + yy, c)
	R.call(4, 6, 9, 6, Color("#1a3a2a")); R.call(5, 5, 7, 8, Color("#2e6a4a")); R.call(6, 6, 5, 6, Color("#4a9a6a")); R.call(13, 8, 2, 2, Color("#2e6a4a"))
	R.call(14, 7, 2, 4, Color("#8a6a40")); R.call(6, 7, 4, 1, Color("#f0e8d0")); R.call(6, 9, 5, 1, Color("#e8dcc0")); R.call(7, 6, 1, 1, Color("#bfe8d0"))
	o.env.ikon[N] = ImageTexture.create_from_image(im)
	if not o.env.G.items.has(N): o.env.G.items[N] = {food = 0, heal = 0, file = ""}

func _kalan() -> Array:
	return LET.filter(func(l): return not bulunan.has(l[0]))

func _kiyi():
	var P: Vector2 = oyun.oyuncu.position
	for k in 500:
		var a := randf() * TAU
		var r := 10.0 + randf() * 22.0
		var q := Vector2(roundf(P.x / 16.0 + cos(a) * r) * 16.0 + 8.0, roundf(P.y / 16.0 + sin(a) * r) * 16.0 + 8.0)
		if oyun.tile_at(q) != 2: continue
		var deniz := false
		for d in [Vector2(16, 0), Vector2(-16, 0), Vector2(0, 16), Vector2(0, -16)]:
			if oyun.tile_at(q + d) == 4: deniz = true
		if deniz and not oyun.engel(q): return q
	return null

func _vur() -> void:
	if _kalan().is_empty(): return
	var p = _kiyi()
	if p == null: return
	oyun.toplama.dusur(N, p, 1)
	# kıyıdaki şişe kaybolmasın (yerde en çok 2 gün durur)
	var d = oyun.toplama.dusenler.back()
	d.sise = true
	out = oyun.zaman.gun
	get_tree().create_timer(0.6).timeout.connect(func(): oyun.env.mesaj("Fırtına dindi. Dalgalar kıyıya bir şeyler bırakmış olabilir."))

func _oku() -> void:
	var L := _kalan()
	if L.is_empty(): return
	var l: Array = L[randi() % L.size()]
	bulunan[l[0]] = true
	out = -1
	var sayfalar: Array = ["[i]Şişenin içinde, tuzdan kabarmış bir kâğıt. Mürekkep yer yer akmış. Üstünde tek bir ad var: \"%s\".[/i]" % l[2]]
	sayfalar.append_array(l[3])
	sayfalar.append("— %s\n[i]Bu mektup hiç ulaşmamış. Katlayıp saklarsın (Kitap › Ada halkı).[/i]" % l[4])
	_sayfa(sayfalar, 0)

func _por() -> Texture2D:
	var at := AtlasTexture.new()
	at.atlas = Karakter.sayfa(oyun.gorunus)
	at.region = Rect2(0, 0, 26, 22)
	return at

func _sayfa(S: Array, i: int) -> void:
	var son := i == S.size() - 1
	oyun.konusma.ac("Kıyıya vuran mektup", _por(), str(S[i]), [{t = "Sakla" if son else "Devam", pri = true, f = func():
		if son:
			if _kalan().is_empty(): get_tree().create_timer(0.5).timeout.connect(func(): oyun.env.mesaj("Kıyıya vuran bütün mektupları buldun."))
		else:
			_sayfa.call_deferred(S, i + 1)}])

func _process(dt: float) -> void:
	if oyun == null or oyun.hava == null or not oyun.hava.canli(): return
	_t -= dt
	if _t > 0.0: return
	_t = 0.4
	var env = oyun.env
	if env.adet(N) > 0 and not oyun.konusma.visible and not oyun.zaman.durdu():
		env.eksilt(N)
		_oku()
		return
	var k: String = oyun.hava.k
	if onceki == "fırtına" and k != "fırtına" and not get_tree().paused and (out < 0 or oyun.zaman.gun - out >= 2) and randf() < 0.6: _vur()
	onceki = k

## Kitap › Ada halkı'nın altına okunan mektuplar
func liste_yaz(liste: VBoxContainer) -> void:
	var F := LET.filter(func(l): return bulunan.has(l[0]))
	if F.is_empty(): return
	var b := Label.new()
	b.text = "Kıyıya vuran mektuplar %d/%d" % [F.size(), LET.size()]
	b.add_theme_font_size_override("font_size", 15)
	liste.add_child(b)
	for l in F:
		var t := RichTextLabel.new()
		t.bbcode_enabled = true
		t.fit_content = true
		t.scroll_active = false
		t.custom_minimum_size = Vector2(560, 0)
		t.add_theme_font_size_override("normal_font_size", 11)
		t.add_theme_font_size_override("bold_font_size", 12)
		t.text = "[b]%s → %s[/b]\n%s\n[i]— %s[/i]" % [l[1], l[2], "\n".join(l[3]), l[4]]
		liste.add_child(t)

func kayit() -> Dictionary:
	return {f = bulunan.keys(), o = out}

func yukle(d) -> void:
	bulunan = {}; out = -1; onceki = ""
	if typeof(d) != TYPE_DICTIONARY: return
	for k in d.get("f", []): bulunan[str(k)] = true
	out = int(d.get("o", -1))
