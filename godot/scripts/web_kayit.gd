## Web oyununun kayıtlarını Godot'a çevirir (belge 99_godot 1f-4). Web oyunu ve Godot denemesi aynı adreste (bogacavdar.github.io)
## çalıştığı için web'in kayıtları tarayıcının localStorage'ında ("hammadde.saves.v1") durur; Godot onları okur, web kaydına dokunmaz.
class_name WebKayit

const ANAHTAR := "hammadde.saves.v1"
const YUVALAR := [["auto", "Otomatik kayıt"], ["s1", "Kayıt 1"], ["s2", "Kayıt 2"], ["s3", "Kayıt 3"]]
const MAPV := 6

## {yuva: {t, lvl, coins, diff, data}}; web dışında ya da kayıt yoksa {}
static func oku() -> Dictionary:
	if not OS.has_feature("web"): return {}
	var s = JavaScriptBridge.eval("(function(){try{return localStorage.getItem('%s')||''}catch(e){return ''}})()" % ANAHTAR)
	if not (s is String) or s == "": return {}
	var d = JSON.parse_string(s)
	if not (d is Dictionary): return {}
	var out := {}
	for y in YUVALAR:
		var v = d.get(y[0], null)
		if v is Dictionary and v.get("data", null) is Dictionary and v.data.has("inv"):
			out[y[0]] = v
	return out

static func _dizi(a) -> Array:
	return a if a is Array else []

static func _sozluk(a) -> Dictionary:
	return a if a is Dictionary else {}

## web snapshot() → Godot durum_al() biçimi
static func cevir(w: Dictionary, kemal: Vector2) -> Dictionary:
	var inv := {}
	var winv := _sozluk(w.get("inv", {}))
	for k in winv:
		if float(winv[k]) > 0: inv[k] = int(winv[k])
	var kemer := []
	for n in _dizi(w.get("bt", [])):
		if kemer.size() >= 5: break
		kemer.append(n if (n is String and inv.has(n)) else null)
	while kemer.size() < 5: kemer.append(null)
	var el := int(w.get("hd", -1)) if w.get("hd", null) is float else -1
	if el >= 5: el = -1
	var dayan := {}
	var td := _sozluk(w.get("toolDur", {}))
	for k in td: dayan[k] = float(td[k])
	var p := Vector2(float(w.get("x", kemal.x)), float(w.get("y", kemal.y)))
	if int(w.get("mv", 0)) != MAPV: p = kemal + Vector2(20, 6)
	var v45 := _sozluk(w.get("v45", {}))
	var v44 := _sozluk(w.get("v44", {}))
	var v47 := _sozluk(w.get("v47", {}))
	var v186 := _sozluk(w.get("v186", {}))
	var aktif = null
	var b := {}
	var a = v186.get("a", null)
	if a is Dictionary and a.get("fq", null) == null and a.get("id", null) is String:
		aktif = a.id
		b = _sozluk(a.get("b", {}))
	var kills := {}
	var kl := _sozluk(v44.get("kl", {}))
	for k in kl: kills[k] = int(kl[k])
	var mz := []
	for g in _dizi(w.get("gv", [])):
		if g is Dictionary and g.has("x"):
			mz.append({x = float(g.x), y = float(g.y), inv = _sozluk(g.get("inv", {})), vio = int(g.get("coins", 0))})
	var tz := int(v45.get("tz", 0))
	var oge := {
		oyuncu = {x = p.x, y = p.y, hp = float(w.get("hp", 100))},
		env = {inv = inv, kemer = kemer, el = el, tokluk = float(w.get("fd", 100)), dayan = dayan, gorulen = _dizi(w.get("seen", [])), vio = int(w.get("coins", 0)), xp = int(w.get("xp", 0)), sv = maxi(1, int(w.get("lvl", 1)))},
		tarifler = _dizi(w.get("found", [])), verilen = _dizi(w.get("bought", [])),
		ogretici = {tz = tz, yenen = int(v45.get("te", 0)), ftut = int(w.get("ft", 0)), axe = int(v47.get("ax", 0)), balta = false},
		gorev = {aktif = aktif, b = b, bitenler = _dizi(v186.get("d", [])), kills = kills, biyomlar = [0], dovulen = _dizi(v45.get("fg", [])), dersler = _dizi(v186.get("ls", []))},
		mesale = {ts = null, yaniyor = false, yanma = _sozluk(w.get("tb", {}))},
		zaman_oyun = {dk = float(w.get("dt", 360)), gun = maxi(1, int(w.get("dy", 1))), mesale_verildi = true, ilk_bayilma = int(w.get("dn", 0)) == 0},
		yetenekler = _dizi(w.get("skills", [])), dl_agac = false,
		kusam = _sozluk(w.get("eq", {})), puan = _sozluk(_sozluk(w.get("v340", {})).get("sp", {})), puan_ders = 2,
		mezarlar = mz,
		zorluk = "zor" if str(w.get("diff", "")) == "hard" else "normal",
		adlar = {kahraman = str(w.get("hn", "")), sevgili = str(w.get("ln", ""))}}
	if w.get("lk", null) is Dictionary and not w.lk.is_empty(): oge.kahraman = w.lk
	if w.get("ll", null) is Dictionary and not w.ll.is_empty(): oge.sevgili = w.ll
	return oge

static func tarih(t: float) -> String:
	var d := Time.get_datetime_dict_from_unix_time(int(t / 1000.0))
	return "%02d.%02d.%d %02d:%02d" % [d.day, d.month, d.year, d.hour, d.minute]
