## Öğretici (web v3.9x tz 1–13: tzStart, tzCard, tzTick, tzAte, tzLearned, tzMade, tzSold, tzAlpDone, AXE_STEPS, v62-axe, tzSkip).
## Kemal'in uyanış konuşmasından sonra başlar. Sürerken görev "!"leri ve kartı gizlidir; sağ üstte öğretici kartı ve sarı ok yol gösterir.
extends Node

var oyun
var env
var tz := 0
var yenen := 0
var ftut := 0          # 2: Börü'nün yumruk dersi (kerevite vur), 3: yumruk dersi bitti
var axe := 0           # Taş balta parçalarında hangi adım (web axeStep)
var balta_tut := false # Dursun baltayı dövdü: baltayı eline al
var yengec = null
var t := 0.0
var kart: PanelContainer
var kart_por: TextureRect
var kart_baslik: Label
var kart_yazi: RichTextLabel
var kart_gec: Button

const TZN := ["", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz", "on"]
const AXE := [
	["Keskin taş", 1, "Börü · Önce keskin taş", "Sopa için önce [b]1 keskin taş[/b] yap: [b]Tab[/b] → Keskin taş (2 taş)."],
	["Sopa", 1, "Börü · Şimdi sopa", "Keskin taş hazır! Şimdi [b]sopa[/b]: 2 dal + 1 keskin taş + 1 lif. [b]Tab[/b] → Sopa."],
	["Keskin taş", 2, "Börü · Baltanın ağzı", "Sopa tamam. Baltanın ağzı için [b]2 keskin taş daha[/b] yap."],
	["İp", 2, "Börü · Şimdi ip", "Şimdi [b]ip[/b]: her biri 3 lif. [b]2 ip[/b] yap; lifleri Börü yanına bıraktı."],
	["Taş", 2, "Börü · Son parça: iki taş", "Son olarak baltanın gövdesi için [b]2 taş[/b] topla ve öyle kalsın: bunları keskin taşa [b]çevirme[/b]!"]]
const AXE_DONE := ["Keskin taş hazır. Şimdi sopayı yap!", "Sopa tamam! Şimdi baltanın ağzı için 2 keskin taş daha.", "Ağız hazır. Şimdi 2 ip.", "İpler tamam. Son olarak 2 taş topla.", "Bütün parçalar hazır! Demirci Dursun'a götür."]

func kur(o) -> void:
	oyun = o
	env = o.env
	kart = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.09, 0.07, 0.92); st.border_color = Color("#f2c94c"); st.set_border_width_all(2)
	st.set_content_margin_all(8)
	kart.add_theme_stylebox_override("panel", st)
	kart.custom_minimum_size = Vector2(330, 0)
	var v := VBoxContainer.new()
	var h := HBoxContainer.new()
	kart_por = TextureRect.new(); kart_por.custom_minimum_size = Vector2(36, 36)
	kart_por.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; kart_por.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	kart_por.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kart_baslik = Label.new(); kart_baslik.add_theme_font_size_override("font_size", 14); kart_baslik.add_theme_color_override("font_color", Color("#f2c94c"))
	kart_baslik.size_flags_horizontal = Control.SIZE_EXPAND_FILL; kart_baslik.autowrap_mode = TextServer.AUTOWRAP_WORD
	h.add_child(kart_por); h.add_child(kart_baslik)
	kart_yazi = RichTextLabel.new(); kart_yazi.bbcode_enabled = true; kart_yazi.fit_content = true; kart_yazi.scroll_active = false
	kart_yazi.add_theme_font_size_override("normal_font_size", 13); kart_yazi.add_theme_font_size_override("bold_font_size", 13)
	kart_gec = Button.new(); kart_gec.text = "Eğitimi geç"; kart_gec.size_flags_horizontal = Control.SIZE_SHRINK_END
	kart_gec.add_theme_font_size_override("font_size", 12)
	kart_gec.pressed.connect(gec_sor)
	v.add_child(h); v.add_child(kart_yazi); v.add_child(kart_gec)
	kart.add_child(v)
	oyun.hud.add_child(kart)
	kart.anchor_left = 1.0; kart.anchor_right = 1.0
	kart.offset_left = -340.0; kart.offset_right = -10.0; kart.offset_top = 34.0
	kart.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	kart.visible = false

func acik() -> bool:
	return tz > 0

# ------------------------------------------------------------------ kişiler, konuşma
func _kisi(k: String):
	for n in oyun.kisiler:
		if n.K.k == k: return n
	return null

func _por(k: String):
	var n = _kisi(k)
	if n == null or n.K.get("portre", null) == null: return null
	return load(n.K.portre)

func soyle(k: String, metin: String, secs: Array = []) -> void:
	var n = _kisi(k)
	oyun.konusma.ac(n.K.ad if n else "", _por(k), metin, secs)

func _kemal_ev() -> Vector2:
	var K: Dictionary = oyun.toplama_veri.kisiler[0]
	return Vector2(K.x, K.y)

func _kazan() -> Vector2:
	var I: Dictionary = oyun.toplama_veri.istasyon
	return Vector2(I.kazan.x, I.kazan.y)

# ------------------------------------------------------------------ yere malzeme koyma (yalnız eksik olan: adım toplamı − çantadaki − yakında duran)
func _yakin(n: String, c: Vector2) -> int:
	var k := 0
	for d in oyun.dugumler:
		if d.canli and d.ad == n and (d.position.distance_to(c) < 200.0 or d.position.distance_to(oyun.oyuncu.position) < 200.0): k += 1
	return k

func _eksik(n: String, top: int, c: Vector2) -> int:
	return maxi(0, top - env.adet(n) - _yakin(n, c))

func _koy(n: String, top: int, c: Vector2) -> int:
	var m := _eksik(n, top, c)
	var k := 0
	for i in 400:
		if k >= m: break
		var a := randf() * TAU
		var d := 34.0 + randf() * 70.0
		var p := c + Vector2(cos(a), sin(a)) * d
		var tl: int = oyun.tile_at(p)
		if tl < 0 or tl > (2 if n == "Kum" else 1) or oyun.engel(p, 6.0): continue
		if _dolu(p): continue
		oyun.dugum_ekle(n, p)
		k += 1
	return k

func _dolu(p: Vector2) -> bool:
	for o in oyun.dugumler:
		if o.canli and o.position.distance_to(p) < 12.0: return true
	for ag in oyun.agaclar:
		if is_instance_valid(ag) and ag.visible and ag.position.distance_to(p) < 12.0: return true
	return false

func _liste(L: Array) -> String:
	var a := []
	for x in L:
		if int(x[1]) > 0:
			a.append("%s %s" % [TZN[int(x[1])] if int(x[1]) < TZN.size() else str(x[1]), str(x[0]).to_lower()])
	if a.size() < 2: return a[0] if a.size() == 1 else ""
	return ", ".join(a.slice(0, a.size() - 1)) + " ve " + a[a.size() - 1]

## web tzBush: Kemal'in yanında tek çalı, üç böğürtlen
func _cali() -> void:
	var c := _kemal_ev() + Vector2(0, 10)
	var en = null
	var bd := 1e9
	for d in oyun.dugumler:
		if d.canli and d.ad == "Böğürtlen":
			var dd: float = d.position.distance_to(c)
			if dd < bd:
				bd = dd
				en = d
	if en != null and bd < 110.0:
		en.kalan = 3
		return
	_koy("Böğürtlen", 1, c)

# ------------------------------------------------------------------ başlangıç, adımın istedikleri, ok
func basla() -> void:
	tz = 1; yenen = 0; ftut = 0; axe = 0; balta_tut = false
	_cali()
	ciz()

func gerek() -> Array:
	var h := func(n: String) -> int: return env.adet(n)
	if tz == 1: return ["Böğürtlen"] if h.call("Böğürtlen") + yenen < 3 else []
	if tz == 4 or tz == 5:
		if tz == 4 and oyun.el_yapimi.bilinen.has("Kaba meşale"): return []
		var L := []
		for n in ["Dal", "Lif", "Yaprak"]:
			if h.call(n) < 2: L.append(n)
		return L
	if tz == 6: return ["Taş"] if h.call("Taş") < 4 else []
	if tz == 12:
		var L2 := []
		var ks: int = h.call("Keskin taş"); var ip: int = h.call("İp"); var so: int = h.call("Sopa")
		var need_ks := 2 + (0 if so > 0 else 2)
		var need_tas := 2 + maxi(0, need_ks - ks) * 2
		if so == 0 and h.call("Dal") < 3: L2.append("Dal")
		if ip < 2 and h.call("Lif") < (2 - ip) * 4: L2.append("Lif")
		if h.call("Taş") < need_tas: L2.append("Taş")
		return L2
	return []

## okun gösterdiği yer (Vector2.INF: ok yok)
func hedef() -> Vector2:
	if tz == 0: return Vector2.INF
	var need := gerek()
	if not need.is_empty():
		var bd := 1e9
		var p := Vector2.INF
		for d in oyun.dugumler:
			if d.canli and need.has(d.ad):
				var dd: float = d.position.distance_to(oyun.oyuncu.position)
				if dd < bd:
					bd = dd
					p = d.position
		return p
	var k := ""
	match tz:
		3, 4, 7: return _kazan()
		9, 10: k = "market"
		11: k = "" if ftut == 2 else "alp"
		13: k = "" if balta_tut else "smith"
	if k == "": return Vector2.INF
	var n = _kisi(k)
	return n.position if n else Vector2.INF

# ------------------------------------------------------------------ kart
func _kart() -> Array:
	var c := func(n: String, q: int) -> String: return "%s %d/%d" % [n, mini(env.adet(n), q), q]
	match tz:
		1: return ["ekin", "Kemal · Önce karnını doyur", "Bu adada en önemli şey [b]yemek[/b]. Tokluk çubuğun (turuncu) sıfıra inerse canın hızla tükenir. Şu çalıdan [b]3 böğürtlen[/b] topla ve [b]üçünü de ye[/b]: çalının yanında [b]F[/b]; düşen meyvenin üstünden yürü. Yemek için [b]X[/b]. [b]Toplanan %d/3 · Yenen %d/3[/b]" % [mini(3, env.adet("Böğürtlen") + yenen), mini(3, yenen)]]
		2: return ["ekin", "Kemal · Ye", "Şimdi ye: [b]X[/b] tuşuna bas. Üçünü de ye. (Yenen %d/3)" % mini(3, yenen)]
		3: return ["ekin", "Kemal · Cadı Zümrüt", "Karnın doydu. Şimdi kuzeydeki ormanın kıyısında yaşayan [b]Cadı Zümrüt[/b]'e git; ok yolu gösteriyor. Bu adada bir şey yapmayı ondan öğrenirsin."]
		4: return ["witch", "Zümrüt · İlk tarif: Kaba meşale", "Kazan bir şey [b]yapmaz[/b], sana [b]tarif öğretir[/b]. Yanımdaki dal, lif ve yaprakları topla: %s · %s · %s. Sonra kazanı aç (yanında [b]F[/b]), soldan [b]Kaba meşale[/b]'yi seç ve [b]Tarifi öğren[/b]'e bas." % [c.call("Dal", 2), c.call("Lif", 2), c.call("Yaprak", 2)]]
		5: return ["witch", "Zümrüt · Elinle yap", "Tarif artık senin, ama o malzemeler tarifi açmaya gitti. [b]Aynılarını[/b] yeniden topla (%s · %s · %s) ve el yapımı ekranında meşaleyi yap: [b]Tab[/b] tuşuna bas." % [c.call("Dal", 2), c.call("Lif", 2), c.call("Yaprak", 2)]]
		6: return ["witch", "Zümrüt · Taşlar", "Şimdi kazanın yanındaki [b]4 taşı[/b] topla. (%s)" % c.call("Taş", 4)]
		7: return ["witch", "Zümrüt · Keskin taş tarifi", "Kazanı aç, [b]Keskin taş[/b]'ı seç, 2 taşı koy ve [b]Tarifi öğren[/b]. Öğrendiğin tarifler artık hep senin; bir tarifi iki kez öğrenemezsin."]
		8: return ["witch", "Zümrüt · Keskin taş yap", "Kalan 2 taşla bir [b]keskin taş[/b] yap: [b]Tab[/b] tuşuna bas. Kazandan bir tarif öğrendin mi, gerisi hep elinde."]
		9: return ["witch", "Zümrüt · Pazarcı Nazlı'ya git", "Keskin taşı al ve kuzeydoğudaki [b]Pazarcı Nazlı[/b]'ya git; ok yolu gösteriyor. Birleştirdiğin şeyleri o alır."]
		10: return ["market", "Nazlı · Sat", "Satış listesinde [b]Keskin taş[/b]'ın yanındaki [b]Sat[/b] düğmesine bas."]
		11:
			if oyun.ders.acik:
				if oyun.ders.mod == "parry": return ["alp", "Börü · Savuşturma", "Kerevit atıldığında, sana değmeden hemen önce [b]savuştur[/b]: [b]sağ tık[/b] ya da [b]E[/b]. Doğru anda yaparsan kerevit sersemler. (%d/4)" % oyun.ders.n]
				return ["alp", "Börü · Atılma", "Kerevitin başında kırmızı [b]![/b] belirince yana [b]atıl[/b]: [b]Boşluk[/b]. (%d/4)" % oyun.ders.n]
			if oyun.ders.agac_bekliyor(): return ["alp", "Börü · Yetenek ağacı", "Yetenek ağacını aç: [b]Y[/b] tuşuna bas. En alttaki yanıp sönen [b]Koşu[/b]'ya bak; sonra pencereyi kapat."]
			if ftut == 2: return ["alp", "Börü · Kereviti vur", "[b]Yürü:[/b] [b]WASD[/b] ya da oklarla kerevite yaklaş. [b]Vur:[/b] [b]sol tık[/b]: tıkladığın yöne vurursun. Canı bitene kadar vur."]
			if ftut == 3: return ["alp", "Börü · Kaçmayı öğren", "Börü'nün yanına git ve onunla konuş ([b]F[/b]): kaçmayı öğretecek."]
			return ["market", "Savaşçı Börü", "Nazlı seni doğudaki [b]Savaşçı Börü[/b]'ye yolladı. Ok yolu gösteriyor; yanına git ve [b]F[/b] ile konuş."]
		12:
			if axe < AXE.size():
				var S: Array = AXE[axe]
				return ["alp", S[2], "%s (%s %d/%d)" % [S[3], S[0], mini(env.adet(S[0]), int(S[1])), int(S[1])]]
		13:
			if balta_tut:
				var i: int = env.kemer.find("Taş balta")
				var tx := "Balta elinde!" if env.elde() == "Taş balta" else ("Baltan çantanda; kemerde boş yuva aç." if i < 0 else "Şimdi baltayı eline al: [b]%d[/b] tuşuna bas." % (i + 1))
				return ["smith", "Dursun · Baltayı eline al", tx]
			return ["alp", "Demirci Dursun", "Parçalar hazır! Kuzeydeki [b]Demirci Dursun[/b]'a git (ok yolu gösteriyor) ve yanında [b]F[/b]'ye bas. Örste [b]Taş balta[/b] seçili gelir: [b]Döv[/b]'e bas."]
	return []

func ciz() -> void:
	var C := _kart()
	if tz == 0 or C.is_empty() or oyun.sahne.acik:
		kart.visible = false
		return
	kart.visible = true
	kart_por.texture = _por(C[0])
	kart_por.visible = kart_por.texture != null
	kart_baslik.text = C[1]
	kart_yazi.text = C[2]

# ------------------------------------------------------------------ kendiliğinden ilerleme (web tzTick, axeTick, v62)
func _process(dt: float) -> void:
	if tz == 0:
		kart.visible = false
		return
	t += dt
	if fmod(t, 0.25) >= dt: return
	var h := func(n: String) -> int: return env.adet(n)
	if tz == 1 and h.call("Böğürtlen") + yenen >= 3:
		tz = 2
	if tz == 2 and h.call("Böğürtlen") == 0 and yenen < 3:
		var yiyecek := false
		for n in env.inv:
			if env.adet(n) > 0 and env.G.items.has(n) and float(env.G.items[n].food) > 0: yiyecek = true
		if not yiyecek:
			tz = 1; _cali()
	if tz == 6 and h.call("Taş") >= 4:
		tz = 7
		env.mesaj("Taşlar tamam. Şimdi kazana: Keskin taş tarifini öğren.")
	_balta()
	if tz == 11 and ftut == 2 and (yengec == null or not is_instance_valid(yengec)) and fmod(t, 2.0) < dt:
		_yengec()
	if tz == 13 and balta_tut and env.elde() == "Taş balta":
		balta_tut = false
		env.mesaj("Balta elinde · Şimdi Kemal'e dön")
		_bitir()
		return
	ciz()

func _balta_adim() -> int:
	var h := func(n: String) -> int: return env.adet(n)
	if h.call("Sopa") < 1: return 0 if h.call("Keskin taş") < 1 else 1
	if h.call("Keskin taş") < 2: return 2
	if h.call("İp") < 2: return 3
	if h.call("Taş") < 2: return 4
	return 5

func _balta() -> void:
	if tz == 13 and not balta_tut and env.adet("Taş balta") == 0 and _balta_adim() < 5:
		tz = 12; axe = _balta_adim()
		env.mesaj("Baltanın parçalarından biri eksildi. Börü'nün listesine bak: eksik olanı tamamla.", true)
		return
	if tz != 12: return
	var k := _balta_adim()
	if k == axe: return
	var once := axe
	axe = k
	if k >= AXE.size():
		tz = 13
		env.mesaj("Parçalar hazır · Demirci Dursun'a git")
		return
	if k > once: env.mesaj("Börü: “%s”" % AXE_DONE[k - 1])
	else: env.mesaj("%s · Bir parça eksildi, ona dön" % str(AXE[k][2]).replace("Börü · ", ""), true)

# ------------------------------------------------------------------ olaylar
func yedi(n: String) -> void:
	if tz == 0 or n != "Böğürtlen": return
	yenen += 1
	if tz == 2 and yenen >= 3:
		tz = 3
		await get_tree().create_timer(0.5).timeout
		soyle("ekin", "Aferin evlat! Gördün mü, ada cömerttir; ama gözünü açık tutacaksın. Ormanda meyve ağaçları, çalılarda yemişler, toprakta kökler var.\n\nŞimdi kuzeye, ormanın kıyısına git: orada [b]Cadı Zümrüt[/b] yaşar. Bu adada bir şey yapmanın yolunu o öğretir. Ok yolu gösteriyor.", [{t = "Zümrüt'e gidiyorum", pri = true, kapat = true}])
	ciz()

func ogrendi(r: String) -> void:
	if tz == 4 and r == "Kaba meşale":
		tz = 5
		oyun.istasyon.pencere.visible = false
		var L := []
		for n in ["Dal", "Lif", "Yaprak"]: L.append([n, _koy(n, 2, _kazan())])
		var tt := _liste(L)
		soyle("witch", "İşte! [b]Kaba meşale[/b] tarifini öğrendin. Bundan sonra malzemelerin olduğunda [b]Tab[/b]'a basarak her yerde meşale yapabilirsin. Kazana koyduğun dal, lif ve yapraklar tarifi açmaya gitti; meşale için [b]aynılarını[/b] yeniden topla. %s" % ("Yakına " + tt + " bıraktım." if tt != "" else "Gerekenler zaten sende ya da yakında."), [{t = "Topluyorum", pri = true, kapat = true}])
	elif tz == 7 and r == "Keskin taş":
		tz = 8
		oyun.istasyon.pencere.visible = false
		soyle("witch", "Keskin taş da kitabında! Şimdi kalan iki taşla [b]Tab[/b]'a bas ve bir [b]keskin taş[/b] yap.", [{t = "Tamam", pri = true, kapat = true}])
	ciz()

func yapti(r: String) -> void:
	if tz == 5 and r == "Kaba meşale":
		tz = 6
		oyun.el_yapimi.pencere.visible = false
		_koy("Taş", 4, _kazan())
		soyle("witch", "İlk meşalen! Kulağını aç evlat: bu adada [b]geceler zifiri karanlıktır[/b] ve karanlıkta bir şey dolaşır. Gece gelmeden elinde bir meşale olsun. Meşalen kemerin solundaki [b]meşale yuvasında[/b]; [b]1[/b]'in solundaki tuşla yakar, söndürürsün. Neyse ki ada halkı her gece [b]ateş yakar[/b]; ateşin yanı güvenlidir. Meşalen yoksa ve geceye yakalanırsan, biri sana yardım eder… ama buna güvenme.\n\nŞimdi kazanın yanındaki [b]dört taşı[/b] topla.", [{t = "Taşları toplayayım", pri = true, kapat = true}])
	elif tz == 8 and r == "Keskin taş":
		tz = 9
		oyun.el_yapimi.pencere.visible = false
		soyle("witch", "Gördün mü? İki çıplak taş bir keskin taş oldu, değeri de katlandı. Topladığın şeyleri birleştire birleştire çok zengin olabilirsin. Kuzeydoğuda [b]Pazarcı Nazlı[/b]'nın tezgâhı var; o böyle şeylerle ilgilenir. Keskin taşını ona götür, bir uğra.", [{t = "Nazlı'ya gidiyorum", pri = true, kapat = true}])
	ciz()

func satti(adlar: Array) -> void:
	if tz == 10 and (adlar.has("Keskin taş") or env.adet("Keskin taş") == 0):
		tz = 11
		await get_tree().create_timer(0.7).timeout
		oyun.pazar.pencere.visible = false
		soyle("market", "Hah! Hesabı göstereyim: bir [b]taş[/b] bana [b]1 Vio[/b] eder, iki taş 2 Vio. Ama sen o iki taşı [b]birleştirip[/b] keskin taş yaptın; keskin taş [b]3 Vio[/b] eder. Aradaki 1 Vio senin emeğin! Kural hep böyle: yaptığın şeyleri de yeniden birleştirdikçe değerleri [b]katlanır[/b]. Taştan keskin taş, keskin taştan alet… Her adımda daha çok para eder.\n\nAma dinle beni: bu adada [b]geceler sert geçer[/b]. Domuzlar, kurtlar… [b]Çıplak ellerle[/b] hayatta kalamazsın. Doğuda [b]Savaşçı Börü[/b] var, git ona; sana kendini korumayı öğretsin.", [{t = "Börü'ye gidiyorum", pri = true, kapat = true}])
	ciz()

func dovuldu(r: String) -> void:
	if tz == 13 and r == "Taş balta":
		await get_tree().create_timer(0.6).timeout
		oyun.istasyon.pencere.visible = false
		balta_tut = true
		var i: int = env.kemer.find("Taş balta")
		soyle("smith", "İşte baltan! Taş balta [b]Çayır'ın ve Orman'ın[/b] ağaçlarını keser; Bataklık'ın ağaçları için daha iyi bir balta gerekir. Her vuruşta biraz körelir, çubuğu kırmızıya dönünce bana getir, bilerim. Kırılırsa ya da kaybolursa parçalarını getir, yenisini döveriz; işçiliğini ödersin. Balta şimdi kemerinde: %s Hadi, önce baltayı eline al; sonra [b]Kemal[/b]'e dön." % ("[b]%d[/b] tuşuna basınca eline gelir." % (i + 1) if i >= 0 else "kemerde yer açınca eline alırsın."), [{t = "Baltayı elime alayım", pri = true, kapat = true}])
		ciz()

## web tzFinish: öğretici biter, görevler Kemal'den başlar
func _bitir() -> void:
	tz = 0
	kart.visible = false
	oyun.gorev.yenile()

# ------------------------------------------------------------------ Börü: yumruk dersi, sonra atılma, savuşturma, yetenek ağacı (web talkAlp, v181 tzAlpDone)
func _yengec() -> void:
	if yengec != null and is_instance_valid(yengec): yengec.queue_free()
	var P: Vector2 = oyun.oyuncu.position
	for k in 60:
		var an := PI * (1.1 + randf() * 0.8)
		var d := 36.0 + randf() * 26.0
		var p := P + Vector2(cos(an), sin(an)) * d
		var tl: int = oyun.tile_at(p)
		if tl < 0 or tl > 2 or oyun.engel(p, 5.0): continue
		yengec = oyun._canli_yeni("Kerevit", p, 0)
		yengec.ogr = true
		yengec.set_meta("ders", true)
		return

func yengec_oldu() -> void:
	if tz != 11 or ftut != 2: return
	ftut = 3
	await get_tree().create_timer(0.7).timeout
	_kacmayi_ogret()

func _kacmayi_ogret() -> void:
	soyle("alp", "Yumruk fena değil! Şimdi daha önemlisi: [b]kaçmayı[/b] öğren. Şu yeni kereviti görüyor musun? Bu ısırmaz ama saldırır. Üstünde kırmızı bir [b]![/b] belirince yana [b]atıl[/b]. Bu dersim benden, ücretsiz.", [{t = "Hazırım", pri = true, f = func(): oyun.ders.basla("dodge", false, _alp_bitti)}])

func _alp_bitti() -> void:
	tz = 12; ftut = 3
	for r in ["Taş balta", "Sopa", "İp"]: oyun.el_yapimi.bilinen[r] = true
	env.ekle("Taş", 6)
	var alp = _kisi("alp")
	var c: Vector2 = alp.position if alp else oyun.oyuncu.position
	var so0: bool = env.adet("Sopa") > 0
	var ip0: int = mini(2, env.adet("İp"))
	var ks0: int = env.adet("Keskin taş")
	var need_ks0 := 2 + (0 if so0 else 1)
	var B := [["Dal", _koy("Dal", 0 if so0 else 2, c)], ["Lif", _koy("Lif", (2 - ip0) * 3 + (0 if so0 else 1), c)], ["Taş", _koy("Taş", 2 + maxi(0, need_ks0 - ks0) * 2, c)]]
	var bt := _liste(B)
	axe = _balta_adim()
	ciz()
	soyle("alp", "Aferin! Artık atılmayı biliyorsun, Koşu'nun yerini de gördün. Şimdi işe yarar bir şey yapalım.", [{t = "Anladım", pri = true, f = _alp_bitti2.bind(bt)}])

func _alp_bitti2(bt: String) -> void:
	soyle("alp", "Şimdi bir [b]Taş balta[/b] yapacağız; tarifini sana veriyorum. Parçaları [b]teker teker[/b] yapalım: önce sopa için 1 keskin taş, sonra sopa, sonra baltanın ağzı için 2 keskin taş daha, en son 2 ip. %sal, şu altı taş da benden. Hepsi bitince [b]Demirci Dursun[/b] döver." % ("Yanına " + bt + " bıraktım; " if bt != "" else "Gerisi zaten sende ya da yakında; "), [{t = "Başlayalım", pri = true, kapat = true}])

## öğretici sürerken kişilerin sözü (true: konuşma burada bitti)
func konus(k: String) -> bool:
	if tz == 0: return false
	match k:
		"ekin":
			var C := _kart()
			if C.is_empty(): return false
			soyle("ekin", C[2], [{t = "Tamam", pri = true, kapat = true}])
			return true
		"witch":
			if tz == 3:
				soyle("witch", "Ooo, bak sen! Kemal'in kumsalda bulduğu kazazede. Gel gel, ısın biraz; kazanımın buharı iyi gelir. Ben [b]Zümrüt[/b]. Gözlerin yorgun ama içinde bir ateş var, beğendim.", [{t = "Merhaba Zümrüt", pri = true, f = _zumrut2}])
				return true
			if tz >= 4 and tz <= 8:
				var C2 := _kart()
				soyle("witch", C2[2], [{t = "Kazanı aç", pri = true, f = func(): oyun.istasyon.ac("kazan")}, {t = "Tamam", kapat = true}])
				return true
			return false
		"market":
			if tz == 9:
				soyle("market", "Hoş geldin, yabancı! Ben [b]Nazlı[/b]. Zümrüt seni bana yolladıysa elinde güzel bir şey vardır. Göster bakalım!", [{t = "Keskin taşımı satmak istiyorum", pri = true, f = _nazli_sat}])
				return true
			if tz < 9:
				soyle("market", "Önce Zümrüt'ün işini bitir evlat; sonra gel, alışveriş ederiz.", [{t = "Tamam", pri = true, kapat = true}])
				return true
			return false
		"smith", "durmus":
			if tz == 13 and not balta_tut and k == "smith":
				soyle("smith", "Ooo, yeni bir yüz! Kazazede sen misin? Hoş geldin evlat. Ben [b]Dursun[/b], adanın demircisi. Ocağım hiç sönmez, örsüm hiç susmaz. Seni buraya hangi rüzgâr attı?", [{t = "Börü yolladı, selamı var", pri = true, f = _dursun2}])
				return true
			if tz < 13:
				soyle(k, "Örs sıcak ama sen daha hazır değilsin. Önce adanın insanlarıyla tanış; zamanı gelince Börü seni bana yollar.", [{t = "Tamam", pri = true, kapat = true}])
				return true
			return false
		"alp":
			if oyun.ders.acik or oyun.ders.agac_bekliyor(): return false
			if tz == 11 and ftut < 2:
				ftut = 2
				_yengec()
				ciz()
				soyle("alp", "Nazlı mı yolladı? İyi etmiş. Ben [b]Börü[/b]. Gece bu adada domuzlar, kurtlar dolaşır; önce [b]yumruğunla[/b] savaşmayı öğren. Şuradaki [b]kereviti[/b] görüyor musun? Kıyıda ağır ağır yürür ama ne kaçar ne ısırır; git, ona vur. İleride saldıran hayvanların üstünde önce kırmızı bir [b]![/b] belirir: o an yana atıl.", [{t = "Hadi bakalım", pri = true, kapat = true}])
				return true
			if tz == 11 and ftut == 2:
				if yengec == null or not is_instance_valid(yengec): _yengec()
				soyle("alp", "Kerevit seni bekliyor. Vur!", [{t = "Tamam", pri = true, kapat = true}])
				return true
			if tz == 11 and ftut == 3:
				_kacmayi_ogret()
				return true
			if tz < 11:
				soyle("alp", "Hah, yeni gelen! Önce Kemal'in, Zümrüt'ün dediklerini yap; sonra gel, sana dövüşmeyi öğreteyim.", [{t = "Tamam", pri = true, kapat = true}])
				return true
			return false
	return false

func _nazli_sat() -> void:
	tz = 10
	oyun.pazar.ac("sat")
	ciz()

func _dursun2() -> void:
	soyle("smith", "Börü mü? O deli oğlan hâlâ kerevitlerle mi dövüşüyor? Ne istiyormuş bakalım… Hah, balta parçaları! Sopa, keskin taşlar, ipler: güzel iş çıkarmışsın. Hadi, örse koy, [b]Taş balta[/b]nı birlikte dövelim!", [{t = "Örse koyalım", pri = true, f = _ors_ac}])

func _ors_ac() -> void:
	oyun.istasyon.ac("smith")
	oyun.istasyon.sec("Taş balta")

func _zumrut_basla() -> void:
	tz = 4
	for n in ["Dal", "Lif", "Yaprak"]: _koy(n, 2, _kazan())
	oyun.el_yapimi.verilen["Kaba meşale"] = true
	ciz()

func _zumrut2() -> void:
	var L := []
	var hepsi := true
	for n in ["Dal", "Lif", "Yaprak"]:
		var m := _eksik(n, 2, _kazan())
		L.append([n, m])
		if m != 2: hepsi = false
	var tt := _liste(L)
	var ek := ("Yanıma %s bıraktım%s Topla, kazana koy." % [tt, "." if hepsi else "; gerisi zaten sende ya da yakında."]) if tt != "" else "İki dal, iki lif, iki yaprak gerekiyor; hepsi zaten sende ya da yakında. Kazana koy."
	soyle("witch", "Sana bu adanın en önemli kuralını söyleyeyim: burada bir şeyi [b]yapabilmek[/b] için önce onun [b]tarifini kazandan çıkarman[/b] gerekir. Kazan eşya yapmaz, [b]tarif öğretir[/b]: malzemeleri koyarsın, kazan onları yutar ve tarif sende kalır. Sonra o şeyi istediğin yerde [b]elinle[/b] yaparsın; aletleri de Dursun döver.\n\nİlk tarif: [b]Kaba meşale[/b]. " + ek, [{t = "Deneyelim", pri = true, f = _zumrut_basla}])

# ------------------------------------------------------------------ Eğitimi geç (web v181 tzSkip uyarısı)
func gec_sor() -> void:
	if tz == 0: return
	soyle("ekin", "Dur bir dakika evlat! Bu ilk adımlar adayı [b]ilk kez[/b] görenler için çok önemli: toplamayı, yemeyi, kazanı, el yapımını, satmayı, dövüşmeyi ve atılmayı burada öğrenirsin. Geçersen öğretici boyunca verilecek [b]ödülleri, XP'yi ve eşyaları[/b] (meşale, balta, taşlar, tarifler) [b]alamazsın[/b]; hepsini kendin bulman gerekir. Yine de geçmek istiyor musun?", [{t = "Öğrenmek istiyorum", pri = true, kapat = true}, {t = "Zaten biliyorum, geç", f = _gec_evet}])

func _gec_evet() -> void:
	gec()
	env.mesaj("Öğretici geçildi. Her şeyi kendin bulacaksın; atılmayı Börü ücretsiz öğretir.")

func gec() -> void:
	for r in ["Kaba meşale", "Keskin taş", "Taş balta", "Sopa", "İp"]: oyun.el_yapimi.bilinen[r] = true
	for r in ["Taş balta", "Kaba meşale"]:
		if env.adet(r) == 0: env.ekle(r)
	if yengec != null and is_instance_valid(yengec): yengec.queue_free()
	yengec = null
	if oyun.ders.acik: oyun.ders.birak()
	ftut = 3
	balta_tut = false
	_bitir()

func kayit() -> Dictionary:
	return {tz = tz, yenen = yenen, ftut = ftut, axe = axe, balta = balta_tut}

func yukle(d: Dictionary) -> void:
	tz = int(d.get("tz", 0)); yenen = int(d.get("yenen", 0)); ftut = int(d.get("ftut", 0))
	axe = int(d.get("axe", 0)); balta_tut = bool(d.get("balta", false))
	if tz == 13 and env.adet("Taş balta") > 0: balta_tut = true
	ciz()
