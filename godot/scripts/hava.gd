extends Node
## Hava, mevsimler, sıcaklık ve kar (web v3.69 mevsim, v3.70 hava, tickWeather, drawWeather; belge Sistemler › Hava; Mevsimler;
## Hava, sıcaklık ve kar). Yıl 28 gün, mevsim 7 gün. Hava zinciri açık → bulut → yağış → (fırtına) → bulut → açık; mevsim olasılığı
## ve süreyi verir. Sıcaklık: yılın eğrisi + günün farkı + saat + yer. Kış ve 0,5°'nin altı: kar/tipi; kar örtüsü yağdıkça büyür, erir.
## Yağmur: meşale 2 kat (fırtına 2,7, sis 1,15) çabuk biter, tarla sulanır, balık %30 çabuk vurur. Siste saldırganlar %40 geç fark eder.
## Mor gece: yılın son gecesi 4 dk, mor ışık saldırısı kesin.

const SN := ["İlkbahar", "Yaz", "Sonbahar", "Kış"]
const SUB := ["Çiçekler açtı; otlar bereketli.", "Geceler kısa, meyveler bol.", "Yapraklar dökülüyor; mantar ve meyve zamanı.", "Geceler uzun, karnın çabuk acıkır; dallarda meyve yok."]
const SRENK := [Color("#6ac050"), Color("#f0c838"), Color("#e8802a"), Color("#a8d8f0")]
const NIGHT := [150.0, 108.0, 150.0, 210.0]
const MG := 240.0
const P_YAG := [0.30, 0.18, 0.35, 0.45]
const P_FRT := [0.15, 0.40, 0.30, 0.20]
const DUR := {"açık": [[180, 360], [300, 520], [160, 320], [140, 280]], "yağmur": [[100, 200], [50, 100], [120, 240], [150, 300]], "fırtına": [[60, 120], [50, 90], [90, 160], [90, 180]]}
const AD := {"açık": "Açık", "bulut": "Bulutlu", "yağmur": "Yağmur", "fırtına": "Fırtına", "sis": "Sis"}
const FS := ["Alabalık", "Sazan", "Turna balığı", "Mersin balığı"]
const LAND1 := {3: -6.0, 5: -2.0, 2: 1.0, 4: 18.0}
const LAND2 := {2: 6.0, 4: 18.0, 5: -4.0}
const FRUITC := ["Böğürtlen", "Ahududu", "Çilek", "Yaban mersini", "Kızılcık", "Elma", "Armut", "Ardıç meyvesi", "Kuşburnu", "Alıç", "Mürver"]
const OTLAR := ["Kekik", "Papatya", "Nane", "Isırgan", "Bataklık otu", "Yaban sarımsağı", "Kuzukulağı", "Ateş çiçeği"]
const UYARI := {"yağmur": "Yağmur başladı: meşaleler iki kat çabuk tükenir.", "fırtına": "Fırtına geliyor! Şimşekler çakar, meşaleler çabuk tükenir.", "sis": "Sis çöktü: uzağı göremezsin ama hayvanlar da seni zor fark eder.", "bulut": "Bulutlar toplandı.", "açık": "Hava açıldı."}

var oyun
var k := "açık"
var t := 240.0
var flash := 0.0
var gok_t := 7.0
var kar := 0.0          # kar örtüsü 0…1 (bütün ada, kayda yazılır)
var kar_su := false
var mg_done := 0
var mg_said := 0
var duyuru := -1.0
var son_gun := 0
var kis_uyari := 0.0
var meyve_kis := false   # toplama sırasında: kış meyvesi düşmedi
var ekran: Control
var sis_kat: ColorRect
var kar_ciz: Node2D
var halka: Control
var _kar_lv := -1
var _kar_kam := Vector2i(-999, -999)
var P: Array = []        # parçacıklar (yağmur, kar, yaprak)
var FL: Array = []       # ateş böcekleri
var R := RandomNumberGenerator.new()

func kur(o) -> void:
	oyun = o
	for i in 160: P.append({x = randf(), y = randf(), v = 0.5 + randf() * 0.8, l = 0.5 + randf() * 0.5, p = randf() * 6.283, c = i % 3})
	for i in 26: FL.append({x = randf(), y = randf(), ph = randf() * 6.0})
	var kat := CanvasLayer.new()
	kat.layer = 1
	oyun.add_child(kat)
	oyun.move_child(kat, 0)
	sis_kat = ColorRect.new()
	sis_kat.set_anchors_preset(Control.PRESET_FULL_RECT)
	sis_kat.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sh := Shader.new()
	sh.code = SIS_SHADER
	var m := ShaderMaterial.new()
	m.shader = sh
	sis_kat.material = m
	sis_kat.visible = false
	kat.add_child(sis_kat)
	ekran = Control.new()
	ekran.set_anchors_preset(Control.PRESET_FULL_RECT)
	ekran.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ekran.draw.connect(_ekran_ciz)
	kat.add_child(ekran)
	kar_ciz = Node2D.new()
	kar_ciz.z_index = -8
	kar_ciz.draw.connect(_kar_ciz)
	oyun.add_child(kar_ciz)
	# saat kutusunun yanında mevsim çemberi
	var sy: Label = oyun.zaman.saat_yazi
	sy.mouse_filter = Control.MOUSE_FILTER_STOP
	halka = Control.new()
	halka.custom_minimum_size = Vector2(14, 14)
	halka.size = Vector2(14, 14)
	halka.mouse_filter = Control.MOUSE_FILTER_STOP
	halka.draw.connect(_halka_ciz)
	sy.add_child(halka)

# ------------------------------------------------------------------ mevsim ve sıcaklık
func canli() -> bool:
	return oyun != null and not oyun.basta and oyun.arena == null

func mevsim() -> int:
	return int(((maxi(1, oyun.zaman.gun) - 1) % 28) / 7)

func yil_gunu() -> int:
	return (maxi(1, oyun.zaman.gun) - 1) % 28 + 1

## yılın son gecesi (28., 56.… günün gecesi): o günün numarası, değilse 0
func mor_gece() -> int:
	var Z = oyun.zaman
	if Z.gun % 28 == 0 and Z.dk >= 1200.0: return Z.gun
	if Z.gun % 28 == 1 and Z.gun > 1 and Z.dk < 360.0: return Z.gun - 1
	return 0

func gece_sn() -> float:
	if not canli(): return 150.0
	return MG if mor_gece() > 0 else float(NIGHT[mevsim()])

func _gun_farki(d: int) -> float:
	var h: int = (d * 2654435761) & 0xFFFFFFFF
	h ^= h >> 15
	h = (h * 2246822519) & 0xFFFFFFFF
	h ^= h >> 13
	return float(h % 601) / 100.0 - 3.0

func _saat_farki() -> float:
	var h: float = oyun.zaman.dk / 60.0
	if h >= 5.0 and h <= 14.0: return -4.0 * cos(PI * (h - 5.0) / 9.0)
	var q := fmod((h - 14.0) + 24.0, 24.0)
	return 4.0 * cos(PI * q / 15.0)

func sicaklik() -> float:
	var b: int = oyun.bio_at(oyun.oyuncu.position)
	var L: Dictionary = LAND2 if oyun.ada == 2 else LAND1
	return 11.5 + 15.0 * cos(TAU * (yil_gunu() - 11) / 28.0) + _gun_farki(oyun.zaman.gun) + _saat_farki() + float(L.get(b, 0.0))

func sicaklik_yazi() -> String:
	var v := roundi(sicaklik())
	return ("−%d°" % -v) if v < 0 else ("%d°" % v)

# ------------------------------------------------------------------ hava
func yagiyor() -> bool:
	return (k == "yağmur" or k == "fırtına") and not oyun.magara.icinde

func kul_firtinasi() -> bool:
	return yagiyor() and oyun.bio_at(oyun.oyuncu.position) == 4

func sisli() -> bool:
	return k == "sis" and not oyun.magara.icinde

func kar_yagiyor() -> bool:
	if not yagiyor() or kul_firtinasi() or mevsim() != 3:
		kar_su = false
		return false
	var T_ := sicaklik()
	kar_su = T_ <= 1.0 if kar_su else T_ <= 0.5
	return kar_su

func ad() -> String:
	if kul_firtinasi(): return "Kül fırtınası"
	if kar_yagiyor(): return "Tipi" if k == "fırtına" else "Kar"
	return str(AD[k])

## meşale ne kadar çabuk yanar (web torchRate, Ateş ustalığı ayrı)
func mesale_kat() -> float:
	if oyun.magara.icinde or kul_firtinasi() or oyun.zaman.kampta(oyun.oyuncu.position): return 1.0
	if k == "fırtına": return 2.7
	if k == "yağmur": return 2.0
	if k == "sis": return 1.15
	return 1.0

func balik_kat() -> float:
	return 0.7 if yagiyor() else 1.0

func fark_kat() -> float:
	return 0.6 if sisli() else 1.0

func _sec(w: Array) -> String:
	var s := 0.0
	for a in w: s += float(a[1])
	var r := randf() * s
	for a in w:
		r -= float(a[1])
		if r <= 0.0: return str(a[0])
	return str(w[0][0])

func _sonraki() -> void:
	var s := mevsim()
	var h: float = oyun.zaman.dk / 60.0
	var bb: int = oyun.bio_at(oyun.oyuncu.position)
	var sis_k := (3.0 if h >= 5.0 and h < 10.0 else 1.0) * (2.0 if (bb == 2 or bb == 3) and oyun.ada == 1 else 1.0)
	var w: Array
	if k == "açık": w = [["bulut", 70], ["sis", 8 * sis_k], ["açık", 22]]
	elif k == "bulut": w = [["yağmur", P_YAG[s] * 100 * (1 - P_FRT[s])], ["fırtına", P_YAG[s] * 100 * P_FRT[s]], ["açık", (1 - P_YAG[s]) * 80], ["sis", 4 * sis_k], ["bulut", (1 - P_YAG[s]) * 20]]
	elif k == "yağmur": w = [["bulut", 65], ["fırtına", P_FRT[s] * 40], ["yağmur", 15]]
	elif k == "fırtına": w = [["yağmur", 55], ["bulut", 45]]
	else: w = [["açık", 60], ["bulut", 40]]
	var n := _sec(w)
	if oyun.zaman.gun <= 1 and not oyun.gorev.bitti("L1"): n = "açık"
	var a: Array = DUR[n][s] if DUR.has(n) else [90, 180]
	var was := k
	k = n
	t = float(a[0]) + randf() * float(a[1] - a[0])
	if k != was and oyun.gorev.bitti("L1"):
		var tip: String = str(UYARI[k])
		if (k == "yağmur" or k == "fırtına") and kar_yagiyor(): tip = "Kar yağmaya başladı: meşaleler iki kat çabuk tükenir." if k == "yağmur" else "Tipi başladı! Meşaleler çabuk tükenir."
		oyun.env.mesaj(tip)

# ------------------------------------------------------------------ toplama: mevsime göre fazladan ya da hiç
func kategori(n: String) -> String:
	var low := n.to_lower()
	if low.contains("mantar") or low.contains("kanlıca"): return "Mantarlar"
	if FRUITC.has(n) or RegEx.create_from_string("meyve|böğürtlen|ahududu|çilek|mersin|kızılcık|kuşburnu|alıç|mürver|elma|armut|erik|fındık|ceviz|kestane$|palamud|incir|üzüm|dut|kiraz|vişne|ayva|yemiş|kozalağı|bal$|eriği|narı$").search(low) != null: return "Meyveler"
	if OTLAR.has(n) or low.contains("sefası"): return "Otlar"
	return ""

## dusur'dan önce: toplanan/silkelenen/kesilen ağaçtan düşen adet (kışın meyve 0)
func adet(n: String, q: int, agac: bool) -> int:
	if not canli(): return q
	var c := kategori(n)
	var s := mevsim()
	if c == "Meyveler":
		if s == 3:
			var now := Time.get_ticks_msec() / 1000.0
			if now - kis_uyari > 4.0:
				kis_uyari = now
				oyun.yazi(oyun.oyuncu.position + Vector2(0, -30), "Kış: dallar çıplak, meyve baharda", Color("#e8f0ff"), 8)
			return 0
		if s == 2 and agac: return q * 2
		if s == 1 and randf() < 0.5: return q + 1
	elif c == "Otlar" and s == 0 and randf() < 0.5: return q + 1
	elif c == "Mantarlar" and s == 2 and randf() < 0.5: return q + 1
	return q

func balik_agirlik(ad_: String) -> float:
	return 2.0 if canli() and ad_ == FS[mevsim()] else 1.0

# ------------------------------------------------------------------ her kare
func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	var dur: bool = oyun.basta or oyun.zaman.durdu() or get_tree().paused
	if canli() and not dur:
		t -= dt
		if t <= 0.0: _sonraki()
		if flash > 0.0: flash -= dt
		if k == "fırtına" and not kul_firtinasi() and not oyun.magara.icinde and not kar_yagiyor():
			gok_t -= dt
			if gok_t <= 0.0:
				gok_t = 7.0 + randf() * 12.0
				flash = 0.35
				get_tree().create_timer(0.3 + randf() * 0.9).timeout.connect(func(): if oyun.ses != null: oyun.ses.cal("thunder", 0.9))
		if yagiyor() and not kul_firtinasi() and oyun.ciftlik != null:
			for f in oyun.ciftlik.plots:
				if f.st == "planted" and not f.wet: f.wet = true
		# kar örtüsü
		if kar_yagiyor(): kar = minf(1.0, kar + dt * (0.006 if k == "fırtına" else 0.003))
		elif kar > 0.0:
			var T_ := sicaklik()
			if T_ > 0.5:
				var m := T_ * 0.00025
				if yagiyor(): m *= 4.0
				elif k == "açık" and oyun.zaman.dk >= 480.0 and oyun.zaman.dk < 1020.0: m *= 1.5
				kar = maxf(0.0, kar - m * dt)
		# yeni mevsim 06:00'da duyurulur
		var g: int = oyun.zaman.gun
		if g != son_gun:
			if son_gun > 0 and g > 1 and (g - 1) % 7 == 0: duyuru = 3.6
			son_gun = g
		if duyuru > 0.0:
			duyuru -= dt
			if duyuru <= 0.0 and oyun.ys != null: oyun.ys.duyur(str(SN[mevsim()]) + " geldi", str(SUB[mevsim()]))
		# Mor gece
		var mk := mor_gece()
		if mk > 0:
			if mg_said != mk and not oyun.uyanis.acik:
				mg_said = mk
				if oyun.ys != null: oyun.ys.duyur("Mor gece", "Yılın en uzun gecesi")
				if oyun.ses != null: oyun.ses.cal("magic")
			if mg_done != mk and oyun.ys != null:
				if oyun.ys.aktif() or oyun.ys.zorla(): mg_done = mk
	_yaz()
	ekran.queue_redraw()
	_sis(dt)
	var lv := roundi(kar * 100.0) if (canli() and not oyun.magara.icinde) else 0
	var kc := Vector2i(int(oyun.oyuncu.position.x / 64.0), int(oyun.oyuncu.position.y / 64.0))
	if lv != _kar_lv or (lv > 0 and kc != _kar_kam):
		_kar_lv = lv
		_kar_kam = kc
		kar_ciz.queue_redraw()

func _yaz() -> void:
	var sy: Label = oyun.zaman.saat_yazi
	var fw: float = sy.get_theme_font("font").get_string_size(sy.text, HORIZONTAL_ALIGNMENT_LEFT, -1, sy.get_theme_font_size("font_size")).x
	halka.position = Vector2(fw + 6.0, (sy.size.y - 14.0) / 2.0)
	halka.queue_redraw()
	if not canli(): return
	var s := mevsim()
	var gs := gece_sn()
	sy.tooltip_text = "%s · %s\nGündüz 06:00–20:00 · 8 dk\nGece 20:00–06:00 · %s dk" % [ad(), sicaklik_yazi(), str(snappedf(gs / 60.0, 0.1)).replace(".", ",")]
	var kalan := 7 - (yil_gunu() - 1) % 7
	var satir := []
	for i in 4: satir.append(("● " if i == s else "  ") + str(SN[i]))
	halka.tooltip_text = "\n".join(satir) + "\n%s · %d/7. gün · %s'a %d gün" % [SN[s], (yil_gunu() - 1) % 7 + 1, SN[(s + 1) % 4], kalan]

## saat kutusuna eklenen satır (zaman._saat_yaz çağırır)
func saat_ek() -> String:
	if not canli(): return ""
	return " · %s · %s %s" % [ad(), SN[mevsim()], sicaklik_yazi()]

func _halka_ciz() -> void:
	if not canli(): return
	var c := Vector2(7, 7)
	for i in 4:
		halka.draw_arc(c, 5.5, -PI / 2.0 + i * PI / 2.0, -PI / 2.0 + (i + 1) * PI / 2.0, 8, SRENK[i], 2.5)
	var a: float = -PI / 2.0 + TAU * ((yil_gunu() - 1) + oyun.zaman.dk / 1440.0) / 28.0
	halka.draw_line(c, c + Vector2(cos(a), sin(a)) * 5.0, Color.WHITE, 1.5)
	halka.draw_circle(c, 1.2, Color.WHITE)

# ------------------------------------------------------------------ çizim
func _ekran_ciz() -> void:
	if not canli() or oyun.magara.icinde or (oyun.ev != null and oyun.ev.acik): return
	var V := ekran.size
	var dt := get_process_delta_time()
	if oyun.zaman.durdu(): dt = 0.0
	var s := mevsim()
	var dk: float = oyun.zaman.karanlik()
	var kul := kul_firtinasi()
	var karl := kar_yagiyor()
	# renk: bulut, yağmur, kül; mevsim; Mor gece
	var a: float = 0.08 if k == "bulut" else (0.16 if yagiyor() and not karl else (0.08 if karl else 0.0))
	if kul: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(60 / 255.0, 30 / 255.0, 20 / 255.0, 0.22))
	elif a > 0.0: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(30 / 255.0, 45 / 255.0, 70 / 255.0, a))
	var tint: Array = [null, [255, 214, 120, 0.045], [200, 110, 40, 0.07], [225, 238, 255, 0.11]][s]
	if tint != null: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(tint[0] / 255.0, tint[1] / 255.0, tint[2] / 255.0, float(tint[3]) * (1.0 - dk * 0.6)))
	if mor_gece() > 0: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(120 / 255.0, 40 / 255.0, 200 / 255.0, 0.10))
	var z := maxf(1.0, roundf(V.x / 640.0))
	# Bataklık'ta gece ateş böcekleri
	if oyun.ada == 1 and oyun.bio_at(oyun.oyuncu.position) == 2 and dk > 0.4 and not yagiyor():
		for f in FL:
			f.ph += dt
			var X: float = fmod(f.x + sin(f.ph * 0.4) * 0.03 + 1.0, 1.0) * V.x
			var Y: float = fmod(f.y + cos(f.ph * 0.3) * 0.03 + 1.0, 1.0) * V.y
			var kk: float = 0.5 + 0.5 * sin(f.ph * 3.0)
			ekran.draw_rect(Rect2(X - z * 4, Y - z * 4, z * 8, z * 8), Color(0.78, 1.0, 0.47, 0.12 * kk * dk))
			ekran.draw_rect(Rect2(X - z, Y - z, z * 2, z * 2), Color(0.78, 1.0, 0.47, 0.5 * kk * dk))
	if yagiyor() and not karl:
		var n := 110 if kul else (140 if k == "fırtına" else 100)
		var ang := 0.5 if kul else 0.18
		for i in mini(n, P.size()):
			var r: Dictionary = P[i]
			r.y += r.v * dt * (0.35 if kul else 1.6)
			r.x += r.v * dt * ang * (0.5 if kul else 1.6)
			if r.y > 1.0: r.y -= 1.0; r.x = randf()
			if r.x > 1.0: r.x -= 1.0
			var X: float = r.x * V.x
			var Y: float = r.y * V.y
			if kul: ekran.draw_rect(Rect2(X, Y, z * 1.5, z * 1.5), Color(170 / 255.0, 160 / 255.0, 155 / 255.0, 0.7) if i % 7 else Color(1.0, 130 / 255.0, 60 / 255.0, 0.85))
			else: ekran.draw_line(Vector2(X, Y), Vector2(X - ang * 14 * z * r.l, Y - 14 * z * r.l), Color(190 / 255.0, 215 / 255.0, 1.0, 0.35 + 0.25 * r.l), maxf(1.0, z * 0.5))
		if not kul and dt > 0.0 and randf() < 0.6:
			var c := Vector2(randf() * V.x, randf() * V.y)
			ekran.draw_arc(c, z * 3, 0, TAU, 10, Color(210 / 255.0, 230 / 255.0, 1.0, 0.5), 1.0)
		if kul: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(90 / 255.0, 50 / 255.0, 35 / 255.0, 0.18))
	else:
		# kar, sonbahar yaprakları, bahar çiçek yaprakları
		var n := (150 if k == "fırtına" else 110) if karl else (22 if s == 2 else (14 if s == 0 else 0))
		for i in n:
			var q: Dictionary = P[i]
			q.p += dt * (1.2 if s == 3 else 2.0)
			if karl:
				q.y += q.v * dt * 0.28 * (1.8 if k == "fırtına" else 1.0)
				q.x += (sin(q.p) * 0.02 + (0.12 if k == "fırtına" else 0.01)) * dt
			else:
				q.y += q.v * dt * 0.07
				q.x += (sin(q.p) * 0.05 + 0.015) * dt
			if q.y > 1.0: q.y -= 1.0; q.x = randf()
			if q.x > 1.0: q.x -= 1.0
			if q.x < 0.0: q.x += 1.0
			var X: float = q.x * V.x
			var Y: float = q.y * V.y
			if karl:
				var rr: float = z if q.c else z * 2.0
				ekran.draw_rect(Rect2(X, Y, rr, rr), Color(1, 1, 1, 0.55 + 0.35 * q.v / 1.3))
			else:
				var col: Color = ([Color("#e8a030"), Color("#d0602a"), Color("#b8382a")] if s == 2 else [Color("#ffffff"), Color("#ffd0e0"), Color("#ffb0d0")])[q.c]
				var w := z * (3.0 if s == 2 else 2.0)
				var h := z * 2.0
				var fl: bool = sin(q.p) > 0.0
				ekran.draw_rect(Rect2(X, Y, w if fl else h, h if fl else w), col)
	if flash > 0.0: ekran.draw_rect(Rect2(Vector2.ZERO, V), Color(235 / 255.0, 240 / 255.0, 1.0, minf(1.0, flash / 0.35) * (0.55 if dk > 0.5 else 0.35)))

## sis: Bataklık ve Kayalık Dağ'da her zaman ince, sisli havada her yerde yoğun; ışıklar sisi açar
func _sis(dt: float) -> void:
	var bb: int = oyun.bio_at(oyun.oyuncu.position)
	var ince: bool = oyun.ada == 1 and (bb == 2 or bb == 3)
	var on: bool = canli() and not oyun.magara.icinde and not (oyun.ev != null and oyun.ev.acik) and (ince or sisli())
	sis_kat.visible = on
	if not on: return
	var m: ShaderMaterial = sis_kat.material
	var thick := (0.62 if ince else 0.5) if sisli() else 0.22
	var dk: float = oyun.zaman.karanlik()
	m.set_shader_parameter("kalin", thick)
	m.set_shader_parameter("renk", Color(62 / 255.0, 70 / 255.0, 94 / 255.0) if dk > 0.5 else Color(226 / 255.0, 232 / 255.0, 228 / 255.0))
	m.set_shader_parameter("nk", 1.0 - minf(1.0, dk) * 0.35)
	m.set_shader_parameter("kenar", 1.0 if sisli() else 0.0)
	var ct: Transform2D = oyun.get_viewport().get_canvas_transform()
	var zoom: float = ct.x.x
	m.set_shader_parameter("ekran", sis_kat.size)
	m.set_shader_parameter("kam", -ct.origin / zoom)
	m.set_shader_parameter("zoom", zoom)
	m.set_shader_parameter("zaman", Time.get_ticks_msec() / 1000.0)
	# ışıklar (ekran pikseli, yarıçap): meşale, kamp ve kişilerin ateşleri
	var L: Array = []
	var me = oyun.mesale.elde()
	if me != null: L.append(Vector3(oyun.oyuncu.position.x, oyun.oyuncu.position.y - 6.0, oyun.mesale.yaricap() * 1.1))
	for l in oyun.zaman.isiklar:
		if L.size() >= 8: break
		if l.position.distance_to(oyun.oyuncu.position) < 500.0: L.append(Vector3(l.position.x, l.position.y, l.texture_scale * 128.0 / 1.3))
	var A: Array = []
	for v in L:
		var sp: Vector2 = ct * Vector2(v.x, v.y)
		A.append(Vector3(sp.x, sp.y, v.z * 1.25 * zoom))
	while A.size() < 8: A.append(Vector3(-9999, -9999, 0))
	m.set_shader_parameter("isik", PackedVector3Array(A))

## kar örtüsü: görünen karelerde, gürültüye göre önce lekeler, sonra birleşir
func _vn(x: float, y: float, s: int) -> float:
	var ix := floori(x)
	var iy := floori(y)
	var fx := x - ix
	var fy := y - iy
	fx = fx * fx * (3.0 - 2.0 * fx)
	fy = fy * fy * (3.0 - 2.0 * fy)
	var a := _h(ix, iy, s)
	var b := _h(ix + 1, iy, s)
	var c := _h(ix, iy + 1, s)
	var d := _h(ix + 1, iy + 1, s)
	return lerpf(lerpf(a, b, fx), lerpf(c, d, fx), fy)

func _h(x: int, y: int, s: int) -> float:
	var h: int = (x * 374761393 + y * 668265263 + s * 1442695041) & 0xFFFFFFFF
	h = ((h ^ (h >> 13)) * 1274126177) & 0xFFFFFFFF
	return float(h & 0xFFFF) / 65535.0

func _kar_ciz() -> void:
	if _kar_lv <= 0: return
	var Lv := (_kar_lv / 100.0 * 1.15 - 0.08)
	var c: Vector2 = oyun.oyuncu.position
	var tx0 := int(c.x / 16.0) - 34
	var ty0 := int(c.y / 16.0) - 22
	var col := Color(238 / 255.0, 245 / 255.0, 252 / 255.0, 0.88)
	for ty in range(ty0, ty0 + 45):
		for tx in range(tx0, tx0 + 69):
			var p := Vector2(tx * 16 + 8, ty * 16 + 8)
			if oyun.tile_at(p) >= 3 or oyun.bio_at(p) == 4: continue
			var base := _vn(tx / 5.0, ty / 5.0, 431) * 0.8 + _h(tx, ty, 401) * 0.2
			for sy in 2:
				for sx in 2:
					var v := base + (_h(tx * 2 + sx, ty * 2 + sy, 402) - 0.5) * 0.08
					if v < Lv: kar_ciz.draw_rect(Rect2(tx * 16 + sx * 8, ty * 16 + sy * 8, 8, 8), col)

# ------------------------------------------------------------------ kayıt
func kayit() -> Dictionary:
	return {kar = snappedf(kar, 0.001), mg = mg_done, k = k, t = t}

func yukle(d) -> void:
	kar = 0.0; mg_done = 0; k = "açık"; t = 240.0
	if typeof(d) != TYPE_DICTIONARY: return
	kar = clampf(float(d.get("kar", 0.0)), 0.0, 1.0)
	mg_done = int(d.get("mg", 0))
	mg_said = mg_done
	if AD.has(str(d.get("k", ""))): k = str(d.k)
	t = float(d.get("t", 240.0))
	son_gun = oyun.zaman.gun

const SIS_SHADER := """
shader_type canvas_item;
uniform float kalin = 0.22;
uniform vec4 renk : source_color = vec4(0.88, 0.91, 0.89, 1.0);
uniform float nk = 1.0;
uniform float kenar = 0.0;
uniform vec2 ekran = vec2(1280.0, 720.0);
uniform vec2 kam = vec2(0.0);
uniform float zoom = 1.0;
uniform float zaman = 0.0;
uniform vec3 isik[8];
float h(vec2 p) { return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }
float vn(vec2 p) { vec2 i = floor(p); vec2 f = fract(p); f = f * f * (3.0 - 2.0 * f);
	return mix(mix(h(i), h(i + vec2(1, 0)), f.x), mix(h(i + vec2(0, 1)), h(i + vec2(1, 1)), f.x), f.y); }
float fbm(vec2 p) { return vn(p * 8.0) * 0.55 + vn(p * 16.0) * 0.3 + vn(p * 32.0) * 0.15; }
float katman(vec2 w) { float v = fbm(w); float a = clamp((v - 0.3) * 1.9, 0.0, 1.0); return a * a * (3.0 - 2.0 * a); }
void fragment() {
	vec2 sp = SCREEN_UV * ekran;
	vec2 w = kam + sp / zoom;
	float a1 = katman((w + vec2(zaman * 2.2, zaman * 0.45)) / 620.0) * 0.85;
	float a2 = katman((w * 0.82 + vec2(zaman * 3.1, zaman * 0.65)) / 380.0 + 7.3) * 0.6;
	float a = min(1.0, kalin * max(a1, a2) * 1.6 * nk);
	a = a + (1.0 - a) * kalin * 0.35;
	for (int i = 0; i < 8; i++) {
		float r = isik[i].z; if (r <= 0.0) continue;
		float d = distance(sp, isik[i].xy) / r;
		float hole = d < 0.55 ? mix(0.95, 0.6, d / 0.55) : mix(0.6, 0.0, clamp((d - 0.55) / 0.45, 0.0, 1.0));
		a *= 1.0 - hole;
	}
	if (kenar > 0.5) { vec2 c = SCREEN_UV - 0.5; float e = smoothstep(0.2, 0.75, length(c * vec2(ekran.x / ekran.y, 1.0))); a = a + (1.0 - a) * e * kalin * 0.7; }
	COLOR = vec4(renk.rgb, a);
}
"""
