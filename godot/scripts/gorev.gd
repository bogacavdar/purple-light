## Ana görevler (web görev sistemi v2; belge: ACT 1 › Ana görevler): tek aktif görev, en çok 2 "!", görev kartı,
## haritada sarı bölge, kişiye ok, teslim ve ödül; görevsiz kalınınca Kemal'in (tarifse Zümrüt'ün) ayak işi.
## Godot'da henüz olmayan sistemleri isteyen görevler (köprü, balık, bileme, kamp ateşi, zırh giyme…) şimdilik verilmez.
extends Node

const BAD := ["Çayır", "Orman", "Bataklık", "Kayalık Dağ", "Kül Diyarı", "Mor Kristal Vadisi"]
const DAT := ["Çayır'a", "Orman'a", "Bataklık'a", "Kayalık Dağ'a", "Kül Diyarı'na", "Mor Kristal Vadisi'ne"]
const DESTEK := ["b", "h", "any", "k", "learn", "kn", "lv", "reach"]
const KISI_G := {"ekin": "npc"}   # kişi türü → görev veren adı (web gidOf)
const QHI := ["Selam %s! Bir işin mi var?", "%s, yüzünden belli, bir derdin var.", "Merhaba %s! Yardım lazım mı?"]

var oyun
var env
var ey
var V: Dictionary          # gorevler.json
var Q: Array = []
var QI := {}
var BYG := {}
var PRI: Array = []

var aktif = null           # süren görev (Dictionary) ya da null
var b := {}                # görev alınınca sayaçların başlangıcı (av)
var bitenler: Array = []
var vis: Array = []        # "!" bekleyen en çok 2 görev: [{q, g}]
var kills := {}
var biyomlar := {0: true}
var dovulen := {}          # örste dövülmüş eşyalar (web forged)
var t := 0.0
var bolge_anahtar := ""
var gorulen_dersler: Array = []
var ders = null            # {k, i}
var ders_kart: PanelContainer
var ders_baslik: Label
var ders_yazi: RichTextLabel
var ders_ileri: Button

# arayüz
var kart: PanelContainer
var kart_baslik: Label
var kart_ad: Label
var kart_satir: RichTextLabel
var kart_x: Button
var ok: Node2D
var kh_bolge: TextureRect
var kh_isaret: Control

func kur(o) -> void:
	oyun = o
	env = o.env
	ey = o.el_yapimi
	V = o._json("res://data/gorevler.json")
	Q = V.gorevler
	for i in Q.size():
		var q: Dictionary = Q[i]
		q.i = i
		QI[q.id] = q
		if not BYG.has(q.g):
			BYG[q.g] = []
		BYG[q.g].append(q)
	PRI = Q.duplicate()
	PRI.sort_custom(func(a, c): return [int(V.GB.get(a.g, 9)), a.i] < [int(V.GB.get(c.g, 9)), c.i])
	_arayuz()
	_ders_arayuz()
	yenile()

# ------------------------------------------------------------------ kişiler
func g_of(kisi_k: String) -> String:
	return KISI_G.get(kisi_k, kisi_k)

func kisi(g: String):
	for n in oyun.kisiler:
		if g_of(n.K.k) == g:
			return n
	return null

func ad(g: String) -> String:
	var n = kisi(g)
	return n.K.ad if n != null else g

func portre(g: String):
	var n = kisi(g)
	return load(n.K.portre) if n != null and n.K.portre != null else null

# ------------------------------------------------------------------ eşyalar: nereden çıkar, tariften mi yapılır
func grup(n: String) -> Array:
	return V.grup.get(n, [n])

func dogal(m: String) -> bool:
	return V.kaynak.has(m)

func gordu_mu(n: String) -> bool:   # web seenOK
	var L := grup(n)
	var herhangi := false
	for m in L:
		if dogal(m):
			herhangi = true
			if env.gorulen.has(m):
				return true
	return not herhangi

func sadece_tarif(n: String) -> bool:   # web craftOnly
	var L := grup(n)
	if L.is_empty():
		return false
	for m in L:
		if not ey.R.has(m) or dogal(m):
			return false
	return true

func sahip(n: String) -> int:
	var s := 0
	for m in grup(n):
		s += env.adet(m)
	return s

func biliyor(n: String) -> bool:
	return ey.bilinen.has(n)

func tarif_gerek(q: Dictionary) -> Array:   # web needRec
	var out := []
	for p in q.p:
		var k: String = p[0]
		if (k == "b" or k == "h" or k == "wear") and typeof(p[1]) == TYPE_STRING and sadece_tarif(p[1]) and not biliyor(p[1]):
			out.append([p[1]])
		elif k == "any":
			var hep := true
			var bir := false
			for n in p[1]:
				if not sadece_tarif(n): hep = false
				if biliyor(n): bir = true
			if hep and not bir:
				out.append(p[1].duplicate())
	return out

# ------------------------------------------------------------------ koşullar ve ilerleme
func bitti(id: String) -> bool:
	return bitenler.has(id)

func sonraki(g: String):
	for q in BYG.get(g, []):
		if not bitti(q.id):
			return q
	return null

func kosul(r: Array) -> bool:
	match str(r[0]):
		"q": return bitti(r[1])
		"lv": return env.sv >= int(r[1])
		"bio": return biyomlar.has(int(r[1]))
		"has":
			for n in r[1]:
				if env.adet(n) > 0: return true
			return false
		"forged":
			for n in dovulen:
				if env.G.tools.has(n) and env.G.tools[n].kind == r[1]: return true
			return false
		"dull":
			for n in env.dayan:
				if env.G.tools.has(n) and env.adet(n) > 0 and float(env.dayan[n]) < float(env.G.tools[n].dur) * 0.9: return true
			return false
	return false

func destekli(q: Dictionary) -> bool:
	for p in q.p:
		if not DESTEK.has(str(p[0])):
			return false
	return true

func acik(q: Dictionary) -> bool:   # web unlocked: koşullar + malzemeler görülmüş + tarifler öğrenilmiş
	for r in q.r:
		if not kosul(r): return false
	if not destekli(q): return false
	if not q.has("nomat"):
		for p in q.p:
			if p[0] == "b" and not gordu_mu(p[1]): return false
	return tarif_gerek(q).is_empty()

func verilebilir(q) -> bool:
	return q != null and not bitti(q.id) and aktif == null and acik(q)

func ilerleme(p: Array) -> Array:
	match str(p[0]):
		"b": return [mini(int(p[2]), sahip(p[1])), int(p[2])]
		"h": return [mini(int(p[2]), env.adet(p[1])), int(p[2])]
		"any":
			for n in p[1]:
				if env.adet(n) > 0: return [1, 1]
			return [0, 1]
		"kn": return [1 if biliyor(p[1]) else 0, 1]
		"k": return [clampi(int(kills.get(p[1], 0)) - int(b.get("k:" + p[1], 0)), 0, int(p[2])), int(p[2])]
		"learn": return [mini(int(p[1]), ey.bilinen.size()), int(p[1])]
		"lv": return [mini(int(p[1]), env.sv), int(p[1])]
		"reach": return [1 if biyomlar.has(int(p[1])) else 0, 1]
	return [0, 1]

func yapildi(p: Array) -> bool:
	var x := ilerleme(p)
	return x[0] >= x[1]

func tamam() -> bool:
	if aktif == null: return false
	for p in aktif.p:
		if not yapildi(p): return false
	return true

func satir(p: Array) -> String:
	var x := ilerleme(p)
	var ok_: bool = x[0] >= x[1]
	var v := "✓ " if ok_ else ""
	match str(p[0]):
		"b": return "%d/%d %s" % [x[0], x[1], p[1]]
		"h": return v + str(p[1]) + ("" if ok_ else (" (dövdür)" if p.size() > 3 and p[3] == "döv" else " (yap)"))
		"any": return v + " ya da ".join(p[1]) + ("" if ok_ else " (dövdür)")
		"k": return "%d/%d %s avı" % [x[0], x[1], p[1]]
		"learn": return "%d/%d tarif (toplam)" % [x[0], x[1]]
		"kn": return v + str(p[1]) + " tarifini kazanda öğren"
		"lv": return "Seviye %d/%d" % [x[0], x[1]]
		"reach": return v + DAT[int(p[1])] + " git"
	return ""

# ------------------------------------------------------------------ nereye: sarı bölge (biyomlar) ve ok (kişi ya da yer)
## web needTarget: bir eşyanın sıradaki ham maddesi ve bulunduğu biyomlar
func eksik_hedef(item: String, n: int, dep: int = 0) -> Dictionary:
	if dep > 6 or sahip(item) >= n:
		return {}
	var L := grup(item)
	var en := {}
	for m in L:
		if dogal(m):
			var bs: Array = V.kaynak[m]
			if en.is_empty() or int(bs[0]) < int(en.bios[0]):
				en = {item = m, bios = bs}
	if not en.is_empty():
		return en
	for m in L:
		if not ey.R.has(m): continue
		for pi in ey.R[m].i:
			var tt := eksik_hedef(str(pi[0]), int(pi[1]) * (n - sahip(item)), dep + 1)
			if not tt.is_empty():
				return tt
		break
	return {}

func hedef() -> Dictionary:
	if aktif == null:
		return {}
	var q: Dictionary = aktif
	if tamam():
		var g: String = q.g
		var n = kisi(g)
		return {kisi = n, ad = ad(g)} if n != null else {}
	for p in q.p:
		if yapildi(p): continue
		match str(p[0]):
			"b", "h", "any":
				var nm: String = p[1] if p[0] != "any" else p[1][0]
				var tt := eksik_hedef(nm, int(p[2]) if p[0] != "any" else 1)
				if not tt.is_empty():
					return tt
				if p[0] != "b" and ((p.size() > 3 and p[3] == "döv") or (p.size() > 2 and str(p[2]) == "döv")):
					var u: String = env.G.usta.get(nm, "smith")
					return {kisi = kisi(u), ad = ad(u)}
				if ey.R.has(nm) and not ey.R[nm].forged:
					return {yer = "el yapımı (Tab)"}
			"k":
				return {item = p[1], bios = V.av.get(p[1], [0])}
			"learn", "kn":
				var I: Dictionary = oyun.toplama_veri.istasyon
				return {nokta = Vector2(I.kazan.x, I.kazan.y), ad = "Zümrüt'ün kazanı"}
			"reach":
				return {bios = [int(p[1])], item = BAD[int(p[1])]}
			"lv":
				return {}
	return {}

func nerede() -> String:
	var h := hedef()
	if h.is_empty(): return ""
	if h.has("bios"):
		var a := []
		for x in h.bios: a.append(BAD[int(x)])
		return "%s: %s · haritada sarı bölge" % [h.item, ", ".join(a)]
	if h.has("kisi") or h.has("nokta"): return str(h.ad)
	if h.has("yer"): return str(h.yer)
	return ""

# ------------------------------------------------------------------ kim "!" bekliyor (en çok 2), ayak işleri
func yenile() -> void:
	if aktif != null:
		vis = []
		return
	var C := []
	for q in PRI:
		var var_ := false
		for x in C:
			if x.g == q.g: var_ = true
		if var_: continue
		if sonraki(q.g) == q and verilebilir(q) and kisi(q.g) != null:
			C.append({q = q, g = q.g})
	vis = C.slice(0, 2)
	if vis.size() < 2:
		var f = ayak_isi(vis.size() > 0)
		if f != null and kisi(f.g) != null:
			var bos := true
			for x in vis:
				if x.g == f.g: bos = false
			if bos: vis.append({q = f, g = f.g})

func isaret(g: String) -> bool:
	if aktif != null: return false
	for x in vis:
		if x.g == g: return true
	return false

func bekleyen(g: String):
	for x in vis:
		if x.g == g: return x.q
	return null

## web pickFiller: sıradaki kilitli görevin eksiğini tamamlatan iş (malzeme → Kemal, tarif → Zümrüt, yoksa seviye)
func ayak_isi(yalniz_mt: bool):
	for q in PRI:
		if bitti(q.id) or sonraki(q.g) != q or not destekli(q): continue
		var dur := false
		for r in q.r:
			if r[0] == "q" and not kosul(r): dur = true
		if dur: continue
		var eks := []
		for r in q.r:
			if not kosul(r): eks.append(r)
		var mats := []
		for p in q.p:
			if p[0] == "b" and not gordu_mu(p[1]):
				var nm: String = p[1]
				for m in grup(p[1]):
					if dogal(m):
						nm = m
						break
				mats.append(nm)
		if not mats.is_empty(): eks.append(["mat", mats])
		var tg := tarif_gerek(q)
		if not tg.is_empty(): eks.append(["rec", tg[0][0]])
		if eks.is_empty(): continue
		var m = null
		for r in eks:
			if not yalniz_mt or r[0] == "mat" or r[0] == "rec":
				m = r
				break
		if m == null: continue
		return _ayak(m, 0)
	return null if yalniz_mt else _ayak(["lv", env.sv + 1], 0)

func _ayak(m: Array, d: int) -> Dictionary:
	match str(m[0]):
		"rec":
			var n: String = m[1]
			if ey.R.has(n):
				var un := []
				for pi in ey.R[n].i:
					if not gordu_mu(str(pi[0])):
						var nm: String = str(pi[0])
						for z in grup(nm):
							if dogal(z):
								nm = z
								break
						un.append(nm)
				if not un.is_empty():
					return _ayak(["mat", un.slice(0, 3)], d)
				if d < 13:
					for pi in ey.R[n].i:
						var i: String = str(pi[0])
						if not sadece_tarif(i): continue
						var bilinen_var := false
						for z in grup(i):
							if biliyor(z): bilinen_var = true
						if bilinen_var: continue
						var z0: String = grup(i)[0]
						if z0 != n and ey.R.has(z0):
							return _ayak(["rec", z0], d + 1)
			return {id = "F-rec-" + n, g = "witch", filler = 1, t = "%s tarifini öğren" % n, p = [["kn", n]], r = [], c = 15, x = 15, remote = 1,
				say = "Kazanım bir şey fısıldıyor: yakında biri senden [b]%s[/b] isteyecek, ama sen onu yapmayı bilmiyorsun. Malzemeleri kazanıma koy, [b]%s[/b] tarifini öğren; o iş sonra sana gelir." % [n.to_lower(), n.to_lower()],
				thx = "Kazan ısındı, tarif artık senin. O iş de yakında kapını çalar."}
		"mat":
			var L: Array = m[1]
			var adlar := []
			for x in L: adlar.append("[b]%s[/b]" % str(x).to_lower())
			var nm: String = adlar[0] if adlar.size() == 1 else ", ".join(adlar.slice(0, -1)) + " ve " + adlar[-1]
			var p := []
			for x in L: p.append(["b", x, 1])
			return {id = "F-mat-" + "+".join(L), g = "npc", filler = 1, t = ("Kemal'in özlemi" if L.size() > 1 else "%s getir" % L[0]), p = p, r = [], c = 10 + 5 * L.size(), x = 8 + 4 * L.size(),
				say = "Dün akşam yürürken aklıma takıldı: gençken %s çok kullanırdım. %s getirir misin?" % [nm, "Her birinden birer tane" if L.size() > 1 else "Bir tane"],
				thx = "Hah, işte bu! Kokusu bile aynı. Sağ ol evlat."}
	if m[0] == "bio":
		var bb := int(m[1])
		return {id = "F-bio-%d" % bb, g = "npc", filler = 1, t = DAT[bb] + " git", p = [["reach", bb]], r = [], c = 25, x = 20, remote = 1,
			say = "Hiç [b]%s[/b] tarafına gittin mi? Gençken oralarda çok dolaşırdım. Bir git bak, nasıl bir yer olmuş; dönünce anlatırsın." % BAD[bb],
			thx = "%s… Anlattığın gibi miymiş? Ben de öyle hatırlıyorum." % BAD[bb]}
	var lv: int = int(m[1]) if m[0] == "lv" else env.sv + 1
	return {id = "F-lv-%d" % lv, g = "npc", filler = 1, t = "Seviye %d'e ulaş" % lv, p = [["lv", lv]], r = [], c = 20, x = 0, remote = 1,
		say = "Kollarına bir bak evlat; bu adada güçsüz yaşanmaz. Biraz topla, biraz birleştir, biraz avlan: [b]Seviye %d[/b]'e gel, sonra konuşalım." % lv,
		thx = "Gözlerin değişmiş. Artık daha sağlam basıyorsun."}

# ------------------------------------------------------------------ konuşma: görev ver, durum, teslim
## kişiyle F: görev işi varsa o yapılır (true döner); yoksa kişinin kendi hizmeti açılır
func konus(g: String, hizmet: Dictionary) -> bool:
	if aktif == null:
		var q = bekleyen(g)
		if q != null:
			_ver(q, g)
			return true
		return false
	if aktif.g == g:
		if tamam():
			_bitir(true)
		else:
			_durum(hizmet)
		return true
	var nx = sonraki(g)
	if nx != null and acik(nx):
		env.mesaj("%s: “Şu an bir işin var; önce onu bitir, sonra sana da bir işim olacak.”" % ad(g), true)
	return false

## önce sahne (kişi yakınsa), sonra kısa görev penceresi; sahne yoksa tam metinli pencere
func _ver(q: Dictionary, g: String) -> void:
	vis = []
	if oyun.sahne.oyna(kisi(g), q, func(): _baslat(q, g, true)):
		return
	_baslat(q, g, false)

func _baslat(q: Dictionary, g: String, kisa: bool) -> void:
	aktif = q
	b = {}
	for p in q.p:
		if p[0] == "k":
			b["k:" + p[1]] = int(kills.get(p[1], 0))
	vis = []
	var hazir := tamam()
	var wh := "" if hazir else nerede()
	var metin: String = ("[b]Görev: %s[/b]" % q.t) if kisa else _bb(q.say)
	if hazir:
		metin += "\n\n[i]Ama bunlar sende zaten var! Bu iş bitti sayılır.[/i]"
	if wh != "":
		metin += "\n[font_size=12]Yer: %s[/font_size]" % wh
	metin += "\n[font_size=12]Ödül: %s[/font_size]" % _odul(q)
	oyun.konusma.ac(ad(g), portre(g), metin, [{t = "Al bakalım" if hazir else "Tamam", pri = true, kapat = true, f = func():
		if hazir:
			_bitir(true)
		else:
			env.mesaj("Görev başladı: " + str(q.t))
			if q.has("les") and ders_gerek(q.les):
				get_tree().create_timer(0.25).timeout.connect(func(): ders_goster(q.les, 0))}])
	_kart()

func _durum(hizmet: Dictionary) -> void:
	var q: Dictionary = aktif
	var sat := []
	for p in q.p: sat.append(satir(p))
	var metin := "[b]%s[/b]\n%s" % [q.t, " · ".join(sat)]
	var wh := nerede()
	if wh != "": metin += "\n[font_size=12]Yer: %s[/font_size]" % wh
	var secs := []
	if not hizmet.is_empty(): secs.append(hizmet)
	secs.append({t = "Tamam", pri = hizmet.is_empty(), kapat = true})
	secs.append({t = "Bu işten vazgeçiyorum", f = func(): _iptal_sor()})
	oyun.konusma.ac(ad(q.g), portre(q.g), metin, secs)

func _iptal_sor() -> void:
	if aktif == null: return
	oyun.konusma.ac("", null, "[b]%s[/b]\nBu işi bırakırsan bütün ilerlemesi silinir. Bırakılsın mı?" % aktif.t, [{t = "Bırak", f = func(): _iptal()}, {t = "Devam et", pri = true, kapat = true}])

func _iptal() -> void:
	var q: Dictionary = aktif
	aktif = null
	b = {}
	env.mesaj("Görev bırakıldı: %s.%s" % [q.t, "" if q.has("filler") else " " + ad(q.g) + " yine bekliyor."], true)
	yenile()
	_kart()

func _bitir(yakin: bool) -> void:
	var q: Dictionary = aktif
	if q == null or not tamam(): return
	for p in q.p:
		if p[0] == "b":
			var need := int(p[2])
			for m in grup(p[1]):
				var al := mini(need, env.adet(m))
				if al > 0: env.eksilt(m, al)
				need -= al
				if need <= 0: break
	aktif = null
	b = {}
	if not q.has("filler") and not bitti(q.id): bitenler.append(q.id)
	if int(q.get("c", 0)) > 0: env.vio_ekle(int(q.c))
	if int(q.get("x", 0)) > 0: env.xp_ekle(int(q.x))
	for r in q.get("rew", []):
		ey.bilinen[r] = true
	env.mesaj("Görev tamamlandı: " + str(q.t))
	var od := _odul(q)
	var metin: String = _bb(q.thx) + "\n[font_size=12]Görev tamamlandı%s[/font_size]" % ((" · " + od) if od != "" else "")
	var g: String = q.g
	get_tree().create_timer(0.2 if yakin else 0.9).timeout.connect(func():
		if not oyun.konusma.visible:
			oyun.konusma.ac(ad(g), portre(g), metin, [{t = "Ne demek", pri = true, kapat = true}]))
	yenile()
	_kart()

func _odul(q: Dictionary) -> String:
	var r := []
	if int(q.get("c", 0)) > 0: r.append("+%d Vio" % int(q.c))
	if int(q.get("x", 0)) > 0: r.append("+%d XP" % int(q.x))
	return ", ".join(r)

func _bb(h: String) -> String:
	return h.replace("<b>", "[b]").replace("</b>", "[/b]").replace("<br>", "\n").replace("<i>", "[i]").replace("</i>", "[/i]")

# ------------------------------------------------------------------ yeni mekanik dersleri (belge: ACT 1 › Ana görevler › Yeni mekanik dersleri)
## her ders bir kez görülür; örs dersi bir şey dövmüş olana gösterilmez; kart bir pencere açıkken bekler
func ders_gerek(k: String) -> bool:
	if k == "" or gorulen_dersler.has(k) or not V.dersler.has(k): return false
	if k == "forge" and not dovulen.is_empty(): return false
	return true

func ders_goster(k: String, i: int) -> void:
	var D: Dictionary = V.dersler[k]
	ders = {k = k, i = i}
	var st: Array = D.s[i]
	ders_baslik.text = "Yeni ders · %d / %d · %s" % [i + 1, D.s.size(), D.t]
	var tx: String = _bb(str(st[0])).replace("E'ye", "F'ye").replace(" E ile", " F ile").replace("(ya da ona dokun)", "")
	ders_yazi.text = tx
	ders_ileri.text = "Devam" if i < D.s.size() - 1 else "Anladım"

func _ders_ileri() -> void:
	if ders == null: return
	var D: Dictionary = V.dersler[ders.k]
	if ders.i < D.s.size() - 1:
		ders_goster(ders.k, ders.i + 1)
	else:
		_ders_bitir()

func _ders_bitir() -> void:
	if ders != null and not gorulen_dersler.has(ders.k):
		gorulen_dersler.append(ders.k)
	ders = null

func _ders_arayuz() -> void:
	ders_kart = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.1, 0.08, 0.16, 0.94); st.border_color = Color("#a07ad8"); st.set_border_width_all(2)
	st.set_content_margin_all(10)
	ders_kart.add_theme_stylebox_override("panel", st)
	var v := VBoxContainer.new()
	ders_baslik = Label.new(); ders_baslik.add_theme_font_size_override("font_size", 12); ders_baslik.add_theme_color_override("font_color", Color("#d8b0ff"))
	ders_yazi = RichTextLabel.new(); ders_yazi.bbcode_enabled = true; ders_yazi.fit_content = true; ders_yazi.scroll_active = false
	ders_yazi.custom_minimum_size = Vector2(340, 0)
	var h := HBoxContainer.new()
	ders_ileri = Button.new(); ders_ileri.pressed.connect(_ders_ileri)
	var gec := Button.new(); gec.text = "Dersi geç"; gec.pressed.connect(_ders_bitir)
	h.add_child(ders_ileri); h.add_child(gec)
	v.add_child(ders_baslik); v.add_child(ders_yazi); v.add_child(h)
	ders_kart.add_child(v)
	oyun.hud.add_child(ders_kart)
	ders_kart.position = Vector2(12, 150)
	ders_kart.visible = false

# ------------------------------------------------------------------ her an
func av(k: String) -> void:
	kills[k] = int(kills.get(k, 0)) + 1

func _process(dt: float) -> void:
	t += dt
	var bio: int = oyun.bio_at(oyun.oyuncu.position)
	if bio >= 0 and not biyomlar.has(bio):
		biyomlar[bio] = true
		env.mesaj("%s keşfedildi" % BAD[bio])
	if fmod(t, 0.25) < dt:
		if aktif != null and tamam():
			if aktif.has("remote"):
				_bitir(false)
			else:
				var n = kisi(aktif.g)
				if n != null and n.position.distance_to(oyun.oyuncu.position) < 32.0 and not oyun.konusma.visible:
					_bitir(true)
		if aktif == null:
			yenile()
		_kart()
		_bolge()
	_ok_ciz()
	if kh_bolge: kh_bolge.modulate.a = 0.45 + 0.25 * sin(t * 3.0)
	if kh_isaret:
		kh_isaret.queue_redraw()
		kh_isaret.visible = oyun.magara == null or not oyun.magara.icinde
		kh_bolge.visible = oyun.magara == null or not oyun.magara.icinde
	ders_kart.visible = ders != null and not oyun.konusma.visible and not oyun.istasyon.pencere.visible and not oyun.sahne.acik and not oyun.el_yapimi.acik_mi()

# ------------------------------------------------------------------ arayüz: kart (sağ üst), ok, küçük haritada sarı bölge ve "!"
func _arayuz() -> void:
	kart = PanelContainer.new()
	var st := StyleBoxFlat.new(); st.bg_color = Color(0.06, 0.05, 0.04, 0.82); st.border_color = Color("#c9a24a"); st.set_border_width_all(1)
	st.set_content_margin_all(8)
	kart.add_theme_stylebox_override("panel", st)
	kart.custom_minimum_size = Vector2(300, 0)
	var v := VBoxContainer.new()
	var h := HBoxContainer.new()
	kart_baslik = Label.new(); kart_baslik.add_theme_font_size_override("font_size", 11); kart_baslik.add_theme_color_override("font_color", Color("#f2c94c"))
	kart_baslik.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	kart_x = Button.new(); kart_x.text = "×"; kart_x.flat = true; kart_x.tooltip_text = "Görevi bırak"
	kart_x.pressed.connect(_iptal_sor)
	h.add_child(kart_baslik); h.add_child(kart_x)
	kart_ad = Label.new(); kart_ad.autowrap_mode = TextServer.AUTOWRAP_WORD; kart_ad.add_theme_font_size_override("font_size", 14); oyun._golge(kart_ad)
	kart_satir = RichTextLabel.new(); kart_satir.bbcode_enabled = true; kart_satir.fit_content = true; kart_satir.scroll_active = false
	kart_satir.add_theme_font_size_override("normal_font_size", 12)
	v.add_child(h); v.add_child(kart_ad); v.add_child(kart_satir)
	kart.add_child(v)
	oyun.hud.add_child(kart)
	kart.anchor_left = 1.0; kart.anchor_right = 1.0
	kart.offset_left = -310.0; kart.offset_right = -10.0; kart.offset_top = 34.0
	kart.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	ok = Node2D.new()
	ok.z_index = 50
	ok.draw.connect(_ok_draw)
	oyun.add_child(ok)
	# küçük harita: sarı bölge katmanı ve "!" işaretleri
	var kh: TextureRect = oyun.kh_resim
	kh_bolge = TextureRect.new()
	kh_bolge.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	kh_bolge.stretch_mode = TextureRect.STRETCH_SCALE
	kh_bolge.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	kh_bolge.size = kh.size
	kh_bolge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	kh.add_child(kh_bolge)
	kh.move_child(kh_bolge, 0)
	kh_isaret = Control.new()
	kh_isaret.size = kh.size
	kh_isaret.mouse_filter = Control.MOUSE_FILTER_IGNORE
	kh_isaret.draw.connect(_kh_isaret_ciz)
	kh.add_child(kh_isaret)

func _kart() -> void:
	if oyun.sahne.acik:
		kart.visible = false
		return
	if aktif == null:
		if bitenler.is_empty() and not vis.is_empty():
			kart.visible = true
			kart_baslik.text = "Görev"
			kart_ad.text = "Başında siyah ! olan kişiyle konuş"
			var a := []
			for x in vis: a.append(ad(x.g))
			kart_satir.text = ", ".join(a)
			kart_x.visible = false
		else:
			kart.visible = false
		return
	var q: Dictionary = aktif
	kart.visible = true
	kart_x.visible = true
	kart_baslik.text = "%s · %s" % [ad(q.g), "Ayak işi" if q.has("filler") else "Ana görev"]
	kart_ad.text = str(q.t)
	var s := []
	for p in q.p:
		s.append(("[color=#a8e08a]%s[/color]" if yapildi(p) else "%s") % satir(p))
	var tx := "\n".join(s)
	for tg in tarif_gerek(q):
		tx += "\nTarif: %s (kazanda öğren)" % tg[0]
	if tamam():
		tx += "\n[color=#f2c94c]Hazır: %s'a dön[/color]" % ad(q.g) if not q.has("remote") else ""
	else:
		var wh := nerede()
		if wh != "": tx += "\n[font_size=11]Yer: %s[/font_size]" % wh
	kart_satir.text = tx

## ok: yalnız bir kişiye ya da yere gidilecekken, 8 karodan uzaksa (sarı bölgeli işlerde ok yok)
var ok_yon := Vector2.ZERO
func _ok_ciz() -> void:
	ok_yon = Vector2.ZERO
	var h := hedef()
	var p := Vector2.INF
	if h.has("kisi") and h.kisi != null: p = h.kisi.position
	elif h.has("nokta"): p = h.nokta
	if p != Vector2.INF:
		var d: Vector2 = p - oyun.oyuncu.position
		if d.length() > 128.0:
			ok_yon = d.normalized()
	ok.position = oyun.oyuncu.position + Vector2(0, -10)
	ok.queue_redraw()

func _ok_draw() -> void:
	if ok_yon == Vector2.ZERO: return
	var c := ok_yon * (26.0 + 2.0 * sin(t * 6.0))
	var n := Vector2(-ok_yon.y, ok_yon.x)
	var pts := PackedVector2Array([c + ok_yon * 7.0, c - ok_yon * 3.0 + n * 5.0, c - ok_yon * 3.0 - n * 5.0])
	ok.draw_colored_polygon(pts, Color("#ffd23a"))
	ok.draw_polyline(PackedVector2Array([pts[0], pts[1], pts[2], pts[0]]), Color("#3a2a08"), 1.0)

func _bolge() -> void:
	var h := hedef()
	var bs: Array = h.get("bios", []) if aktif != null and not tamam() else []
	var key := ",".join(bs)
	if key == bolge_anahtar: return
	bolge_anahtar = key
	if bs.is_empty():
		kh_bolge.texture = null
		return
	var w: int = oyun.bw
	var hh: int = oyun.bh
	var img := Image.create(w, hh, false, Image.FORMAT_RGBA8)
	var set_ := {}
	for x in bs: set_[int(x)] = true
	for y in hh:
		for x in w:
			var i := y * w + x
			if oyun.tiles[i] < 3 and set_.has(int(oyun.bio_arr[i])):
				img.set_pixel(x, y, Color(1.0, 0.86, 0.2, 0.8))
	kh_bolge.texture = ImageTexture.create_from_image(img)

func _kh_isaret_ciz() -> void:
	var k: float = oyun.kh_olcek
	for x in vis:
		var n = kisi(x.g)
		if n == null: continue
		var p: Vector2 = n.position / float(oyun.T) * k
		var a := 0.5 + 0.4 * sin(t * 4.0)
		kh_isaret.draw_circle(p, 7.0, Color(1, 0.85, 0.25, a * 0.6))
		kh_isaret.draw_rect(Rect2(p + Vector2(-2, -5), Vector2(4, 10)), Color("#1a1408"))
		kh_isaret.draw_rect(Rect2(p + Vector2(-1, -4), Vector2(2, 5)), Color("#ffd23a"))
		kh_isaret.draw_rect(Rect2(p + Vector2(-1, 2), Vector2(2, 2)), Color("#ffd23a"))
	var h := hedef()
	if h.has("kisi") and h.kisi != null:
		kh_isaret.draw_arc(h.kisi.position / float(oyun.T) * k, 6.0 + 2.0 * sin(t * 4.0), 0, TAU, 20, Color("#ffd23a"), 1.5)
	elif h.has("nokta"):
		kh_isaret.draw_arc(h.nokta / float(oyun.T) * k, 6.0 + 2.0 * sin(t * 4.0), 0, TAU, 20, Color("#ffd23a"), 1.5)
