## Adım 0 · Deneme: Çayır'ın oyuncunun başladığı 80×60 karelik parçası.
## Bütün sayılar ve resimler web oyunundan otomatik dökülür (godot/tools/disa_aktar.js → data/*.json, art/*.png).
extends Node2D

const SURUM := "Godot · S3"

var harita: Dictionary
var ada := 1               # 1 = Yıldızsız Ada, 2 = ACT 2'nin adası (yonca ada); bir anda bellekte tek ada (web ISLE)
var ada_diger := {}        # öbür adanın kendi durumu (yer, kurulanlar, mezarlar, köprü, geçit, tuzaklar); kayıtta korunur
var yerler2 := {}          # ikinci adanın yerleri (data/ada2/yerler.json)
const ADA_YEREL := ["yapi", "insa", "mezarlar", "kopru", "gecit", "balik", "kesif"]
var dunya: Dictionary
var canlilar: Dictionary
var oyuncu_veri: Dictionary

var T := 16
var bx0 := 0  # bölgenin dünya karesi cinsinden sol üstü
var by0 := 0
var bw := 0
var bh := 0
var tiles: PackedByteArray
var tvar: PackedByteArray
var shore: PackedByteArray
var agac_izgara := {}  # 32 px'lik hücre → o hücredeki ağaçlar (web: TGRID)
var agaclar: Array = []
var dugumler: Array = []
var env
var el_yapimi
var istasyon
var konusma
var kisiler: Array = []
var gorev
var sahne
var canli_liste := {}         # biyom → [[tür, istenen, koşul]] (web BANIM)
var atis                      # canlıların attığı diken ve tükürükler (atis.gd)
var dogum_t := 1.0
var paket_no := 0
var pazar
var zaman
var kayit
var basta := false
var gorunus := {}            # oyuncunun görünüşü (karakter yaratma)
var sevgili := {}
var zorluk := "normal"
var ad_kahraman := ""
var ad_sevgili := ""
var cine
var uyanis
var mezarlar: Array = []   # bayılınca kalan çantalar: {p, inv, vio, dugum}
var balon_yazi: Label
var balon_t := 0.0
var magara
var mesale
var ortam: CanvasModulate
var taban_renk := Color.WHITE
var sahne_renk := Color.WHITE
var bio_arr: PackedByteArray
var kh_resim: TextureRect
var toplama_veri: Dictionary
var toplama

var nesneler: Node2D  # y sıralı: ağaçlar, düğümler, canlılar, oyuncu
var efekt: Node2D
var oyuncu: Node2D
var kamera: Camera2D
var hud: CanvasLayer
var can_cubugu: ProgressBar
var enerji_cubugu: ProgressBar
var etki_yazi: RichTextLabel
var yetenekler := {}        # web skills: S1 atılma, P0 savuşturma (yetenek ağacı 1f-3b-3)
var ders                    # Börü'nün dersleri (ders.gd)
var yetenek                 # yetenek ağacı (yetenek.gd)
var ogr                     # öğretici (ogretici.gd)
var kuzen                   # kuzenler, pazarcı kuzenler, Sinan (kuzen.gd)
var kisi_veri := {}         # data/kisiler_orman.json (ustalar, biyomlar)
var istasyonlar: Array = [] # Orman'ın kazanı, ocak, örsler, tezgâh
var kademe := {}            # dövülen tarif → kademe (web tierOf)
var zirh_set := {}          # zırh tarifleri (web ARMORSET)
var kusanma := {}           # data/kusanma.json (web EQUIP, silahlar, SPS)
var kusam := {}             # yuva → giyilen eşya (web equip)
var puan := {}              # özellik → verilen seviye puanı (web SPT)
var puan_ders := 0          # ilk seviye kartı: 0 gösterilmedi, 1 gösterildi, 2 ilk puan verildi
var karakter                # karakter penceresi (karakter_pen.gd)
var yapi                    # kurulan yapılar ve evler (yapi.gd)
var sinan                   # Usta Sinan'ın sipariş pencereleri (sinan.gd)
var atolye                  # Atölye penceresi ve üretimi (atolye.gd)
var yan                     # yan görevler (yan.gd)
var iz                      # eşinden kalan izler (iz.gd)
var gecit                   # Doğu geçidi ve sıradağ (gecit.gd)
var zemin_katman: TileMapLayer
var kopru                   # büyük nehrin köprüleri (kopru.gd)
var camur_dedi := false
var evcil                   # evcil hayvanlar ve Çoban Davut (evcil.gd)
var ev                      # evin içi ve Döşe (ev_ici.gd)
var enkaz: Node2D           # Barbaros'un gemisinin enkazı (kuzen.gd çizer)
var portal                  # adalar arası portallar (portal.gd)
var hikaye                  # Ada halkı hikâyeleri (hikaye.gd)
var isikci                  # Yıldızsız Işıkçı ve Kafa lambası (isikci.gd)
var gezgin                  # Yıldızsız Gezgin ve robot köpekler (gezgin.gd)
var reis                    # Reisler (reis.gd)
var ozel                    # özel vuruşlar (ozel.gd)
var dovus                   # Börü'nün dövüş dersleri ve ulti (dovus.gd)
var ult := 0.0              # ulti çubuğu (0–100)
var harita_k                # keşif sisi, büyük harita (M), yan görev işaretleri (harita.gd)
var ani                     # anılar (ani.gd)
var roket                   # ACT 2'nin sonu: fırlatma, kavuşma, son kart (roket.gd)
var buyu                    # mor mana ve asalar (buyu.gd)
var act2                    # ACT 2 adasının ustaları: Yıldız (act2.gd); yalnız ikinci adada
var poyraz                  # Gemici Poyraz ve deniz (poyraz.gd)
var ciftlik                 # Çiftçi Ekin ve Bereket Adası (ciftlik.gd)
var balik                   # balık tutma, tuzaklar, gece buluntuları (balik.gd)
var insa                    # İnşa kipi: zemin, çit, duvar, kapı, fener (insa.gd)
var dl_agac := false        # Börü'nün dersi bitti, yetenek ağacını gösterecek (1f-3b-3)
var silah_yazi: Label
var parlama_shader: Shader
var rng := RandomNumberGenerator.new()
var canli_sayac := {}

func _ready() -> void:
	Girdi.kur()
	ada = int(Kayit.bekleyen.get("ada", 1)) if not Kayit.bekleyen.is_empty() else 1
	var dk := "res://data/ada2/" if ada == 2 else "res://data/"
	harita = _json(dk + "harita.json")
	dunya = _json(dk + "dunya.json")
	if ada == 2: yerler2 = _json("res://data/ada2/yerler.json")
	var CC: Dictionary = _json("res://data/canlilar_cayir.json")
	canlilar = CC.canlilar
	canli_liste = {0: CC.liste} if ada == 1 else {}
	var dosyalar := {1: "orman", 2: "bataklik", 3: "kayalik", 4: "kul", 5: "kristal"}
	for bi in dosyalar:
		if ada == 2:
			var C3: Dictionary = _json("res://data/canlilar_%s.json" % dosyalar[bi])
			for k in C3.canlilar: canlilar[k] = C3.canlilar[k]
			continue
		var C2: Dictionary = _json("res://data/canlilar_%s.json" % dosyalar[bi])
		for k in C2.canlilar: canlilar[k] = C2.canlilar[k]
		canli_liste[bi] = C2.liste
	if ada == 2:
		# ikinci adanın kendi canlıları (web __I2C.anim + NEWN; tools/disa_aktar_canli.js ADA=2)
		for b2 in 6:
			var A2: Dictionary = _json("res://data/ada2/canlilar_%d.json" % b2)
			for k in A2.canlilar: canlilar[k] = A2.canlilar[k]
			canli_liste[b2] = A2.liste
	oyuncu_veri = _json("res://data/oyuncu.json")
	T = int(harita.T)
	bx0 = int(harita.region.x0); by0 = int(harita.region.y0)
	bw = int(harita.region.w); bh = int(harita.region.h)
	tiles = Marshalls.base64_to_raw(harita.tiles)
	tvar = Marshalls.base64_to_raw(harita.tvar)
	shore = Marshalls.base64_to_raw(harita.shore)
	parlama_shader = load("res://scripts/parlama.gdshader")
	# yazı tipine yedek: ✓ ✗ ▸ gibi işaretler DejaVu'dan, sahnedeki duygu işaretleri (💧 💡 💢 ✨) küçük bir Noto Emoji parçasından
	var yf: Font = ThemeDB.fallback_font
	yf.fallbacks = [load("res://fonts/DejaVuSans.ttf"), load("res://fonts/emoji.ttf")]
	_hud()
	_zemin()
	_kucuk_harita()
	nesneler = Node2D.new()
	nesneler.y_sort_enabled = true
	add_child(nesneler)
	toplama_veri = _json("res://data/toplama.json")
	if ada == 2:
		var EK: Dictionary = _json("res://data/ada2/toplama_ek.json")
		for k in EK.nodes: toplama_veri.nodes[k] = EK.nodes[k]
		for k in EK.trees: toplama_veri.trees[k] = EK.trees[k]
		for k in EK.items:
			if not toplama_veri.items.has(k): toplama_veri.items[k] = EK.items[k]
	_agaclar()
	_dugumler()
	oyuncu = preload("res://scripts/oyuncu.gd").new()
	oyuncu.oyun = self
	oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	nesneler.add_child(oyuncu)
	env = preload("res://scripts/envanter.gd").new()
	add_child(env)
	env.kur(self)
	el_yapimi = preload("res://scripts/el_yapimi.gd").new()
	add_child(el_yapimi)
	el_yapimi.kur(self)
	pazar = preload("res://scripts/pazar.gd").new()
	add_child(pazar)
	istasyon = preload("res://scripts/istasyon.gd").new()
	add_child(istasyon)
	istasyon.kur(self)
	pazar.kur(self)
	konusma = preload("res://scripts/konusma.gd").new()
	hud.add_child(konusma)
	konusma.kur(self)
	_kisiler()
	ders = preload("res://scripts/ders.gd").new()
	add_child(ders)
	ders.kur(self)
	yetenek = preload("res://scripts/yetenek.gd").new()
	add_child(yetenek)
	yetenek.kur(self)
	sahne = preload("res://scripts/sahne.gd").new()
	hud.add_child(sahne)
	hud.move_child(sahne, konusma.get_index())
	sahne.kur(self)
	gorev = preload("res://scripts/gorev.gd").new()
	add_child(gorev)
	gorev.kur(self)
	kuzen = preload("res://scripts/kuzen.gd").new()
	add_child(kuzen)
	kuzen.kur(self)
	yapi = preload("res://scripts/yapi.gd").new()
	add_child(yapi)
	yapi.kur(self)
	insa = preload("res://scripts/insa.gd").new()
	add_child(insa)
	insa.kur(self)
	iz = preload("res://scripts/iz.gd").new()
	add_child(iz)
	iz.kur(self)
	gecit = preload("res://scripts/gecit.gd").new()
	add_child(gecit)
	gecit.kur(self)
	balik = preload("res://scripts/balik.gd").new()
	add_child(balik)
	balik.kur(self)
	ciftlik = preload("res://scripts/ciftlik.gd").new()
	add_child(ciftlik)
	ciftlik.kur(self)
	poyraz = preload("res://scripts/poyraz.gd").new()
	add_child(poyraz)
	poyraz.kur(self)
	gezgin = preload("res://scripts/gezgin.gd").new()
	add_child(gezgin)
	gezgin.kur(self)
	isikci = preload("res://scripts/isikci.gd").new()
	add_child(isikci)
	isikci.kur(self)
	hikaye = preload("res://scripts/hikaye.gd").new()
	add_child(hikaye)
	hikaye.kur(self)
	portal = preload("res://scripts/portal.gd").new()
	add_child(portal)
	portal.kur(self)
	kopru = preload("res://scripts/kopru.gd").new()
	add_child(kopru)
	kopru.kur(self)
	ozel = preload("res://scripts/ozel.gd").new()
	add_child(ozel)
	ozel.kur(self)
	dovus = preload("res://scripts/dovus.gd").new()
	add_child(dovus)
	dovus.kur(self)
	reis = preload("res://scripts/reis.gd").new()
	add_child(reis)
	reis.kur(self)
	harita_k = preload("res://scripts/harita.gd").new()
	add_child(harita_k)
	harita_k.kur(self)
	ani = preload("res://scripts/ani.gd").new()
	add_child(ani)
	ani.kur(self)
	roket = preload("res://scripts/roket.gd").new()
	add_child(roket)
	roket.kur(self)
	buyu = preload("res://scripts/buyu.gd").new()
	add_child(buyu)
	buyu.kur(self)
	evcil = preload("res://scripts/evcil.gd").new()
	add_child(evcil)
	evcil.kur(self)
	yan = preload("res://scripts/yan.gd").new()
	add_child(yan)
	yan.kur(self)
	ev = preload("res://scripts/ev_ici.gd").new()
	add_child(ev)
	move_child(ev, hud.get_index())
	ev.kur(self)
	atolye = preload("res://scripts/atolye.gd").new()
	add_child(atolye)
	atolye.kur(self)
	sinan = preload("res://scripts/sinan.gd").new()
	add_child(sinan)
	sinan.kur(self)
	karakter = preload("res://scripts/karakter_pen.gd").new()
	add_child(karakter)
	karakter.kur(self)
	ogr = preload("res://scripts/ogretici.gd").new()
	add_child(ogr)
	ogr.kur(self)
	ortam = CanvasModulate.new()
	add_child(ortam)
	mesale = preload("res://scripts/mesale.gd").new()
	add_child(mesale)
	magara = preload("res://scripts/magara.gd").new()
	add_child(magara)
	magara.kur(self)
	mesale.kur(self, magara.M.mesale)
	zaman = preload("res://scripts/zaman.gd").new()
	add_child(zaman)
	zaman.kur(self)
	balon_yazi = Label.new()
	balon_yazi.add_theme_font_size_override("font_size", 14)
	balon_yazi.add_theme_color_override("font_color", Color("#2a1e14"))
	var bst := StyleBoxFlat.new(); bst.bg_color = Color("#fffcf0"); bst.border_color = Color("#3a2a1a"); bst.set_border_width_all(2); bst.set_content_margin_all(5)
	balon_yazi.add_theme_stylebox_override("normal", bst)
	balon_yazi.visible = false
	hud.add_child(balon_yazi)
	toplama = preload("res://scripts/toplama.gd").new()
	toplama.oyun = self
	toplama.env = env
	toplama.G = toplama_veri
	add_child(toplama)
	atis = preload("res://scripts/atis.gd").new()
	atis.oyun = self
	atis.z_index = 4
	add_child(atis)
	efekt = preload("res://scripts/efekt.gd").new()
	efekt.z_index = 50
	add_child(efekt)
	kamera = Camera2D.new()
	kamera_sinir()
	oyuncu.add_child(kamera)
	kamera.make_current()
	# web derlemesinde adrese ?kurt ya da ?tavsan yazılırsa (denetim için) o canlı oyuncunun 5–7 kare yakınına konur
	if OS.has_feature("web"):
		var q := str(JavaScriptBridge.eval("location.search"))
		if q.contains("kurt"):
			_canli_koy_yakin("Kurt", 6.0)
		if q.contains("tavsan"):
			_canli_koy_yakin("Tavşan", 4.0)
		if q.contains("kemal"):
			oyuncu.position = Vector2(toplama_veri.kisiler[0].x + 20, toplama_veri.kisiler[0].y + 6)
		if q.contains("insatest"):
			oyuncu.position = Vector2(5400, 1720)
			for n3 in ["Çit", "Taş duvar", "Toprak yol", "Tahta kapı", "Direk feneri", "Dal çit"]: env.ekle(n3, 20)
			if q.contains("kirtest"): _kir_test.call_deferred()
		if q.contains("evtest"):
			oyuncu.position = Vector2(5400, 1720)
			var c0: Vector2i = insa.karo(oyuncu.position)
			var ev0 := {n = "Kulübe", tx = c0.x - 1, ty = c0.y - 4, rot = 0, yatak = null}
			yapi.kurulu.append(ev0)
			yapi._kur_dugum(ev0)
			for n4 in ["Hasır yatak", "Taş lamba", "Masa", "Halı", "Perde", "Sandalye", "Asma fener"]: env.ekle(n4)
			if q.contains("gece"):
				zaman.dk = 1300.0
				ev.gir.call_deferred(ev0)
		if q.contains("kecitest") or q.contains("evcilat") or q.contains("evcilkurt"): _evcil_test.call_deferred(q)
		if q.contains("koprutest"): _kopru_test.call_deferred(q.contains("camur"))
		if q.contains("iztest"):
			oyuncu.position = Vector2(7664 + 8, 2280 + 6)
			ad_sevgili = "Elif"
		if q.contains("yantest_"): _yan_test.call_deferred(RegEx.create_from_string("yantest_([a-z]+)").search(q).get_string(1))
		if q.contains("ekintest"): _ekin_test.call_deferred()
		if q.contains("adatest"): _ada_test.call_deferred(q)
		if q.contains("denizt"): _deniz_test.call_deferred()
		if q.contains("kopektest"): _kopek_test.call_deferred()
		if q.contains("lambatest"): _lamba_test.call_deferred()
		if q.contains("hikayetest"): _hikaye_test.call_deferred()
		if q.contains("gemitest"): _gemi_test.call_deferred()
		if q.contains("ada2test"): _ada2_test.call_deferred(q)
		if q.contains("anitest"): _ani_test.call_deferred(q)
		if q.contains("haritatest"): _harita_test.call_deferred(q)
		if q.contains("reistest"): _reis_test.call_deferred(q)
		if q.contains("yaytest"): _yay_test.call_deferred(q)
		if q.contains("s2btest"): _s2b_test.call_deferred(q)
		if q.contains("ozeltest"): _ozel_test.call_deferred(q)
		if q.contains("derstest"): _ders_test.call_deferred(q)
		if q.contains("imzatest"): _imza_test.call_deferred(q)
		if q.contains("dztest"):
			el_yapimi.bilinen["Gemi"] = true
			for m in ["Ay otu", "Işık mantarı"]: env.gorulen[m] = true
			for id in ["E1", "E2", "E3", "E4", "E5"]: gorev.bitenler.append(id)
			oyuncu.dokunulmaz = 9999.0
			for n in kisiler:
				if n.K.k == "denizci": oyuncu.position = n.position + Vector2(-14, 4)
			_dz_test.call_deferred()
		if q.contains("baliktest") or q.contains("tuzaktest") or q.contains("gecetest"): _balik_test.call_deferred(q)
		if q.contains("gecittest"):
			oyuncu.position = Vector2(gecit.x0 * T - 20, gecit.cy)
			env.ekle("Kaya patlatıcı", 2); env.ekle("Çelik kazma"); oyuncu.dokunulmaz = 9999.0
			gorev._baslat.call_deferred(gorev.QI["E3"], "npc", true)
		if q.contains("yapitest"):
			env.ekle("Kulübe"); env.ekle("Hasır yatak"); env.vio_ekle(3000); env.ekle("Atölye"); env.ekle("Dal", 20); env.ekle("Taş", 20)
		if q.contains("kusan"):
			for n2 in ["Kemik zırh", "Kürk başlık", "Taş kılıç", "Diş kolye"]: env.ekle(n2)
			while env.sv < 8: env.xp_ekle(300)
		if q.contains("git_"):
			var m2 := RegEx.create_from_string("git_([a-z_]+)").search(q)
			for n in kisiler:
				if m2 != null and n.K.k == m2.get_string(1): oyuncu.position = n.position + Vector2(0, 22)
			if q.contains("tz0"): ogr.gec()
		if q.contains("orman"):
			oyuncu.position = Vector2(5400, 1720)
			yetenekler["S1"] = true; yetenekler["P0"] = true
			while env.sv < 10: env.xp_ekle(400)
			_orman_test(q)
		if q.contains("ogr"):
			oyuncu.position = Vector2(toplama_veri.kisiler[0].x + 20, toplama_veri.kisiler[0].y + 6)
			ogr.basla()
			var rx := RegEx.create_from_string("ogr(\\d+)")
			var m := rx.search(q)
			if m != null:
				ogr.tz = int(m.get_string(1))
				var yer := {3: "witch", 4: "witch", 7: "witch", 9: "market", 10: "market", 11: "alp", 12: "alp", 13: "smith"}
				if yer.has(ogr.tz):
					oyuncu.position = ogr._kisi(yer[ogr.tz]).position + Vector2(0, 20)
				if ogr.tz >= 9: env.ekle("Keskin taş")
				if q.contains("k3"): ogr.ftut = 3
				ogr.ciz()
		if q.contains("boru"):
			var al = alp_dugum()
			oyuncu.position = al.position + Vector2(0, 40)
			ders.oto = q.contains("oto")
			if q.contains("boru2"): yetenekler["S1"] = true
			if q.contains("tum"):
				for id in yetenek.L: yetenekler[id] = true
				oyuncu.yetenek_uygula()
			if q.contains("agac"):
				env.vio_ekle(5000)
				while env.sv < 9: env.xp_ekle(400)
			if q.contains("boru3"):
				yetenekler["S1"] = true; yetenekler["P0"] = true
			else: ders.basla("parry" if q.contains("boru2") else "dodge")
		if q.contains("e1"):
			env.ekle("Dal", 6)
			env.ekle("Kuru ot", 2)
		if q.contains("ders"):
			gorev.ders_goster("chop", 0)
		if q.contains("magara"):
			oyuncu.position = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 30.0)
			env.ekle("Kaba meşale", 2)
			while env.sv < 5:
				env.xp_ekle(200)
			mesale.degistir()
		if q.contains("kayatest"):
			env.ekle("Kaba meşale", 2)
			env.ekle("Yankı mantarı", 4)
			env.ekle("Taş kılıç")
			while env.sv < 10:
				env.xp_ekle(400)
			mesale.degistir()
			magara._gir()
			oyuncu.position = magara.kaya.position + Vector2(18, 10)
		if q.contains("mag_c1") or q.contains("mag_c2"):
			env.ekle("Kaba meşale", 3)
			env.ekle("Parıltı yosunu", 4); env.ekle("Kök reçinesi", 3)
			while env.sv < 20: env.xp_ekle(800)
			mesale.degistir()
			magara.cur = magara.MAGS[1 if q.contains("mag_c1") else 2]
			magara._gir()
			if q.contains("dip"): oyuncu.position = magara.kaya.position + Vector2(18, 10)
		if q.contains("magdogum"):
			env.ekle("Kaba meşale", 2)
			mesale.degistir()
			magara._gir()
		if q.contains("gece"):
			zaman.dk = 1270.0
			zaman.gun = 2
			zaman.mesale_verildi = true
			if q.contains("gece2"): oyuncu.position = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 60.0)
			env.ekle("Dal", 5)
			env.vio_ekle(50)
		if q.contains("pazar"):
			var nz: Dictionary = toplama_veri.kisiler[4]
			oyuncu.position = Vector2(nz.x + 20, nz.y + 8)
			for e in [["Dal", 12], ["Taş", 9], ["Böğürtlen", 4], ["Keskin taş", 3], ["Lif", 5]]:
				env.ekle(e[0], e[1])
		if q.contains("ors"):
			oyuncu.position = Vector2(toplama_veri.istasyon.ors.x - 14, toplama_veri.istasyon.ors.y + 4)
			for e in [["Taş", 6], ["Sopa", 2], ["İp", 4], ["Dal", 2], ["Keskin taş", 4]]:
				env.ekle(e[0], e[1])
			env.vio_ekle(50)
			el_yapimi.bilinen["Mızrak"] = true
		if q.contains("kazan"):
			oyuncu.position = Vector2(toplama_veri.istasyon.kazan.x - 26, toplama_veri.istasyon.kazan.y + 6)
			for e in [["Taş", 6], ["Sopa", 2], ["İp", 4], ["Dal", 2], ["Keskin taş", 4]]:
				env.ekle(e[0], e[1])
			env.vio_ekle(50)
	get_viewport().size_changed.connect(_yakinlik)
	_yakinlik()
	gorunus_uygula(Karakter.gorunus(Karakter.varsayilan("e")))
	sevgili = Karakter.gorunus(Karakter.varsayilan("k"))
	uyanis = preload("res://scripts/uyanis.gd").new()
	hud.add_child(uyanis)
	uyanis.kur(self)
	cine = preload("res://scripts/cine.gd").new()
	hud.add_child(cine)
	cine.kur(self)
	kayit = preload("res://scripts/kayit.gd").new()
	hud.add_child(kayit)
	kayit.kur(self)
	var test := OS.has_feature("web") and str(JavaScriptBridge.eval("location.search")).length() > 1
	var yeni := false
	if not Kayit.bekleyen.is_empty():
		yeni = bool(Kayit.bekleyen.get("yeni", false))
		var varis := str(Kayit.bekleyen.get("varis", ""))
		durum_yukle(Kayit.bekleyen)
		Kayit.bekleyen = {}
		if varis != "": _varis.call_deferred(varis)
	if Kayit.dogrudan or test:
		Kayit.dogrudan = false
		kayit.ana_gizle()
		if yeni or (test and str(JavaScriptBridge.eval("location.search")).contains("giris")):
			cine.oyna(zorluk == "zor", func(): uyanis.basla())
	else:
		kayit.ana_goster()

## öbür adadan gelince nereye inilir (web applyState: land → iniş yeri, portal → Barbaros'un portalı, Kemal → Kemal'in portalı)
func _varis(how: String) -> void:
	if how == "land": oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	else:
		var p = portal.yer(how)
		if p != null: oyuncu.position = p + Vector2(0, 14)
	if ada == 2: env.mesaj("ACT 2 · %s" % yerler2.bname[maxi(0, bio_at(oyuncu.position))])
	else: env.mesaj("Portal · Yıldızsız Ada")

func _json(p: String) -> Dictionary:
	var f := FileAccess.open(p, FileAccess.READ)
	return JSON.parse_string(f.get_as_text())

## web: S = max(2, round(min(ekran) / 260)); dünya pikseli başına ekran pikseli
func _yakinlik() -> void:
	var v := get_viewport().get_visible_rect().size
	var s := maxf(2.0, roundf(minf(v.x, v.y) / 260.0))
	kamera.zoom = Vector2(s, s)

# ------------------------------------------------------------------ zemin
## web v425karo: Çayır çimi, orman zemini, kum ve suların karoları ComfyUI'de çizilmiş 128 px dikişsiz dokulardan gelir;
## bir karo dokunun dünyadaki yerine düşen parçasını alır (x mod 8, y mod 8), yan yana karolar kesintisiz birleşir.
## Dokusu olmayan türler (öbür biyomlar) web'in eski karo setinden (TILEC, tvar) çizilir.
func _zemin() -> void:
	var ts := TileSet.new()
	ts.tile_size = Vector2i(T, T)
	var eski := TileSetAtlasSource.new()
	eski.texture = load("res://art/ada2/karolar.png" if ada == 2 else "res://art/karolar.png")
	eski.texture_region_size = Vector2i(T, T)
	for k in 21:
		for v in 8:
			eski.create_tile(Vector2i(v, k))
	ts.add_source(eski, 0)
	var doku := {}
	for k in 6:
		var yol := "res://art/zemin_%d.png" % k
		if ada == 2 or not ResourceLoader.exists(yol):   # ComfyUI zemin dokuları yalnız ACT 1 adasında (web v425karo)
			continue
		var src := TileSetAtlasSource.new()
		src.texture = load(yol)
		src.texture_region_size = Vector2i(T, T)
		var n := int(src.texture.get_width() / T)
		for y in n:
			for x in n:
				src.create_tile(Vector2i(x, y))
		ts.add_source(src, 1 + k)
		doku[k] = n
	var tm := TileMapLayer.new()
	zemin_katman = tm
	tm.tile_set = ts
	tm.z_index = -10
	add_child(tm)
	for y in bh:
		for x in bw:
			var kv := int(tvar[y * bw + x])
			var k := kv >> 3
			if doku.has(k):
				var n: int = doku[k]
				tm.set_cell(Vector2i(bx0 + x, by0 + y), 1 + k, Vector2i((bx0 + x) % n, (by0 + y) % n))
			else:
				tm.set_cell(Vector2i(bx0 + x, by0 + y), 0, Vector2i(kv % 8, kv / 8))
	var su := preload("res://scripts/su.gd").new()
	su.oyun = self
	su.z_index = -9
	add_child(su)

## Bataklık'ın çamur karosu (web MUD: karo seti 12)
func camur_mu(p: Vector2) -> bool:
	if magara != null and magara.icinde: return false
	var x := int(floor(p.x / T)) - bx0
	var y := int(floor(p.y / T)) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh: return false
	return (int(tvar[y * bw + x]) >> 3) == 12

## giyilen bir eşya çamurda yavaşlatmıyor mu (web mudProof)
func camur_gecmez() -> bool:
	for y in kusam:
		var n = kusam[y]
		if n != null and kusanma.esya.has(n) and int(kusanma.esya[n].mud) == 1: return true
	return false

func bio_at(p: Vector2) -> int:
	var x := int(p.x / T) - bx0
	var y := int(p.y / T) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh or bio_arr.is_empty():
		return -1
	return int(bio_arr[y * bw + x])

func tile_at(p: Vector2) -> int:
	if magara != null and magara.icinde:
		return 1
	var x := int(floor(p.x / T)) - bx0
	var y := int(floor(p.y / T)) - by0
	if x < 0 or y < 0 or x >= bw or y >= bh:
		return 4
	return tiles[y * bw + x]

static func su_mu(t: int) -> bool:
	return t >= 3

## web blocked(): kutunun dört köşesinden biri sudaysa ya da bir ağaç gövdesine değiyorsa geçilmez
func engel(p: Vector2, half: float = 5.0, canli := false) -> bool:
	if magara != null:
		if magara.icinde:
			return magara.engel(p, half)
		if magara.kapi_engel(p):
			return true
	if ciftlik != null and ciftlik.engel(p, half):
		return true
	if poyraz != null and poyraz.engel(p):
		return true
	for d in [Vector2(-half, -half), Vector2(half, -half), Vector2(-half, half), Vector2(half, half)]:
		if su_mu(tile_at(p + d)) and not (kopru != null and kopru.ustunde(p + d)):
			return true
	if gecit != null and gecit.engel(p):
		return true
	if yapi != null and yapi.engel(p, half):
		return true
	if insa != null and insa.engel(p, half, canli):
		return true
	var cx := int(floor(p.x / 32.0))
	var cy := int(floor(p.y / 32.0))
	for gy in range(cy - 1, cy + 2):
		for gx in range(cx - 1, cx + 2):
			var L = agac_izgara.get(Vector2i(gx, gy))
			if L == null:
				continue
			for t in L:
				if absf(t.x - p.x) < half + 4.0 and absf(t.y + 2.0 - p.y) < half + 3.0:
					return true
	return false

# ------------------------------------------------------------------ ağaçlar (ComfyUI resimleri, web v424dunya)
func _agaclar() -> void:
	var resim: Dictionary = dunya.agacResimleri
	for a in dunya.agaclar:
		var R: Dictionary = resim[a.key]
		var n := preload("res://scripts/agac.gd").new()
		n.position = Vector2(a.x, a.y)
		n.kur(load(R.file), int(R.bot), a.seed if a.has("seed") else int(a.x * 7 + a.y))
		n.oyun = self
		n.tur = a.k
		nesneler.add_child(n)
		agaclar.append(n)
		var k := Vector2i(int(floor(a.x / 32.0)), int(floor(a.y / 32.0)))
		if not agac_izgara.has(k):
			agac_izgara[k] = []
		agac_izgara[k].append(Vector2(a.x, a.y))

# ------------------------------------------------------------------ yerdeki toplanabilirler (bu adımda yalnız görünür)
## öğretici yere malzeme koyar (web tzPlace: nodes.push)
func dugum_ekle(n: String, p: Vector2) -> void:
	var resim: Dictionary = dunya.dugumResimleri
	if not resim.has(n): return
	var R: Dictionary = resim[n]
	var k := float(R.get("k", 1))
	var s := preload("res://scripts/dugum.gd").new()
	s.ad = n
	s.texture = load(R.file)
	s.centered = false
	s.offset = Vector2(-float(R.ox), -float(R.oy))
	s.scale = Vector2(1.0 / k, 1.0 / k)
	s.position = p
	s.bas_kalan = 3 if (toplama_veri.nodes.has(n) and toplama_veri.nodes[n].bush) else 1
	s.kalan = s.bas_kalan
	dugumler.append(s)
	nesneler.add_child(s)

func _dugumler() -> void:
	var resim: Dictionary = dunya.dugumResimleri
	for d in dunya.dugumler:
		if not resim.has(d.n):
			continue
		var R: Dictionary = resim[d.n]
		# v > 0.5: web draws these kinds in their second look (mirrored or the other picture), captured as "b"
		if float(d.v) > 0.5 and R.has("b"):
			R = R.b
		var k := float(resim[d.n].get("k", 1))
		var s := preload("res://scripts/dugum.gd").new()
		s.ad = d.n
		s.texture = load(R.file)
		s.centered = false
		s.offset = Vector2(-float(R.ox), -float(R.oy))
		# captured k times finer than the world: same size in the world, the web's detail on screen
		s.scale = Vector2(1.0 / k, 1.0 / k)
		s.position = Vector2(d.x, d.y)
		# maden kayası web'de birkaç kazmada tükenir (left); böğürtlen çalısı 3 kez toplanır
		s.bas_kalan = 3 if (d.mine or (toplama_veri.nodes.has(d.n) and toplama_veri.nodes[d.n].bush)) else 1
		s.kalan = s.bas_kalan
		dugumler.append(s)
		nesneler.add_child(s)

# ------------------------------------------------------------------ canlılar
func _evcil_test(q: String) -> void:
	kuzen.tanis["k_davut"] = true
	while env.sv < 3: env.xp_ekle(300)
	var dn = evcil.davut()
	if q.contains("kecitest"):
		oyuncu.position = dn.position + Vector2(0, 20)
		gorev._baslat(gorev.QI["CB1"], "k_davut", true)
		konusma.visible = false
		for k in 8:
			await get_tree().create_timer(1.5).timeout
			oyuncu.position = evcil.keci.n.position + Vector2(4, 0)
			print("KECI ", k, " ", evcil.keci.durum, " cnt=", evcil.keci.cnt, " p=", evcil.keci.n.position)
		oyuncu.position = dn.position + Vector2(60, 0)
		for k in 6:
			await get_tree().create_timer(1.0).timeout
			print("KECI2 ", evcil.keci.durum, " d=", evcil.keci.n.position.distance_to(dn.position), " satir=", gorev.satir(["sq", "husnu"]))
		return
	if q.contains("evcilkurt"):
		gorev.bitenler.append_array(["CB1", "CB2", "CB3"])
		gorev.biyomlar[1] = true
		var dk: Vector2 = Vector2(evcil.V["in"].kurt.x, evcil.V["in"].kurt.y)
		oyuncu.position = dk + Vector2(0, 70)
		var c1: Vector2i = insa.karo(oyuncu.position)
		var ag1 := {n = "Ağıl", tx = c1.x + 4, ty = c1.y + 2, rot = 0, yatak = null}
		yapi.kurulu.append(ag1)
		yapi._kur_dugum(ag1)
		env.ekle("Tavşan eti", 10)
		gorev._baslat(gorev.QI["CB4"], "k_davut", true)
		konusma.visible = false
		zaman.dk = 600.0
		for k in 4:
			await get_tree().create_timer(1.5).timeout
			var u = evcil.PUP.get("kurt", null)
			if u == null:
				print("KURT pup yok")
				continue
			oyuncu.position = u.n.position + Vector2(20, 0)
			print("KURT ipucu=", evcil.ipucu(), " f=", evcil.f())
			oyuncu.position = u.n.position + Vector2(140, 0)
			await get_tree().create_timer(4.0).timeout
			print("KURT tr=", evcil.PT.tr)
			zaman.dk += 70.0
		await get_tree().create_timer(1.5).timeout
		evcil._ad_bitti()
		print("KURT pets=", evcil.PT.pets.size(), " grow=", evcil.PT.pets[0].grow if not evcil.PT.pets.is_empty() else 0.0)
		_canli_koy("Kurt", 5.0, 2.0)
		for c in nesneler.get_children():
			if c.get("tur") == "Kurt": c.mad = true
		if not evcil.PT.pets.is_empty(): evcil.PT.pets[0].grow = 0.0
		await get_tree().create_timer(6.0).timeout
		print("KURT sonra hp=", evcil.PT.pets[0].hp if not evcil.PT.pets.is_empty() else -1.0, " dead=", evcil.PT.dead)
		return
	oyuncu.position = dn.position + Vector2(0, 60)
	gorev.bitenler.append_array(["CB1", "CB2"])
	evcil.keci.durum = "davut"
	var c0: Vector2i = insa.karo(oyuncu.position)
	var ag := {n = "Ağıl", tx = c0.x + 3, ty = c0.y - 1, rot = 0, yatak = null}
	yapi.kurulu.append(ag)
	yapi._kur_dugum(ag)
	env.ekle("Elma", 10)
	gorev._baslat(gorev.QI["CB3"], "k_davut", true)
	konusma.visible = false
	_canli_koy("Yaban atı", 4.0, 2.0)
	var at = null
	for c in nesneler.get_children():
		if c.get("tur") == "Yaban atı": at = c
	for k in 4:
		await get_tree().create_timer(1.0).timeout
		oyuncu.position = at.position + Vector2(30, 0)
		print("AT ipucu=", evcil.ipucu(), " f=", evcil.f(), " FD=", evcil.FD.size())
		oyuncu.position = at.position + Vector2(170, 0)
		await get_tree().create_timer(4.0).timeout
		if not evcil.FD.is_empty(): print("AT FD0 ", evcil.FD[0].p, " a=", evcil.FD[0].a, " at=", at.position if is_instance_valid(at) else Vector2.ZERO, " ok=", evcil.evcillesir("at"), " meta=", at.has_meta("yem") if is_instance_valid(at) else false, " flash=", at.flash if is_instance_valid(at) else 0.0)
		print("AT tr=", evcil.PT.tr, " FD=", evcil.FD.size(), " d=", at.position.distance_to(oyuncu.position) if is_instance_valid(at) else -1.0)
		zaman.dk += 70.0
	await get_tree().create_timer(1.5).timeout
	evcil._ad_bitti()
	print("AT pets=", evcil.PT.pets.size(), " ever=", evcil.PT.ever, " satir=", gorev.satir(["tame", "at"]))
	await get_tree().create_timer(1.0).timeout
	evcil.bin()
	print("AT binilen=", evcil.binilen != null, " hiz=", evcil.hiz())

func _kopru_test(camur: bool) -> void:
	var b: Dictionary = kopru.ana()
	oyuncu.position = Vector2(b.x0 * T - 14, b.cy)
	env.ekle("Odun", 12); env.ekle("Sert odun", 10)
	await get_tree().create_timer(1.0).timeout
	print("KOPRU f(gorevsiz)=", kopru.f(), " fixed=", b.fixed)
	gorev._baslat(gorev.QI["E2"], "npc", true)
	konusma.visible = false
	print("KOPRU satir=", gorev.satir(["bridge"]), " f=", kopru.f())
	await get_tree().create_timer(1.5).timeout
	kopru._onar(b)
	konusma.visible = false
	await get_tree().create_timer(5.0).timeout
	print("KOPRU fixed=", b.fixed, " odun=", kopru.odun(), " satir=", gorev.satir(["bridge"]))
	await get_tree().create_timer(4.0).timeout
	print("KOPRU x=", oyuncu.position.x, " bitis=", (b.x1 + 1) * T, " bio=", bio_at(oyuncu.position))
	if not camur: return
	for y in bh:
		for x in bw:
			if (int(tvar[y * bw + x]) >> 3) == 12 and absf(x * T - oyuncu.position.x) < 400 and absf(y * T - oyuncu.position.y) < 400:
				oyuncu.position = Vector2((bx0 + x) * T + 8, (by0 + y) * T + 8)
				print("KOPRU camur=", camur_mu(oyuncu.position), " carpan=", oyuncu._camur())
				return

func _yan_test(id: String) -> void:
	for i in 32: gorev.bitenler.append("X%d" % i)
	gorev.bitenler.append_array(["E2", "E3"])
	kopru.ana().fixed = true
	var q: Dictionary = yan.BY[id]
	zaman.dk = float(q.win[0]) + 20.0
	oyuncu.position = Vector2(q.x + 14, q.y + 6)
	while env.sv < 15: env.xp_ekle(800)
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	print("YAN gorunur=", yan.kisi_n[id].visible, " acik=", yan.acik_mi(q))
	yan._basla(q)
	konusma.visible = false
	for s in q.steps:
		await get_tree().create_timer(1.0).timeout
		konusma.visible = false
		var st = yan._adim()
		if st == null: break
		print("YAN adim=", st.t, " yazi=", yan.adim_yazi())
		if st.t == "collect" or st.t == "use":
			for k in st.ps:
				if st.t == "use": env.ekle(str(st.need))
				oyuncu.position = Vector2(q.pts[k].x, q.pts[k].y)
				await get_tree().create_timer(0.6).timeout
				while konusma.visible:
					konusma._cik()
					await get_tree().create_timer(0.2).timeout
			await get_tree().create_timer(0.8).timeout
			print("YAN toplandi got=", yan.A.got if yan.A != null else [])
		elif st.t == "bring":
			for it in st.items: env.ekle(str(it[0]), int(it[1]))
			oyuncu.position = Vector2(q.x + 10, q.y + 6)
			yan._konus(q)
		elif st.t == "back":
			oyuncu.position = Vector2(q.x + 10, q.y + 6)
			yan._konus(q)
		elif st.t == "go":
			oyuncu.position = Vector2(q.pts[st.p].x, q.pts[st.p].y)
		elif st.t == "chase":
			for k in 8:
				if yan.A == null or yan._adim() != st: break
				oyuncu.position = yan.A.keci + Vector2(4, 0)
				await get_tree().create_timer(1.6).timeout
				print("YAN kovala cnt=", yan.A.cnt if yan.A != null else -1)
		elif st.t == "escort":
			for k in 40:
				if yan.A == null or yan._adim() != st: break
				var hd: Vector2 = yan._hedef(st, q)
				oyuncu.position = oyuncu.position.move_toward(hd, 40.0)
				await get_tree().create_timer(0.5).timeout
			print("YAN eslik bitti? ", yan.A == null or yan._adim() != st)
		elif st.t == "kill":
			oyuncu.position = Vector2(q.pts[st.p].x, q.pts[st.p].y) + Vector2(0, 40)
			await get_tree().create_timer(1.0).timeout
			print("YAN canavar=", yan._canavarlar().size(), " yazi=", yan.adim_yazi())
			for c in yan._canavarlar(): c.vuruldu(99999, Vector2.RIGHT)
			await get_tree().create_timer(2.0).timeout
			print("YAN sonra yazi=", yan.adim_yazi())
		await get_tree().create_timer(1.0).timeout
		while konusma.visible:
			konusma._cik()
			await get_tree().create_timer(0.3).timeout
	print("YAN bitti=", yan.done.has(id), " vio=", env.vio)

func _ekin_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	while env.sv < 3: env.xp_ekle(200)
	var ek = gorev.kisi("k_ekin")
	oyuncu.position = ek.position + Vector2(-14, 4)
	await get_tree().create_timer(1.0).timeout
	konus_ya_da_istasyon(); print("EKIN 1 ", konusma.yazi.text.substr(0, 50)); konusma._cik()
	gorev._baslat(gorev.QI["EK1"], "k_ekin", true); print("EKIN 2 aktif ", gorev.aktif.id if gorev.aktif != null else "-"); konusma._cik()
	await get_tree().create_timer(1.0).timeout
	var q: Dictionary = yan.BY.ekin1
	print("EKIN satir ", gorev.satir(gorev.aktif.p[0]))
	for k in ["s1", "s2", "s3"]:
		oyuncu.position = Vector2(q.pts[k].x, q.pts[k].y) + Vector2(0, 6)
		await get_tree().create_timer(1.5).timeout
		if konusma.visible: konusma._cik()
		await get_tree().create_timer(0.6).timeout
		print("EKIN ", k, " ", gorev.satir(gorev.aktif.p[0]))
	env.ekle("Elma")
	oyuncu.position = Vector2(q.pts.k.x, q.pts.k.y) + Vector2(0, 6)
	await get_tree().create_timer(1.5).timeout
	if konusma.visible: konusma._cik()
	await get_tree().create_timer(0.8).timeout
	if konusma.visible: konusma._cik()
	print("EKIN kirpi ", gorev.satir(gorev.aktif.p[0]), " elma ", env.adet("Elma"))
	oyuncu.position = ek.position + Vector2(-14, 4)
	await get_tree().create_timer(2.0).timeout
	print("EKIN donus ", gorev.bitti("EK1"), " ", konusma.yazi.text.substr(0, 40))
	konusma._cik()
	await get_tree().create_timer(0.5).timeout
	konus_ya_da_istasyon(); print("EKIN veda ", konusma.yazi.text.substr(0, 40)); konusma._cik()
	await get_tree().create_timer(0.5).timeout
	print("EKIN gitti ", kuzen.tanis.has("ekin_gitti"), " gorunur ", ek.visible)

func _ada_test(q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	el_yapimi.bilinen["Gemi"] = true
	for id in ["E1", "E2", "E3", "E4", "E5", "EK1", "L1", "L2", "L3", "L4"]: gorev.bitenler.append(id)
	ciftlik.st = "gone"
	var dz = gorev.kisi("denizci")
	oyuncu.position = dz.position + Vector2(-40, 10)
	await get_tree().create_timer(1.5).timeout
	for i in 6:
		print("ADA sahne ", ciftlik.st, " ", konusma.yazi.text.substr(0, 40))
		if konusma.visible: konusma._cik()
		await get_tree().create_timer(0.3).timeout
	oyuncu.position = ciftlik.kayik() + Vector2(4, -6)
	print("ADA kayik ", ciftlik.etkiles())
	await get_tree().create_timer(2.0).timeout
	print("ADA adada ", ciftlik.adada(oyuncu.position), " ", oyuncu.position, " ekin ", ciftlik.ekin_n.position, " gorunur ", ciftlik.ekin_n.visible)
	for n in ["Tırmık", "Sulama kabı", "Tırpan"]: env.ekle(n)
	env.ekle("Buğday tohumu", 2)
	env.kemer[0] = "Tırmık"; env.kemer[1] = "Sulama kabı"; env.kemer[2] = "Tırpan"; env.el = 0; env.kemer_ciz()
	oyuncu.position = ciftlik.tarh(0) + Vector2(0, 2)
	for adim in [0, 0, 1, 2]:
		env.el = adim; env.kemer_ciz()
		if adim == 2: ciftlik.plots[0].t = 999.0
		print("ADA tarla ", ciftlik.etkiles(), " ", ciftlik.is_.get("ad", "-"))
		await get_tree().create_timer(2.0).timeout
		print("ADA tarh ", ciftlik.plots[0], " bugday ", env.adet("Buğday"))
	print("ADA kuyu ", ciftlik.etkiles())
	if q.contains("gece"): zaman.dk = 1320.0
	oyuncu.position = ciftlik.P(0, 2)

func _deniz_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	while env.sv < 3: env.xp_ekle(200)
	env.ekle("Olta")
	poyraz.gun_d = zaman.gun
	await get_tree().create_timer(1.5).timeout
	while konusma.visible:
		konusma._cik()
		await get_tree().create_timer(0.3).timeout
	print("DENIZ ph ", poyraz.ph, " D ", poyraz.gun_d)
	var pz = gorev.kisi("trader")
	oyuncu.position = pz.position + Vector2(0, 14)
	await get_tree().create_timer(0.5).timeout
	if konusma.visible: konusma._cik()
	konus_ya_da_istasyon(); print("DENIZ konus ", konusma.yazi.text.substr(0, 40)); konusma._cik()
	for id in ["G1", "G2", "G3", "G4"]: gorev.bitenler.append(id)
	await get_tree().create_timer(2.5).timeout
	print("DENIZ ph ", poyraz.ph, " ", konusma.yazi.text.substr(0, 30))
	if konusma.visible: konusma._cik()
	poyraz.harita_ac()
	await get_tree().create_timer(0.5).timeout
	poyraz._bolge_sec(poyraz.ZONES[0])
	print("DENIZ denizde ", poyraz.denizde, " paused ", get_tree().paused, " G5 acik ", gorev.acik(gorev.QI["G5"]))
	for i in 400:
		await get_tree().create_timer(0.1).timeout
		var f = poyraz.f
		if f == null: poyraz.bas()
		elif f.st == "bite" and f.t > 0.3: poyraz.bas()
		elif f.st == "reel" and f.pos > f.z0 + 0.02 and f.pos < f.z1 - 0.02: poyraz.bas()
		if poyraz.caught.size() >= 2 and i > 100: break
	print("DENIZ tutulan ", poyraz.caught, " log ", poyraz.log_)

func _kopek_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	zaman.gun = 5
	await get_tree().create_timer(1.0).timeout
	print("KOPEK wiz ", gezgin.wiz.shown)
	oyuncu.position = gezgin.wiz_n.position + Vector2(-10, 4)
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	konus_ya_da_istasyon(); print("KOPEK 1 ", konusma.yazi.text.substr(0, 30))
	konusma._sec(konusma.liste[0]); print("KOPEK 2 ", konusma.yazi.text.substr(0, 30))
	konusma._sec(konusma.liste[0]); print("KOPEK 3 ", konusma.yazi.text.substr(0, 30))
	konusma._sec(konusma.liste[0])
	await get_tree().create_timer(1.0).timeout
	print("KOPEK kopek ", gezgin.kopekler.size(), " menu ", gezgin.acik(), " wiz ", gezgin.wiz.shown)
	gezgin._sec(gezgin.kopekler[0], "Dal")
	gezgin.kapat()
	await get_tree().create_timer(25.0).timeout
	var d = gezgin.kopekler[0]
	print("KOPEK durum ", d.st, " torba ", d.bag, " dal ", env.adet("Dal"), " wiz ", gezgin.wiz.shown)
	gezgin._cagir_kopek(d)
	await get_tree().create_timer(12.0).timeout
	print("KOPEK cagir ", d.st, " torba ", d.bag, " dal ", env.adet("Dal"))
	zaman.gun = 21
	await get_tree().create_timer(1.5).timeout
	print("KOPEK v2 ", gezgin.wiz.shown, " ", gezgin.wiz.v2)

func _lamba_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	zaman.gun = 15; zaman.dk = 1100.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	print("LAMBA shown ", isikci.shown)
	oyuncu.position = isikci.n.position + Vector2(-12, 4)
	konus_ya_da_istasyon(); print("LAMBA 1 ", konusma.yazi.text.substr(0, 30)); konusma._sec(konusma.liste[0])
	print("LAMBA yan ", yan.act("isikci") != null, " ", yan.adim_yazi()); konusma._cik()
	env.ekle("Mor kıymık", 5); env.ekle("Gece sefası", 3); env.ekle("Tunç külçesi", 1)
	konus_ya_da_istasyon(); print("LAMBA 2 ", konusma.liste[0].t); konusma._sec(konusma.liste[0])
	print("LAMBA 3 ", konusma.yazi.text.substr(0, 20)); konusma._sec(konusma.liste[0])
	await get_tree().create_timer(1.5).timeout
	print("LAMBA son lamba ", isikci.lamba(), " gone ", isikci.gone, " yan bitti ", yan.done.has("isikci"), " isikta ", zaman.isikta(oyuncu.position))

func _hikaye_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	for id in ["N2", "N3", "N5", "N6", "N8"]: gorev.bitenler.append(id)
	var m = gorev.kisi("market")
	oyuncu.position = m.position + Vector2(0, 20)
	konusma.ac("Pazarcı Nazlı", null, "deneme", [{t = "Sat"}, {t = "Hoşça kal", kapat = true}])
	var L := []
	for s in konusma.liste: L.append(s.t)
	print("HIKAYE secenek ", L)
	konusma._sec(konusma.liste[1])
	for i in 5:
		konusma._sec(konusma.liste[0])
		print("HIKAYE parca ", hikaye.duydu, " ", konusma.yazi.text.substr(0, 30))
	await get_tree().create_timer(0.5).timeout
	print("HIKAYE sahne ", hikaye.cur != null, " paused ", get_tree().paused)
	await get_tree().create_timer(1.0).timeout
	for i in 4: hikaye._ileri()
	print("HIKAYE bitti ", hikaye.gordu, " paused ", get_tree().paused)

func _gemi_test() -> void:
	oyuncu.dokunulmaz = 9999.0
	el_yapimi.bilinen["Gemi"] = true
	for id in ["E1", "E2", "E3", "E4", "E5", "EK1", "L1", "L2", "L3", "L4", "L6", "L7", "L8"]: gorev.bitenler.append(id)
	ciftlik.st = "home"
	kuzen.tanis["denizci"] = true
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	gorev._baslat(gorev.QI["L5"], "denizci", true)
	while konusma.visible or sahne.acik:
		if konusma.visible: konusma._cik()
		if sahne.acik and sahne.faz == "oyna": sahne._bitir()
		await get_tree().create_timer(0.2).timeout
	print("GEMI aktif ", gorev.aktif.id if gorev.aktif != null else "-", " satir ", gorev.satir(gorev.aktif.p[0]) if gorev.aktif != null else "")
	for x in el_yapimi.R["Gemi"].i: env.ekle(str(x[0]), int(x[1]))
	oyuncu.position = enkaz.position + Vector2(0, 16)
	print("GEMI f ", konus_ya_da_istasyon(), " ", konusma.yazi.text.substr(0, 30))
	konusma._sec(konusma.liste[0])
	await get_tree().create_timer(1.0).timeout
	print("GEMI kuruldu ", kuzen.gemi, " tamam ", gorev.tamam())
	oyuncu.position = gorev.kisi("denizci").position + Vector2(-14, 4)
	await get_tree().create_timer(1.5).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.3).timeout
	print("GEMI L5 bitti ", gorev.bitti("L5"))
	konus_ya_da_istasyon()
	await get_tree().create_timer(0.5).timeout
	print("GEMI hikaye sahne ", hikaye.cur != null)
	hikaye._atla()
	await get_tree().create_timer(1.0).timeout
	print("GEMI teklif ", konusma.yazi.text.substr(0, 40))
	konusma._sec(konusma.liste[0])
	await get_tree().create_timer(4.0).timeout
	print("GEMI yolculuk ", kuzen.yol_t)

func _ada2_test(q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	if ada == 1:
		if q.contains("_don") and kuzen.tanis.has("act2"):
			print("ADA2 birinci adaya döndü; konum ", oyuncu.position, " portal ", portal.yer("Kemal"), " gorunur ", portal.P[0].n.visible)
			return
		el_yapimi.bilinen["Gemi"] = true
		kuzen.tanis["act2"] = true; kuzen.tanis["denizci"] = true
		env.ekle("Dal", 7)
		print("ADA2 gidiyor; dal ", env.adet("Dal"))
		seyahat(2, "land")
		return
	print("ADA2 ada ", ada, " konum ", oyuncu.position, " bio ", bio_at(oyuncu.position), " dal ", env.adet("Dal"), " kisiler ", kisiler.size(), " portallar ", portal.P.size(), " barbaros portal açık ", portal.acik_mi(portal.P[1]))
	var dz = gorev.kisi("denizci")
	oyuncu.position = dz.position + Vector2(-14, 4)
	konus_ya_da_istasyon(); print("ADA2 barbaros ", konusma.yazi.text.substr(0, 40)); konusma._cik()
	if q.contains("don"):
		oyuncu.position = portal.P[1].p + Vector2(0, 4)
		print("ADA2 portal f ", portal.etkiles())
	if q.contains("kopru2"):
		var b: Dictionary = kopru.ana()
		oyuncu.position = Vector2(b.x0 * T - 6, b.cy)
		env.ekle("Odun", 20)
		print("KB f ", kopru.f(), " ", konusma.yazi.text.substr(0, 60).replace("\n", " "))
		for c in konusma.liste.duplicate():
			if c.t == "Onar": konusma._sec(c)
		print("KB fixed ", b.fixed, " ustunde ", kopru.ustunde(Vector2(b.cx, b.cy)), " engel ", engel(Vector2(b.cx, b.cy)), " yaka ", kopru._yakalar(), " gecit ", gecit.x0, " ", gecit.engel(Vector2(gecit.cx, gecit.cy)))
	if q.contains("gokay"):
		bitenler_ekle(["gk1", "gk2", "gk3", "pv1", "pv2", "pv3", "sl1", "sl2", "sl3", "sl4", "mk1", "mk2", "mk3", "ej1", "ej2", "ej3", "ej4"])
		for g2 in ["gok", "pervin", "tamer", "selin", "alara"]: kuzen.tanis[g2] = true
		var Gk = gorev.kisi("tuna")
		await get_tree().create_timer(0.5).timeout
		print("GK hedef ", gorev.hedef().get("ad", "-"), " kart ", gorev.kart_baslik.text, " / ", gorev.kart_ad.text, " G ", Gk.position)
		oyuncu.position = Gk.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("GK 1 ", konusma.yazi.text.substr(0, 60)); konusma._cik()
		bitenler_ekle(["as1", "as2", "as3", "as4"])
		await get_tree().create_timer(0.3).timeout
		el_yapimi.bilinen["Roket"] = true
		for p in el_yapimi.R["Roket"].i: env.ekle(str(p[0]), int(p[1]))
		env.vio_ekle(3000)
		act2._yap(Gk, "Roket", 2000, act2.gokay)
		print("GK yaptı ", konusma.yazi.text.substr(0, 50), " ", env.adet("Roket"), " vio ", env.vio)
		konusma._cik()
		await get_tree().create_timer(0.3).timeout
		print("GK vis ", gorev.vis.map(func(x): return x.q.id))
		gorev.aktif = gorev.QI["as5"]; gorev.b = {}
		await get_tree().create_timer(0.6).timeout
		while konusma.visible:
			konusma._cik(); await get_tree().create_timer(0.2).timeout
		print("GK as5 ", gorev.bitti("as5"), " kart ", gorev.kart_ad.text)
		konus_ya_da_istasyon(); print("GK fırlat ", konusma.yazi.text.substr(0, 40))
		for c in konusma.liste.duplicate():
			if str(c.t).contains("Fırlat"): konusma._sec(c)
		await get_tree().create_timer(5.0).timeout
		print("GK faz ", roket.faz, " t ", roket.t)
		roket._gec(); await get_tree().create_timer(0.3).timeout; roket._gec(); await get_tree().create_timer(9.0).timeout
		print("GK faz2 ", roket.faz, " ", roket.yazi.text)
		roket._gec(); await get_tree().create_timer(0.3).timeout
		print("GK son ", roket.faz, " roket ", kuzen.tanis.has("roket"), " kart ", gorev.kart_ad.text)
	if q.contains("tomris"):
		bitenler_ekle(["gk1", "gk2", "gk3", "pv1", "pv2", "pv3", "sl1", "sl2", "sl3", "sl4", "mk1", "mk2", "mk3"])
		for g2 in ["gok", "pervin", "tamer", "selin"]: kuzen.tanis[g2] = true
		var Tm = gorev.kisi("alara")
		await get_tree().create_timer(0.5).timeout
		print("TM hedef ", gorev.hedef().get("ad", "-"), " kart ", gorev.kart_baslik.text, " / ", gorev.kart_ad.text, " T ", Tm.position)
		oyuncu.position = Tm.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("TM 1 ", konusma.yazi.text.substr(0, 60)); konusma._cik()
		bitenler_ekle(["ej1", "ej2", "ej3", "ej4"])
		await get_tree().create_timer(0.3).timeout
		el_yapimi.bilinen["Işın kılıcı"] = true
		for p in el_yapimi.R["Işın kılıcı"].i: env.ekle(str(p[0]), int(p[1]))
		env.vio_ekle(1000)
		konus_ya_da_istasyon()
		for c in konusma.liste.duplicate():
			if str(c.t).contains("Işın kılıcı"): konusma._sec(c)
		print("TM yaptı ", konusma.yazi.text.substr(0, 50), " ", env.adet("Işın kılıcı"), " vio ", env.vio, " kart ", gorev.kart_ad.text, " verilen ", el_yapimi.verilen.has("Plazma hücresi"))
		konusma._cik()
		env.el = env.kemer.find("Işın kılıcı")
		print("TM silah ", oyuncu.silah_v())
	if q.contains("isin"):
		bitenler_ekle(["gk1", "gk2", "gk3", "pv1", "pv2", "pv3", "sl1", "sl2", "sl3", "sl4"])
		kuzen.tanis["gok"] = true; kuzen.tanis["pervin"] = true; kuzen.tanis["tamer"] = true
		var Is = gorev.kisi("selin")
		await get_tree().create_timer(0.5).timeout
		print("IS hedef ", gorev.hedef().get("ad", "-"), " kart ", gorev.kart_baslik.text, " / ", gorev.kart_ad.text, " I ", Is.position)
		oyuncu.position = Is.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("IS 1 ", konusma.yazi.text.substr(0, 60)); konusma._cik()
		await get_tree().create_timer(0.4).timeout
		print("IS pv4 verilebilir ", gorev.acik(gorev.QI["pv4"]), " vis ", gorev.vis.map(func(x): return x.q.id))
		bitenler_ekle(["mk1", "mk2", "mk3"])
		await get_tree().create_timer(0.3).timeout
		el_yapimi.bilinen["Meka zırh"] = true
		for p in el_yapimi.R["Meka zırh"].i: env.ekle(str(p[0]), int(p[1]))
		env.vio_ekle(1000)
		konus_ya_da_istasyon()
		for c in konusma.liste.duplicate():
			if str(c.t).contains("Meka"): konusma._sec(c)
		print("IS yaptı ", konusma.yazi.text.substr(0, 50), " ", env.adet("Meka zırh"), " vio ", env.vio, " kart ", gorev.kart_ad.text)
		konusma._cik()
		var h0: float = oyuncu.hp_max; var m0: float = stat("move")
		giy("Meka zırh")
		print("IS giydi can ", h0, " → ", oyuncu.hp_max, " hız ", m0, " → ", stat("move"))
	if q.contains("tufan"):
		bitenler_ekle(["gk1", "gk2", "gk3", "pv1", "pv2", "pv3"])
		el_yapimi.bilinen["Ateş asası"] = true
		kuzen.tanis["gok"] = true; kuzen.tanis["pervin"] = true
		var Tf = gorev.kisi("tamer")
		await get_tree().create_timer(0.5).timeout
		print("TF hedef ", gorev.hedef().get("ad", "-"), " kart ", gorev.kart_baslik.text, " / ", gorev.kart_ad.text, " T ", Tf.position)
		oyuncu.position = Tf.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("TF 1 ", konusma.yazi.text.substr(0, 60)); konusma._cik()
		bitenler_ekle(["sl1", "sl2", "sl3", "sl4"])
		await get_tree().create_timer(0.3).timeout
		print("TF verilen ", el_yapimi.verilen.keys().filter(func(x): return x in ["Tabanca", "Pompalı", "Barut", "Tabanca mermisi"]))
		el_yapimi.bilinen["Tabanca"] = true; el_yapimi.bilinen["Tabanca mermisi"] = true; el_yapimi.bilinen["Pompalı"] = true
		for p in el_yapimi.R["Tabanca"].i: env.ekle(str(p[0]), int(p[1]))
		for p in el_yapimi.R["Tabanca mermisi"].i: env.ekle(str(p[0]), int(p[1]))
		env.vio_ekle(1000)
		el_yapimi.yap("Tabanca mermisi")
		print("TF mermi ", env.adet("Tabanca mermisi"))
		konus_ya_da_istasyon()
		for c in konusma.liste.duplicate():
			if str(c.t).contains("Tabanca"): konusma._sec(c)
		print("TF yaptı ", konusma.yazi.text.substr(0, 50), " ", env.adet("Tabanca"), " vio ", env.vio, " kart ", gorev.kart_ad.text)
		konusma._cik()
		env.ekle("Pompalı", 1); env.ekle("Pompalı fişeği", 3)
		for sn in ["Pompalı", "Tabanca", "Tabanca"]:
			env.el = env.kemer.find(sn)
			oyuncu.position = Tf.position + Vector2(0, 200)
			for c in canlilari_ver(): c.queue_free()
			await get_tree().process_frame
			var c1 = _canli_yeni("Bulut koyunu", oyuncu.position + Vector2(70, 0), 1)
			oyuncu.bakis = Vector2(1, 0)
			var h0: float = c1.hp
			oyuncu.vur(Vector2(1, 0))
			await get_tree().create_timer(0.6).timeout
			print("TF ", sn, " elde ", env.elde(), " hasar ", h0 - c1.hp, " mermi ", env.adet("Tabanca mermisi"), " fişek ", env.adet("Pompalı fişeği"))
	if q.contains("efsun"):
		bitenler_ekle(["gk1", "gk2", "gk3"])
		var E = gorev.kisi("pervin")
		await get_tree().create_timer(0.5).timeout
		print("EF hedef ", gorev.hedef().get("ad", "-"), " kart ", gorev.kart_baslik.text, " / ", gorev.kart_ad.text, " E ", E.position, " mana açık ", buyu.acik_mi(), " bar ", buyu.bar.visible)
		oyuncu.position = E.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("EF 1 ", konusma.yazi.text.substr(0, 60)); konusma._cik()
		await get_tree().create_timer(0.3).timeout
		konus_ya_da_istasyon(); print("EF 2 ", konusma.yazi.text.substr(0, 70).replace("\n", " ")); konusma._cik()
		await get_tree().create_timer(0.3).timeout
		while konusma.visible:
			konusma._cik(); await get_tree().create_timer(0.2).timeout
		print("EF aktif ", gorev.aktif.id if gorev.aktif != null else "-")
		gorev.aktif = null
		bitenler_ekle(["pv1", "pv2", "pv3"])
		await get_tree().create_timer(0.3).timeout
		print("EF verilen ", el_yapimi.verilen.has("Ateş asası"), " ", el_yapimi.verilen.has("Mana iksiri"))
		el_yapimi.bilinen["Ateş asası"] = true; el_yapimi.bilinen["Buz asası"] = true; el_yapimi.bilinen["Yıldırım asası"] = true
		for p in el_yapimi.R["Ateş asası"].i: env.ekle(str(p[0]), int(p[1]))
		env.vio_ekle(1000)
		konus_ya_da_istasyon(); print("EF menü ", konusma.yazi.text.substr(0, 40))
		var bt := []
		for c in konusma.liste: bt.append(c.t)
		print("EF seçenekler ", bt)
		for c in konusma.liste.duplicate():
			if str(c.t).contains("Ateş asası"): konusma._sec(c)
		print("EF yaptı ", konusma.yazi.text.substr(0, 40), " asa ", env.adet("Ateş asası"), " vio ", env.vio)
		konusma._cik()
		for h in ["Buz asası", "Yıldırım asası"]: env.ekle(h, 1)
		for sn in ["Ateş asası", "Buz asası", "Yıldırım asası"]:
			env.el = env.kemer.find(sn)
			buyu.mana = 200.0
			oyuncu.position = E.position + Vector2(0, 200)
			for c in canlilari_ver(): c.queue_free()
			await get_tree().process_frame
			var c1 = _canli_yeni("Bulut koyunu", oyuncu.position + Vector2(60, 0), 1)
			var c2 = _canli_yeni("Bulut koyunu", oyuncu.position + Vector2(100, 10), 2)
			oyuncu.bakis = Vector2(1, 0)
			var h0: float = c1.hp; var h2: float = c2.hp
			oyuncu.vur(Vector2(1, 0))
			await get_tree().create_timer(0.8).timeout
			print("EF ", sn, " elde ", env.elde(), " mana ", int(buyu.mana), " hasar ", h0 - c1.hp, " ikinci ", h2 - c2.hp, " donuk ", c1.donuk)
	if q.contains("yildiz"):
		var Y = gorev.kisi("gok")
		print("YZ hedef ", gorev.hedef().get("ad", "-"), " kazan ", toplama_veri.istasyon.kazan, " Y ", Y.position, " portal Yıldız açık ", portal.acik_mi(portal.P[0]))
		oyuncu.position = Y.position + Vector2(-14, 4)
		konus_ya_da_istasyon(); print("YZ 1 ", konusma.yazi.text.substr(0, 50)); konusma._cik()
		await get_tree().create_timer(0.3).timeout
		print("YZ isaret ", gorev.isaret("gok"), " vis ", gorev.vis.map(func(x): return x.q.id))
		for gi in ["gk1", "gk2", "gk3"]:
			konus_ya_da_istasyon(); print("YZ ver ", konusma.yazi.text.substr(0, 60).replace("\n", " ")); konusma._cik()
			await get_tree().create_timer(0.3).timeout
			if sahne.acik and sahne.faz == "oyna": sahne._bitir()
			while konusma.visible:
				konusma._cik(); await get_tree().create_timer(0.2).timeout
			print("YZ aktif ", gorev.aktif.id if gorev.aktif != null else "-", " kart ", gorev.kart_ad.text, " ", gorev.satir(gorev.aktif.p[0]) if gorev.aktif != null else "")
			if gi == "gk1": env.ekle("Ulu odun kalası", 4); env.ekle("Halat", 2)
			if gi == "gk2": zaman.gun += 1
			if gi == "gk3": env.ekle("Kristal", 2); env.ekle("Demir levha", 2); env.ekle("Mor kıymık", 2)
			await get_tree().create_timer(0.6).timeout
			while konusma.visible:
				print("YZ teslim ", konusma.yazi.text.substr(0, 60).replace("\n", " ")); konusma._cik(); await get_tree().create_timer(0.2).timeout
			print("YZ bitti ", gi, " ", gorev.bitti(gi), " vio ", env.vio)
		await get_tree().create_timer(0.5).timeout
		print("YZ portallar ", portal.bilinen(), " Yıldız portalı ", portal.acik_mi(portal.P[0]), " kart ", gorev.kart_ad.text)
		konus_ya_da_istasyon(); print("YZ son ", konusma.yazi.text.substr(0, 50)); konusma._cik()
		oyuncu.position = Vector2(toplama_veri.istasyon.kazan.x, toplama_veri.istasyon.kazan.y) + Vector2(-12, 6)
		konus_ya_da_istasyon(); print("YZ kazan ", istasyon.baslik.text, " ", istasyon.pencere.visible); istasyon.pencere.visible = false
		oyuncu.dokunulmaz = 9999.0
		await get_tree().create_timer(6.0).timeout
		var tc := {}
		for c in canlilari_ver(): tc[c.tur] = int(tc.get(c.tur, 0)) + 1
		print("YZ canlılar ", tc, " bio ", bio_at(oyuncu.position))

func _imza_test(_q: String) -> void:
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	oyuncu.hp_max = 99999.0; oyuncu.hp = 99999.0
	var bul := false
	for rr in range(2, 60):
		for an in 16:
			var q: Vector2 = oyuncu.position + Vector2(cos(an * TAU / 16.0), sin(an * TAU / 16.0)) * rr * 16.0
			var ok := true
			for o in [Vector2.ZERO, Vector2(60, 0), Vector2(-60, 0), Vector2(0, 60), Vector2(0, -60), Vector2(90, 10)]:
				if tile_at(q + o) != 0 or engel(q + o, 6.0, true): ok = false
			if ok:
				oyuncu.position = q; bul = true; break
		if bul: break
	print("IMZA çimen yeri ", bul)
	for k in ["Geyik", "Yaban domuzu", "Dikenli kirpi", "Engerek"]:
		for c in canlilari_ver(): c.queue_free()
		await get_tree().process_frame
		var a = _canli_yeni(k, oyuncu.position + Vector2(60, 0), 1)
		a.mad = true; a.imza_t = 0.5
		var gor := {}
		var h0: float = oyuncu.hp
		for i in 50:
			await get_tree().create_timer(0.1).timeout
			if not a.imza.is_empty(): gor[str(a.imza.tip)] = true
		print("IMZA ", k, " hamleler ", gor.keys(), " oyuncu hasar ", h0 - oyuncu.hp)
	for c in canlilari_ver(): c.queue_free()
	await get_tree().process_frame
	var w1 = _canli_yeni("Kurt", oyuncu.position + Vector2(50, 0), 2)
	var w2 = _canli_yeni("Kurt", oyuncu.position + Vector2(80, 10), 2)
	w1.mad = true; w2.mad = true
	await get_tree().create_timer(2.0).timeout
	var a1: float = (w1.position - oyuncu.position).angle(); var a2: float = (w2.position - oyuncu.position).angle()
	print("IMZA sürü açı farkı ", rad_to_deg(absf(angle_difference(a1, a2))), " uzaklıklar ", w1.position.distance_to(oyuncu.position), " ", w2.position.distance_to(oyuncu.position))

func _ders_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	env.sv = 8; env.vio_ekle(1000)
	var n := 0
	for i in harita_k.kesif.size():
		if int(bio_arr[i]) == 1 and n < 70:
			harita_k.kesif[i] = 1; n += 1
	var alp = alp_dugum()
	oyuncu.position = alp.position + Vector2(30, 10)
	dovus.liste(alp)
	print("DERS liste ", konusma.yazi.text.replace("\n", " | ").substr(0, 300))
	print("DERS seçenekler ", konusma.liste.map(func(c): return c.t))
	for c in konusma.liste.duplicate():
		if c.t == "Çift vuruş": konusma._sec(c)
	await get_tree().create_timer(0.5).timeout
	print("DERS açık ", dovus.acik(), " ", dovus.kutu.text.replace("\n", " | "), " vio ", env.vio)
	env.ekle("Demir kılıç", 1); env.el = env.kemer.find("Demir kılıç")
	for k in 9:
		var c = dovus.can_
		oyuncu.position = c.position + Vector2(-18, 0); oyuncu.st = oyuncu.st_max; oyuncu.atk_cd = 0.0; ozel.cd = 0.0
		ozel.bas(Vector2.RIGHT); await get_tree().create_timer(0.08).timeout; ozel.bas(Vector2.RIGHT)
		await get_tree().create_timer(0.6).timeout
		if not dovus.acik(): break
	print("DERS bitti ", not dovus.acik(), " öğrenildi ", kuzen.tanis.has("ders_double"), " sv xp ", env.xp if "xp" in env else -1)
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	kuzen.tanis["act2"] = true
	ult = 100.0
	for c in canlilari_ver(): c.queue_free()
	await get_tree().process_frame
	var g = _canli_yeni("Geyik", oyuncu.position + Vector2(30, 0), 7)
	g.D = g.D.duplicate(); g.hp = 5000.0; g.D.spd = 0.0
	print("DERS ulti hazır ", dovus.ulti_hazir(), " bar ", dovus.bar.visible)
	dovus.ulti()
	await get_tree().create_timer(1.2).timeout
	print("DERS ulti hasar ", 5000.0 - g.hp, " ult ", ult, " uzaklık ", g.position.distance_to(oyuncu.position), " r ", g.D.r)

func _ozel_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	var P := oyuncu.position
	env.ekle("Demir kılıç", 1); env.el = env.kemer.find("Demir kılıç")
	var yeni = func() -> Node:
		for c in canlilari_ver(): c.queue_free()
		await get_tree().process_frame
		var a = _canli_yeni("Geyik", oyuncu.position + Vector2(22, 0), 9)
		a.D = a.D.duplicate(); a.hp = 5000.0; a.D.spd = 0.0
		oyuncu.st = 200.0; oyuncu.st_max = 200.0; oyuncu.atk_cd = 0.0; ozel.cd = 0.0
		return a
	# kapalı: çift tık normal vuruş
	var a = await yeni.call()
	ozel.bas(Vector2.RIGHT); await get_tree().create_timer(0.1).timeout; ozel.bas(Vector2.RIGHT)
	await get_tree().create_timer(0.4).timeout
	print("OZEL kapalı çift ", 5000.0 - a.hp)
	kuzen.tanis["act2"] = true
	a = await yeni.call()
	ozel.bas(Vector2.RIGHT); await get_tree().create_timer(0.1).timeout; ozel.bas(Vector2.RIGHT)
	await get_tree().create_timer(0.4).timeout
	print("OZEL çift kesik ", 5000.0 - a.hp)
	a = await yeni.call()
	ozel.bas(Vector2.RIGHT); await get_tree().create_timer(0.9).timeout; ozel.birak()
	await get_tree().create_timer(0.3).timeout
	print("OZEL güçlü ", 5000.0 - a.hp)
	a = await yeni.call()
	a.position = oyuncu.position + Vector2(110, 0)
	yetenekler["S1"] = true; oyuncu.bakis = Vector2.RIGHT; oyuncu._atil(Vector2.RIGHT); await get_tree().create_timer(0.1).timeout; ozel.bas(Vector2.RIGHT)
	await get_tree().create_timer(0.4).timeout
	print("OZEL takla vuruşu ", 5000.0 - a.hp)
	a = await yeni.call()
	ozel.bas(Vector2.RIGHT); await get_tree().create_timer(0.05).timeout
	var bek: float = ozel._sure()
	await get_tree().create_timer(bek).timeout; ozel.bas(Vector2.RIGHT)
	await get_tree().create_timer(0.36).timeout; ozel.bas(Vector2.RIGHT)
	await get_tree().create_timer(0.7).timeout
	print("OZEL ritim (normal + ters + ağır) ", 5000.0 - a.hp)

func _s2b_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	print("S2B ihtimal Demir kılıç ", krit_ihtimal("Demir kılıç"), " Mor kristal topuz ", krit_ihtimal("Mor kristal topuz"), " Taş kılıç ", krit_ihtimal("Taş kılıç"), " Tabanca ", krit_ihtimal("Tabanca"))
	var P := oyuncu.position
	for c in canlilari_ver(): c.queue_free()
	await get_tree().process_frame
	# savuşturma sonrası kritik
	env.ekle("Taş kılıç", 1); env.el = env.kemer.find("Taş kılıç")
	var a = _canli_yeni("Yaban domuzu", P + Vector2(18, 0), 1)
	a.set_meta("pc", true)
	var h0: float = a.hp
	oyuncu.atk_cd = 0.0; oyuncu.st = 100.0
	oyuncu.vur(Vector2(1, 0))
	print("S2B kritik hasar ", h0 - a.hp, " (Taş kılıç 12)")
	a.queue_free()
	await get_tree().process_frame
	# topuz kombo
	env.ekle("Taş topuz", 1); env.el = env.kemer.find("Taş topuz")
	var b = _canli_yeni("Geyik", P + Vector2(18, 0), 2)
	for i in 5:
		oyuncu.atk_cd = 0.0; oyuncu.st = 100.0
		var hb: float = b.hp
		oyuncu.vur(Vector2(1, 0))
		print("S2B topuz ", i, " hasar ", hb - b.hp, " kombo ", oyuncu.kombo)
		await get_tree().create_timer(0.3).timeout
	b.queue_free()
	# savaş çekici çevre
	env.ekle("Taş savaş çekici", 1); env.el = env.kemer.find("Taş savaş çekici")
	var c1 = _canli_yeni("Geyik", P + Vector2(20, 0), 3)
	var c2 = _canli_yeni("Geyik", P + Vector2(40, 10), 4)
	var g2: float = c2.hp
	for i in 3:
		oyuncu.atk_cd = 0.0; oyuncu.st = 100.0
		oyuncu.vur(Vector2(1, 0))
		await get_tree().create_timer(0.3).timeout
	print("S2B çekiç ikinciye ", g2 - c2.hp, " sersem ", c1.sersem)
	c1.queue_free(); c2.queue_free()
	await get_tree().process_frame
	# sapan ve bola
	env.ekle("Sapan", 1); env.ekle("Taş", 3); env.el = env.kemer.find("Sapan")
	var k1 = _canli_yeni("Keklik", P + Vector2(80, 0), 5)
	buyu.scd = 0.0
	oyuncu.vur(Vector2(1, 0))
	print("S2B sapan atış ", buyu.shots.map(func(x): return [x.p, x.v, x.left]), " hedef ", k1.position, " oyuncu ", oyuncu.position, " elde ", env.elde())
	await get_tree().create_timer(0.6).timeout
	print("S2B sapan keklik sersem ", k1.sersem, " taş ", env.adet("Taş"), " hp ", k1.hp)
	k1.queue_free()
	await get_tree().process_frame
	env.ekle("Bola", 1); env.el = env.kemer.find("Bola")
	var k2 = _canli_yeni("Geyik", P + Vector2(80, 0), 6)
	buyu.scd = 0.0
	oyuncu.vur(Vector2(1, 0))
	await get_tree().create_timer(0.6).timeout
	print("S2B bola yavaş ", k2.yavas)
	# ok seçimi ve bileme
	env.ekle("Basit ok", 3); env.ekle("Bakır ok", 3)
	env._canta_tik("Basit ok")
	print("S2B seçili ", buyu.secili_ok, " ok ", buyu._ok()[0])
	env.ekle("Odun yayı", 1); env.dayan["Odun yayı"] = 3
	print("S2B bileme ", bileme())

func _yay_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	env.ekle("Odun yayı", 1); env.ekle("Basit ok", 5); env.ekle("Alevli Bakır ok", 2)
	env.el = env.kemer.find("Odun yayı")
	print("YAY elde ", env.elde(), " tür ", env.elde_tur())
	for sn in 3:
		for c in canlilari_ver(): c.queue_free()
		await get_tree().process_frame
		var c1 = _canli_yeni("Yaban domuzu", oyuncu.position + Vector2(90, 0), 1)
		oyuncu.bakis = Vector2(1, 0)
		var h0: float = c1.hp
		oyuncu.vur(Vector2(1, 0))
		print("YAY ok uçuyor ", buyu.shots.size(), " ", buyu.shots.map(func(x): return [x.p, x.v]), " hedef ", c1.position, " oyuncu ", oyuncu.position, " scd ", buyu.scd)
		await get_tree().create_timer(0.1).timeout
		print("YAY 0.1 ", buyu.shots.map(func(x): return x.p), " ", c1.position)
		await get_tree().create_timer(0.2).timeout
		var h1: float = c1.hp
		await get_tree().create_timer(2.2).timeout
		print("YAY atış ", sn, " hasar ", h0 - h1, " etki ", c1.etkiler.keys(), " sonra ", h1 - c1.hp, " ok ", env.adet("Alevli Bakır ok"), "/", env.adet("Basit ok"), " dayanıklılık ", env.dayan.get("Odun yayı", -1))
	env.ekle("Alevli Taş kılıç", 1)
	env.el = env.kemer.find("Alevli Taş kılıç")
	for c in canlilari_ver(): c.queue_free()
	await get_tree().process_frame
	var c2 = _canli_yeni("Yaban domuzu", oyuncu.position + Vector2(18, 0), 2)
	oyuncu.vur(Vector2(1, 0))
	await get_tree().create_timer(0.2).timeout
	print("YAY kılıç etki ", c2.etkiler)
	var y0: int = env.adet("Basit ok")
	el_yapimi.bilinen["Basit ok"] = true
	for p in el_yapimi.R["Basit ok"].i: env.ekle(str(p[0]), int(p[1]))
	el_yapimi.yap("Basit ok")
	print("YAY yapım ", env.adet("Basit ok") - y0)

func _reis_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	var k := "Tavşan"
	print("REIS gerek ", reis.gerek(k), " Kurt ", reis.gerek("Kurt"), " Geyik ", reis.gerek("Geyik"))
	reis.bc[k] = reis.gerek(k) - 1
	var c = _canli_yeni(k, oyuncu.position + Vector2(40, 0), 0)
	await get_tree().process_frame
	c.vuruldu(9999, Vector2.RIGHT)
	await get_tree().create_timer(1.0).timeout
	var r = reis._canli(k)
	print("REIS geldi ", r != null, " ", r.tur if r else "", " can ", r.hp if r else 0, " vuruş ", r.D.dmg if r else 0, " xp ", r.D.xp if r else 0)
	oyuncu.dokunulmaz = 0.0
	oyuncu.position = r.position + Vector2(30, 0)
	await get_tree().create_timer(3.5).timeout
	print("REIS halka ", reis.slamlar.size(), " can ", oyuncu.hp)
	r.vuruldu(99999, Vector2.RIGHT)
	await get_tree().create_timer(0.5).timeout
	print("REIS yenildi ", reis.bd, " sayaç ", reis.bc)

func _harita_test(_q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	var p0 := oyuncu.position
	for k in 40:
		oyuncu.position = p0 + Vector2(k * 40.0, sin(k * 0.4) * 120.0)
		await get_tree().process_frame
	oyuncu.position = p0
	var n := 0
	for q2 in yan.Q:
		if yan.var_mi(q2) and not yan.done.has(q2.id): n += 1
	print("HARITA yüzde ", harita_k.yuzde(), " yan görünür ", n, " kayit uzunluk ", harita_k.kayit().length())
	harita_k.ac()
	await get_tree().create_timer(1.0).timeout
	print("HARITA açık ", harita_k.acik(), " ", harita_k.bilgi.text)

func _ani_test(q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	await get_tree().create_timer(1.0).timeout
	while konusma.visible:
		konusma._cik(); await get_tree().create_timer(0.2).timeout
	ad_sevgili = "Elif"; ad_kahraman = "Can"
	var x0: int = env.xp if "xp" in env else 0
	ani.getir(ani.sonraki_a1(), "quest")
	await get_tree().create_timer(1.5).timeout
	print("ANI açık ", ani.visible, " ", ani.ad_yazi.text, " | ", ani.metin.text.substr(0, 60), " | ", ani.dugme.text)
	for k in 6:
		if ani.cur == null: break
		ani._ileri(); await get_tree().create_timer(0.2).timeout
	print("ANI bitti ", ani.mems.keys(), " tür ", ani.tur)
	var i := 14 if q.contains("waffle") else (5 if q.contains("sahil") else 17)
	ani.izle(i)
	ani.cur.line = 1 if i != 5 else 0
	ani._satir()
	await get_tree().create_timer(1.2).timeout
	print("ANI izle ", ani.ad_yazi.text, " | ", ani.metin.text.substr(0, 80))

func bitenler_ekle(L: Array) -> void:
	for id in L:
		if not gorev.bitti(id): gorev.bitenler.append(id)

func _dz_test() -> void:
	await get_tree().create_timer(2.0).timeout
	print("DZ yakin ", konus_ya_da_istasyon(), " ", konusma.yazi.text.substr(0, 60))
	konusma._cik()
	await get_tree().create_timer(0.5).timeout
	print("DZ ikinci ", konus_ya_da_istasyon(), " ", konusma.yazi.text.substr(0, 60), " aktif ", gorev.aktif.id if gorev.aktif != null else "-")

func _balik_test(q: String) -> void:
	oyuncu.dokunulmaz = 9999.0
	# Çayır'da nehir kıyısı ara: oyuncunun çevresinde suya bakan kara karesi
	var P := oyuncu.position
	var bul := Vector2.ZERO
	var bd := 1e18
	var cx := int(P.x / T) - bx0
	var cy := int(P.y / T) - by0
	for y in range(maxi(1, cy - 150), mini(bh - 1, cy + 150)):
		for x in range(maxi(1, cx - 150), mini(bw - 2, cx + 150)):
			if tiles[y * bw + x] == 3 and tiles[y * bw + x - 1] <= 2:
				var p := Vector2((x + bx0 - 1) * T + 8, (y + by0) * T + 8)
				var dd := p.distance_squared_to(P)
				if dd < bd and not engel(p):
					bd = dd
					bul = p
	if q.contains("baliktest"):
		oyuncu.position = bul
		oyuncu.bakis = Vector2(1, 0)
		env.ekle("Olta")
		env.kemer[0] = "Olta"; env.el = 0; env.kemer_ciz()
		gorev._baslat(gorev.QI["N2"], "market", true)
		if konusma.visible: konusma._cik()
		balik.oto = true
		print("BALIK yer ", bul, " su_onde ", balik.su_onde(), " etkiles ", balik.etkiles())
	if q.contains("tuzaktest"):
		env.ekle("Tuzak"); env.ekle("Balık kapanı")
		env.kemer[0] = "Tuzak"; env.kemer[1] = "Balık kapanı"; env.el = 0; env.kemer_ciz()
		print("TUZAK kur ", balik.etkiles(), " ", tile_at(oyuncu.position))
		oyuncu.position = bul; oyuncu.bakis = Vector2(1, 0); env.el = 1
		print("TUZAK kapan ", balik.etkiles(), " sayi ", balik.tuzaklar.size())
		for t in balik.tuzaklar: t.t = 1.0
		await get_tree().create_timer(3.0).timeout
		for t in balik.tuzaklar: print("TUZAK av ", t.k, " ", t.tur, " ", t.got)
		print("TUZAK kapan al ", balik.etkiles(), " qc ", gorev.qc)
		print("TUZAK kayit ", JSON.stringify(balik.kayit()))
	if q.contains("gecetest"):
		zaman.dk = 1320.0
		await get_tree().create_timer(14.0).timeout
		var L := []
		for n in balik.gece_dugum: L.append([n.ad, int(n.position.distance_to(oyuncu.position))])
		print("GECE ", L, " bocek ", balik.bocek.size())
		if not balik.gece_dugum.is_empty():
			oyuncu.position = balik.gece_dugum[0].position + Vector2(0, 6)
			print("GECE koruyor ", balik.koruyor(oyuncu.position), " isikta ", zaman.isikta(oyuncu.position))

func _kir_test() -> void:
	var c0: Vector2i = insa.karo(oyuncu.position)
	for i in range(-3, 4):
		for c in [c0 + Vector2i(i, -3), c0 + Vector2i(i, 3), c0 + Vector2i(-3, i), c0 + Vector2i(3, i)]:
			insa.G1[c] = {k = 2, turn = false}
			insa._duvar_yenile(c)
	insa.avlu_hesapla()
	print("KIRTEST avlu=", insa.AVLU.size(), " ic=", insa.avluda(oyuncu.position))
	_canli_koy("Kurt", 6.0, 2.0)
	for c in nesneler.get_children():
		if c.get("tur") == "Kurt": c.mad = true
	for k in 20:
		await get_tree().create_timer(2.0).timeout
		var kr := 0
		for c in insa.G1: if insa.G1[c].get("kirik", false): kr += 1
		print("KIRTEST t=", k * 2, " hasar=", insa.HP.size(), " kirik=", kr, " avlu=", insa.AVLU.size(), " can=", oyuncu.hp)

func _canli_koy_yakin(k: String, min_kare: float) -> void:
	_canli_koy(k, min_kare, 2.0)

func _canli_koy(k: String, min_kare: float, aralik: float = 14.0) -> void:
	var D: Dictionary = canlilar[k]
	var land: Array = D.landTiles
	for deneme in 300:
		var p := oyuncu.position + Vector2.from_angle(rng.randf() * TAU) * rng.randf_range(min_kare, min_kare + aralik) * T
		if not land.has(float(tile_at(p))) or engel(p, 6.0):
			continue
		var d := p.distance_to(oyuncu.position)
		if d < min_kare * T or d > (min_kare + aralik) * T:
			continue
		var c := preload("res://scripts/canli.gd").new()
		c.oyun = self
		c.tur = k
		c.D = D
		c.position = p
		nesneler.add_child(c)
		return

## kritik vuruş (web v3.11; belge Silahlar › Kritik vuruş): normal hasarın %50 fazlası (Ölümcül vuruş ile %80); savuşturmayla sersemleyen canlıya
## ilk vuruş her zaman kritik. İhtimal = (seviye 2'den her seviye %0,2 + Keskin göz I %3 / II %6 + silahın kademesi × %1) × silah türü.
const KRIT_KADEME := [["Tunç", 1], ["Granit", 1], ["Meşe", 1], ["Ihlamur", 1], ["Demir", 2], ["Timsah", 2], ["Kızılağaç", 2], ["Söğüt", 2], ["Çelik", 3], ["Gümüş", 3], ["Kuvars", 3], ["Akçaağaç", 3], ["Huş", 3],
	["Kara çelik", 4], ["Ejder", 4], ["Obsidyen", 4], ["Kızıl sedir", 4], ["Kor odun", 4], ["Mor kristal", 5], ["Ametist", 5], ["Gece ağacı", 5], ["Işık ağacı", 5]]
const KRIT_ACT2 := ["Tabanca", "Pompalı", "Işın kılıcı", "Ateş asası", "Buz asası", "Yıldırım asası"]
## ulti çubuğu (web v122 ULT): isabet +1,5, özel vuruş +4, ritimli 2. +5, ritimli 3. +10, savuşturma +10
func ult_ekle(n: float) -> void:
	ult = minf(100.0, ult + n)

func krit_ihtimal(n: String) -> float:
	if n == "": return 0.0
	var tur := ""
	if env.G.tools.has(n): tur = str(env.G.tools[n].kind)
	elif kusanma.silah.has(n):
		var w: Dictionary = kusanma.silah[n]
		tur = "spear" if w.kind == "hunt" else (str(w.mace) if w.mace != null else "sword")
	var m := float({"bow": 1.5, "gun": 1.5, "spear": 1.2, "topuz": 1.1, "sword": 1.0, "staff": 0.8, "gurz": 0.6}.get(tur, 0.0))
	var t := 6 if KRIT_ACT2.has(n) else 0
	if t == 0:
		for k in KRIT_KADEME:
			if n.begins_with(str(k[0])):
				t = int(k[1]); break
	if m == 0.0 or t == 0: return 0.0
	var lv := maxf(0.0, (env.sv - 1) * 0.2)
	return (lv + (6.0 if sk("K4") else (3.0 if sk("H6") else 0.0)) + t) * m

func kritik(dm: int, n: String, a) -> int:
	var zorla: bool = a != null and a.has_meta("pc")
	if zorla: a.remove_meta("pc")
	var c := krit_ihtimal(n)
	if not zorla and (c <= 0.0 or randf() * 100.0 >= c): return dm
	var ex := maxi(1, int(round(dm * (0.8 if sk("H8") else 0.5))))
	if a != null:
		yazi(a.position + Vector2(0, -26), "KRİTİK! -%d" % ex, Color("#ff4a3a"), 11)
		for i in 10:
			var tt := randf() * TAU
			var sp := 60.0 + randf() * 80.0
			parca(a.position + Vector2(0, -8), Vector2(cos(tt) * sp, sin(tt) * sp - 30.0), 0.3, Color("#ff4a3a") if i % 2 else Color("#ffd040"))
	return dm + ex

func canli_oldu(k: String, c = null) -> void:
	if yan != null and yan.oldu(c): return
	if reis != null: reis.oldu(k, c)
	if c != null and c.ogr: ogr.yengec_oldu()
	if gorev: gorev.av(k)
	if magara != null and c != null and c.cvb:
		magara.boss_oldu()

## web spawnAnimals/spawnIn (Çayır, BANIM[0]): 1,5 sn'de bir her türden istenen kadar (sürülerde sürü sayısı), oyuncudan 330–470 px
## uzakta, kendi zemininde ve Çayır'da doğar; 760 px'ten uzaklaşan silinir, gece canlısı gündüz 360 px'ten uzaksa gider.
## Kurt yalnız gece; Sv 1–5'te sahada en çok bir kurt ve tek başına; Yaban atı Sv 2'den; saldırganlar Kemal'in kampının yanında doğmaz.
func _dogur(dt: float) -> void:
	if magara.icinde or basta or cine.acik: return
	dogum_t -= dt
	if dogum_t > 0.0: return
	dogum_t = 1.5
	var P: Vector2 = oyuncu.position
	var gece: bool = zaman.gece_mi()
	var hepsi := canlilari_ver()
	for c in hepsi:
		var d: float = c.position.distance_to(P)
		if c.has_meta("ders"): continue
		if insa.avluda(c.position) and not c.has_meta("avlu_bakildi"):
			c.queue_free()
			continue
		c.set_meta("avlu_bakildi", true)
		if d > 760.0 or (bool(c.D.get("night", false)) and not gece and d > 360.0):
			c.queue_free()
	var bio := bio_at(P)
	if not canli_liste.has(bio): return
	for L in canli_liste[bio]:
		var k: String = L[0]
		var want: int = int(L[1])
		if L[2] == "gece" and not gece: continue
		if L[2] == "sv2" and env.sv < 2: continue
		if L[2] == "sv10" and env.sv < 10: continue
		if L[2] == "sv6" and env.sv < 6: continue
		if L[2] == "sv6gun3" and ((env.sv < 6 and zaman.gun < 3) or (env.sv < 10 and _atici_var(k, hepsi))): continue
		_dogur_tur(k, want, hepsi, bio)

func _orman_test(q: String) -> void:
	await get_tree().create_timer(8.0).timeout
	for k2 in ["Engerek", "Dikenli kirpi", "Yaban domuzu", "Oklu kirpi"]:
		if q.contains(k2.to_lower().replace(" ", "")): _canli_koy_yakin(k2, 5.0)

## web rangedNear: sahada başka bir saldırgan atıcı varsa (Sv 10'dan önce) ikinci bir atıcı doğmaz
func _atici_var(haric: String, hepsi: Array) -> bool:
	for c in hepsi:
		if c.tur != haric and c.D.get("ranged", null) != null and c.D.temper == "saldırgan": return true
	return false

func _dogur_tur(k: String, want: int, hepsi: Array, bio: int = 0) -> void:
	var D: Dictionary = canlilar[k]
	var paket = D.get("pack", null)
	var ayni := []
	for c in hepsi:
		if c.tur == k and is_instance_valid(c) and not c.ders: ayni.append(c)
	if k == "Kurt" and env.sv <= 5 and not ayni.is_empty(): return
	var var_ := ayni.size()
	if paket != null:
		var pk := {}
		for c in ayni: pk[c.get_meta("pk", 0)] = true
		var_ = pk.size()
	if var_ >= want: return
	var land: Array = D.landTiles
	var Pp: Vector2 = oyuncu.position
	for deneme in 12:
		var p := Pp + Vector2.from_angle(rng.randf() * TAU) * (330.0 + rng.randf() * 140.0)
		if not land.has(float(tile_at(p))) or engel(p, 6.0) or bio_at(p) != bio: continue
		if int(D.aggro) > 0 and zaman.kampta(p): continue
		if insa.avluda(p): continue
		paket_no += 1
		var n := 1
		if paket != null:
			var lo: int = int(paket[0]); var hi: int = int(paket[1])
			if D.temper == "saldırgan":
				if env.sv < 4: hi = mini(hi, 2)
				elif env.sv < 7: hi = mini(hi, 3)
				if env.sv < 7: lo = mini(lo, 2)
			n = 1 if (k == "Kurt" and env.sv <= 5) else rng.randi_range(lo, hi)
		_canli_yeni(k, p, paket_no)
		var g := 0
		var m := 1
		while m < n and g < 40:
			g += 1
			var q := p + Vector2(rng.randf_range(-22, 22), rng.randf_range(-22, 22))
			if engel(q, 6.0) or not land.has(float(tile_at(q))) or bio_at(q) != bio: continue
			_canli_yeni(k, q, paket_no)
			m += 1
		return

func _canli_yeni(k: String, p: Vector2, pk: int):
	var c := preload("res://scripts/canli.gd").new()
	c.oyun = self
	c.tur = k
	c.D = canlilar[k]
	c.position = p
	c.set_meta("pk", pk)
	nesneler.add_child(c)
	return c

func canlilari_ver() -> Array:
	var out := []
	for c in nesneler.get_children():
		if c.has_method("vuruldu") and c.hp > 0:
			out.append(c)
	return out

# ------------------------------------------------------------------ ekrandaki yazılar ve göstergeler
func _hud() -> void:
	hud = CanvasLayer.new()
	add_child(hud)
	var kutu := VBoxContainer.new()
	kutu.position = Vector2(12, 10)
	hud.add_child(kutu)
	can_cubugu = ProgressBar.new()
	can_cubugu.custom_minimum_size = Vector2(180, 14)
	can_cubugu.show_percentage = false
	can_cubugu.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	can_cubugu.max_value = float(oyuncu_veri.hp)
	can_cubugu.value = float(oyuncu_veri.hp)
	var bg := StyleBoxFlat.new(); bg.bg_color = Color("#5a2a26"); bg.border_color = Color("#0b0f0a"); bg.set_border_width_all(2)
	var fg := StyleBoxFlat.new(); fg.bg_color = Color("#8fd46b")
	can_cubugu.add_theme_stylebox_override("background", bg)
	can_cubugu.add_theme_stylebox_override("fill", fg)
	kutu.add_child(can_cubugu)
	enerji_cubugu = ProgressBar.new()
	enerji_cubugu.custom_minimum_size = Vector2(180, 8)
	enerji_cubugu.show_percentage = false
	enerji_cubugu.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	enerji_cubugu.max_value = 100.0
	enerji_cubugu.value = 100.0
	var ebg := StyleBoxFlat.new(); ebg.bg_color = Color("#22301c"); ebg.border_color = Color("#0b0f0a"); ebg.set_border_width_all(2)
	var efg := StyleBoxFlat.new(); efg.bg_color = Color("#9ad05a")
	enerji_cubugu.add_theme_stylebox_override("background", ebg)
	enerji_cubugu.add_theme_stylebox_override("fill", efg)
	enerji_cubugu.tooltip_text = "Enerji"
	kutu.add_child(enerji_cubugu)
	etki_yazi = RichTextLabel.new()
	etki_yazi.bbcode_enabled = true; etki_yazi.fit_content = true; etki_yazi.scroll_active = false
	etki_yazi.custom_minimum_size = Vector2(260, 0)
	etki_yazi.add_theme_font_size_override("normal_font_size", 12)
	etki_yazi.add_theme_color_override("font_outline_color", Color("#14100c")); etki_yazi.add_theme_constant_override("outline_size", 4)
	kutu.add_child(etki_yazi)
	silah_yazi = Label.new()
	_golge(silah_yazi)
	kutu.add_child(silah_yazi)
	var yardim := Label.new()
	yardim.text = "WASD / oklar: yürü · Shift: koş · Q ya da sol tık: vur · Boşluk: atıl · Sağ tık ya da E: savuştur (basılı: gard) · F: topla · X: ye · I: çanta · Tab: el yapımı · K: tarif kitabı · Y: yetenekler · 1–5: kemer · G: görevler · C: karakter · N: inşa · B: bin · R: köpekler · M: harita\nKol: sol çubuk yürü · L3 koş · X ya da RT vur · B atıl · LT savuştur · A topla · LB ye · Y kemer · Back çanta · Start el yapımı"
	yardim.add_theme_font_size_override("font_size", 12)
	_golge(yardim)
	yardim.add_theme_font_size_override("font_size", 11)
	kutu.add_child(yardim)
	yardim.position.y -= 4
	var ver := Label.new()
	ver.text = SURUM + " · veri: " + str(harita.meta.surum)
	ver.add_theme_font_size_override("font_size", 12)
	_golge(ver)
	hud.add_child(ver)
	ver.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT, Control.PRESET_MODE_MINSIZE, 10)
	ver.grow_horizontal = Control.GROW_DIRECTION_BEGIN

func _golge(l: Label) -> void:
	l.add_theme_color_override("font_color", Color("#fff6dc"))
	l.add_theme_color_override("font_outline_color", Color("#14100c"))
	l.add_theme_constant_override("outline_size", 4)

func enerji_guncelle(v: float, mx: float, yorgun: bool) -> void:
	enerji_cubugu.max_value = mx
	enerji_cubugu.value = v
	(enerji_cubugu.get_theme_stylebox("fill") as StyleBoxFlat).bg_color = Color("#d8a84a") if yorgun else Color("#9ad05a")

## bir pencere ya da sahne açıkken savaş tuşları işlemez
func sk(id: String) -> bool:
	return yetenekler.has(id)

func pencere_acik() -> bool:
	return (gezgin != null and gezgin.acik()) or (ev != null and ev.acik) or (evcil != null and evcil.acik()) or (yan != null and yan.acik()) or (atolye != null and atolye.visible) or (sinan != null and sinan.visible) or (yetenek != null and yetenek.visible) or (karakter != null and karakter.visible) or sahne.acik or konusma.visible or istasyon.pencere.visible or pazar.pencere.visible or menu_acik() or env.canta.visible

func can_guncelle(hp: float, mx: float) -> void:
	can_cubugu.max_value = mx
	can_cubugu.value = hp
	var k := hp / mx
	var fg := can_cubugu.get_theme_stylebox("fill") as StyleBoxFlat
	fg.bg_color = Color("#8fd46b") if k > 0.5 else (Color("#f2b84b") if k > 0.25 else Color("#e8775a"))

func yazi(p: Vector2, metin: String, renk: Color, boy: int = 8) -> void:
	efekt.yazi(p, metin, renk, boy)

func parca(p: Vector2, v: Vector2, omur: float, renk: Color) -> void:
	efekt.parca(p, v, omur, renk)

# ------------------------------------------------------------------ küçük harita (sağ alt): ada, biyom renkleri, oyuncunun yeri
var kh_nokta: ColorRect
var kh_olcek := 0.0
func _kucuk_harita() -> void:
	var bio := Marshalls.base64_to_raw(harita.bio)
	bio_arr = bio
	var BR := [Color("#7fb04a"), Color("#3f7a3a"), Color("#6b7440"), Color("#8a8580"), Color("#5a3a36"), Color("#7a5aa8")]
	if ada == 2:
		BR = []
		for c in yerler2.bcol: BR.append(Color(c).darkened(0.25))
	var img := Image.create(bw, bh, false, Image.FORMAT_RGBA8)
	for y in bh:
		for x in bw:
			var i := y * bw + x
			var k := tiles[i]
			var c: Color
			if k == 4: c = Color("#2a6db0")
			elif k == 5 and ada == 2: c = Color("#5a5a66")
			elif k == 3 or k == 5: c = Color("#4a9ad8")
			elif k == 2: c = Color("#e6d39a")
			else: c = BR[mini(int(bio[i]), 5)]
			img.set_pixel(x, y, c)
	var tr := TextureRect.new()
	kh_resim = tr
	tr.texture = ImageTexture.create_from_image(img)
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kh_olcek = 220.0 / float(bw)
	tr.custom_minimum_size = Vector2(bw, bh) * kh_olcek
	tr.size = tr.custom_minimum_size
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	var cer := PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.05, 0.07, 0.05, 0.85); st.border_color = Color("#0b0f0a"); st.set_border_width_all(2)
	cer.add_theme_stylebox_override("panel", st)
	cer.add_child(tr)
	hud.add_child(cer)
	cer.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_RIGHT, Control.PRESET_MODE_MINSIZE, 10)
	kh_nokta = ColorRect.new()
	kh_nokta.color = Color("#ffd84a")
	kh_nokta.size = Vector2(4, 4)
	tr.add_child(kh_nokta)

func _process(_d: float) -> void:
	if kh_nokta and oyuncu:
		if magara != null and magara.icinde:
			kh_nokta.position = magara.harita_nokta() - Vector2(2, 2)
		else:
			kh_nokta.position = oyuncu.position / float(T) * kh_olcek - Vector2(2, 2)

## web treeChopped (v65): üç kesimde ağaç devrilir; 200–300 sn sonra aynı biyomda başka bir yerde yenisi büyür
func agac_devrildi(ag) -> void:
	for k in 14:
		parca(ag.position + Vector2(randf_range(-10, 10), -10 - randf() * 20), Vector2(randf_range(-20, 20), -20 - randf() * 30), 0.7, Color("#6a4426") if k % 2 else Color("#4a8a3a"))
	ag.visible = false
	var bio := Marshalls.base64_to_raw(harita.bio)
	var b0 := int(bio[int(ag.position.y / T) * bw + int(ag.position.x / T)])
	await get_tree().create_timer(rng.randf_range(float(toplama_veri.treeRegrow[0]), float(toplama_veri.treeRegrow[1]))).timeout
	for deneme in 400:
		var x := rng.randi_range(2, bw - 3)
		var y := rng.randi_range(2, bh - 3)
		var i := y * bw + x
		if tiles[i] > 1 or int(bio[i]) != b0:
			continue
		var p := Vector2(x * T + 8, y * T + 8)
		if p.distance_to(oyuncu.position) < 200.0:
			continue
		ag.position = p
		ag.kesim = 0
		ag.visible = true
		return

# ------------------------------------------------------------------ Çayır'ın kişileri, kazan ve örsler
func _kisiler() -> void:
	kusanma = _json("res://data/kusanma.json")
	for y in kusanma.yuvalar: kusam[y[0]] = null
	kisi_veri = _json("res://data/kisiler_orman.json")
	kademe = kisi_veri.tier
	for r in kisi_veri.zirh: zirh_set[r] = true
	var tum: Array = toplama_veri.kisiler.duplicate()
	tum.append_array(kisi_veri.kisiler)
	for bf in ["bataklik", "kayalik", "kul", "kristal"]:
		var kb: Dictionary = _json("res://data/kisiler_%s.json" % bf)
		tum.append_array(kb.kisiler)
		kisi_veri.istasyonlar.append_array(kb.istasyonlar)
	tum.append(_json("res://data/evcil.json").davut)
	var PZ: Dictionary = _json("res://data/poyraz.json").koy
	tum.append({k = "trader", ad = "Gemici Poyraz", x = PZ.x, y = PZ.y, rol = "pz", resim = {f = "res://art/kisiler/kisi_poyraz_f.png", q = "res://art/kisiler/kisi_poyraz_q.png"}, portre = "res://art/kisiler/portre_poyraz.png"})
	for yq in _json("res://data/yan.json").yan:
		if yq.id == "ekin1": tum.append({k = "k_ekin", ad = yq.name, x = yq.x, y = yq.y, rol = "ek", resim = {f = yq.resim_f, q = yq.resim_q}, portre = yq.portre})
	if ada == 2:
		# ikinci adada birinci adanın kişileri, kazanı ve örsleri yoktur (web v76 away); Barbaros indirdiği kıyıda gemisinin başında bekler
		var dz: Dictionary = {}
		for k in tum:
			if k.k == "denizci": dz = k.duplicate(true)
		var B: Dictionary = yerler2.barbaros
		dz.x = B.x; dz.y = B.y
		dz.enkaz = {x = B.bx, y = B.by}
		dz.tekne = {x = B.bx, y = B.by}
		tum = [dz]
		kisi_veri.istasyonlar = []
		for a in ["kazan", "ors", "ors2"]: toplama_veri.istasyon[a] = {x = -100000, y = -100000}
		# web v76/v77: Gökbilimci Yıldız Yüzen Kayalar'ın yüksek kayasında; ACT 2'de tarifler onun yanındaki kazanda öğrenilir
		act2 = preload("res://scripts/act2.gd").new()
		add_child(act2)
		act2.kur(self)
		tum.append_array(act2.kisiler())
		var Y: Dictionary = act2.usta("gok")
		toplama_veri.istasyon.kazan = {x = int(Y.x) + 42, y = int(Y.y) + 8}
	for st in kisi_veri.istasyonlar:
		if st.tur == "ates": continue
		istasyonlar.append(st)
		var o := Node2D.new()
		o.position = Vector2(st.x, st.y)
		o.draw.connect(_istasyon2_ciz.bind(o, st))
		nesneler.add_child(o)
	for k in tum:
		if k.has("enkaz"):
			var ek := Node2D.new()
			ek.position = Vector2(k.enkaz.x, k.enkaz.y)
			if k.has("tekne"): ek.set_meta("tekne", Vector2(k.tekne.x, k.tekne.y))
			ek.draw.connect(func(): kuzen.enkaz_ciz(ek))
			nesneler.add_child(ek)
			enkaz = ek
		if k.has("kulube"):
			var hk := Node2D.new()
			hk.position = Vector2(k.kulube.x, k.kulube.y)
			hk.draw.connect(_kulube_ciz.bind(hk))
			nesneler.add_child(hk)
		var n := preload("res://scripts/kisi.gd").new()
		n.kur(self, k)
		nesneler.add_child(n)
		kisiler.append(n)
		if act2 != null: act2.kisi_kuruldu(n)
	var I: Dictionary = toplama_veri.istasyon
	for a in [["kazan", I.kazan], ["ors", I.ors], ["ors", I.ors2]]:
		var o := Node2D.new()
		o.position = Vector2(a[1].x, a[1].y)
		o.set_meta("tur", a[0])
		o.draw.connect(_istasyon_ciz.bind(o))
		nesneler.add_child(o)

## Avcı Doğan'ın kamış kulübesi (web drawToygar)
func _kulube_ciz(o: Node2D) -> void:
	var r := func(x: float, y: float, w: float, h: float, c: String) -> void: o.draw_rect(Rect2(x, y, w, h), Color(c))
	r.call(-14, 6, 30, 3, "#00000038")
	for dx in [-12, -2, 8, 12]: r.call(dx, -2, 2, 10, "#4a3018")
	r.call(-15, -6, 30, 5, "#7a5a32"); r.call(-15, -6, 30, 1, "#9a7a48")
	for i in 8: r.call(-14 + i * 4, -16 + absf(i - 3.5) * 1.2, 3, 11 - absf(i - 3.5) * 1.2, "#a89050" if i % 2 else "#c0a860")
	r.call(-17, -18, 34, 3, "#8a7040"); r.call(-12, -21, 24, 3, "#a08848"); r.call(-6, -24, 12, 3, "#b8a058"); r.call(-3, -9, 5, 6, "#2a1e12")
	r.call(16, -14, 1, 10, "#4a3018"); r.call(16, -14, 8, 1, "#4a3018"); r.call(18, -13, 2, 4, "#a8b8c0"); r.call(21, -13, 2, 4, "#98a8b0")

## kazan: kara kazan, mor buhar; örs: gri örs ve kütük (web'in kendi çizimleri sonra aktarılacak)
func _istasyon_ciz(o: Node2D) -> void:
	if o.get_meta("tur") == "kazan":
		o.draw_circle(Vector2(0, 1), 8.0, Color(0, 0, 0, 0.25))
		o.draw_rect(Rect2(-7, -9, 14, 9), Color("#1e1a22"))
		o.draw_rect(Rect2(-8, -10, 16, 2), Color("#3a3240"))
		o.draw_rect(Rect2(-6, -9, 12, 2), Color("#7a4ad8"))
		o.draw_rect(Rect2(-5, 0, 2, 2), Color("#2a2420")); o.draw_rect(Rect2(3, 0, 2, 2), Color("#2a2420"))
	else:
		o.draw_rect(Rect2(-5, -4, 10, 5), Color("#5a3d22"))
		o.draw_rect(Rect2(-7, -9, 14, 4), Color("#6a6e74"))
		o.draw_rect(Rect2(-9, -9, 3, 2), Color("#6a6e74"))
		o.draw_rect(Rect2(-6, -9, 12, 1), Color("#9aa0a8"))

## web'in kuzen istasyonları (kodla çizilmiş; ComfyUI ile yenilenecek): renkli kazan, ocak, örs, silah rafı, manken, tenteli tezgâh
func _istasyon2_ciz(o: Node2D, st: Dictionary) -> void:
	match str(st.tur):
		"kazan":
			var c := Color(str(st.get("renk", "#7a4ad8")))
			o.draw_circle(Vector2(0, 1), 8.0, Color(0, 0, 0, 0.25))
			o.draw_rect(Rect2(-7, -9, 14, 9), Color("#1e1a22"))
			o.draw_rect(Rect2(-8, -10, 16, 2), Color("#3a3240"))
			o.draw_rect(Rect2(-6, -9, 12, 2), c)
			o.draw_rect(Rect2(-5, 0, 2, 2), Color("#2a2420")); o.draw_rect(Rect2(3, 0, 2, 2), Color("#2a2420"))
		"ocak":
			o.draw_rect(Rect2(-9, -14, 18, 15), Color("#6a625a")); o.draw_rect(Rect2(-9, -14, 18, 2), Color("#8a827a"))
			o.draw_rect(Rect2(-5, -8, 10, 6), Color("#2a1a12")); o.draw_rect(Rect2(-4, -7, 8, 4), Color("#f2902a")); o.draw_rect(Rect2(-2, -6, 4, 2), Color("#ffd27a"))
		"ors":
			o.draw_rect(Rect2(-5, -4, 10, 5), Color("#5a3d22"))
			o.draw_rect(Rect2(-7, -9, 14, 4), Color("#6a6e74"))
			o.draw_rect(Rect2(-9, -9, 3, 2), Color("#6a6e74"))
			o.draw_rect(Rect2(-6, -9, 12, 1), Color("#9aa0a8"))
		"raf":
			o.draw_rect(Rect2(-8, -16, 2, 17), Color("#6a4424")); o.draw_rect(Rect2(6, -16, 2, 17), Color("#6a4424"))
			o.draw_rect(Rect2(-8, -12, 16, 2), Color("#8a5a32")); o.draw_rect(Rect2(-8, -5, 16, 2), Color("#8a5a32"))
			o.draw_rect(Rect2(-5, -18, 1, 12), Color("#c2c6ca")); o.draw_rect(Rect2(0, -17, 1, 11), Color("#c2c6ca")); o.draw_rect(Rect2(4, -18, 1, 12), Color("#c2c6ca"))
		"manken":
			o.draw_rect(Rect2(-1, -6, 2, 7), Color("#6a4424")); o.draw_rect(Rect2(-5, -16, 10, 10), Color("#7a6a5a"))
			o.draw_rect(Rect2(-5, -16, 10, 2), Color("#9a8a7a")); o.draw_rect(Rect2(-3, -21, 6, 5), Color("#5a5e64"))
		"tezgah":
			var hc := Color(str(st.get("renk", "#3f9a3a")))
			o.draw_rect(Rect2(-12, 2, 24, 3), Color(0, 0, 0, 0.25))
			o.draw_rect(Rect2(-11, -18, 2, 20), Color("#6a4424")); o.draw_rect(Rect2(9, -18, 2, 20), Color("#6a4424"))
			o.draw_rect(Rect2(-11, -5, 22, 7), Color("#a0703c")); o.draw_rect(Rect2(-11, -5, 22, 2), Color("#c08a50"))
			o.draw_rect(Rect2(-13, -22, 26, 5), hc); o.draw_rect(Rect2(-13, -18, 26, 1), hc.darkened(0.3))

# ------------------------------------------------------------------ özellikler, seviye puanları, kuşanma (web SPS, sv, ptsAt, capAt, EQUIP, armorMul)
const DUZ := {"hp": true, "st": true, "mana": true, "zirh": true}
func _taki(k: String) -> float:
	var t := 0.0
	for s in ["kolye", "yuzuk"]:
		var n = kusam.get(s, null)
		if n != null and kusanma.esya.has(n) and kusanma.esya[n].fx != null and kusanma.esya[n].fx.has(k): t += float(kusanma.esya[n].fx[k])
	return t

## r < 0: şimdiki puanla ve takıların etkisiyle; r ≥ 0: o puanla (önizleme, takısız)
func stat(k: String, r: int = -1) -> float:
	var v0 := _stat(k, r)
	if k == "move" and r < 0 and kusam.get("govde", null) == "Meka zırh": v0 *= 1.12   # web v79: Meka zırh adımı %12 hızlandırır
	return v0

func _stat(k: String, r: int = -1) -> float:
	var S: Array = kusanma.sps[k]
	var v: float = float(S[0]) + float(S[1]) * float(r if r >= 0 else int(puan.get(k, 0)))
	if r >= 0: return v
	var p := _taki(k)
	if p == 0.0: return v
	if DUZ.has(k): return v + p
	if k == "luck": return v + p / 100.0
	return v * (1.0 + p / 100.0)

static func _ptl(L: int) -> int:
	return 0 if L <= 1 else (2 if L <= 10 else (3 if L <= 30 else 4))

func puan_toplam() -> int:
	var n := 0
	for i in range(2, env.sv + 1): n += _ptl(i)
	return n

func puan_bos() -> int:
	var t := 0
	for k in kusanma.spk: t += mini(int(kusanma.rmax), int(puan.get(k, 0)))
	return maxi(0, puan_toplam() - t)

func puan_tavan() -> int:
	return mini(int(kusanma.rmax), 1 + env.sv / 3)

func puan_ver(k: String) -> void:
	var r := int(puan.get(k, 0))
	if puan_bos() <= 0 or r >= int(kusanma.rmax) or r >= puan_tavan(): return
	puan[k] = r + 1
	if puan_ders < 2: puan_ders = 2
	oyuncu.yetenek_uygula()
	env._sv_ciz()

func savunma() -> int:
	var t := 0
	for s in kusam:
		var n = kusam[s]
		if n != null and kusanma.esya.has(n): t += int(kusanma.esya[n].def)
	return t

func zirh_deger(r: int = -1) -> int:
	return int(round(stat("zirh", r))) + (30 if sk("D10") else (20 if sk("D7") else (12 if sk("D5") else (5 if sk("D2") else 0))))

## fiziksel hasar çarpanı: 25 / (25 + savunma + zırh)
func zirh_carpan() -> float:
	return 25.0 / (25.0 + savunma() + zirh_deger())

func direnc(k: String) -> float:
	var t := 0.0
	for s in kusam:
		var n = kusam[s]
		if n != null and kusanma.esya.has(n) and kusanma.esya[n].res != null: t += float(kusanma.esya[n].res.get(k, 0.0))
	return minf(0.85, t)

func yuva_of(n: String) -> String:
	if kusanma.esya.has(n): return str(kusanma.esya[n].s)
	if kusanma.silah.has(n): return "silah"
	return ""

const FXL := {"hp": ["can", "+"], "st": ["enerji", "+"], "mana": ["mana", "+"], "zirh": ["zırh", "+"], "hpRe": ["can yenilenmesi", "+%"], "stRe": ["enerji yenilenmesi", "+%"], "dmg": ["hasar", "+%"], "move": ["hız", "+%"], "gather": ["toplama hızı", "+%"], "trade": ["satış fiyatı", "+%"], "luck": ["şans", "+%"]}
func esya_yazi(n) -> String:
	if n == null: return ""
	if kusanma.silah.has(n): return "%d hasar" % int(kusanma.silah[n].dmg)
	if not kusanma.esya.has(n): return ""
	var e: Dictionary = kusanma.esya[n]
	var P := []
	if int(e.def) > 0: P.append("+%d savunma" % int(e.def))
	if e.fx != null:
		for k in e.fx:
			if FXL.has(k): P.append("%s%s %s" % [FXL[k][1], str(e.fx[k]), FXL[k][0]])
	if e.res != null:
		for k in e.res: P.append("%s direnci %%%d" % [k, int(round(float(e.res[k]) * 100.0))])
	if int(e.mud) == 1: P.append("çamurda yavaşlamaz")
	if int(e.lamp) == 1: P.append("ışık")
	return " · ".join(P) if not P.is_empty() else "+0 savunma"

func giy(n: String) -> void:
	var s := yuva_of(n)
	if s == "" or env.adet(n) <= 0: return
	if kusam.get(s, null) != null: cikar(s, true)
	env.eksilt(n)
	var i: int = env.kemer.find(n)
	if i >= 0 and env.adet(n) <= 0:
		env.kemer[i] = null
		env.kemer_ciz()
	kusam[s] = n
	env.mesaj("%s giyildi" % n)
	oyuncu.yetenek_uygula()

func cikar(s: String, sessiz := false) -> void:
	var n = kusam.get(s, null)
	if n == null: return
	kusam[s] = null
	env.ekle(n)
	if not sessiz: env.mesaj("%s çıkarıldı" % n)
	oyuncu.yetenek_uygula()

## örs kipinin ustası: {rol, b, ad} (web roleOf, tierW)
func usta_bilgi(k: String) -> Dictionary:
	if k == "smith": return {rol = "s", b = 0, ad = "Demirci Dursun"}
	if k == "durmus": return {rol = "a", b = 0, ad = "Zırhçı Durmuş"}
	for n in kisiler:
		if n.K.k == k and n.K.has("kuzen"): return {rol = n.K.rol, b = int(n.K.kuzen.b), ad = n.K.ad}
	return {}

## o kademeyi dövebilen en alttaki usta (web lowestFor)
func usta_adi(rol: String, t: int) -> String:
	if t <= 0: return "Zırhçı Durmuş" if rol == "a" else "Demirci Dursun"
	for u in kisi_veri.get("ustalar", []):
		if u.rol == rol and int(u.b) == mini(5, t): return "%s (%s)" % [u.ad, kisi_veri.biyomlar[int(u.b)]]
	return "?"

## Türkçe iyelik: Durdu'nun, Duran'ın, Yakut'un, Dursun'un
static func iyelik(ad: String) -> String:
	var sesli := ""
	for i in range(ad.length() - 1, -1, -1):
		if "aeıioöuü".contains(ad[i]):
			sesli = ad[i]
			break
	var ek: String = {"a": "ın", "ı": "ın", "e": "in", "i": "in", "o": "un", "u": "un", "ö": "ün", "ü": "ün"}.get(sesli, "in")
	if "aeıioöuü".contains(ad[ad.length() - 1]): ek = "n" + ek
	return ad + "'" + ek

## F: toplanacak bir şey yoksa yakındaki kişi (görev işi varsa önce o), kazan, örs ya da kişinin kendi hizmeti (web target sırası)
func konus_ya_da_istasyon() -> bool:
	var p: Vector2 = oyuncu.position
	var yakin = null
	for n in kisiler:
		if n.visible and p.distance_to(n.position) < 30.0 and (yakin == null or p.distance_to(n.position) < p.distance_to(yakin.position)):
			yakin = n
	if iz.f():
		return true
	if gezgin.f():
		return true
	if isikci.f():
		return true
	if yan.f():
		return true
	if yakin != null and ogr.konus(yakin.K.k):
		return true
	if yakin != null and gorev.konus(gorev.g_of(yakin.K.k), _hizmet(yakin.K.k)):
		return true
	var I: Dictionary = toplama_veri.istasyon
	if p.distance_to(Vector2(I.kazan.x, I.kazan.y)) < 26.0:
		istasyon.ac("kazan")
		return true
	for st in istasyonlar:
		var r := 22.0 if st.tur == "kazan" else 18.0
		if p.distance_to(Vector2(st.x, st.y)) < r and st.has("sahip"):
			for n in kisiler:
				if n.K.k == st.sahip:
					return kuzen.konus(n, st.tur == "kazan")
	if p.distance_to(Vector2(I.ors.x, I.ors.y)) < 20.0:
		istasyon.ac("smith")
		return true
	if p.distance_to(Vector2(I.ors2.x, I.ors2.y)) < 18.0:
		istasyon.ac("durmus")
		return true
	if yakin != null:
		_konus(yakin)
		return true
	if gecit.f():
		return true
	if kuzen.enkaz_f():
		return true
	if kopru.f():
		return true
	if evcil.f():
		return true
	if insa.onar():
		return true
	if insa.yakit_koy():
		return true
	if yapi.kullan():
		return true
	return false

func _hizmet(k: String) -> Dictionary:
	match k:
		"witch": return {t = "Kazana bak", f = func(): istasyon.ac("kazan")}
		"smith": return {t = "Örse bak", f = func(): istasyon.ac("smith")}
		"durmus": return {t = "Örse bak", f = func(): istasyon.ac("durmus")}
		"market": return {t = "Pazara bak", f = func(): pazar.ac()}
	return {}

const SELAM := {"ekin": "Ateş sıcak, çay demde. Otur biraz evlat.", "market": "Hoş geldin! Tezgâhım yakında açılacak; satacak bir şeyin olursa unutma beni.", "alp": "Kılıcını hep elinin altında tut. Bu adada her çalının ardında bir diş vardır."}

func _konus(n) -> void:
	var K: Dictionary = n.K
	if kuzen.konus(n): return
	var por = load(K.portre) if K.portre != null else null
	match K.k:
		"witch":
			var ws := [{t = "Kazana bak", pri = true, f = func(): istasyon.ac("kazan")}]
			var mk = ani.kiymik_secenegi()
			if mk != null: ws.append(mk)
			ws.append({t = "Sonra", kapat = true})
			konusma.ac(K.ad, por, "Kazanım hep kaynar evlat. Yeni bir şey bulduğunda gel; malzemelerini kazana atarsın, tarifi öğrenirsin.", ws)
		"smith":
			var ss := [{t = "Örse bak", pri = true, f = func(): istasyon.ac("smith")}]
			var bl := bileme()
			if not bl.is_empty(): ss.append({t = "Aşınan aletleri bile (%d Vio)" % int(bl.ucret), f = func(): bile(K, por)})
			ss.append({t = "Sonra", kapat = true})
			konusma.ac(K.ad, por, "Tarifini bildiğin aleti ve silahı örsümde döverim; malzemeyi sen getir, işçiliğimi ödersin.", ss)
		"durmus":
			konusma.ac(K.ad, por, "Zırh benim işim. Tarifini bildiğin zırhı malzemesi ve işçiliğiyle döverim.", [{t = "Örse bak", pri = true, f = func(): istasyon.ac("durmus")}, {t = "Sonra", kapat = true}])
		"market":
			konusma.ac(K.ad, por, "Hoş geldin! Silah, zırh, takı ve aletler dışında her şeyi alırım; eline geçmiş doğal malzemeleri ve tarifini bildiğin eşyaları da satarım.", [{t = "Pazara bak", pri = true, f = func(): pazar.ac()}, {t = "Sonra", kapat = true}])
		"alp":
			_konus_alp(K, por)
		_:
			konusma.ac(K.ad, por, SELAM.get(K.k, "Merhaba!"))

## bileme (belge Aletler › dayanıklılık): Dursun körelmiş aletleri yeniler; her biri değerinin onda biri (web GT.sharp ≈ satış değeri × 2,2 / 10)
func bileme() -> Dictionary:
	var L := []
	var u := 0
	for n in env.inv:
		if env.adet(n) <= 0 or not env.G.tools.has(n) or not env.dayan.has(n): continue
		if str(env.G.tools[n].kind) in ["staff", "gun"]: continue
		if int(env.dayan[n]) < int(env.G.tools[n].dur):
			L.append(n)
			u += maxi(1, int(round(pazar.taban(n) * 0.22)))
	return {} if L.is_empty() else {liste = L, ucret = u}

func bile(K: Dictionary, por) -> void:
	var b := bileme()
	if b.is_empty(): return
	if env.vio < int(b.ucret):
		konusma.ac(K.ad, por, "Bilemek %d Vio tutar evlat; sende %d var." % [int(b.ucret), env.vio], [{t = "Tamam", pri = true, kapat = true}])
		return
	env.vio_ekle(-int(b.ucret))
	for n in b.liste: env.dayan[n] = int(env.G.tools[n].dur)
	env.kemer_ciz()
	konusma.ac(K.ad, por, "[i](bileği taşında kıvılcımlar)[/i] İşte, hepsi ilk günkü gibi keskin: %s." % ", ".join(b.liste), [{t = "Teşekkürler", pri = true, kapat = true}])

## web talkAlp + v181: öğretici yokken atılma ve savuşturma dersleri Börü'den, ücretsiz
func _konus_alp(K: Dictionary, por) -> void:
	if ders.agac_bekliyor():
		ders.agac_iste()
		konusma.ac(K.ad, por, "Önce [b]yetenek ağacını[/b] aç evlat! [b]Y[/b]'ye bas.", [{t = "Tamam", pri = true, kapat = true}])
		return
	if ders.acik:
		konusma.ac(K.ad, por, "Kerevite odaklan evlat! Atıldığında, değmeden hemen önce [b]savuştur[/b]." if ders.mod == "parry" else "Kerevite odaklan evlat! Üstünde kırmızı [b]![/b] görünce yana [b]atıl[/b].", [{t = "Tamam", pri = true, kapat = true}])
		return
	if not yetenekler.has("S1"):
		konusma.ac(K.ad, por, "Hey evlat, sen hâlâ [b]atılmayı[/b] bilmiyorsun! Saldırının içinden yana kaçamayan bu adada uzun yaşamaz. Gel, kısa bir ders; benden, ücretsiz.", [{t = "Öğret", pri = true, f = func(): ders.basla("dodge")}, {t = "Sonra", kapat = true}])
		return
	if not yetenekler.has("P0"):
		konusma.ac(K.ad, por, "Kaçmayı biliyorsun ama [b]savuşturmayı[/b] bilmiyorsun evlat! Gel, kısa bir ders; benden, ücretsiz.", [{t = "Öğret", pri = true, f = func(): ders.basla("parry")}, {t = "Sonra", kapat = true}])
		return
	var L := ["Kılıcın keskin, nefesin derin olsun.", "Nötr hayvana bulaşırsan karşılık verir; zararsız olan kaçar, saldırgan olan seni arar.", "Zırhın varsa yaralar daha az acıtır. Postlardan giysi diktir."]
	var ch := [{t = "Kılıç nasıl yapılır?", f = func(): _alp_kilic(K, por)}]
	if ada == 1 and not kuzen.act2 and not ogr.acik(): ch.append(dovus.secenek(alp_dugum()))
	ch.append({t = "Hoşça kal", pri = true, kapat = true})
	konusma.ac(K.ad, por, L[randi() % L.size()], ch)

func _alp_kilic(K: Dictionary, por) -> void:
	el_yapimi.bilinen["Taş kılıç"] = true
	konusma.ac(K.ad, por, "Bir sopa, dört keskin taş, iki ip ve bir çakmaktaşı. Tarifini kitabına yazdım; [b]Dursun[/b] örsünde döver. Kılıcı kemerine koyup eline alırsın.", [{t = "Anladım", pri = true, f = func(): _konus_alp(K, por)}])

func alp_dugum():
	for n in kisiler:
		if n.K.k == "alp": return n
	return null

func kamera_sinir() -> void:
	kamera.limit_left = bx0 * T; kamera.limit_top = by0 * T
	kamera.limit_right = (bx0 + bw) * T; kamera.limit_bottom = (by0 + bh) * T

## dünyanın rengi: mağaranın karanlığı × sahnenin tonu (sepya, gece)
func renk_guncelle() -> void:
	ortam.color = taban_renk * sahne_renk

func sahne_rengi(c: Color) -> void:
	sahne_renk = c
	renk_guncelle()

func menu_acik() -> bool:
	return kayit != null and kayit.ic.visible

## karakterin kısa sözü başının üstünde (web bubble)
func balon(t: String, sure: float) -> void:
	balon_yazi.text = t
	balon_yazi.visible = true
	balon_yazi.reset_size()
	balon_t = sure

func _physics_process(dt: float) -> void:
	_dogur(dt)
	if balon_t > 0.0:
		balon_t -= dt
		var s: Vector2 = get_viewport().get_canvas_transform() * (oyuncu.position + Vector2(0, -40))
		balon_yazi.position = s - Vector2(balon_yazi.size.x / 2.0, balon_yazi.size.y)
		if balon_t <= 0.0: balon_yazi.visible = false
	# çantanın üstüne yürüyünce her şey geri gelir
	for m in mezarlar.duplicate():
		if m.p.distance_to(oyuncu.position) < 14.0 and not oyuncu.bayildi:
			var n := 0
			for k in m.inv:
				env.ekle(k, int(m.inv[k])); n += int(m.inv[k])
			env.vio_ekle(int(m.vio))
			for i in 16: parca(m.p + Vector2(0, -4), Vector2(randf_range(-25, 25), -20 - randf() * 40), 0.7, Color("#c9a0ff") if i % 2 else Color.WHITE)
			env.mesaj("Eşyalarını geri aldın: %d malzeme%s" % [n, (", %d Vio" % int(m.vio)) if int(m.vio) > 0 else ""])
			m.dugum.queue_free()
			mezarlar.erase(m)

# ------------------------------------------------------------------ bayılma (web faint, deathDrop, deathTalk; belge: Hayatta kalma › Bayılma)
## taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) %20'si ve Vio'nun %20'si gider (ilk gece hiçbir şey gitmez);
## kalanı düştüğün yerde bir çantada kalır (kurukafa). Kumsalda can %50 ile uyanırsın; Kemal seni bulduğunu anlatır.
const KEMAL_ALAY := ["Gece karanlıktır evlat, öğreneceksin bunları! Sabah seni burada, yüzüstü buldum.", "Yine mi? Gece karanlıktır evlat! Ateşin ya da meşalen yoksa karanlıkta durmayacaksın.", "Hah, bizim gece kuşu uyanmış! Karanlıkta ışıksız gezilmez evlat, kaç kere söyleyeceğim?", "Seni yine taşıdım buraya. Gece karanlıktır, karanlık da açtır. Meşalesiz çıkma!"]
var ilk_gece_bayilma := true
func bayil(sebep: String) -> void:
	if oyuncu.bayildi: return
	get_tree().create_timer(2.5).timeout.connect(func(): ani.olay("faint"))
	if reis != null: reis.bayildi()   # web v318: bayılınca %60 bir anı
	oyuncu.bayildi = true
	oyuncu.rotation = PI / 2
	var gece := sebep == "gece"
	var kayip := 0.0 if zaman.ilk_gece() else 0.2
	var yer: Vector2 = oyuncu.position
	if magara.icinde: yer = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 30.0)
	var m := {p = yer, inv = {}, vio = 0}
	var gitti := 0
	for n in env.inv.keys():
		var q: int = env.adet(n)
		if q <= 0 or toplama_veri.tools.has(n) or n == "Taş kılıç" or (el_yapimi.R.has(n) and el_yapimi.R[n].place) or n == "Kaba meşale" or n == "Meşale":
			continue
		var l := int(round(q * kayip))
		gitti += l
		if q - l > 0: m.inv[n] = q - l
		env.eksilt(n, q)
	var lv := int(round(env.vio * kayip))
	m.vio = env.vio - lv
	env.vio_ekle(-env.vio)
	var cantali: bool = not m.inv.is_empty() or int(m.vio) > 0
	if cantali:
		var d := Node2D.new()
		d.position = yer
		d.draw.connect(_mezar_ciz.bind(d))
		nesneler.add_child(d)
		m.dugum = d
		mezarlar.append(m)
	await get_tree().create_timer(1.2).timeout
	if magara.icinde: magara._cik(true, true)
	for c in canlilari_ver(): c.queue_free()
	oyuncu.rotation = 0
	oyuncu.position = Vector2(harita.spawn.x, harita.spawn.y)
	oyuncu.hp = round(oyuncu.hp_max * 0.5)
	can_guncelle(oyuncu.hp, oyuncu.hp_max)
	env.tokluk = maxf(env.tokluk, 30.0)
	kamera.reset_smoothing()
	oyuncu.bayildi = false
	await get_tree().create_timer(1.6).timeout
	var ne := ""
	if gece:
		ne = "Gece karanlıktır evlat, öğreneceksin bunları! Sabah seni kıyıda baygın buldum. Mor bir ışık mı? …Karanlıkta bir şey var, ışıktan korkar. Ya bir ateşin yanında kal ya da meşalen elinde olsun." if ilk_gece_bayilma else KEMAL_ALAY.pick_random()
		ilk_gece_bayilma = false
	else:
		ne = "Kıyıda baygın yatıyordun evlat, dalgalar seni yine bana getirdi."
	if cantali:
		ne += " Çantan ve Vio'ların [b]düştüğün yerde[/b] kaldı; git, kalanını geri al."
		if gitti > 0 or lv > 0: ne += " Bir kısmı çoktan gitmiş (%%20%s)." % ((", %d Vio" % lv) if lv > 0 else "")
	if kayip == 0.0: ne += " Neyse ki çantana kimse dokunmamış; ama bir dahaki gece bu kadar şanslı olmayabilirsin."
	var K: Dictionary = toplama_veri.kisiler[0]
	konusma.ac(K.ad, load(K.portre), ne, [{t = ("Öğrendim, öğrendim…" if gece and not ilk_gece_bayilma else ("Gidip alacağım" if cantali else "Anladım")), pri = true, kapat = true}])

func _mezar_ciz(d: Node2D) -> void:
	var px := func(x: float, y: float, w: float, h: float, c: Color): d.draw_rect(Rect2(x, y, w, h), c)
	d.draw_set_transform(Vector2(0, 3), 0, Vector2(8, 2.5)); d.draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.25)); d.draw_set_transform(Vector2.ZERO)
	px.call(-7, 0, 6, 2, Color("#e8e0d0")); px.call(1, 1, 6, 2, Color("#d8d0c0")); px.call(-8, -1, 2, 4, Color("#f4ecdc")); px.call(6, 0, 2, 4, Color("#f4ecdc"))
	px.call(-3, -8, 7, 6, Color("#f4ecdc")); px.call(-2, -9, 5, 1, Color("#f4ecdc")); px.call(-2, -6, 2, 2, Color("#2a1f2a")); px.call(1, -6, 2, 2, Color("#2a1f2a"))
	px.call(0, -3, 1, 1, Color("#2a1f2a")); px.call(-2, -2, 5, 1, Color("#d8d0c0"))

# ------------------------------------------------------------------ kayıt: oyunun durumu
func _durum_al() -> Dictionary:
	var p: Vector2 = oyuncu.position
	if magara.icinde: p = Vector2(magara.M.kapi.x, float(magara.M.kapi.y) + 24.0)
	var G = gorev
	var ak = null
	if G.aktif != null: ak = G.aktif if G.aktif.has("filler") else G.aktif.id
	var mz := []
	for m in mezarlar: mz.append({x = m.p.x, y = m.p.y, inv = m.inv, vio = m.vio})
	return {
		oyuncu = {x = p.x, y = p.y, hp = oyuncu.hp},
		env = {inv = env.inv, kemer = env.kemer, el = env.el, tokluk = env.tokluk, dayan = env.dayan, gorulen = env.gorulen.keys(), vio = env.vio, xp = env.xp, sv = env.sv},
		tarifler = el_yapimi.bilinen.keys(), verilen = el_yapimi.verilen.keys(), ogretici = ogr.kayit(),
		gorev = {aktif = ak, b = G.b, bitenler = G.bitenler, kills = G.kills, qc = G.qc, biyomlar = G.biyomlar.keys(), dovulen = G.dovulen.keys(), dersler = G.gorulen_dersler},
		mesale = {ts = mesale.ts, yaniyor = mesale.yaniyor, yanma = mesale.yanma},
		magara = magara.kayit(), magaralar = magara.kayit2(),
		zaman_oyun = {dk = zaman.dk, gun = zaman.gun, mesale_verildi = zaman.mesale_verildi, ilk_bayilma = ilk_gece_bayilma},
		yetenekler = ders.kayit_yetenek(), dl_agac = dl_agac, kuzen = kuzen.tanis.keys(), kusam = kusam, puan = puan, puan_ders = puan_ders, yapi = yapi.kayit(), insa = insa.kayit(), evcil = evcil.kayit(), kopru = kopru.kayit(), gecit = gecit.kayit(), kesif = harita_k.kayit(), buyu = buyu.kayit(), ani = ani.kayit(), reis = reis.kayit(), dovus = dovus.kayit(), balik = balik.kayit(), ciftlik = ciftlik.kayit(), poyraz = poyraz.kayit(), gezgin = gezgin.kayit(), isikci = isikci.kayit(), hikaye = hikaye.kayit(), izler = iz.kayit(), yan = yan.kayit(), camur_dedi = camur_dedi,
		mezarlar = mz, kahraman = gorunus, sevgili = sevgili, zorluk = zorluk, adlar = {kahraman = ad_kahraman, sevgili = ad_sevgili}}

## iki ada: kaydın üst düzeyi hep Yıldızsız Ada'nın yerel durumudur, ikinci adanınki "ada2"de durur (web: d.i2); ada = şu an nerede
func durum_al() -> Dictionary:
	var d := _durum_al()
	var yerel := {x = d.oyuncu.x, y = d.oyuncu.y}
	for k in ADA_YEREL: yerel[k] = d[k]
	if ada == 2:
		d.ada2 = yerel
		d.oyuncu.x = ada_diger.get("x", harita.spawn.x); d.oyuncu.y = ada_diger.get("y", harita.spawn.y)
		for k in ADA_YEREL:
			if ada_diger.has(k): d[k] = ada_diger[k]
			else: d.erase(k)
	elif not ada_diger.is_empty():
		d.ada2 = ada_diger
	d.ada = ada
	return d

## adalar arası geçiş (web travel): kaydet, sahneyi öbür adayla yeniden kur
var gecis_ekrani: Control
func seyahat(to: int, how: String) -> void:
	if to == ada: return
	var d := durum_al()
	d.ada = to
	d.varis = how
	d.zaman = Time.get_unix_time_from_system()
	d.surum = SURUM
	var f := FileAccess.open(Kayit.yol("oto"), FileAccess.WRITE)
	if f != null:
		f.store_string(JSON.stringify(d)); f.close()
	var k := CanvasLayer.new(); k.layer = 20; add_child(k)
	var r := ColorRect.new(); r.color = Color("#07060c"); r.set_anchors_preset(Control.PRESET_FULL_RECT); k.add_child(r)
	var l := Label.new(); l.text = ("Yüzen Kayalar" if to == 2 else "Yıldızsız Ada") + " · yükleniyor…"; l.set_anchors_preset(Control.PRESET_CENTER)
	l.add_theme_font_size_override("font_size", 20); l.add_theme_color_override("font_color", Color("#e0d0ff")); l.position = Vector2(-120, -12); k.add_child(l)
	Kayit.bekleyen = d
	Kayit.dogrudan = true
	get_tree().paused = false
	(func(): get_tree().reload_current_scene()).call_deferred()

func gorunus_uygula(L: Dictionary) -> void:
	gorunus = L
	oyuncu.spr.texture = Karakter.sayfa(L)

func durum_yukle(d: Dictionary) -> void:
	if d.has("kahraman"): gorunus_uygula(d.kahraman)
	if d.has("sevgili"): sevgili = d.sevgili
	zorluk = str(d.get("zorluk", "normal"))
	var ad: Dictionary = d.get("adlar", {})
	ad_kahraman = str(ad.get("kahraman", "")); ad_sevgili = str(ad.get("sevgili", ""))
	if d.get("yeni", false): return
	var dd: Dictionary = d.get("ada2", {})
	if ada == 2:
		ada_diger = {x = d.get("oyuncu", {}).get("x", 0.0), y = d.get("oyuncu", {}).get("y", 0.0)}
		for k in ADA_YEREL:
			if d.has(k): ada_diger[k] = d[k]
		d = d.duplicate()
		d.oyuncu = d.get("oyuncu", {}).duplicate()
		d.oyuncu.x = dd.get("x", harita.spawn.x); d.oyuncu.y = dd.get("y", harita.spawn.y)
		for k in ADA_YEREL:
			if dd.has(k): d[k] = dd[k]
			else: d.erase(k)
	else:
		ada_diger = dd
	var o: Dictionary = d.get("oyuncu", {})
	if o.has("x"): oyuncu.position = Vector2(o.x, o.y)
	var e: Dictionary = d.get("env", {})
	env.inv = {}
	for k in e.get("inv", {}): env.inv[k] = int(e.inv[k])
	var km: Array = e.get("kemer", [])
	for i in mini(5, km.size()): env.kemer[i] = km[i]
	env.el = int(e.get("el", -1))
	env.tokluk = float(e.get("tokluk", env.tokluk))
	env.dayan = {}
	for k in e.get("dayan", {}): env.dayan[k] = float(e.dayan[k])
	env.gorulen = {}
	for k in e.get("gorulen", []): env.gorulen[k] = true
	env.sv = int(e.get("sv", 1)); env.xp = int(e.get("xp", 0))
	env.vio = 0; env.vio_ekle(int(e.get("vio", 0)))
	env._sv_ciz()
	env.kemer_ciz()
	el_yapimi.bilinen = {}
	for k in d.get("tarifler", []): el_yapimi.bilinen[k] = true
	el_yapimi.verilen = {}
	for k in d.get("verilen", []): el_yapimi.verilen[k] = true
	ogr.yukle(d.get("ogretici", {}))
	var g: Dictionary = d.get("gorev", {})
	var G = gorev
	G.bitenler = g.get("bitenler", [])
	G.kills = {}
	for k in g.get("kills", {}): G.kills[k] = int(g.kills[k])
	G.qc = {}
	for k in g.get("qc", {}): G.qc[k] = int(g.qc[k])
	G.biyomlar = {}
	for k in g.get("biyomlar", [0]): G.biyomlar[int(k)] = true
	G.dovulen = {}
	for k in g.get("dovulen", []): G.dovulen[k] = true
	G.gorulen_dersler = g.get("dersler", [])
	G.b = g.get("b", {})
	var ak = g.get("aktif", null)
	if ak is Dictionary: G.aktif = ak
	elif ak is String and G.QI.has(ak): G.aktif = G.QI[ak]
	else: G.aktif = null
	G.yenile()
	var ms: Dictionary = d.get("mesale", {})
	mesale.ts = ms.get("ts", null)
	mesale.yaniyor = bool(ms.get("yaniyor", false))
	mesale.yanma = ms.get("yanma", {})
	var mg: Dictionary = d.get("magara", {})
	magara.yukle(mg, d.get("magaralar", {}))
	var z: Dictionary = d.get("zaman_oyun", {})
	zaman.dk = float(z.get("dk", 360.0)); zaman.gun = int(z.get("gun", 1))
	zaman.mesale_verildi = bool(z.get("mesale_verildi", false))
	ilk_gece_bayilma = bool(z.get("ilk_bayilma", true))
	for m in d.get("mezarlar", []):
		var dg := Node2D.new()
		dg.position = Vector2(m.x, m.y)
		dg.draw.connect(_mezar_ciz.bind(dg))
		nesneler.add_child(dg)
		mezarlar.append({p = dg.position, inv = m.inv, vio = int(m.vio), dugum = dg})
	yetenekler = {}
	for k in d.get("yetenekler", []): yetenekler[k] = true
	dl_agac = bool(d.get("dl_agac", false))
	kuzen.tanis = {}
	for k in d.get("kuzen", []): kuzen.tanis[k] = true
	var ks: Dictionary = d.get("kusam", {})
	for s in kusam: kusam[s] = ks.get(s, null)
	puan = {}
	var pd: Dictionary = d.get("puan", {})
	for k in pd: puan[k] = int(pd[k])
	puan_ders = int(d.get("puan_ders", 2 if env.sv > 1 else 0))
	yapi.yukle(d.get("yapi", {}))
	evcil.yukle(d.get("evcil", {}))
	kopru.yukle(d.get("kopru", []))
	gecit.yukle(d.get("gecit", false))
	harita_k.yukle(d.get("kesif", ""))
	buyu.yukle(d.get("buyu", {}))
	ani.yukle(d.get("ani", {}))
	reis.yukle(d.get("reis", {}))
	dovus.yukle(d.get("dovus", {}))
	balik.yukle(d.get("balik", {}))
	ciftlik.yukle(d.get("ciftlik", {}), kuzen.tanis.has("ekin_gitti"))
	poyraz.yukle(d.get("poyraz", {}))
	gezgin.yukle(d.get("gezgin", {}))
	isikci.yukle(d.get("isikci", {}))
	hikaye.yukle(d.get("hikaye", {}))
	iz.yukle(d.get("izler", []))
	yan.yukle(d.get("yan", {}))
	camur_dedi = bool(d.get("camur_dedi", false))
	insa.yukle(d.get("insa", {}))
	oyuncu.yetenek_uygula()
	oyuncu.hp = float(o.get("hp", oyuncu.hp_max))
	can_guncelle(oyuncu.hp, oyuncu.hp_max)
	kamera.reset_smoothing()
