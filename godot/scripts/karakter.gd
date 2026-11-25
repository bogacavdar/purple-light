## Oyuncunun ve sevdiği kişinin çizimi (web v428kahraman sheet(); belge: Sistemler › Oyuncunun karakteri).
## Her cinsiyet ve saç biçimi ComfyUI'de tek parça çizilmiş bir sayfadır (5 yön × 5 kare: duruş + 4 adım); renk maskesi
## (R = bölüm × 30: 1 ten, 2 saç, 3 üst, 4 alt, 6 göz; G = parlaklık × 100) seçilen renkleri boyar. Pembe yanak, dört yüz ve
## elbise piksel düzeyinde eklenir, figürün çevresine koyu kontur çekilir; sağa bakan yönler aynadır. Godot sayfası 8 yön × 5 kare.
class_name Karakter

const D5 := ["S", "SW", "W", "NW", "N"]
const R5 := {"S": 0, "SW": 1, "W": 2, "NW": 3, "N": 4}
const SRC := {"S": ["S", false], "SE": ["SW", true], "E": ["W", true], "NE": ["NW", true], "N": ["N", false], "NW": ["NW", false], "W": ["W", false], "SW": ["SW", false]}
const D8 := ["S", "SE", "E", "NE", "N", "NW", "W", "SW"]

static var _veri := {}
static var _resim := {}
static var _onbellek := {}

static func veri() -> Dictionary:
	if _veri.is_empty():
		var f := FileAccess.open("res://data/kahraman.json", FileAccess.READ)
		_veri = JSON.parse_string(f.get_as_text())
	return _veri

static func _img(yol: String) -> Image:
	if not _resim.has(yol):
		var t: Texture2D = load(yol)
		var im := t.get_image()
		if im.is_compressed(): im.decompress()
		im.convert(Image.FORMAT_RGBA8)
		_resim[yol] = im
	return _resim[yol]

static func stil(L: Dictionary) -> String:
	var V := veri()
	var g: String = L.get("gender", "e")
	var s: String = L.get("hs", "short")
	if s == "buzz": s = "kel"
	if not V.stiller[g].has(s): s = "short" if g == "e" else "long"
	return s

## web sheet(L) + yön düzeni: dönen ImageTexture 5 × 8 hücre (her biri CW × CH), satırlar S SE E NE N NW W SW
static func sayfa(L: Dictionary) -> ImageTexture:
	var anahtar := JSON.stringify(L)
	if _onbellek.has(anahtar): return _onbellek[anahtar]
	var V := veri()
	var CW := int(V.CW); var CH := int(V.CH); var NF := 5
	var g: String = L.get("gender", "e")
	var st := stil(L)
	var S: Dictionary = V.stiller[g][st]
	var B := _img(S.c); var BM := _img(S.m)
	var dress: bool = bool(L.get("dress", false)) and g == "k"
	var col := {1: Color(L.skin), 2: Color(L.skin if st == "kel" else L.hair), 3: Color(L.shirt), 4: Color(L.skin if dress else L.get("pants", "#5a6a9a")), 6: Color(L.get("eye", "#2a1f08"))}
	var W := CW * NF; var H := CH * 5
	var out := Image.create(W, H, false, Image.FORMAT_RGBA8)
	var lab := PackedByteArray(); lab.resize(W * H)
	for y in H:
		for x in W:
			var a := B.get_pixel(x, y)
			if a.a8 == 0: continue
			var m := BM.get_pixel(x, y)
			var l := int(round(m.r8 / 30.0)) if m.a8 > 0 else 0
			if col.has(l):
				var f := m.g8 / 100.0
				var c: Color = col[l]
				out.set_pixel(x, y, Color(minf(1.0, c.r * f), minf(1.0, c.g * f), minf(1.0, c.b * f), 1.0))
			else:
				out.set_pixel(x, y, Color(a.r, a.g, a.b, 1.0))
			lab[y * W + x] = l
	var at := func(row: int, fr: int, x: int, y: int) -> Vector2i: return Vector2i(fr * CW + x, row * CH + y)
	var put := func(p: Vector2i, c: Color): out.set_pixel(p.x, p.y, Color(clampf(c.r, 0, 1), clampf(c.g, 0, 1), clampf(c.b, 0, 1), 1.0))
	var c3: Color = col[3]
	for d in D5:
		var row: int = R5[d]
		var A: Dictionary = S.A.get(d, {})
		if A.is_empty(): continue
		# elbise: bacakların üst kısmı etek (elbise rengi, eteğin ucunda iki yana birer piksel geniş), altı çıplak bacak
		if dress:
			var hip := int(A.hip)
			var hem := hip + int(round((CH - 3 - hip) * 0.45))
			for fr in NF:
				for y in range(hip, hem + 1):
					for x in CW:
						var p: Vector2i = at.call(row, fr, x, y)
						var i := p.y * W + p.x
						if out.get_pixel(p.x, p.y).a8 == 0: continue
						var yan := x > 0 and x < CW - 1 and (lab[i - 1] == 4 or lab[i + 1] == 4 or lab[i - 1] == 3)
						if lab[i] == 4 or (lab[i] == 0 and yan):
							var f2 := 0.72 if y == hem else 0.95
							put.call(p, Color(c3.r * f2, c3.g * f2, c3.b * f2)); lab[i] = 3
				for y in [hem - 1, hem]:
					var x0 := -1; var x1 := -1
					for x in CW:
						var p: Vector2i = at.call(row, fr, x, y)
						if lab[p.y * W + p.x] == 3:
							if x0 < 0: x0 = x
							x1 = x
					if x0 > 0:
						var p: Vector2i = at.call(row, fr, x0 - 1, y)
						put.call(p, Color(c3.r * 0.8, c3.g * 0.8, c3.b * 0.8)); lab[p.y * W + p.x] = 3
					if x1 >= 0 and x1 < CW - 1:
						var p: Vector2i = at.call(row, fr, x1 + 1, y)
						put.call(p, Color(c3.r * 0.8, c3.g * 0.8, c3.b * 0.8)); lab[p.y * W + p.x] = 3
		# yüzler: her zaman pembe yanak; dört yüz birkaç pikselle ayrılır (ağız, çil, kaş)
		if A.get("er") != null and A.get("ex") != null and (A.ex as Array).size() > 0 and (d == "S" or d == "SW" or d == "W"):
			var er := int(A.er)
			var ex: Array = A.ex
			var skin: Color = col[1]
			var dk := Color(skin.r * 0.62, skin.g * 0.5, skin.b * 0.5)
			var ort := 0.0
			for v in ex: ort += float(v)
			ort /= ex.size()
			var mo: Array = A.mo if A.get("mo") != null else [er + 2, int(ex[0]) if d == "W" else int(round(ort))]
			var face := int(L.get("face", 0))
			var cheeks := [int(ex[0]) + 1] if d == "W" else [int(ex[0]) - 1, int(ex[-1]) + 1]
			var CHK := Color8(236, 150, 150)
			for fr in NF:
				var P := func(x: int, y: int, c: Color):
					if x < 0 or x >= CW or y < 0 or y >= CH: return
					var q: Vector2i = at.call(row, fr, x, y)
					if out.get_pixel(q.x, q.y).a8 > 0 and lab[q.y * W + q.x] == 1: put.call(q, c)
				for cx in cheeks: P.call(cx, er + 1, Color((skin.r + CHK.r) / 2.0, (skin.g + CHK.g) / 2.0, (skin.b + CHK.b) / 2.0))
				var MC := Color8(178, 92, 92)
				var my := int(mo[0]); var mx := int(mo[1])
				if face == 0 or face == 2: P.call(mx, my, MC)
				if face == 1:
					var k := Color8(150, 60, 60)
					P.call(mx - 1, my, k); P.call(mx, my, k); P.call(mx + (0 if d == "W" else 1), my, k); P.call(mx, my + 1, Color8(200, 90, 90))
				elif face == 2:
					for cx in cheeks:
						P.call(cx, er + 2, dk); P.call(cx + (1 if cx < mx else -1), er + 1, dk)
				elif face == 3:
					var hc: Color = col[2]
					var br := Color(hc.r * 0.6, hc.g * 0.6, hc.b * 0.6)
					for x in ex:
						var xi := int(x)
						P.call(xi, er - 1, br); P.call(xi + (-1 if d == "W" else (-1 if xi < mx else 1)), er - 1, br)
					P.call(mx - (0 if d == "W" else 1), my, Color8(110, 60, 60)); P.call(mx, my, Color8(110, 60, 60))
	# her karenin çevresine tek koyu kontur
	var OL := Color8(26, 18, 22)
	var al := PackedByteArray(); al.resize(W * H)
	for y in H:
		for x in W:
			al[y * W + x] = 1 if out.get_pixel(x, y).a8 > 0 else 0
	for y in H:
		for x in W:
			var i := y * W + x
			if al[i]: continue
			var cx := x % CW; var cy := y % CH
			if (cx > 0 and al[i - 1]) or (cx < CW - 1 and al[i + 1]) or (cy > 0 and al[i - W]) or (cy < CH - 1 and al[i + W]):
				out.set_pixel(x, y, OL)
	# Godot sayfası: 8 yön, sağa bakanlar ayna
	var son := Image.create(CW * NF, CH * 8, false, Image.FORMAT_RGBA8)
	for r in 8:
		var s: Array = SRC[D8[r]]
		var sr: int = R5[s[0]]
		for fr in NF:
			var hucre := out.get_region(Rect2i(fr * CW, sr * CH, CW, CH))
			if s[1]: hucre.flip_x()
			son.blit_rect(hucre, Rect2i(0, 0, CW, CH), Vector2i(fr * CW, r * CH))
	var tx := ImageTexture.create_from_image(son)
	_onbellek[anahtar] = tx
	return tx

## web cDefaults + buildLook: yaratıcının seçimlerinden görünüş
static func varsayilan(g: String) -> Dictionary:
	return {g = g, skin = 0, hair = 0, hs = "short", shirt = 0, pants = 0, dress = false, eye = 0, face = 0} if g == "e" else {g = g, skin = 0, hair = 2, hs = "long", shirt = 2, pants = 5, dress = true, eye = 0, face = 0}

static func gorunus(s: Dictionary) -> Dictionary:
	var V := veri()
	var CC: Dictionary = V.CC
	var g: String = s.g
	var sk: Array = CC.skin[int(s.skin)]
	var hr: Array = CC.hair[int(s.hair)]
	var dress: bool = bool(s.dress) and g == "k"
	return {gender = g, hs = s.hs, skin = sk[0], hair = hr[0], shirt = CC.shirt[int(s.shirt)], pants = sk[0] if dress else CC.pants[int(s.pants)], dress = dress, eye = V.EYES[int(s.eye)][0], face = int(s.face)}
