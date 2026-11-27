extends Node
## Keşif defteri ve Zümrüt'ün bilmecesi (web codex / riddle; belge Sistemler › Kitap › Keşif defteri, ACT 1 › Cadı Zümrüt › Bilmece).
## Her tarif kategorisinde öğrendiğin tariflerin oranı: %25 → Vio (4 × sayı + 20), %50 → kalıcı ustalık, %100 → Vio (20 × sayı + 100) + 100 XP.
## Sayı, adada elde edilebilen malzemelerle ulaşılabilen tariflerdir (web reachable).

var oyun
const USTALIK := {"Yiyecek": "Tokluk %20 daha yavaş azalır", "Şifa": "Can %50 daha hızlı yenilenir", "Temel aletler": "Aletler %20 ihtimalle körelmez",
	"Alet kademeleri": "Aletler %20 ihtimalle körelmez", "Metal aletler": "Aletler %20 ihtimalle körelmez", "Giyim": "Savunma +5", "Zırh": "Savunma +5",
	"Ateş": "Meşaleler %30 daha uzun yanar", "Ağaç": "Odun %20 daha hızlı kesilir", "Taş ve kil": "Taş ve kil %20 daha hızlı toplanır", "Av ve hayvan": "Avlarda düşürme şansı +%10"}
const EK := ["Su", "Nehir kili", "Kaba meşale", "Hasır yatak", "Kafa lambası", "Mor pusula"]
const RHINT := {"Dal": "ormanın kırık kolu", "Taş": "yolun sert yüzü", "Lif": "çayırın ince saçı", "Yaprak": "ağacın yeşil eli", "Su": "nehrin kendisi", "Kum": "kumsalın tozu",
	"Çakmaktaşı": "içinde kıvılcım uyuyan kara taş", "Nehir çakılı": "suyun yuvarladığı taş", "Nehir kili": "nehrin yumuşak çamuru", "Böğürtlen": "dikenli çalının mor gözü",
	"Kuru ot": "güneşte sararmış ot", "Kekik": "kokusu dağları saran ot", "Nane": "serin kokulu yaprak", "Papatya": "beyaz taçlı küçük çiçek", "Isırgan": "dokununca yakan ot",
	"Kamış": "bataklığın uzun boylu sazı", "Kül": "ateşin geride bıraktığı", "Tuz kayası": "denizin unuttuğu taş", "Kemik": "avın beyaz iskeleti", "Sinir": "avın gergin ipi",
	"Hayvan yağı": "avın yumuşak ateşi", "Yosun": "taşın yeşil kürkü", "Turba": "bataklığın kara ekmeği", "Ateş": "yakıp ısıtan, dans eden", "Kıvılcım": "taştan doğan küçük yıldız",
	"İp": "liften örülmüş yol", "Sopa": "bilenmiş dal", "Keskin taş": "kenarı ısıran taş", "Hasır": "örülmüş ot", "Yabani buğday": "rüzgârda eğilen başak", "Ahududu": "kırmızı taneli orman yemişi"}

var ulasir := {}         # ulaşılabilen tarifler
var kat_n := {}          # kategori → ulaşılabilen tarif sayısı
var codex := {}          # kategori → 0..3
var bilmece = null       # {r, gun}
var bilmece_n := 0
var t := 0.0

func kur(o) -> void:
	oyun = o
	_ulasilir()

func _json(p: String):
	if not FileAccess.file_exists(p): return null
	return JSON.parse_string(FileAccess.get_file_as_string(p))

func _ulasilir() -> void:
	var have := {}
	for n in EK: have[n] = true
	var G = oyun.toplama_veri
	for n in G.nodes: have[n] = true
	for tr in G.trees:
		var T: Dictionary = G.trees[tr]
		if not bool(T.get("noCut", false)): have[str(T.wood)] = true
		for k in ["fruit", "seed"]:
			if T.get(k, null) != null: have[str(T[k])] = true
		for e in T.get("extra", []): have[str(e[0])] = true
	var dos := []
	for b in ["cayir", "orman", "bataklik", "kayalik", "kul", "kristal"]: dos.append("res://data/canlilar_%s.json" % b)
	for f in ["magara", "magara_c1", "magara_c2", "magara_c3", "magara_c4", "magara_c5"]: dos.append("res://data/%s.json" % f)
	for f in dos:
		var J = _json(f)
		if J == null: continue
		for k in J.canlilar:
			for d in J.canlilar[k].get("drops", []): have[str(d.n)] = true
		for n in J.get("toplanir", {}): have[n] = true
	for z in oyun.balik.FISHT:
		for w in oyun.balik.FISHT[z]:
			for f in oyun.balik.FISHT[z][w]: have[str(f[0])] = true
	var R: Dictionary = oyun.el_yapimi.R
	var ch := true
	while ch:
		ch = false
		for r in R:
			if ulasir.has(r): continue
			var ok := true
			for p in R[r].i:
				if not have.has(str(p[0])): ok = false; break
			if ok:
				for tt in R[r].t:
					if not have.has(str(tt)): ok = false; break
			if ok:
				ulasir[r] = true; have[r] = true; ch = true
	for r in R:
		var c: String = R[r].c
		if not kat_n.has(c): kat_n[c] = 0
		if ulasir.has(r): kat_n[c] += 1
	for c in kat_n: kat_n[c] = maxi(1, int(kat_n[c]))

func bulunan(c: String) -> int:
	var n := 0
	for r in oyun.el_yapimi.bilinen:
		if ulasir.has(r) and oyun.el_yapimi.R.has(r) and oyun.el_yapimi.R[r].c == c: n += 1
	return mini(n, int(kat_n.get(c, 1)))

## ustalık açık mı (kategori %50)
func usta(c: String) -> bool:
	return int(codex.get(c, 0)) >= 2

func alet_usta() -> bool:
	return usta("Temel aletler") or usta("Alet kademeleri") or usta("Metal aletler")

## satış: ustalığı kendine özel olmayan kategorilerde o kategorinin eşyaları %15 pahalı
func satis_ek(n: String) -> float:
	var R: Dictionary = oyun.el_yapimi.R
	if not R.has(n): return 0.0
	var c: String = R[n].c
	return 0.15 if (not USTALIK.has(c) and usta(c)) else 0.0

func ustalik_yazi(c: String) -> String:
	return USTALIK.get(c, "%s eşyaları %%15 daha pahalı satılır" % c)

func _process(dt: float) -> void:
	if oyun == null or oyun.basta: return
	t -= dt
	if t > 0.0: return
	t = 1.0
	_denetle()
	_bilmece_denetle()

func _denetle() -> void:
	for c in kat_n:
		var n := int(kat_n[c])
		var f := bulunan(c)
		var got := int(codex.get(c, 0))
		var lv := 3 if f >= n else (2 if f >= ceili(n / 2.0) else (1 if f >= ceili(n / 4.0) else 0))
		for k in range(got + 1, lv + 1):
			codex[c] = k
			if k == 1:
				var r := roundi(n * 4 + 20)
				oyun.env.vio_ekle(r)
				oyun.env.mesaj("Keşif defteri: %s %%25 · +%d Vio" % [c, r])
			elif k == 2:
				oyun.almanak._ilan("%s · ustalık" % c, ustalik_yazi(c))
			elif k == 3:
				var r2 := roundi(n * 20 + 100)
				oyun.env.vio_ekle(r2)
				oyun.env.xp_ekle(100)
				oyun.almanak._ilan("%s tamamlandı!" % c, "+%d Vio · +100 XP" % r2)

# ------------------------------------------------------------------ bilmece
func bilmece_yazi(rd) -> String:
	var R: Dictionary = oyun.el_yapimi.R
	if rd == null or not R.has(rd.r): return ""
	var x: Dictionary = R[rd.r]
	var parts := []
	for p in x.i:
		var n: String = p[0]
		parts.append("[i]%s[/i]" % RHINT[n] if RHINT.has(n) else "[i]\"%s\" ile başlayan bir şey[/i]" % n.substr(0, 1))
	var s := ", ".join(parts.slice(0, parts.size() - 1))
	if parts.size() > 1: s += " ve "
	s += parts[parts.size() - 1]
	return "\"%s… hepsi bir kazanda buluşunca ne olur?\" (%d malzeme · %s)" % [s, x.i.size(), x.c]

func _sec():
	var R: Dictionary = oyun.el_yapimi.R
	var L := []
	for r in R:
		var x: Dictionary = R[r]
		if oyun.el_yapimi.bilinen.has(r) or bool(x.place) or x.i.size() < 2 or x.i.size() > 4: continue
		var ok := true
		for p in x.i:
			if not oyun.env.gorulen.has(str(p[0])): ok = false; break
		if ok and oyun.istasyon._acik(r): L.append(r)
	if L.is_empty(): return null
	L.sort_custom(func(a, b): return oyun.pazar.taban(a) < oyun.pazar.taban(b))
	return {r = L[randi() % mini(L.size(), 40)], gun = oyun.zaman.gun}

func _bilmece_denetle() -> void:
	if bilmece == null or not oyun.el_yapimi.bilinen.has(bilmece.r): return
	var r: String = bilmece.r
	var c := (30 + roundi(oyun.pazar.taban(r) * 2.0)) * (2 if oyun.sk("B8") else 1)
	bilmece = null
	bilmece_n += 1
	oyun.env.vio_ekle(c)
	oyun.env.xp_ekle(20)
	oyun.almanak._ilan(r, "Zümrüt'ün bilmecesini çözdün")
	oyun.env.mesaj("Zümrüt'ün bilmecesi çözüldü: %s! +%d Vio, +20 XP" % [r, c])

## Zümrüt'ün konuşmasındaki seçenek
func secenek(K: Dictionary, por) -> Dictionary:
	return {t = "Bilmeceyi bir daha söyle" if bilmece != null else "Bir bilmecen var mı?", f = func():
		if bilmece == null or int(bilmece.gun) < oyun.zaman.gun - 2:
			var nr = _sec()
			if nr != null: bilmece = nr
		if bilmece == null:
			oyun.konusma.ac(K.ad, por, "Şimdilik aklımda bilmece yok evlat. Yeni malzemeler topla, sonra yine sor.", [{t = "Peki", pri = true, kapat = true}])
			return
		oyun.konusma.ac(K.ad, por, "Dinle bakalım: %s\n\nCevabı bulup kazanda [b]tarifini öğrenirsen[/b] kesen dolar. Bilmece kitabında, [b]Anılar[/b] sayfasında da yazılı." % bilmece_yazi(bilmece),
			[{t = "Düşüneyim", pri = true, kapat = true}, {t = "Kazanı aç", f = func(): oyun.istasyon.ac("kazan")}])}

# ------------------------------------------------------------------ kitap sayfası
func liste_yaz(L: VBoxContainer) -> void:
	var ks := kat_n.keys()
	ks.sort_custom(func(a, b): return int(oyun.el_yapimi.kat_sira.get(a, 99)) < int(oyun.el_yapimi.kat_sira.get(b, 99)))
	var not_ := Label.new()
	not_.text = "Her kategoride tariflerin %25'i: Vio · %50'si: kalıcı ustalık · hepsi: Vio ve 100 XP"
	not_.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	not_.add_theme_font_size_override("font_size", 11)
	not_.add_theme_color_override("font_color", Color("#b8b090"))
	L.add_child(not_)
	for c in ks:
		var n := int(kat_n[c])
		var f := bulunan(c)
		var lv := int(codex.get(c, 0))
		var v := VBoxContainer.new()
		var h := HBoxContainer.new()
		var a := Label.new()
		a.text = c
		a.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		a.add_theme_font_size_override("font_size", 13)
		a.add_theme_color_override("font_color", Color("#ffe08a") if lv >= 3 else Color("#e8e2cc"))
		h.add_child(a)
		var s := Label.new()
		s.text = "%d / %d  %%%d" % [f, n, roundi(100.0 * f / n)]
		s.add_theme_font_size_override("font_size", 12)
		h.add_child(s)
		v.add_child(h)
		var pr := ProgressBar.new()
		pr.custom_minimum_size = Vector2(0, 6)
		pr.max_value = n; pr.value = f; pr.show_percentage = false
		v.add_child(pr)
		var u := Label.new()
		u.text = ("Ustalık: " if lv >= 2 else "%50'de ustalık: ") + ustalik_yazi(c)
		u.add_theme_font_size_override("font_size", 11)
		u.add_theme_color_override("font_color", Color("#9fe08a") if lv >= 2 else Color("#8a8a80"))
		u.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		v.add_child(u)
		L.add_child(v)

## Anılar sayfasının başında bilmece
func bilmece_yaz(L: VBoxContainer) -> void:
	if bilmece == null: return
	var r := RichTextLabel.new()
	r.bbcode_enabled = true
	r.fit_content = true
	r.add_theme_font_size_override("normal_font_size", 12)
	r.add_theme_font_size_override("italics_font_size", 12)
	r.text = "[b]Zümrüt'ün bilmecesi:[/b] %s\n[color=#b8b090]Bu tarifi kazanda öğrenince Zümrüt seni ödüllendirir.[/color]" % bilmece_yazi(bilmece)
	L.add_child(r)

func kayit() -> Dictionary:
	return {c = codex, b = bilmece, n = bilmece_n}

func yukle(d: Dictionary) -> void:
	codex = {}
	for k in d.get("c", {}): codex[k] = int(d.c[k])
	bilmece = d.get("b", null)
	bilmece_n = int(d.get("n", 0))
	if d.is_empty():
		# eski kayıt: o ana kadar hak edilen basamaklar ödülsüz açılır
		for c in kat_n:
			var n := int(kat_n[c])
			var f := bulunan(c)
			codex[c] = 3 if f >= n else (2 if f >= ceili(n / 2.0) else (1 if f >= ceili(n / 4.0) else 0))
