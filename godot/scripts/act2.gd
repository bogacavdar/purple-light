## ACT 2 adasının ustaları (web v76–v81). Şimdilik Gökbilimci Yıldız (Yüzen Kayalar): teleskobu, konuşması, kazanı (ACT 2'de tarifler
## onun yanındaki kazanda öğrenilir) ve son işinden sonra açılan portallar. Görevleri (gk1–gk3) gorev.gd'de, data/ada2/ustalar.json'dan.
extends Node

var oyun
var U: Dictionary = {}          # data/ada2/ustalar.json

func kur(o) -> void:
	oyun = o
	U = o._json("res://data/ada2/ustalar.json")

const ROL := {"gok": "gk", "pervin": "pv"}
## ikinci adada kişi listesine girecek ustalar (şimdilik Yıldız ve Efsun)
func kisiler() -> Array:
	var out := []
	for k in U.kisiler:
		if ROL.has(k.k):
			var d: Dictionary = k.duplicate(true)
			d.rol = ROL[k.k]
			out.append(d)
	return out

## kişi düğümü kurulunca: Yıldız'ın teleskobu, Efsun'un mor ateşi ve şapkası
func kisi_kuruldu(n) -> void:
	if n.K.k == "gok": teleskop_kur(n)
	if n.K.k == "pervin": efsun_kur(n)

func usta(k: String) -> Dictionary:
	for x in U.kisiler:
		if x.k == k: return x
	return {}

## Yıldız'ın teleskobu (web drawScope): kişinin sağında, göğe dönük
func teleskop_kur(n) -> void:
	var t := Node2D.new()
	t.position = n.position + Vector2(16, 0)
	t.draw.connect(func():
		t.draw_rect(Rect2(-1, -14, 2, 14), Color("#4a3a2a"))
		t.draw_rect(Rect2(-6, -1, 3, 2), Color("#4a3a2a"))
		t.draw_rect(Rect2(4, -1, 3, 2), Color("#4a3a2a"))
		t.draw_set_transform(Vector2(0, -15), -0.6, Vector2.ONE)
		t.draw_rect(Rect2(-3, -14, 6, 16), Color("#8a7a5a"))
		t.draw_rect(Rect2(-4, -16, 8, 3), Color("#c8a868"))
		t.draw_rect(Rect2(-2, -16, 4, 1), Color("#bfe8ff"))
		t.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE))
	oyun.nesneler.add_child(t)

func _soyle(n, metin: String, secs: Array) -> void:
	oyun.konusma.ac(n.K.ad, load(n.K.portre) if n.K.get("portre", null) != null else null, metin, secs)

## web talkGok
func yildiz(n) -> void:
	var K = oyun.kuzen
	if not K.tanis.has("gok"):
		K.tanis["gok"] = true
		_soyle(n, "[i](teleskobunun başında, gözünü ayırmadan)[/i] Bir gemi daha… ve içinden çıkan bir yolcu. Hoş geldin evlat, ben [b]Yıldız[/b]. Kırk yıldır gökyüzünü izlerim. Seni buraya getiren denizci değil, o mor ışık; bunu gözlerinden okuyorum. Otur biraz. Anlatacak çok şeyim var, ama önce yardımına ihtiyacım var.",
			[{t = "Mor ışık nedir?", f = func(): _soyle(n, "Bir yıldız değil, onu söyleyeyim. Yıldızlar titrer; o bakar. Gerisini, sen bana yardım ettikçe anlatırım.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])}, {t = "Hoşça kal", kapat = true}])
		return
	if oyun.gorev.bitti("gk3"):
		_soyle(n, "Portallar çalışıyor. Yıldızsız Ada'daki her dostunun yanında bir kapı var; buradaki iki kapı da seni oraya götürür. Gökyüzü sabırsızlanıyor evlat.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])
		return
	var L := ["Gökyüzü bu gece berrak. İyi işaret.", "Teleskop hiç yalan söylemez; gözler söyler.", "Bu kayalar havada durur, biliyor musun? Ben de nedenini kırk yıldır bilmiyorum."]
	_soyle(n, L[randi() % L.size()], [{t = "Kazana bak", f = func(): oyun.istasyon.ac("kazan")}, {t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])

# ------------------------------------------------------------------ Büyücü Efsun (web v77: Dev Mantar Ormanı; mor mana ve asalar)
const MAKES := [["Ateş asası", 100], ["Buz asası", 200], ["Yıldırım asası", 300], ["Mana iksiri", 10]]
const ODUL := {"pv1": "Mana iksiri", "pv3": "Ateş asası", "pv4": "Buz asası", "pv5": "Yıldırım asası"}

func efsun_kur(n) -> void:
	# şapka (web: kişinin başında mor sivri şapka)
	var h := Node2D.new()
	h.draw.connect(func():
		var c := Color("#3e1a66")
		h.draw_rect(Rect2(-6, -21, 12, 2), c); h.draw_rect(Rect2(-4, -24, 8, 3), c); h.draw_rect(Rect2(-2, -27, 4, 3), c); h.draw_rect(Rect2(-1, -29, 2, 2), c))
	n.add_child(h)
	# havada asılı mor ateş
	var f := Node2D.new()
	f.position = n.position + Vector2(18, 0)
	f.set_meta("t", 0.0)
	f.draw.connect(func():
		var y := roundf(sin(Time.get_ticks_msec() / 1000.0 * 5.0))
		f.draw_set_transform(Vector2(0, 1), 0, Vector2(9, 3)); f.draw_circle(Vector2.ZERO, 1.0, Color(0.47, 0.24, 0.78, 0.35)); f.draw_set_transform(Vector2.ZERO)
		f.draw_rect(Rect2(-3, -10 + y, 6, 6), Color("#a050e0")); f.draw_rect(Rect2(-2, -12 + y, 4, 4), Color("#d8b0ff")); f.draw_rect(Rect2(-1, -13 + y, 2, 2), Color.WHITE))
	var tm := Timer.new(); tm.wait_time = 0.08; tm.autostart = true
	tm.timeout.connect(func():
		f.queue_redraw()
		if randf() < 0.1 and f.global_position.distance_to(oyun.oyuncu.position) < 400.0: oyun.parca(f.position + Vector2(randf_range(-3, 3), -12), Vector2(0, -14), 0.7, Color("#c9a0ff")))
	f.add_child(tm)
	oyun.nesneler.add_child(f)

func _ey():
	return oyun.el_yapimi

func _yapabilir(n: String) -> bool:
	return _ey().bilinen.has(n) and _ey().eksik(n) == ""

## web talkPervin
func efsun(n) -> void:
	var K = oyun.kuzen
	if not K.tanis.has("pervin"):
		K.tanis["pervin"] = true
		oyun.buyu.ac()
		_soyle(n, "[i](mantarların arasında, havada asılı mor bir ateşin başında)[/i] Ah, Yıldız'ın yolladığı yolcu! Ben [b]Efsun[/b]. Buna büyü diyorlar ama değil: gökten düşen [b]mor kıymıkların[/b] enerjisi. Doğru taşla, doğru otla onu yönlendirebilirsin. Sende de bir kıvılcım var; hissediyorum. Görüyor musun, artık [b]mor manan[/b] var.", [{t = "Hoşça kal", kapat = true}])
		return
	var ch := []
	for m in MAKES:
		var nm: String = m[0]
		if not (_ey().verilen.has(nm) or _ey().bilinen.has(nm)): continue
		ch.append({t = "%s %s yap (%d Vio)" % ["✦" if _yapabilir(nm) else "·", nm, int(m[1])], f = _yap.bind(n, nm, int(m[1]))})
	ch.append({t = "Hoşça kal", pri = true, kapat = true})
	var L := ["Mantarlar konuşur; dinlemesini bilene.", "Goblinler kıymık toplar ama ne işe yaradığını bilmez.", "Mana nefes gibidir: zorlarsan tükenir, beklersen dolar."]
	_soyle(n, L[randi() % L.size()], ch)

func _yap(n, nm: String, ucret: int) -> void:
	var geri := [{t = "Tamam", pri = true, f = func(): efsun(n)}]
	if not _ey().bilinen.has(nm):
		_soyle(n, "[b]%s[/b] tarifini önce kazanda öğrenmelisin evlat. Yıldız'ın kazanı Yüzen Kayalar'da." % nm, geri)
		return
	var eks: String = _ey().eksik(nm)
	if eks != "":
		_soyle(n, "Eksik: %s." % eks, geri)
		return
	if oyun.env.vio < ucret:
		_soyle(n, "Emeğim %d Vio." % ucret, geri)
		return
	for p in _ey().R[nm].i:
		var need := int(p[1])
		for m in oyun.gorev.grup(str(p[0])):
			var al := mini(need, oyun.env.adet(m))
			if al > 0: oyun.env.eksilt(m, al)
			need -= al
			if need <= 0: break
	oyun.env.vio_ekle(-ucret)
	oyun.env.ekle(nm, 1)
	if oyun.buyu.asa_mi(nm): oyun.buyu.ac()
	_soyle(n, "[i](asanın ucundaki taş kızarır)[/i] Al bakalım. Saldırı tuşuna bas: ateş topu fırlar. Her atış biraz [b]mor mana[/b] yer; mana kendiliğinden dolar, [b]mana iksiri[/b] hızlandırır." if nm == "Ateş asası" else "%s hazır." % nm, [{t = "Teşekkürler", pri = true, kapat = true}])

## görev ödülleri: tarifler kitaba yazılır (web bought.add), Yıldız'ın kazanında öğrenilir
func _process(_dt: float) -> void:
	if oyun == null or oyun.gorev == null: return
	for id in ODUL:
		var nm: String = ODUL[id]
		if oyun.gorev.bitti(id) and not _ey().verilen.has(nm) and not _ey().bilinen.has(nm):
			_ey().verilen[nm] = true
			if nm != "Mana iksiri": oyun.env.mesaj("%s · tarifi kitabında: Yıldız'ın kazanında öğren, Efsun yapsın" % nm)
