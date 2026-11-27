## Bir canlı: web tickAnimals / drawAnimal (ART yolu). Tavşan (zararsız) yaklaşınca kaçar; Kurt (saldırgan) görünce kovalar,
## önünde durur, "!" ile atılır ve ısırır. Resim v436cayir'den: kare 0 duruş, 1–4 yürüyüş, 5 hamle; sağa bakar, sola giderken aynalanır.
extends Node2D

var oyun
var tur := ""
var D: Dictionary
var spr: Sprite2D
var mat: ShaderMaterial

var hp := 1.0
var st := "wander"
var t := 0.0
var dir := Vector2.ZERO
var step := 0.0
var face := 1
var mad := false
var flash := 0.0
var atk := 0.0
var wind := 0.0
var lunge := {}
var kb := {}
var hedef := Vector2.ZERO
var olu := -1.0

var tur_k := ""        # mağara canlıları: "w" önden yarasa, "t" üstten kertenkele/örümcek (web v436cayir)
var boss := false
var cvb := false        # mağaranın boss'u (yan görev çağırır)
var etkiler := {}        # silah ve ok etkileri: yanık, zehir, kanama (web weapon fx) → {t, n, dps, kat}
var imza := {}          # imza hamlesi (belge İmza hamleleri ve sürü taktiği): {tip, faz, t, ...}
var imza_t := 3.0
# hayvanların tutumu (belge Sistemler › Hayvanların tutumu, 13 Kasım 2026, Boğaç)
var fark := -1.0        # "?" ile durup bakıyor
var uyari := -1.0       # nötrün "!" uyarısı
var kacis := -1.0       # yaralıyken kaçış süresi
var kacis_g := 0.0
var kac_sans := -1      # -1 belirlenmedi, 0 kaçmaz, 1 kaçar, 2 kaçtı
var son_vur := -100.0   # son vurulduğu an (güçlüden çekinme 20 sn bozulur)
var av = null           # avcı: kovaladığı av
var av_t := 0.0
var av_ara := 0.0
var yeme_t := 0.0
var avci = null         # av: peşindeki avcı
var yavas := 0.0        # Bola: %35 hızla yürür
var donuk := 0.0        # Buz asası: donmuşken kıpırdamaz (web a.frz)
var sersem := 0.0       # savuşturulunca sersemler (web a.stun)
var renk := "n"         # saldırının rengi: n beyaz, y sarı (×1,4), r kırmızı (×1,7, savuşturulamaz)
var ders := false       # Börü'nün ders kereviti: dersi ders.gd yürütür, hasar almaz
var ders_yuru := false
var ogr := false        # öğreticide Börü'nün yumruk kereviti: saldırmaz, kaçmaz
const MUL := {"n": 1.0, "y": 1.4, "r": 1.7}
const RENK := {"n": Color("#ffffff"), "y": Color("#ffd028"), "r": Color("#ff3a2a")}
const AGIR := ["Timsah", "Yaban öküzü", "Kara ejder", "Mağara ayısı", "Hurda devi", "Büyük golem", "Lav golemi", "Kızıl ejder", "Gölge muhafız", "Gök bekçisi", "Kristal golem", "Kristal golemcik", "Devriye robotu", "Yavru ejder", "Bataklık kurdu", "Kül kurdu", "Gölge kurdu", "Kristal geyik"]

## web v110 roll: saldırının rengi
func _zar() -> String:
	if D.get("ranged", false): return "n"
	var r := randf()
	if ders: return "y" if r < 0.25 else "n"
	if boss: return "r" if r < 0.3 else ("y" if r < 0.65 else "n")
	if AGIR.has(tur) or float(D.hp) >= 300.0: return "r" if r < 0.2 else ("y" if r < 0.5 else "n")
	if float(D.dmg) >= 8.0 and float(D.hp) >= 35.0: return "y" if r < 0.3 else "n"
	return "n"

## savuşturuldu: sersemler, geri savrulur (web parried)
func savusturuldu(yon: Vector2) -> void:
	sersem = 1.1 if boss else 1.6
	set_meta("pc", true)   # web v3.11: savuşturmayla sersemleyen canlıya ilk vuruş her zaman kritik
	wind = 0.0
	lunge = {}
	flash = 0.15
	mad = true
	if not ders:
		kb = {v = yon * (90.0 if boss else 170.0), t = 0.16}

func _ready() -> void:
	hp = float(D.hp)
	tur_k = str(D.get("kind", ""))
	boss = bool(D.get("boss", false))
	spr = Sprite2D.new()
	spr.texture = D.tex if D.has("tex") else load(D.file)
	spr.hframes = int(D.frames)
	if tur_k == "ys":
		spr.vframes = 2
		var gl := Sprite2D.new()
		gl.name = "parilti"
		gl.texture = D.parilti
		gl.hframes = int(D.frames); gl.vframes = 2
		gl.centered = false
		var cm := CanvasItemMaterial.new()
		cm.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
		gl.material = cm
		spr.add_child(gl)
	elif tur_k != "":
		spr.vframes = 3
	spr.centered = false
	spr.offset = Vector2(-float(D.ox), -float(D.oy))
	mat = ShaderMaterial.new()
	mat.shader = oyun.parlama_shader
	spr.material = mat
	add_child(spr)

func _draw() -> void:
	_imza_ciz()
	if tur_k == "ys" and olu < 0.0:
		var pl := 0.5 + 0.5 * sin(Time.get_ticks_msec() / 250.0 + position.x * 0.2)
		var R := maxf(float(D.fw), float(D.fh)) * 0.8
		var cy := -float(D.fh) / 2.0 + 2.0 + (-6.0 if tur == "Yıldızsız gözcü" else 0.0)
		for i in 5:
			var k := 1.0 - i / 5.0
			draw_circle(Vector2(0, cy), R * k, Color(0.75, 0.3, 1.0, (0.08 + 0.05 * pl) * (1.0 - k * 0.6)))
	if boss and olu < 0.0:
		var pp := 0.5 + 0.5 * sin(Time.get_ticks_msec() / 250.0 + position.x)
		for r in [16.0, 11.0, 6.0]:
			draw_circle(Vector2(0, -8), r, Color(0.7, 0.29, 1.0, (0.1 + 0.06 * pp) * (1.0 - r / 20.0)))
	if olu >= 0.0:
		return
	var sh := float(D.shadow)
	draw_set_transform(Vector2(0, 1.5), 0, Vector2(sh * 0.5, maxf(1.5, sh * 0.12)))
	draw_circle(Vector2.ZERO, 1.0, Color(0, 0, 0, 0.22))
	draw_set_transform(Vector2.ZERO)
	var top := -float(D.top)
	if sersem > 0.0:
		# sersem: başının üstünde dönen yıldızlar
		var tm := Time.get_ticks_msec() / 1000.0
		for i in 3:
			var a := tm * 5.0 + i * 2.094
			var c := Color("#ffe070") if i % 2 else Color("#fff8c8")
			draw_rect(Rect2(cos(a) * 7.0 - 1.0, top - 6.0 + sin(a) * 2.5 - 1.0, 3, 3), c)
			draw_rect(Rect2(cos(a) * 7.0, top - 6.0 + sin(a) * 2.5, 1, 1), Color.WHITE)
	elif wind > 0.0:
		# ünlem: saldırı geliyor; rengi darbenin rengi (beyaz, sarı savuşturulur; kırmızı savuşturulamaz)
		var hg := top - 10.0
		var c: Color = RENK[renk]
		var nn := 2 if renk == "r" else 1
		for i in nn:
			var ox := (3.0 if i else -3.0) if nn > 1 else 0.0
			draw_rect(Rect2(-2 + ox, hg - 1, 5, 9), Color("#11170f"))
			draw_rect(Rect2(-1 + ox, hg, 3, 5), c)
			draw_rect(Rect2(-1 + ox, hg + 6, 3, 2), c)
	elif mad and D.temper != "zararsız":
		var b := roundf(sin(Time.get_ticks_msec() / 125.0))
		draw_rect(Rect2(-1, top - 9 + b, 2, 5), Color("#ff4a2a"))
		draw_rect(Rect2(-1, top - 3 + b, 2, 1), Color("#ff4a2a"))
	if hp < float(D.hp):
		# web hpBar: boş kısmı görünen can çubuğu
		var w := roundf(maxf(14.0, minf(32.0, float(D.fw) * 0.7)))
		var k := clampf(hp / float(D.hp), 0.0, 1.0)
		var x := roundf(-w / 2.0)
		var y := roundf(top - 5.0)
		draw_rect(Rect2(x - 1, y - 1, w + 2, 4), Color("#0b0f0a"))
		draw_rect(Rect2(x, y, w, 2), Color("#5a2a26"))
		var f := roundf(w * k)
		if f > 0:
			draw_rect(Rect2(x, y, f, 2), Color("#8fd46b") if k > 0.5 else (Color("#f2b84b") if k > 0.25 else Color("#e8775a")))

func _git(v: Vector2, dt: float) -> void:
	var land: Array = D.get("landTiles", [0.0, 1.0, 2.0])
	if oyun.insa.dal_cit(position): v *= 0.35
	if yavas > 0.0 and kb.is_empty(): v *= 0.35
	var nx := position + Vector2(v.x * dt, 0)
	var takildi := false
	if not oyun.engel(nx, 5.0, true) and land.has(float(oyun.tile_at(nx))):
		position.x = nx.x
	else:
		t = 0.0
		takildi = v.x != 0.0
	var ny := position + Vector2(0, v.y * dt)
	if not oyun.engel(ny, 5.0, true) and land.has(float(oyun.tile_at(ny))):
		position.y = ny.y
	else:
		t = 0.0
		takildi = takildi or v.y != 0.0
	if takildi and mad: oyun.insa.carpti(self, v)
	if v.x != 0.0:
		face = 1 if v.x > 0 else -1

func _process(dt: float) -> void:
	if oyun.ev.acik: return
	if has_meta("yem"):
		if oyun.evcil.yem_hedefi(self) and olu < 0.0: return
		remove_meta("yem")
	if olu < 0.0 and not etkiler.is_empty(): _etki_isle(dt)
	if yavas > 0.0: yavas -= dt
	if olu >= 0.0:
		olu += dt
		if tur_k == "ys":
			# Yıldızsız: mor ışıkla göğe çekilir gibi solar
			modulate.a = clampf(1.0 - olu * 2.0, 0.0, 1.0)
			if olu > 0.6: queue_free()
			return
		if tur_k != "":
			# mağara canlıları yuvarlanmaz: yarasa gölgesinin üstüne süzülür, kertenkele ve örümcek durduğu gibi yatar, gözleri söner
			_kare(dt, false)
			modulate.a = clampf(3.0 - olu * 1.2, 0.0, 1.0)
			if olu > 2.5:
				queue_free()
			return
		# ölünce yana devrilir ve söner
		rotation = minf(1.0, olu / 0.25) * PI / 2 * face
		modulate.a = clampf(1.6 - olu * 1.6, 0.0, 1.0)
		if olu > 1.0:
			queue_free()
		return
	if donuk > 0.0:
		donuk -= dt
		flash -= dt
		wind = 0.0; lunge = {}
		return
	if ders:
		_gorun(ders_yuru)
		sersem = maxf(0.0, sersem - dt)
		flash -= dt
		return
	if sersem > 0.0:
		sersem -= dt
		if sersem <= 0.0 and has_meta("pc"): remove_meta("pc")
		wind = 0.0; lunge = {}; atk = maxf(atk, 0.4); imza = {}
		flash -= dt
		if not kb.is_empty():
			kb.t -= dt
			_git(kb.v, dt)
			if kb.t <= 0: kb = {}
		_gorun(false)
		return
	var P: Node2D = oyun.oyuncu
	if has_meta("dnc") and oyun.gizli.dansta():
		# dansı izleyen hayvan: yerinde durur, sana bakar
		st = "wander"; mad = false
		_gorun(false)
		return
	var dv: Vector2 = P.position - position
	var d := maxf(dv.length(), 1.0)
	var aggro := float(D.aggro)
	if oyun.gizli != null and oyun.gizli.gorunmez():
		# görünmezken canlılar seni görmez: kovalayan bırakır, saldırmaz, atmaz
		aggro = 0.0
		mad = false; wind = 0.0; lunge = {}; imza = {}; fark = -1.0
	var tut := _tutum_var()
	var cek := tut and _cekiniyor()
	var saldirgan: bool = (D.temper == "saldırgan" or (D.temper == "nötr" and mad)) and not ogr and not cek
	if D.temper == "nötr" and mad and d > 200.0:
		mad = false
	if tut:
		# fark etme: dururken alanın %55'i, yürürken %80'i, koşarken tamamı; önce "?" ile durup bakar
		var ak: float = aggro * [0.55, 0.8, 1.0][int(P.hiz_kip)]
		if saldirgan and not mad and not P.bayildi and not P.kilit and not oyun.zaman.kampta(P.position):
			if fark < 0.0 and d < ak:
				fark = 0.35 if (oyun.ada == 2 or oyun.bio_at(position) == 5) else 0.7
				oyun.yazi(position + Vector2(0, -float(D.r) - 16.0), "?", Color("#ffd23a"), 14)
				_birak_av()
			elif fark >= 0.0:
				if d > ak * 1.15: fark = -1.0
				else:
					fark -= dt
					face = 1 if dv.x > 0 else -1
					if fark <= 0.0:
						fark = -1.0; mad = true
						_suru_fark()
					_gorun(false)
					flash -= dt
					return
		# nötr: dibinde kalırsan önce turuncu "!" ile uyarır, 1,5 sn sonra saldırır
		if D.temper == "nötr" and not mad and tur != "Kerevit" and not P.bayildi and not oyun.zaman.kampta(position):
			if d < float(D.r) + 40.0:
				if uyari < 0.0:
					uyari = 1.5
					oyun.yazi(position + Vector2(0, -float(D.r) - 16.0), "!", Color("#ff9a2a"), 14)
				uyari -= dt
				spr.rotation = sin(Time.get_ticks_msec() / 60.0) * 0.12
				face = 1 if dv.x > 0 else -1
				if uyari <= 0.0:
					uyari = -1.0; mad = true; spr.rotation = 0.0
			elif uyari >= 0.0:
				uyari = -1.0; spr.rotation = 0.0
		# yaralanınca kaçma: canı %20'nin altında, %60 ihtimal, 4 sn
		if kacis > 0.0:
			kacis -= dt
			kacis_g += dt
			var ky := -dv / d
			var once := position
			_git(ky * float(D.spd) * 1.25, dt)
			if randf() < dt * 8.0: oyun.parca(position + Vector2(randf_range(-3, 3), -2), Vector2.ZERO, 1.2, Color("#9a1a1a"))
			face = 1 if ky.x > 0 else -1
			if (kacis_g > 1.0 and d < float(D.r) + 14.0) or (kacis_g > 0.3 and position.distance_to(once) < 0.2): kacis = 0.0
			if kacis <= 0.0: kacis = -1.0
			flash -= dt
			_gorun(true)
			return
		if cek and d < 70.0:
			st = "wander"
			_git(-dv / d * float(D.spd) * 0.6, dt)
			flash -= dt
			_gorun(true)
			return
	if saldirgan and not mad and d < aggro and not P.bayildi and not P.kilit and not tut:
		mad = true
	if tut and avci != null and is_instance_valid(avci) and avci.olu < 0.0 and avci.av == self:
		var hv: Vector2 = position - avci.position
		_git(hv.normalized() * float(D.spd), dt)
		face = 1 if hv.x > 0 else -1
		flash -= dt
		_gorun(true)
		return
	if tut and not mad and _avlan(dt):
		flash -= dt
		return
	flash -= dt
	atk -= dt
	step += dt
	var moving := false
	imza_t -= dt
	if not imza.is_empty() and kb.is_empty():
		_gorun(_imza_isle(dt, P))
		return
	if not kb.is_empty():
		kb.t -= dt
		_git(kb.v, dt)
		if kb.t <= 0:
			kb = {}
	else:
		if D.temper == "saldırgan" and mad and not boss and (d > aggro * 2.0 or P.bayildi or P.kilit) and lunge.is_empty() and wind <= 0.0:
			mad = false
		if boss and (P.bayildi or P.kilit): mad = false
		var angry: bool = saldirgan and (mad or d < aggro) and not P.bayildi and not P.kilit
		var kd: float = [35.0, 55.0, 100.0][int(P.hiz_kip)] if tut else 70.0
		if D.temper == "zararsız" and (d < kd or mad):
			st = "flee"
			_git(-dv / d * float(D.spd), dt)
			moving = true
			mad = d <= 200.0
		elif angry:
			st = "chase"
			var R = D.get("ranged", null)
			if R != null:
				# web ranged: menzilin %80'inden uzaksa yaklaşır, %40'ından yakınsa geri çekilir; menzildeyken 0,6 sn hazırlanıp atar
				if wind > 0.0:
					wind -= dt
					if wind <= 0.0:
						oyun.atis.at(self)
						if _imza_tur() == "vurkac": imza = {tip = "geri", t = 0.35, v = -dv / d * 200.0}
				elif imza_t <= 0.0 and _imza_basla(P, dv, d): pass
				else:
					var rg := float(R.range)
					if d > rg * 0.8:
						_git(dv / d * float(D.spd), dt); moving = true
					elif d < rg * 0.4:
						_git(-dv / d * float(D.spd) * 0.8, dt); moving = true
					if d < rg and atk <= 0.0:
						wind = 0.6
						atk = float(R.cd)
						renk = "n"
						hedef = P.position + Vector2(0, -4)
						face = 1 if dv.x > 0 else -1
			elif not lunge.is_empty():
				lunge.t -= dt
				_git(lunge.v, dt)
				moving = true
				if P.position.distance_to(position) < float(D.r) + 9.0:
					if not lunge.hit and not oyun.insa.arada(position, P.position):
						lunge.hit = true
						P.isirildi(int(round(float(D.dmg) * float(MUL[renk]))), position, self, renk)
						if D.get("fx", null) != null and P.hp > 0.0 and P.dokunulmaz > 0.5: P.etki_ekle(str(D.fx[0]), float(D.fx[1]), float(D.fx[2]))
						if _imza_tur() == "vurkac": imza = {tip = "geri", t = 0.35, v = -dv / d * 200.0}
					lunge = {}
				elif lunge.t <= 0:
					lunge = {}
			elif wind > 0.0:
				wind -= dt
				if wind <= 0.0:
					# atılma oyuncunun şimdi durduğu yere gider, sonra çizgisini korur
					hedef = P.position
					var e := hedef - position
					var el := maxf(e.length(), 1.0)
					var sp := minf(300.0, (el + 12.0) / 0.3)
					lunge = {v = e / el * sp, t = 0.3, hit = false}
					oyun.yazi(position + Vector2(0, -float(D.r) - 14.0), "!", RENK[renk] if renk != "n" else Color("#ff3b30"), 14)
			else:
				var cs: float = float(D.cs) if D.cs != null else float(D.spd)
				var hn := _suru_yeri(P)
				if hn != Vector2.INF and hn.distance_to(position) > 10.0:
					var hv := hn - position
					_git(hv.normalized() * cs, dt)
					moving = true
				elif d > maxf(14.0, float(D.r) + 10.0):
					_git(dv / d * cs, dt)
					moving = true
				if imza_t <= 0.0 and _imza_basla(P, dv, d): pass
				elif d < float(D.reach) and atk <= 0.0:
					wind = 0.1
					renk = _zar()
					atk = float(D.wind) + 0.9
					face = 1 if dv.x > 0 else -1
		else:
			st = "wander"
			t -= dt
			if t <= 0.0:
				t = 1.5 + randf() * 2.5
				var an := randf() * TAU
				dir = Vector2(cos(an), sin(an)) if randf() < 0.6 else Vector2.ZERO
			if dir != Vector2.ZERO:
				_git(dir * float(D.spd) * 0.3, dt)
				moving = true
	_gorun(moving)

func _gorun(moving: bool) -> void:
	if tur_k == "ys":
		_ys_kare()
		mat.set_shader_parameter("flash", 1.0 if flash > 0.0 else 0.0)
		queue_redraw()
		return
	if tur_k != "":
		_kare(0.0, moving)
		mat.set_shader_parameter("flash", 1.0 if flash > 0.0 else 0.0)
		queue_redraw()
		return
	# kare seçimi: hamlede 5, yürürken 1–4, dururken 0
	var fr := 0
	if wind > 0.0 or not lunge.is_empty():
		fr = 5
	elif moving:
		var hz := 10.0 if st == "wander" else 18.0
		fr = 1 + (int(floor(step * hz / PI)) % 4)
	spr.frame = mini(fr, int(D.frames) - 1)
	spr.flip_h = face < 0
	spr.offset.x = (-float(D.ox)) if face > 0 else (float(D.ox) - float(D.fw))
	mat.set_shader_parameter("flash", 1.0 if flash > 0.0 else 0.0)
	queue_redraw()

## Yıldızsız: dev hamlede kollarını kaldırır (3. kare), sürüngenin bacakları, ötekiler kıpırdar; gözcü havada süzülür; kovalarken gözler kırmızı
func _ys_kare() -> void:
	var tm := Time.get_ticks_msec() / 1000.0 + position.x * 0.05
	var fr := 0
	if tur == "Yıldızsız dev": fr = 2 if (wind > 0.0 or not lunge.is_empty()) else (1 if sin(step * 10.0) > 0.0 else 0)
	elif tur == "Yıldızsız sürüngen": fr = 1 if sin(step * 16.0) > 0.0 else 0
	else: fr = 1 if sin(tm * 5.0) > 0.0 else 0
	var row := 1 if ((st == "chase" or mad) and olu < 0.0) else 0
	spr.frame = row * int(D.frames) + fr
	spr.flip_h = face < 0
	var bob := roundf(sin(tm * 4.0) * 1.5) - 6.0 if tur == "Yıldızsız gözcü" else 0.0
	spr.offset = Vector2(-floorf(float(D.fw) / 2.0), -float(D.fh) + 2.0 + bob)
	var gl: Sprite2D = spr.get_node("parilti")
	gl.frame = spr.frame; gl.flip_h = spr.flip_h; gl.offset = spr.offset
	gl.modulate.a = 0.6 + 0.4 * (0.5 + 0.5 * sin(tm * 4.0))

## web v436cayir: yarasa kanadını üç kareyle çırpar (yukarı, düz, aşağı), leşi 6. kare; kertenkele/örümcek iki adım, leşi 'd' satırı;
## kovalarken gözler kırmızı ('r' satırı)
func _kare(_dt: float, moving: bool) -> void:
	var fw := float(D.fw); var fh := float(D.fh)
	var tm := Time.get_ticks_msec() / 1000.0
	var row := 0
	var fr := 0
	var top := 0.0
	var kovala: bool = (st == "chase" or mad) and olu < 0.0
	if tur_k == "w":
		var ph := sin(tm * 14.0 + position.x * 0.37)
		if olu >= 0.0:
			fr = 6
			top = -fh + 4.0 - (1.0 - minf(1.0, olu / 0.4)) * 12.0
		else:
			fr = 1 if ph > 0.45 else (3 if ph < -0.45 else 2)
			top = -fh - (6.0 if fh > 40.0 else 8.0) + sin(tm * 3.0 + position.x * 0.1) * 2.0
			row = 1 if kovala else 0
	else:
		var l := sin(step * (10.0 if st == "wander" else 18.0)) if moving else 0.0
		if olu >= 0.0:
			fr = 0; row = 2
		else:
			fr = 2 if l > 0.0 else 1
			row = 1 if kovala else 0
		top = -fh * 0.72
	spr.frame = row * int(D.frames) + fr
	spr.flip_h = face < 0
	spr.offset = Vector2(-floorf(fw / 2.0), roundf(top))

# ------------------------------------------------------------------ imza hamleleri ve sürü taktiği (13 Kasım 2026, Boğaç)
const IMZA := {"tekme": ["Geyik", "Karaca", "Yaban atı", "Kristal geyik", "Yaban kazı", "Turna kuşu"], "vurkac": ["Engerek", "Kunduz", "Su samuru", "Işık tilkisi", "Işık engereği"],
	"hucum": ["Yaban domuzu", "Muflon", "Dağ keçisi", "Yaban öküzü"], "pence": ["Mağara ayısı", "Porsuk"], "dalis": ["Kartal", "Kor yarasası"], "gomul": ["Timsah"],
	"yuvarlan": ["Dikenli kirpi", "Oklu kirpi", "Kül böceği"], "kuyruk": ["Lav kertenkelesi", "Kara ejder", "Kristal örümcek"], "igne": ["Ateş akrebi"]}
const KURT := ["Kurt", "Bataklık kurdu", "Kül kurdu", "Gölge kurdu", "Gök tazısı"]

func _imza_tur() -> String:
	if boss or ders or has_meta("reis") or has_meta("ders"): return ""
	for k in IMZA:
		if IMZA[k].has(tur): return k
	return ""

## sürü: sana en yakın kurt önünden oyalar, öbürleri öndekinin karşı tarafına (46 px + gövde) dolaşır
func _suru_yeri(P: Node2D) -> Vector2:
	if not KURT.has(tur): return Vector2.INF
	var on = null
	var bd := 1e9
	for c in oyun.canlilari_ver():
		if not KURT.has(c.tur) or c.olu >= 0.0 or not (c.mad or c.st == "chase"): continue
		var dd: float = c.position.distance_to(P.position)
		if dd < bd:
			bd = dd; on = c
	if on == null or on == self: return Vector2.INF
	var y: Vector2 = (P.position - on.position).normalized()
	return P.position + y * (46.0 + float(D.r))

func _imza_basla(P: Node2D, dv: Vector2, d: float) -> bool:
	var k := _imza_tur()
	if k == "" or k == "vurkac": return false
	# her hamle kendi mesafesinde başlar: yakın hamleler gövde+40 içinde, hücum/dalış/gömülme/yuvarlanma 130 px'e kadar
	var r0 := float(D.r)
	var men: float = 130.0 if ["hucum", "dalis", "gomul", "yuvarlan"].has(k) else (r0 + 50.0 if k == "igne" else r0 + 40.0)
	if d > men: return false
	var zor: bool = oyun.ada == 2 or oyun.bio_at(position) >= 3
	imza_t = (3.0 + randf() * 1.5) if zor else (4.0 + randf() * 2.0)
	var y := dv / d
	face = 1 if dv.x > 0 else -1
	match k:
		"tekme": imza = {tip = k, faz = 0, t = 0.45, renk = "y"}
		"hucum": imza = {tip = k, faz = 0, t = 0.5, renk = "r" if tur == "Yaban öküzü" else "y", y = y}
		"pence": imza = {tip = k, faz = 0, t = 0.6, renk = "y", y = y}
		"dalis": imza = {tip = k, faz = 0, t = 0.5, renk = "r", p = P.position}
		"gomul": imza = {tip = k, faz = 0, t = 1.2, renk = "r"}
		"yuvarlan": imza = {tip = k, faz = 0, t = 0.4, renk = "y", y = y}
		"kuyruk": imza = {tip = k, faz = 0, t = 0.55, renk = "y"}
		"igne": imza = {tip = k, faz = 0, t = 0.5, renk = "r", y = y}
	oyun.yazi(position + Vector2(0, -float(D.r) - 14.0), "!", RENK.get(imza.renk, Color.WHITE), 14)
	return true

func _vur_oyuncu(P: Node2D, m: float, rk: String, it: float = 0.0, fx = null) -> void:
	if oyun.insa.arada(position, P.position): return
	P.isirildi(int(round(float(D.dmg) * m)), position, self, rk)
	if it > 0.0 and P.dokunulmaz > 0.5: P._kay((P.position - position).normalized() * it)
	if fx != null and P.dokunulmaz > 0.5: P.etki_ekle(str(fx[0]), float(fx[1]), float(fx[2]))

func _imza_isle(dt: float, P: Node2D) -> bool:
	var I: Dictionary = imza
	I.t -= dt
	var dv: Vector2 = P.position - position
	var d := maxf(1.0, dv.length())
	var r := float(D.r)
	var hareket := false
	wind = 0.1 if int(I.get("faz", 1)) == 0 else 0.0
	match str(I.tip):
		"geri":
			_git(I.v, dt); hareket = true
			if I.t <= 0.0: imza = {}
		"tekme":
			if I.faz == 0 and I.t <= 0.0:
				if d <= r + 30.0: _vur_oyuncu(P, 1.1, "y", 30.0)
				I.faz = 1; I.t = 0.25; I.v = -dv / d * 200.0
			elif I.faz == 1:
				_git(I.v, dt); hareket = true
				if I.t <= 0.0: imza = {}
		"hucum":
			if I.faz == 0:
				_git(-I.y * 30.0, dt); hareket = true
				if randf() < dt * 20.0: oyun.parca(position + Vector2(randf_range(-4, 4), 0), Vector2(randf_range(-20, 20), -10), 0.3, Color("#b8a888"))
				if I.t <= 0.0: I.faz = 1; I.t = 1.0; I.y = dv / d
			else:
				_git(I.y * float(D.spd) * 2.4, dt); hareket = true
				if not I.get("vurdu", false) and d < r + 10.0:
					I.vurdu = true; _vur_oyuncu(P, 1.3, str(I.renk), 60.0)
				if I.t <= 0.0: imza = {}
		"pence":
			if I.faz == 0 and I.t <= 0.0:
				if d <= r + 34.0 and dv.normalized().dot(I.y) > 0.2: _vur_oyuncu(P, 1.0, "y")
				I.faz = 1; I.t = 0.4
				oyun.yazi(position + Vector2(0, -r - 14.0), "!", RENK["r"], 14)
			elif I.faz == 1 and I.t <= 0.0:
				if d <= r + 34.0 and dv.normalized().dot(I.y) > 0.2: _vur_oyuncu(P, 1.4, "r")
				imza = {}
		"dalis":
			if I.faz == 0 and I.t <= 0.0: I.faz = 1; I.t = 0.3
			elif I.faz == 1:
				position = position.lerp(I.p, minf(1.0, dt * 8.0)); hareket = true
				if I.t <= 0.0:
					if P.position.distance_to(I.p) <= 24.0: _vur_oyuncu(P, 1.5, "r")
					for k in 10: oyun.parca(I.p + Vector2(randf_range(-20, 20), 0), Vector2(randf_range(-30, 30), -20), 0.3, Color("#c8b898"))
					I.faz = 2; I.t = 0.4; I.v = -dv / d * 160.0
			else:
				_git(I.v, dt); hareket = true
				if I.t <= 0.0: imza = {}
		"gomul":
			modulate.a = 0.3 if I.faz == 0 else 1.0
			if I.faz == 0:
				_git(dv / d * float(D.spd) * 1.4, dt); hareket = true
				if I.t <= 0.0 or d < 20.0:
					I.faz = 1; I.t = 0.3; I.p = P.position
			elif I.t <= 0.0:
				if P.position.distance_to(I.p) <= r + 18.0: _vur_oyuncu(P, 1.5, "r")
				modulate.a = 1.0
				imza = {}
		"yuvarlan":
			if I.faz == 0 and I.t <= 0.0: I.faz = 1; I.t = 0.7; I.y = dv / d
			elif I.faz == 1:
				_git(I.y * float(D.spd) * 2.6, dt); hareket = true
				if not I.get("vurdu", false) and d < r + 10.0:
					I.vurdu = true; _vur_oyuncu(P, 1.2, "y", 0.0, ["kanama", 2.0, 4.0])
				if I.t <= 0.0: imza = {}
		"kuyruk":
			if I.t <= 0.0:
				if d <= r + 30.0: _vur_oyuncu(P, 1.2, "y")
				for k in 16:
					var a := k / 16.0 * TAU
					oyun.parca(position + Vector2(cos(a) * (r + 30.0), sin(a) * (r + 30.0) * 0.5), Vector2.ZERO, 0.25, Color("#ffd23a"))
				imza = {}
		"igne":
			if I.t <= 0.0:
				var q: Vector2 = P.position - position
				var tt := q.dot(I.y)
				if tt > -4.0 and tt < r + 50.0 and absf(q.cross(I.y)) < 10.0: _vur_oyuncu(P, 1.4, "r", 0.0, D.get("fx", ["zehir", 3.0, 5.0]))
				imza = {}
	if imza.is_empty(): wind = 0.0; modulate.a = 1.0
	queue_redraw()
	return hareket

## imza hamlesinin uyarısı: halka ya da çizgi (rengi hamlenin rengi)
func _imza_ciz() -> void:
	if imza.is_empty() or olu >= 0.0: return
	var c: Color = RENK.get(str(imza.get("renk", "y")), Color.WHITE)
	var r := float(D.r)
	match str(imza.tip):
		"tekme", "kuyruk":
			if int(imza.faz) == 0: draw_arc(Vector2.ZERO, (r + 30.0) / scale.x, 0, TAU, 28, Color(c.r, c.g, c.b, 0.6), 1.5)
		"dalis", "gomul":
			if imza.has("p"):
				var p: Vector2 = (imza.p - position) / scale.x
				draw_arc(p, 24.0, 0, TAU, 24, Color(1, 0.2, 0.15, 0.8), 2.0)
			elif str(imza.tip) == "dalis":
				var P: Vector2 = (oyun.oyuncu.position - position) / scale.x
				draw_arc(P, 24.0, 0, TAU, 24, Color(1, 0.2, 0.15, 0.5), 1.5)
		"hucum", "igne", "yuvarlan":
			if int(imza.faz) == 0 and imza.has("y"):
				draw_line(Vector2.ZERO, imza.y * 80.0, Color(c.r, c.g, c.b, 0.5), 2.0)

# ------------------------------------------------------------------ hayvanların tutumu
const VARIS := [1, 10, 18, 21, 34, 42]
const AVLAR := {"Kurt": ["Tavşan", "Keklik", "Bıldırcın", "Sincap"], "Bataklık kurdu": ["Ördek"], "Timsah": ["Ördek"], "Vaşak": ["Ur kekliği"], "Kartal": ["Ur kekliği"], "Gölge kurdu": ["Mor güve"]}

## Reisler, boss'lar, Yıldızsızlar, ders/öğretici canavarları, yan görev canavarları ve evciller bu davranışların dışında
func _tutum_var() -> bool:
	return not (boss or ders or ogr or tur_k == "ys" or has_meta("reis") or has_meta("ys") or has_meta("ders") or has_meta("sq") or has_meta("evcil"))

func _iri() -> bool:
	var k := tur.to_lower()
	return ["Timsah", "Yaban öküzü", "Mağara ayısı"].has(tur) or k.contains("ejder") or k.contains("golem") or float(D.r) >= 10.0

## ACT 1'de sen biyomun varış seviyesinden 15 yüksekken saldırgan sana kendiliğinden saldırmaz; vurursan 20 sn normal dövüşür
func _cekiniyor() -> bool:
	if oyun.ada != 1 or D.temper != "saldırgan": return false
	if Time.get_ticks_msec() / 1000.0 - son_vur < 20.0: return false
	var b: int = oyun.bio_at(position)
	if b < 0 or b >= VARIS.size(): return false
	return int(oyun.env.sv) >= int(VARIS[b]) + 15

func _suru_fark() -> void:
	if D.get("pack", null) == null: return
	for c in oyun.canlilari_ver():
		if c != self and c.tur == tur and c.olu < 0.0 and not c.mad and c.position.distance_to(position) < 160.0:
			c.mad = true; c.fark = -1.0

func _birak_av() -> void:
	if av != null and is_instance_valid(av) and av.avci == self: av.avci = null
	av = null

## ACT 1'de yırtıcı, seni kovalamıyorken 160 px içindeki küçük hayvanı avlar; yakalarsa leşin başında 6 sn yer
func _avlan(dt: float) -> bool:
	if oyun.ada != 1 or not AVLAR.has(tur): return false
	if yeme_t > 0.0:
		yeme_t -= dt
		st = "wander"
		_gorun(false)
		return true
	if av != null and (not is_instance_valid(av) or av.olu >= 0.0): av = null
	if av == null:
		av_ara -= dt
		if av_ara > 0.0: return false
		av_ara = 1.0
		var L: Array = AVLAR[tur]
		var bd := 160.0
		for c in oyun.canlilari_ver():
			if L.has(c.tur) and c.olu < 0.0 and c.avci == null:
				var dd: float = c.position.distance_to(position)
				if dd < bd: bd = dd; av = c
		if av == null: return false
		av.avci = self
		av_t = 8.0
	av_t -= dt
	if av_t <= 0.0:
		_birak_av()
		return false
	st = "chase"
	var v: Vector2 = av.position - position
	var cs: float = float(D.cs) if D.cs != null else float(D.spd)
	_git(v.normalized() * cs, dt)
	face = 1 if v.x > 0 else -1
	if v.length() < float(D.r) + float(av.D.r) + 4.0:
		av.av_ol()
		av = null
		yeme_t = 6.0
	_gorun(true)
	return true

## av yakalandı: eti avcı yemiştir, deri/tüy/yumurta leşin içinde kalır (XP yok, av sayısına ve Reis sayacına girmez)
func av_ol() -> void:
	if olu >= 0.0: return
	hp = 0.0
	olu = 0.0
	avci = null
	for k in 8:
		oyun.parca(position + Vector2(0, -4), Vector2(randf_range(-25, 25), -15 - randf() * 30), 0.6, Color("#c84a3a"))
	for dr in D.get("drops", []):
		if str(dr.n).ends_with(" eti"): continue
		if randf() < float(dr.p):
			oyun.toplama.dusur(str(dr.n), position, randi_range(int(dr.min), int(dr.max)))

## silahın ya da okun etkisi (belge Aletler › Alevli, zehirli, keskin silahlar): taban = silahın tablo hasarı (okta yay × ok)
const ETKI_C := {"yanık": [3.0, 0.2, "#ffa040"], "zehir": [6.0, 0.1, "#9ad84a"], "kanama": [4.0, 0.15, "#ff5a4a"]}
func etki_ver(k: String, taban: float) -> void:
	if ders or olu >= 0.0 or not ETKI_C.has(k) or has_meta("evcil"): return
	var fx = D.get("fx", null)
	if k == "yanık" and ((fx != null and str(fx[0]) == "yanık") or tur.contains("ejder") or tur.begins_with("Kor ") or tur.begins_with("Lav ") or tur.begins_with("Kül ")): return
	if k == "zehir" and fx != null and str(fx[0]) == "zehir": return
	if k == "kanama":
		var t2 := tur.to_lower()
		for w in ["golem", "robot", "dron", "taş kaplumbağası", "hurda", "kristal", "muhafız", "bekçi"]:
			if t2.contains(w): return
	var C: Array = ETKI_C[k]
	var e: Dictionary = etkiler.get(k, {kat = 0, n = 1.0})
	e.kat = mini(3, int(e.kat) + 1) if k == "zehir" else 1
	e.t = float(C[0]) * (0.5 if boss else 1.0)
	e.dps = taban * float(C[1]) * int(e.kat)
	etkiler[k] = e

func _etki_isle(dt: float) -> void:
	for k in etkiler.keys():
		var e: Dictionary = etkiler[k]
		e.t -= dt; e.n -= dt
		if randf() < dt * 6.0: oyun.parca(position + Vector2(randf_range(-5, 5), -6 - randf() * 8), Vector2(0, -14), 0.4, Color(ETKI_C[k][2]))
		if e.n <= 0.0:
			e.n = 1.0
			var d := maxi(1, int(round(float(e.dps))))
			hp -= d
			oyun.yazi(position + Vector2(0, -16), "-%d" % d, Color(ETKI_C[k][2]), 9)
			if hp <= 0.0:
				hp = 1.0
				etkiler = {}
				vuruldu(1, Vector2.ZERO)
				return
		if e.t <= 0.0: etkiler.erase(k)

func vuruldu(dm: int, yon: Vector2) -> void:
	if olu >= 0.0:
		return
	if ders:
		flash = 0.15
		return
	hp -= dm
	flash = 0.15
	mad = true
	fark = -1.0; uyari = -1.0
	son_vur = Time.get_ticks_msec() / 1000.0
	_birak_av()
	if kac_sans == -1 and hp > 0.0 and hp < float(D.hp) * 0.2 and _tutum_var():
		kac_sans = 1 if (randf() < 0.6 and not _iri()) else 0
		if kac_sans == 1:
			kac_sans = 2; kacis = 4.0; kacis_g = 0.0; lunge = {}; wind = 0.0; imza = {}
	kb = {v = yon * 140.0, t = 0.12}
	lunge = {}
	oyun.yazi(position + Vector2(0, -12), "-%d" % dm, Color.WHITE, 9)
	if hp <= 0.0:
		hp = 0.0
		olu = 0.0
		for k in 14:
			oyun.parca(position + Vector2(0, -4), Vector2(randf_range(-30, 30), -20 - randf() * 40), 0.6, Color("#c84a3a") if k % 2 else Color("#e8e0c8"))
		oyun.yazi(position + Vector2(0, -26), tur + " avlandı", Color("#fff2b0"), 9)
		# web killAnimal: düşenler ve XP
		var tilt: float = 0.1 if (oyun.kesif != null and oyun.kesif.usta("Av ve hayvan")) else 0.0
		for dr in D.get("drops", []):
			if randf() < float(dr.p) + (tilt if float(dr.p) < 1.0 else 0.0):
				oyun.toplama.dusur(str(dr.n), position, randi_range(int(dr.min), int(dr.max)))
		if int(D.get("xp", 0)) > 0:
			oyun.env.xp_ekle(int(D.xp))
		oyun.canli_oldu(tur, self)
