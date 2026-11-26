## Kumsalda uyanış (web startWake/tickWake/wakeTalk/askName/wakeDone; belge: Oyun akışı › Açılış 4–5).
## "ACT 1 · Yıldızsız Ada" kartı → kıyıda baygın yatarsın; Kemal yürüyerek gelir, 4,3 sn'de kalkarsın, "Neredeyim…?";
## Kemal konuşur, önce senin sonra sevdiğin kişinin adını sorar (adlar yazılır ya da zarla seçilir, en çok 14 harf, ilk harf büyük),
## sonra böğürtlen için yol gösterir; Kemal kampına döner, "Gün 1" duyurusu.
extends Control

const WAKE_UP := 4.3
const HERO_NAMES := ["Deniz", "Umut", "Ege", "Evren", "Derin", "Arda", "Kuzey", "Bulut", "Toprak", "Çınar", "Boğaç", "Selçuk", "Tolga", "Alp", "Anıl", "Rıdvan", "Cumhur", "Enes", "Engin", "Mehmet", "Mertcan", "Derman", "Eren", "Halil", "Doğukan", "Cengiz"]
const HEROINE_NAMES := ["Lale", "Nehir", "Ela", "Mavi", "İnci", "Su", "Melis", "Defne", "Ada", "Derin", "Aysel", "Cemre", "Tuğçe", "Nilgün", "Hilal", "Büşra", "Gül", "Gülnihal", "Ilgın", "Selen", "Dünya"]
const LOVE_M_NAMES := ["Kaan", "Emre", "Arda", "Kuzey", "Efe", "Doruk", "Toprak", "Çınar", "Bora", "Umut", "Boğaç", "Selçuk", "Tolga", "Alp", "Anıl", "Rıdvan", "Cumhur", "Enes", "Engin", "Mehmet", "Mertcan", "Derman", "Eren", "Halil", "Doğukan", "Cengiz"]
const LOVE_NAMES := ["Lale", "Nehir", "Ela", "Mavi", "İnci", "Yaprak", "Su", "Melis", "Defne", "Ada", "Aysel", "Cemre", "Tuğçe", "Nilgün", "Hilal", "Büşra", "Gül", "Gülnihal", "Ilgın", "Selen", "Dünya"]

var oyun
var acik := false
var t := 0.0
var adim := {}
var kemal
var kemal_hedef = null
var kart: ColorRect
var ad_kutu: PanelContainer
var ad_baslik: Label
var ad_yazi: RichTextLabel
var ad_giris: LineEdit
var ad_cb: Callable
var havuz: Array = []

func kur(o) -> void:
	oyun = o
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	kart = ColorRect.new(); kart.color = Color("#07050c"); kart.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var v := VBoxContainer.new(); v.alignment = BoxContainer.ALIGNMENT_CENTER; v.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var a := Label.new(); a.text = "ACT 1"; a.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; a.add_theme_font_size_override("font_size", 18); a.add_theme_color_override("font_color", Color("#b9aed6"))
	var b := Label.new(); b.text = "Yıldızsız Ada"; b.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; b.add_theme_font_size_override("font_size", 40); b.add_theme_color_override("font_color", Color("#efe6ff"))
	var c := Label.new(); c.text = "Yükleniyor…"; c.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; c.add_theme_color_override("font_color", Color("#8a80a8"))
	v.add_child(a); v.add_child(b); v.add_child(c)
	kart.add_child(v); kart.visible = false
	add_child(kart)
	# isim penceresi
	ad_kutu = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.08, 0.05, 0.12, 0.96); st.border_color = Color("#CFA6F6"); st.set_border_width_all(2); st.set_corner_radius_all(8); st.set_content_margin_all(16)
	ad_kutu.add_theme_stylebox_override("panel", st)
	var av := VBoxContainer.new(); av.add_theme_constant_override("separation", 10); av.custom_minimum_size = Vector2(420, 0)
	ad_baslik = Label.new(); ad_baslik.add_theme_font_size_override("font_size", 20); ad_baslik.add_theme_color_override("font_color", Color("#CFA6F6"))
	ad_yazi = RichTextLabel.new(); ad_yazi.bbcode_enabled = true; ad_yazi.fit_content = true; ad_yazi.scroll_active = false; ad_yazi.custom_minimum_size = Vector2(420, 0)
	ad_giris = LineEdit.new(); ad_giris.max_length = 14; ad_giris.add_theme_font_size_override("font_size", 20)
	ad_giris.text_submitted.connect(func(_s): _ad_tamam())
	var h := HBoxContainer.new(); h.alignment = BoxContainer.ALIGNMENT_END
	var zar := Button.new(); zar.text = "Rastgele"; zar.pressed.connect(_zar)
	var ok_ := Button.new(); ok_.text = "Tamam"; ok_.pressed.connect(_ad_tamam)
	h.add_child(zar); h.add_child(ok_)
	av.add_child(ad_baslik); av.add_child(ad_yazi); av.add_child(ad_giris); av.add_child(h)
	ad_kutu.add_child(av); ad_kutu.visible = false
	add_child(ad_kutu)
	ad_kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)

func basla() -> void:
	acik = true
	kart.visible = true
	kart.modulate.a = 1.0
	t = 0.0
	adim = {}
	var A: Dictionary = oyun.zaman.A
	oyun.oyuncu.position = Vector2(A.uyanis.x, A.uyanis.y)
	oyun.oyuncu.rotation = PI / 2
	oyun.oyuncu.kilit = true
	oyun.kamera.reset_smoothing()
	kemal = oyun.kisiler[0]
	kemal.position = Vector2(A.kemalGelis.x, A.kemalGelis.y)
	oyun.env.tokluk = 8.0
	await get_tree().create_timer(2.0).timeout
	var tw := create_tween(); tw.tween_property(kart, "modulate:a", 0.0, 0.6)
	tw.tween_callback(func(): kart.visible = false)

func _process(dt: float) -> void:
	if not acik: return
	_kemal_yuru(dt)
	if kart.visible or oyun.konusma.visible or ad_kutu.visible: return
	t += dt
	var P = oyun.oyuncu
	if t > 0.6 and not adim.has("yuru"):
		adim.yuru = true
		var yan := -1.0 if kemal.position.x < P.position.x else 1.0
		var g: Vector2 = P.position + Vector2(yan * 20.0, -1.0)
		if oyun.engel(g, 4.0): g = P.position + Vector2(-yan * 20.0, -1.0)
		if oyun.engel(g, 4.0): g = P.position + Vector2(0, -20)
		kemal_hedef = g
	if t >= WAKE_UP and not adim.has("kalk"):
		adim.kalk = true
		P.rotation = 0
		P.bak(Vector2(-1 if kemal.position.x < P.position.x else 1, 0))
	if t >= WAKE_UP + 0.4 and not adim.has("soru"):
		adim.soru = true
		oyun.balon("Neredeyim…?", 3.6)
	if t >= WAKE_UP + 2.6 and kemal_hedef == null and not adim.has("konus"):
		adim.konus = true
		P.bak(Vector2(-1 if kemal.position.x < P.position.x else 1, 0))
		_konus()

func _kemal_yuru(dt: float) -> void:
	if kemal_hedef == null: return
	var d: Vector2 = kemal_hedef - kemal.position
	if d.length() < 1.0:
		kemal.position = kemal_hedef
		kemal_hedef = null
		return
	kemal.position += d.normalized() * minf(d.length(), (34.0 if acik else 40.0) * dt)

func _de(metin: String, secenek: String, f: Callable) -> void:
	var K: Dictionary = oyun.toplama_veri.kisiler[0]
	oyun.konusma.ac(K.ad, load(K.portre), metin, [{t = secenek, pri = true, kapat = true, f = f}])

func _konus() -> void:
	_de("Ah, gözlerini açtın sonunda! Dalgalar seni bu sabah kıyıya attı. Ben [b]Kemal[/b]; bu adada yıllardır yaşıyorum.", "O nerede?!", _k2)

func _k2() -> void:
	_de("Kim? Kıyıda senden başka kimse yoktu evlat. Yalnızca sen, bir de sarıldığın şu tahta parçası. [i](Bir an susar.)[/i] Kıyıya hep yalnız biri vurur…", "Bir gemideydik… sonra mor bir ışık…", _k3)

func _k3() -> void:
	_de("Mor bir ışık mı? [i](Kemal bir an susar, gözü denize kayar.)[/i] …Kırk yıl önce benim gemim de bir gece battı. Deniz bazen insandan en sevdiğini alır evlat; ama umudu alamaz. Peki sen kimsin? [b]Adın ne?[/b]", "Adım… adım…", func(): _ad_sor(false, _k4))

func _k4(n: String) -> void:
	oyun.ad_kahraman = n
	_de("[b]%s[/b]. Güzel ad. Ya aradığın kişi? [b]Onun adı ne?[/b]" % n, "Onun adı…", func(): _ad_sor(true, _k5))

func _k5(m: String) -> void:
	oyun.ad_sevgili = m
	_de("[b]%s[/b]… [i](Kemal bir an denize bakar.)[/i] Kaybettiğini soran çok olur evlat. Sana söz veremem; denize kimse söz veremez. Ama bir şey biliyorum: aramak isteyen önce bu adada ayakta kalmayı öğrenmeli. Gel, sana yol göstereyim." % m, "Peki, başlayalım", _son)

func _son() -> void:
	oyun.env.tokluk = 25.0
	_de("Dur bakalım, yüzün kireç gibi; kim bilir kaç gündür ağzına lokma girmedi. Bu adada [b]ilk iş yemek bulmaktır[/b]: aç kalırsan canın hızla tükenir. Şuradaki çalıda [b]böğürtlen[/b] var. Git, [b]üç tane[/b] topla ve ye. Çalının [b]yanına git[/b] ve [b]F[/b]'ye bas; her basışta bir böğürtlen yere düşer, üstünden yürüyünce alırsın. Bir çalı üç böğürtlen verir. Ada cömerttir evlat; yeter ki yemek aramayı unutma.", "Böğürtlen toplayacağım", _bitti)

func _bitti() -> void:
	acik = false
	oyun.oyuncu.kilit = false
	var K: Dictionary = oyun.toplama_veri.kisiler[0]
	kemal_hedef = Vector2(K.x, K.y)
	oyun.ogr.basla()
	oyun.kayit.kaydet("oto")
	await get_tree().create_timer(4.0).timeout
	oyun.env.mesaj("Gün 1")

func _ad_sor(sevgili: bool, cb: Callable) -> void:
	ad_cb = cb
	var kadin: bool = oyun.gorunus.get("gender", "e") == "k"
	var o_kadin: bool = oyun.sevgili.get("gender", "k") == "k"
	ad_baslik.text = "Onun adını da hatırlamıyorsun" if sevgili else "Adını hatırlamıyorsun"
	ad_yazi.text = "Yüzü gözünün önünde, masanın öbür ucundaki gülüşü… ama adı yok. Hafızandan silinmeyen tek şey, onu sevdiğin. [b]Ona bir ad ver:[/b]" if sevgili else "Ne kadar zorlasan da aklına gelmiyor. Gemi, mor ışık, karanlık… öncesi bomboş. [b]Kendine bir ad ver:[/b]"
	havuz = (LOVE_NAMES if o_kadin else LOVE_M_NAMES) if sevgili else (HEROINE_NAMES if kadin else HERO_NAMES)
	ad_giris.text = ""
	ad_giris.placeholder_text = havuz.pick_random()
	ad_kutu.visible = true
	ad_kutu.reset_size()
	ad_kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
	ad_giris.grab_focus()

func _zar() -> void:
	var n: String = havuz.pick_random()
	while n == ad_giris.text and havuz.size() > 1: n = havuz.pick_random()
	ad_giris.text = n

func _ad_tamam() -> void:
	var n := ad_giris.text.strip_edges()
	while n.contains("  "): n = n.replace("  ", " ")
	n = n.substr(0, 14)
	if n == "": n = ad_giris.placeholder_text
	n = n.substr(0, 1).replace("i", "İ").to_upper() + n.substr(1)
	ad_kutu.visible = false
	ad_cb.call(n)
