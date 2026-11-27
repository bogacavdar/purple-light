## Çanta, alet kemeri, tokluk ve kısa bildirimler (web: inv, belt/hand, food, toast).
## Sayılar ve eşya resimleri data/toplama.json'dan (web oyunundan otomatik).
extends Node

var oyun
var G: Dictionary                # data/toplama.json
var inv := {}                    # eşya adı → adet
var kemer: Array = [null, null, null, null, null]   # web belt: 5 yuva
var el := -1                     # elde tutulan kemer yuvası (-1: el boş)
var tokluk := 100.0
var aclik_hasar := 0.0
var dayan := {}                  # alet adı → kalan dayanıklılık
var gorulen := {}                # web seen: bir kez eline geçmiş her eşya
var vio := 0
var xp := 0
var sv := 1
var vio_yazi: Label
var sv_yazi: Label
var puan_dugme: Button
var xp_cubuk: ProgressBar

var ikon := {}                   # eşya adı → Texture2D
var ust: Control
var tok_cubuk: ProgressBar
var kemer_kutu: HBoxContainer
var canta: PanelContainer
var canta_izgara: GridContainer
var bildirim: VBoxContainer
var ilerleme: ProgressBar
var ilerleme_yazi: Label

func kur(o) -> void:
	oyun = o
	G = oyun._json("res://data/toplama.json")
	for k in G.items:
		var A: Dictionary = G.items[k]
		if A.has("file"):
			ikon[k] = load(A.file)
	inv = G.start.inv.duplicate()
	for n in inv:
		gorulen[n] = true
	tokluk = float(G.start.food)
	_arayuz()
	kemer_ciz()
	vio_ekle(0)
	_sv_ciz()

func ikon_al(n: String) -> Texture2D:
	return ikon.get(n, null)

func adet(n: String) -> int:
	return int(inv.get(n, 0))

func ekle(n: String, k: int = 1) -> void:
	inv[n] = adet(n) + k
	if oyun.basarim != null: oyun.basarim.esya(n)
	if not gorulen.has(n) and oyun.sk("T6") and oyun.pazar != null and oyun.pazar.P.ham.has(n):
		# İlk keşif ödülü: yeni malzeme ilk bulunduğunda fiyatının 5 katı
		var r := int(round(oyun.pazar.taban(n) * 5.0))
		if r > 0:
			vio_ekle(r)
			mesaj("İlk keşif: %s · +%d Vio" % [n, r])
	gorulen[n] = true
	# aletler ve silahlar kemerdeki ilk boş yuvaya kendiliğinden girer (web: hotItem)
	if (G.tools.has(n) or oyun.kusanma.silah.has(n) or oyun.yapi.yapi_mi(n) or (oyun.ses != null and oyun.ses.alet_mi(n))) and kemer.find(n) < 0:
		var i := kemer.find(null)
		if i >= 0:
			kemer[i] = n
			if G.tools.has(n) and not dayan.has(n):
				dayan[n] = int(G.tools[n].dur)
	kemer_ciz()
	if canta.visible:
		canta_ciz()
	if oyun.el_yapimi and oyun.el_yapimi.pencere.visible:
		oyun.el_yapimi.ciz()

func eksilt(n: String, k: int = 1) -> void:
	inv[n] = maxi(0, adet(n) - k)
	if inv[n] == 0:
		inv.erase(n)
		var i := kemer.find(n)
		if i >= 0:
			kemer[i] = null
			if el == i:
				el = -1
	kemer_ciz()
	if canta.visible:
		canta_ciz()

func elde() -> String:
	if el < 0 or el >= kemer.size() or kemer[el] == null:
		return ""
	return kemer[el]

func elde_tur() -> String:
	var h := elde()
	return G.tools[h].kind if G.tools.has(h) else ""

## web aletin aşınması: her kullanımda 1 azalır; 0'da körelir ve iş görmez
func alet_kullan(n: String) -> bool:
	if not dayan.has(n):
		dayan[n] = int(G.tools[n].dur)
	if Hile.dayan: return true
	if dayan[n] <= 0:
		mesaj("%s köreldi! Demirci Dursun'da bilenir." % n, true)
		return false
	# Sağlam aletler: %20/%40/%60 ihtimalle aşınmaz
	if not (oyun.kesif.alet_usta() and randf() < 0.2) and not (randf() < (0.6 if oyun.sk("A7") else (0.4 if oyun.sk("A6") else (0.2 if oyun.sk("A5") else 0.0)))):
		dayan[n] -= 1
	if dayan[n] <= 0:
		mesaj("%s köreldi!" % n, true)
	kemer_ciz()
	return true

## web eat(): tokluk dolar (100'ü geçmez), şifalı yiyecek can da verir
func ye() -> void:
	var sec := ""
	var h := elde()
	if h != "" and _yenir(h):
		sec = h
	else:
		var en := 1e9
		for n in inv:
			if _yenir(n) and float(G.items[n].food) < en:
				en = float(G.items[n].food)
				sec = n
	if sec == "":
		mesaj("Yiyecek bir şeyin yok", true)
		return
	var f := float(G.items[sec].food)
	var hl := float(G.items[sec].heal)
	eksilt(sec)
	if sec == "Mana iksiri" and oyun.buyu != null: oyun.buyu.iksir()
	tokluk = minf(100.0, tokluk + f)
	oyun.ogr.yedi(sec)
	if hl > 0:
		hl *= 1.5 if oyun.sk("D12") else 1.0
		oyun.oyuncu.hp = minf(oyun.oyuncu.hp_max, oyun.oyuncu.hp + hl)
		oyun.can_guncelle(oyun.oyuncu.hp, oyun.oyuncu.hp_max)
	oyun.yazi(oyun.oyuncu.position + Vector2(0, -26), "+%d tokluk" % int(f), Color("#f2b84b"), 8)

func _yenir(n: String) -> bool:
	return G.items.has(n) and (float(G.items[n].food) > 0 or float(G.items[n].heal) > 0) and adet(n) > 0

func _process(dt: float) -> void:
	# web tickHunger: bir günde (720 sn) boşalır; ilk iki gün yarı hızla (günler Godot'da henüz yok: ilk günler sayılır)
	tokluk = maxf(0.0, tokluk - float(G.hunger.perSec) * 0.5 * (0.75 if oyun.sk("D13") else 1.0) * (0.8 if oyun.kesif != null and oyun.kesif.usta("Yiyecek") else 1.0) * (1.25 if oyun.hava != null and oyun.hava.canli() and oyun.hava.mevsim() == 3 else 1.0) * (0.0 if oyun.yemek != null and oyun.yemek.var_mi("doygun") else 1.0) * dt)
	tok_cubuk.value = tokluk
	if tokluk <= 0.0 and not oyun.oyuncu.bayildi:
		aclik_hasar += dt
		if aclik_hasar >= 1.0:
			aclik_hasar = 0.0
			oyun.oyuncu.hp = maxf(0.0, oyun.oyuncu.hp - 2.0)
			oyun.can_guncelle(oyun.oyuncu.hp, oyun.oyuncu.hp_max)
	for i in 5:
		if Input.is_action_just_pressed("kemer%d" % (i + 1)):
			el = -1 if el == i else i
			kemer_ciz()
			_el_degisti()
	if Input.is_action_just_pressed("kemer_sonraki"):
		el = (el + 1) % 5 if el < 4 else -1
		kemer_ciz()
		_el_degisti()
	if Input.is_action_just_pressed("canta"):
		canta.visible = not canta.visible
		if canta.visible:
			canta_ciz()
	if Input.is_action_just_pressed("deneme_alet"):
		for n in ["Taş balta", "Taş kazma", "Taş kılıç"]:
			if adet(n) == 0:
				ekle(n)
		vio_ekle(100)
		mesaj("Deneme: Taş balta, Taş kazma, Taş kılıç ve 100 Vio verildi")

# ------------------------------------------------------------------ arayüz
func _arayuz() -> void:
	var hud: CanvasLayer = oyun.hud
	tok_cubuk = ProgressBar.new()
	tok_cubuk.custom_minimum_size = Vector2(180, 10)
	tok_cubuk.show_percentage = false
	tok_cubuk.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	tok_cubuk.max_value = 100.0
	var bg := StyleBoxFlat.new(); bg.bg_color = Color("#3a2a16"); bg.border_color = Color("#0b0f0a"); bg.set_border_width_all(2)
	var fg := StyleBoxFlat.new(); fg.bg_color = Color("#f2a33a")
	tok_cubuk.add_theme_stylebox_override("background", bg)
	tok_cubuk.add_theme_stylebox_override("fill", fg)
	oyun.can_cubugu.get_parent().add_child(tok_cubuk)
	oyun.can_cubugu.get_parent().move_child(tok_cubuk, 1)
	var sat := HBoxContainer.new()
	sat.add_theme_constant_override("separation", 10)
	vio_yazi = Label.new(); vio_yazi.add_theme_color_override("font_color", Color("#d8b0ff")); oyun._golge(vio_yazi)
	sv_yazi = Label.new(); oyun._golge(sv_yazi)
	xp_cubuk = ProgressBar.new(); xp_cubuk.custom_minimum_size = Vector2(90, 8); xp_cubuk.show_percentage = false
	xp_cubuk.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var xb := StyleBoxFlat.new(); xb.bg_color = Color("#16202a"); var xf := StyleBoxFlat.new(); xf.bg_color = Color("#6ab0e8")
	xp_cubuk.add_theme_stylebox_override("background", xb); xp_cubuk.add_theme_stylebox_override("fill", xf)
	sat.add_child(vio_yazi); sat.add_child(sv_yazi); sat.add_child(xp_cubuk)
	puan_dugme = Button.new(); puan_dugme.add_theme_font_size_override("font_size", 11)
	puan_dugme.add_theme_color_override("font_color", Color("#ffe27a")); puan_dugme.visible = false
	puan_dugme.pressed.connect(func(): oyun.karakter.ac())
	sat.add_child(puan_dugme)
	oyun.can_cubugu.get_parent().add_child(sat)
	oyun.can_cubugu.get_parent().move_child(sat, 2)
	# kemer: altta ortada 5 yuva
	kemer_kutu = HBoxContainer.new()
	kemer_kutu.add_theme_constant_override("separation", 4)
	hud.add_child(kemer_kutu)
	kemer_kutu.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM, Control.PRESET_MODE_MINSIZE, 44)
	# toplama çubuğu: oyuncunun üstünde değil, kemerin üstünde ortada
	var ik := VBoxContainer.new()
	ilerleme_yazi = Label.new()
	ilerleme_yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	oyun._golge(ilerleme_yazi)
	ilerleme = ProgressBar.new()
	ilerleme.custom_minimum_size = Vector2(160, 8)
	ilerleme.show_percentage = false
	var pb := StyleBoxFlat.new(); pb.bg_color = Color("#1b2418"); pb.border_color = Color("#0b0f0a"); pb.set_border_width_all(1)
	var pf := StyleBoxFlat.new(); pf.bg_color = Color("#9fe07a")
	ilerleme.add_theme_stylebox_override("background", pb)
	ilerleme.add_theme_stylebox_override("fill", pf)
	ik.add_child(ilerleme_yazi)
	ik.add_child(ilerleme)
	ik.visible = false
	hud.add_child(ik)
	ik.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM, Control.PRESET_MODE_MINSIZE, 110)
	ilerleme.set_meta("kutu", ik)
	# çanta (I)
	canta = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.07, 0.09, 0.07, 0.94); st.border_color = Color("#c9a24a"); st.set_border_width_all(2)
	st.set_content_margin_all(10)
	canta.add_theme_stylebox_override("panel", st)
	var v := VBoxContainer.new()
	var bas := Label.new(); bas.text = "Çanta  (I)"; oyun._golge(bas)
	v.add_child(bas)
	canta_izgara = GridContainer.new()
	canta_izgara.columns = 8
	v.add_child(canta_izgara)
	canta.add_child(v)
	canta.visible = false
	hud.add_child(canta)
	canta.set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
	# bildirimler: üstte ortada
	bildirim = VBoxContainer.new()
	hud.add_child(bildirim)
	bildirim.set_anchors_and_offsets_preset(Control.PRESET_CENTER_TOP, Control.PRESET_MODE_MINSIZE, 40)
	bildirim.grow_horizontal = Control.GROW_DIRECTION_BOTH
	bildirim.alignment = BoxContainer.ALIGNMENT_BEGIN

func _yuva(n, sec: bool, sayi: int, ust_yazi: String) -> Control:
	var p := PanelContainer.new()
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.1, 0.13, 0.1, 0.85)
	st.border_color = Color("#ffd84a") if sec else Color("#2a3328")
	st.set_border_width_all(2)
	p.add_theme_stylebox_override("panel", st)
	p.custom_minimum_size = Vector2(40, 40)
	var c := Control.new()
	c.custom_minimum_size = Vector2(36, 36)
	p.add_child(c)
	if n != null and ikon.has(n):
		var t := TextureRect.new()
		t.texture = ikon[n]
		t.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		t.size = Vector2(32, 32)
		t.position = Vector2(2, 2)
		c.add_child(t)
		p.tooltip_text = n
	if sayi > 1:
		var l := Label.new()
		l.text = str(sayi)
		l.add_theme_font_size_override("font_size", 11)
		oyun._golge(l)
		l.position = Vector2(20, 20)
		c.add_child(l)
	if ust_yazi != "":
		var u := Label.new()
		u.text = ust_yazi
		u.add_theme_font_size_override("font_size", 9)
		oyun._golge(u)
		u.position = Vector2(1, -3)
		c.add_child(u)
	return p

func kemer_ciz() -> void:
	for c in kemer_kutu.get_children():
		c.queue_free()
	for i in 5:
		var n = kemer[i]
		var s := 0 if n == null else adet(n)
		kemer_kutu.add_child(_yuva(n, el == i, s, str(i + 1)))

## elde bir yapı varsa yerleştirme başlar; bırakılınca biter
func _el_degisti() -> void:
	var Y = oyun.yapi
	if Y.yerlestiriyor() and Y.yer.tasinan == null: Y.vazgec()
	var h := elde()
	if Y.yapi_mi(h) and adet(h) > 0: Y.basla(h)

## çantada bir şeye tıklamak: yapıysa yere kurmaya başla, giyilecekse giy
func _canta_tik(n: String) -> void:
	if oyun.yapi.yapi_mi(n):
		canta.visible = false
		oyun.yapi.basla(n)
	elif oyun.yuva_of(n) != "":
		oyun.giy(n)
		canta_ciz()
	elif oyun.buyu != null and oyun.buyu.ok_mu(n):
		oyun.buyu.ok_sec(n)
		canta_ciz()

func canta_ciz() -> void:
	for c in canta_izgara.get_children():
		c.queue_free()
	var adlar := inv.keys()
	adlar.sort()
	for n in adlar:
		var y := _yuva(n, oyun.buyu != null and oyun.buyu.secili_ok == n, adet(n), "")
		y.gui_input.connect(func(e):
			if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT: _canta_tik(n))
		canta_izgara.add_child(y)
	if adlar.is_empty():
		var l := Label.new(); l.text = "Çanta boş"; canta_izgara.add_child(l)

func mesaj(t: String, kotu: bool = false) -> void:
	var l := Label.new()
	l.text = t
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.add_theme_color_override("font_color", Color("#ffb0a0") if kotu else Color("#fff2c0"))
	oyun._golge(l)
	bildirim.add_child(l)
	if kotu and oyun.ses != null: oyun.ses.cal("bad", 0.5)
	if bildirim.get_child_count() > 4:
		bildirim.get_child(0).queue_free()
	await get_tree().create_timer(3.2).timeout
	if is_instance_valid(l):
		l.queue_free()

func ilerleme_goster(yazi: String, k: float) -> void:
	var kutu: Control = ilerleme.get_meta("kutu")
	kutu.visible = k >= 0.0
	if k >= 0.0:
		ilerleme_yazi.text = yazi
		ilerleme.value = k * 100.0

func vio_ekle(n: int) -> void:
	if n < 0 and Hile.sonsuz: n = 0   # Sınırsız Vio: satın almak Vio'nu azaltmaz
	if oyun.ist != null: oyun.ist.vio(maxi(n, -vio))
	vio = maxi(0, vio + n)
	if n > 0 and oyun.ses != null: oyun.ses.cal("gold" if n >= 100 else "coin", 0.7)
	vio_yazi.text = ("%d Vio ∞" if Hile.sonsuz else "%d Vio") % vio

## web gainXP: seviye eşiği need(L) (Sv 16'ya kadar 40·1,35^(L-1), sonra 3606·(1+0,06·(L-16)))
func xp_ekle(n: int) -> void:
	n = int(round(n * (1.0 + (0.35 if oyun.sk("B6") else (0.2 if oyun.sk("B5") else (0.1 if oyun.sk("B4") else 0.0))))))
	xp += n
	oyun.yazi(oyun.oyuncu.position + Vector2(0, -30), "+%d XP" % n, Color("#9fd0f0"), 7)
	var need: Array = G.xpNeed
	while sv - 1 < need.size() and int(need[sv - 1]) > 0 and xp >= int(need[sv - 1]):
		xp -= int(need[sv - 1])
		sv += 1
		mesaj("Seviye %d! Seviye puanı kazandın." % sv)
		if oyun.ses != null: oyun.ses.cal("level")
		oyun.oyuncu.yetenek_uygula()
		if oyun.puan_ders == 0: _puan_dersi()
	_sv_ciz()

## web ilk seviye dersi: ilk kez seviye atlayınca kart; "Puanımı vereyim" karakter penceresini açar
func _puan_dersi() -> void:
	oyun.puan_ders = 1
	await get_tree().create_timer(1.2).timeout
	oyun.konusma.ac("", null, "[b]Seviye puanı kazandın: %d[/b]\n\nHer seviye atlayışta [b]seviye puanı[/b] gelir. Puanı hangi özelliğe verirsen o gelişir: toplama hızı, hareket, can, enerji, güç…\n\n[b]Karakter[/b] penceresinde ([b]C[/b]) istediğin özelliğin yanındaki [b]+[/b] düğmesine bas. Verilen puan geri alınmaz; puanın kaldıkça seviye çubuğunun yanında hatırlatılır." % oyun.puan_bos(), [{t = "Sonra", kapat = true}, {t = "Puanımı vereyim", pri = true, f = func(): oyun.karakter.ac()}])

func _sv_ciz() -> void:
	var need: int = int(G.xpNeed[mini(sv - 1, G.xpNeed.size() - 1)])
	sv_yazi.text = "Seviye %d" % sv
	if puan_dugme != null and oyun.kusanma.size() > 0:
		var b: int = oyun.puan_bos()
		puan_dugme.visible = b > 0
		puan_dugme.text = "%d puan ver" % b
	xp_cubuk.max_value = maxf(1.0, float(need))
	xp_cubuk.value = xp
