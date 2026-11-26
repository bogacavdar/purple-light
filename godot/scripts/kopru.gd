extends Node2D
## Büyük nehrin üç kırık köprüsü (web BRIDGES, fixBridge, drawBridgeOne; belge 99_godot 3a).
## Ana köprü (Orman ↔ Bataklık) Kemal'in E2 görevi alınınca 20 odunla onarılır; sonra iki kısayol görevsiz onarılır.

const BR := [[134, 433, 437], [75, 410, 413], [199, 449, 453]]   # web MAPD.br: [y, x0, x1] (karo)
const BR2 := [[202, 230, 237], [158, 174, 181], [290, 336, 340]]   # ikinci adanın büyük nehri (web ISLE 2 MAPD.br)
const ODUN := 20
var oyun
var kapali := false
var env
var K: Array = []           # {x0, x1, y, fixed, cx, cy, main}
var dedi := false           # 20 odunla gelince bir kez kendi kendine konuşur
var T := 16

func kur(o) -> void:
	oyun = o
	env = o.env
	T = o.T
	z_index = -8
	var L: Array = BR2 if o.ada == 2 else BR
	for i in L.size():
		var b: Array = L[i]
		K.append({y = b[0], x0 = b[1], x1 = b[2], fixed = false, cx = (b[1] + b[2] + 1) / 2.0 * T, cy = (b[0] + 0.5) * T, main = i == 0})

## onarılmış bir köprünün üstü (web onBridge)
func ustunde(p: Vector2) -> bool:
	if kapali: return false
	for b in K:
		if b.fixed and p.x >= b.x0 * T - 2 and p.x < (b.x1 + 1) * T + 2 and p.y >= (b.y - 1) * T + 3 and p.y < (b.y + 2) * T - 3: return true
	return false

func ana() -> Dictionary:
	if K.is_empty(): return {fixed = false}
	return K[0]

func odun_mu(n: String) -> bool:
	if n.ends_with(" odunu"): return true
	for t in env.G.trees.values():
		if str(t.get("wood", "")) == n: return true
	return false

func odun() -> int:
	var k := 0
	for n in env.inv:
		if odun_mu(n): k += env.adet(n)
	return k

func _harca(k: int) -> void:
	var L: Array = []
	for n in env.inv:
		if odun_mu(n) and env.adet(n) > 0: L.append(n)
	L.sort_custom(func(a, b): return oyun.pazar.taban(a) < oyun.pazar.taban(b))
	for n in L:
		var t: int = mini(k, env.adet(n))
		env.eksilt(n, t)
		k -= t
		if k <= 0: break

## köprünün başında mıyız (web target: kırık köprünün batı ucu; ana köprü onarılınca doğu ucu da)
func yakin():
	var P: Vector2 = oyun.oyuncu.position
	for b in K:
		if b.fixed: continue
		if P.distance_to(Vector2(b.x0 * T - 6, b.cy)) < 30.0: return b
		if ana().fixed and P.distance_to(Vector2((b.x1 + 1) * T + 6, b.cy)) < 30.0: return b
	return null

func f() -> bool:
	if kapali: return false
	var b = yakin()
	if b == null: return false
	var gorevde: bool = oyun.gorev.aktif != null and str(oyun.gorev.aktif.id) == "E2"
	if b.main and not gorevde and oyun.ada == 1:   # ikinci adada görev beklenmez (web fixBridge)
		if odun() >= ODUN and not dedi:
			dedi = true
			oyun.balon("Buradan nasıl geçebilirim acaba? Kemal bilir belki.", 3.5)
		else:
			oyun.balon("Kırık bir köprü… Kemal bir şey biliyordur.", 3.0)
		return true
	if not b.main and not ana().fixed:
		env.mesaj("Bu köprü bir kısayol. Önce %s ile %s arasındaki ana köprüyü onar." % _yakalar(), true)
		return true
	var w := odun()
	if w < ODUN:
		env.mesaj("Köprüyü onarmak için %d odun gerekli (sende %d). %s" % [ODUN, w, "Ağaç kes; her tür odun olur." if _baltan_var() else "Önce bir taş balta yap."], true)
		return true
	oyun.konusma.ac("", null, "[b]%s[/b]\n%d odun harcanacak. Köprü onarılsın mı?" % ["Ana köprü" if b.main else "Kısayol köprüsü", ODUN], [{t = "Onar", f = _onar.bind(b)}, {t = "Vazgeç", pri = true, kapat = true}])
	return true

func _baltan_var() -> bool:
	for n in env.inv:
		if env.adet(n) > 0 and env.G.tools.has(n) and env.G.tools[n].kind == "axe": return true
	return false

func _onar(b: Dictionary) -> void:
	if b.fixed or odun() < ODUN: return
	_harca(ODUN)
	b.fixed = true
	for k in 30: oyun.parca(Vector2(b.cx + randf_range(-40, 40), b.cy), Vector2(randf_range(-20, 20), -30 - randf() * 40), 0.8, Color("#c89458") if k % 2 else Color("#ffe29b"))
	env.mesaj(("Köprü onarıldı · Karşı yaka: %s · %s" % _karsi()) if b.main else "Kısayol köprüsü onarıldı · Nehrin öbür ucuna giden yol kısaldı")
	oyun.balon("Aa, sandığımdan kolaymış!" if b.main else "Bir kısayol daha. Ayaklarım teşekkür eder.", 3.0)
	queue_redraw()
	oyun.gorev.yenile()

## ana köprünün iki yakası (web BNAME[1], BNAME[2]; ikinci adada köprünün iki yanındaki biyomlar)
func _yakalar() -> Array:
	if oyun.ada == 1: return ["Orman", "Bataklık"]
	var b: Dictionary = ana()
	return [oyun.yerler2.bname[maxi(0, oyun.bio_at(Vector2((b.x0 - 3) * T, b.cy)))], oyun.yerler2.bname[maxi(0, oyun.bio_at(Vector2((b.x1 + 4) * T, b.cy)))]]

func _karsi() -> Array:
	if oyun.ada == 1: return ["Bataklık", "Tehlikeli"]
	var i := maxi(0, oyun.bio_at(Vector2((ana().x1 + 4) * T, ana().cy)))
	return [oyun.yerler2.bname[i], oyun.yerler2.bdanger[i]]

# ------------------------------------------------------------------ çizim (web drawBridgeOne)
func _r(x: float, y: float, w: float, h: float, c: String) -> void:
	draw_rect(Rect2(x, y, w, h), Color(c))

func _draw() -> void:
	for b in K:
		var x0: float = b.x0 * T - 6
		var x1: float = (b.x1 + 1) * T + 6
		var y0: float = (b.y - 1) * T + 2
		var y1: float = (b.y + 2) * T - 2
		var gA: float = roundf((b.x0 + (b.x1 - b.x0) * 0.38) * T)
		var gB: float = roundf((b.x0 + (b.x1 - b.x0) * 0.68) * T)
		var x := x0 + 4
		while x < x1:
			_r(x, y0 - 3, 3, y1 - y0 + 8, "#4a3018"); _r(x, y0 - 3, 3, 1, "#6a4828")
			x += 22
		x = x0
		while x < x1:
			var kirik: bool = not b.fixed and x > gA and x < gB
			if not kirik:
				var sag := 1.0 if not b.fixed and (absf(x - gA) < 10 or absf(x - gB) < 10) else 0.0
				_r(x, y0 + sag, 3, y1 - y0, "#9a6a3a" if int(x / 4) % 2 == 1 else "#8a5a30")
				_r(x, y0 + sag, 3, 1, "#b8844a"); _r(x + 3, y0 + sag, 1, y1 - y0, "#5a3a1e")
			x += 4
		if b.fixed:
			_r(x0, y0 - 2, x1 - x0, 2, "#6a4828"); _r(x0, y1, x1 - x0, 2, "#5a3a1e")
		else:
			_r(x0, y0 - 2, gA - x0, 2, "#6a4828"); _r(gB, y0 - 2, x1 - gB, 2, "#6a4828")
			_r(gA + 4, y1 - 2, 10, 3, "#7a4a24"); _r(gB - 14, y0 + 6, 8, 3, "#7a4a24")
			var sx := x0 - 12
			var sy := y0 - 14
			_r(sx, sy, 2, 16, "#5a3a1e"); _r(sx - 8, sy, 18, 9, "#c8a868"); _r(sx - 8, sy, 18, 1, "#e0c488")
			var fnt := ThemeDB.fallback_font
			var w := fnt.get_string_size("KIRIK", HORIZONTAL_ALIGNMENT_LEFT, -1, 5).x
			draw_string(fnt, Vector2(sx + 1 - w / 2, sy + 6.5), "KIRIK", HORIZONTAL_ALIGNMENT_LEFT, -1, 5, Color("#4a2a14"))

func kayit() -> Array:
	var L: Array = []
	for b in K: L.append(b.fixed)
	return L

func yukle(d) -> void:
	for i in K.size():
		K[i].fixed = d is Array and i < d.size() and bool(d[i])
	dedi = false
	queue_redraw()
