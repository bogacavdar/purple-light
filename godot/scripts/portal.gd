## Adalar arası portallar (web v76: P1, P2, drawPortal, pOn, pOk, travel; belge ACT 2 › Geçiş ve portallar).
## Yıldızsız Ada'da her kişinin sağ yanında bir portal (Kemal, Zümrüt, Nazlı, Dursun, Ekin, Sinan, Börü, Doğan), ikinci adada iki
## (Yıldız'ın ve Barbaros'un yanında). İlk deniz yolculuğundan sonra Kemal'in ve Barbaros'un portalı hep açıktır; Yıldız'ın son
## görevi (gk3) bitince hepsi açılır. Portalın üstünde F: öbür adaya geçilir (kayıt, yükleme ekranı, öbür ada).
extends Node2D

var oyun
var P: Array = []       # {p, who, n}
var t := 0.0

func kur(o) -> void:
	oyun = o
	if oyun.ada == 1:
		var adlar := {"Yaşlı Kemal": "Kemal", "Cadı Zümrüt": "Zümrüt", "Pazarcı Nazlı": "Nazlı", "Demirci Dursun": "Dursun", "Usta Sinan": "Sinan", "Savaşçı Börü": "Börü", "Avcı Doğan": "Doğan"}
		var sira := ["Kemal", "Zümrüt", "Nazlı", "Dursun", "Ekin", "Sinan", "Börü", "Doğan"]
		var yer := {}
		for n in oyun.kisiler:
			if adlar.has(n.K.ad): yer[adlar[n.K.ad]] = n.position
		yer["Ekin"] = Vector2(oyun.ciftlik.ekin_ev()) if oyun.ciftlik != null else null
		for k in oyun.toplama_veri.kisiler:
			if adlar.has(k.ad) and not yer.has(adlar[k.ad]): yer[adlar[k.ad]] = Vector2(k.x, k.y)
		for w in sira:
			if yer.get(w, null) == null: continue
			_ekle(_bos_yer(yer[w] + Vector2(44, -6)), w)
	else:
		var Y: Dictionary = oyun.yerler2.yildiz
		var B: Dictionary = oyun.yerler2.barbaros
		_ekle(_bos_yer(Vector2(Y.x - 30, Y.y + 14)), "Yıldız")
		_ekle(_bos_yer(Vector2(B.x + 30, B.y - 20)), "Barbaros")

func _ekle(p: Vector2, who: String) -> void:
	var n := Node2D.new()
	n.position = p
	n.draw.connect(_ciz.bind(n))
	n.visible = false
	oyun.nesneler.add_child(n)
	P.append({p = p, who = who, n = n})

## web nearFree + pClear: geçilebilir, kazanın, örsün, tezgâhın önünde değil, kişilerin dibinde değil, Ekin'in tarlasında değil
func _bos_yer(x: Vector2) -> Vector2:
	for tur in 2:
		for r in range(0, 120 if tur == 0 else 70, 6):
			for a in 12:
				var p := x + Vector2(cos(a / 12.0 * TAU), sin(a / 12.0 * TAU)) * r
				if oyun.engel(p, 5.0) or oyun.tile_at(p) >= 3: continue
				if tur == 0 and not _temiz(p): continue
				return p
	return x

func _temiz(p: Vector2) -> bool:
	var I: Dictionary = oyun.toplama_veri.istasyon
	for a in ["kazan", "ors", "ors2"]:
		if Vector2(I[a].x, I[a].y).distance_to(p) < (46.0 if a == "kazan" else 30.0): return false
	for n in oyun.kisiler:
		if n.position.distance_to(p) < 30.0: return false
	if oyun.ada == 1 and oyun.ciftlik != null:
		for k in 24:
			if oyun.ciftlik.tarh(k).distance_to(p) < 26.0: return false
	return true

func bilinen() -> bool:
	return oyun.kuzen.tanis.has("portal_acik") or oyun.gorev.bitti("gk3")

func acik_mi(q: Dictionary) -> bool:
	return bilinen() or ((q.who == "Barbaros" or q.who == "Kemal") and oyun.kuzen.act2)

## varışta inilecek portal: "portal" → bu adanın ilk portalı (web P2[0]), "Kemal" → Kemal'in portalı
func yer(how: String):
	for q in P:
		if q.who == how: return q.p
	if not P.is_empty(): return P[0].p
	return null

func etkiles() -> bool:
	for q in P:
		if acik_mi(q) and q.p.distance_to(oyun.oyuncu.position) < 16.0:
			oyun.seyahat(1 if oyun.ada == 2 else 2, "Kemal" if oyun.ada == 2 else "portal")
			return true
	return false

func _process(dt: float) -> void:
	t += dt
	if oyun.basta: return
	if not oyun.kuzen.tanis.has("portal_acik") and oyun.gorev.bitti("gk3"):
		oyun.kuzen.tanis["portal_acik"] = true
		oyun.env.mesaj("Portallar açıldı · Yıldızsız Ada'daki herkesin yanında bir kapı var")
	var O: Vector2 = oyun.oyuncu.position
	for q in P:
		var v: bool = acik_mi(q) and not oyun.magara.icinde
		q.n.visible = v
		if v and q.p.distance_to(O) < 500.0:
			q.n.queue_redraw()
			if randf() < 0.08: oyun.parca(q.p + Vector2(randf_range(-5, 5), -14), Vector2(0, -12), 0.8, Color("#c9a0ff"))

## web drawPortal: iki taş direk, üstte mor taşlı lento, içinde dönen mor ışık
func _ciz(n: Node2D) -> void:
	var r := func(x: float, y: float, w: float, h: float, c) -> void: n.draw_rect(Rect2(x, y, w, h), Color(c))
	n.draw_set_transform(Vector2(0, 2), 0.0, Vector2(13, 4)); n.draw_circle(Vector2.ZERO, 1.0, Color(0.08, 0.04, 0.16, 0.35)); n.draw_set_transform(Vector2.ZERO)
	r.call(-12, -30, 4, 32, "#4a4a5a"); r.call(8, -30, 4, 32, "#4a4a5a"); r.call(-13, -34, 26, 5, "#5a5a6c"); r.call(-12, -34, 24, 1, "#7a7a90"); r.call(-2, -37, 4, 3, "#c080ff")
	var k := 0.6 + 0.4 * sin(t * 3)
	n.draw_set_transform(Vector2(0, -14), 0.0, Vector2(8, 14)); n.draw_circle(Vector2.ZERO, 1.0, Color(0.47, 0.2, 0.78, 0.55 + 0.25 * k))
	n.draw_set_transform(Vector2(0, -14), 0.0, Vector2(4, 9)); n.draw_circle(Vector2.ZERO, 1.0, Color(0.9, 0.78, 1.0, 0.35 + 0.3 * k))
	n.draw_set_transform(Vector2.ZERO)
	for i in 4:
		var a := t * 2.4 + i * 1.57
		r.call(roundf(cos(a) * 6), roundf(-14 + sin(a) * 11), 1, 1, "#ffffff")
