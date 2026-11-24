## F ile toplama, ağaç kesme, meyve silkeleme, taş kırma ve yere düşen eşyalar (web: interact, gatherTarget, tickGather, dropItem, ePick).
## Sıra (Boğaç, "F önce yerdeki eşya"): F'ye basınca önce ayağının dibindeki (28 px) düşmüş eşyalar alınır; yoksa toplanacak şey aranır.
extends Node2D

var oyun
var env
var G: Dictionary
var is_ := {}          # süren iş: {tur, hedef, ad, sure, t, alet}
var dusenler: Array = []

func _process(dt: float) -> void:
	var o = oyun.oyuncu
	if o.bayildi:
		_dur()
		return
	if Input.is_action_just_pressed("topla") and not oyun.sahne.acik and not oyun.konusma.visible and not oyun.istasyon.pencere.visible:
		if not _yerdekileri_al() and not oyun.magara.etkiles():
			_basla()
	if not is_.is_empty():
		if o.yuruyor or (is_.tur == "dugum" and not is_.hedef.canli):
			_dur()
		else:
			is_.t += dt
			env.ilerleme_goster(is_.ad, is_.t / is_.sure)
			if is_.t >= is_.sure:
				_bitir()
	# yere düşenler: önce süzülerek yere iner, sonra üstünden yürüyünce alınır; 180 sn sonra kaybolur
	for d in dusenler.duplicate():
		d.yas += dt
		if d.yas > float(G.dropLife):
			_dusen_sil(d)
			continue
		if d.t < 1.0:
			d.t = minf(1.0, d.t + dt / 0.42)
			var k: float = d.t
			d.node.position = d.bas.lerp(d.hedef, k) + Vector2(0, -sin(k * PI) * 10.0)
		elif d.yas > 0.6 and d.node.position.distance_to(o.position + Vector2(0, -2)) < 10.0:
			_al(d)
		else:
			d.node.position.y = d.hedef.y + sin(d.yas * 3.0 + d.ph) * 0.6

func _dur() -> void:
	is_ = {}
	env.ilerleme_goster("", -1.0)

func _yerdekileri_al() -> bool:
	var o = oyun.oyuncu
	var any := false
	for d in dusenler.duplicate():
		if d.node.position.distance_to(o.position + Vector2(0, -2)) < float(G.pickR):
			_al(d)
			any = true
	return any

func _al(d) -> void:
	env.ekle(d.n)
	oyun.yazi(d.node.position + Vector2(0, -8), "+1 " + d.n, Color("#fff2b0"), 7)
	for k in 5:
		oyun.parca(d.node.position + Vector2(0, -3), Vector2(randf_range(-15, 15), -20 - randf() * 20), 0.35, Color("#fff2b0"))
	_dusen_sil(d)

func _dusen_sil(d) -> void:
	dusenler.erase(d)
	d.node.queue_free()

## web dropItem: eşya oyuncudan uzağa doğru 12–21 px fırlar
func dusur(n: String, p: Vector2, q: int = 1) -> void:
	var o = oyun.oyuncu
	for i in q:
		var uzak := atan2(p.y - o.position.y, p.x - o.position.x)
		var a := uzak + randf_range(-1.2, 1.2)
		var dd := 12.0 + randf() * 9.0
		var s := Sprite2D.new()
		s.texture = env.ikon_al(n)
		s.scale = Vector2(0.75, 0.75) if s.texture and s.texture.get_width() >= 16 else Vector2.ONE
		s.offset = Vector2(0, -6)
		s.position = p
		oyun.nesneler.add_child(s)
		dusenler.append({n = n, node = s, bas = p, hedef = p + Vector2(cos(a) * dd, 4 + sin(a) * dd * 0.8), t = 0.0, yas = 0.0, ph = randf() * 6.0})

# ------------------------------------------------------------------ ne toplanacak
func _basla() -> void:
	var o = oyun.oyuncu
	var h: String = env.elde()
	var tur: String = env.elde_tur()
	# elde balta varsa en yakın ağaç (22 px); meyve ağacı kesilmez, silkelenir
	if tur == "axe":
		var ag = _en_yakin_agac(22.0)
		if ag != null:
			var A: Dictionary = G.trees[ag.tur]
			if A.noCut:
				_silkele(ag)
				return
			if int(G.tools[h].tier) < int(A.tier):
				env.mesaj("%s ağacı için daha iyi bir balta gerekli (%d. kademe)" % [ag.tur, int(A.tier)], true)
				return
			is_ = {tur = "agac", hedef = ag, ad = "Kesiliyor: %s ağacı" % ag.tur, sure = float(G.tools[h].time), t = 0.0, alet = h}
			return
	# en yakın düğüm (REACH 24 px; maden kayaları 13 px daha uzaktan): maden kayasına kazma, öbürlerine boş el ya da herhangi bir şey
	var en = null
	var bd: float = float(G.reach)
	for d in oyun.dugumler:
		if not d.canli:
			continue
		var A: Dictionary = G.nodes.get(d.ad, {})
		var mine: bool = A.get("mine", false)
		if mine and tur != "pick":
			continue
		var dist: float = d.position.distance_to(o.position) - (13.0 if mine else 0.0)
		if dist < bd:
			bd = dist
			en = d
	if en != null:
		var A: Dictionary = G.nodes[en.ad]
		if A.mine:
			if int(G.tools[h].tier) < int(A.tier):
				env.mesaj("%s: %s yetmez, daha iyi bir kazma gerekli" % [A.ad, h], true)
				return
			is_ = {tur = "dugum", hedef = en, ad = "Kazılıyor: " + en.ad, sure = float(G.tools[h].time) * 1.5, t = 0.0, alet = h}
		else:
			is_ = {tur = "dugum", hedef = en, ad = "Toplanıyor: " + en.ad, sure = float(A.time), t = 0.0, alet = ""}
		return
	# elinde balta yokken meyve ağacının dibinde: silkele
	var ag2 = _en_yakin_agac(22.0)
	if ag2 != null and G.trees[ag2.tur].fruit != null and (G.trees[ag2.tur].noCut or tur != "axe"):
		_silkele(ag2)
		return
	if oyun.konus_ya_da_istasyon():
		return
	if ag2 != null and tur != "axe":
		env.mesaj("Ağaç kesmek için elinde balta olmalı (1–5 ile seç)", true)

func _silkele(ag) -> void:
	var A: Dictionary = G.trees[ag.tur]
	if ag.meyve_cd > 0.0:
		env.mesaj("%s ağacında meyve kalmadı; %d dakika sonra yine olgunlaşır." % [ag.tur, ceili(ag.meyve_cd / 60.0)], true)
		return
	is_ = {tur = "silkele", hedef = ag, ad = "%s ağacı silkeleniyor" % ag.tur, sure = 1.4, t = 0.0, alet = ""}

func _en_yakin_agac(r: float):
	var o = oyun.oyuncu
	var en = null
	var bd := r
	for ag in oyun.agaclar:
		if not is_instance_valid(ag) or not ag.visible:
			continue
		var d: float = ag.position.distance_to(o.position)
		if d < bd:
			bd = d
			en = ag
	return en

func _bitir() -> void:
	var g := is_
	_dur()
	var o = oyun.oyuncu
	if g.alet != "" and not env.alet_kullan(g.alet):
		return
	if g.tur == "dugum":
		var d = g.hedef
		var A: Dictionary = G.nodes[d.ad]
		if A.mine:
			d.kalan -= 1
			if d.kalan <= 0:
				d.oldur(float(A.respawn))
				env.mesaj("%s tükendi; bir süre sonra yine çıkar." % A.ad)
			dusur(d.ad, d.position)
			if d.ad != "Taş" and randf() < 0.5:
				dusur("Taş", d.position)
		else:
			# böğürtlen çalısı üç kez toplanır, sonra dinlenir
			if A.bush:
				d.kalan -= 1
				if d.kalan <= 0:
					d.oldur(float(A.respawn))
			else:
				d.oldur(float(A.respawn))
			dusur(d.ad, d.position)
			if A.hurt != null:
				o.isirildi(int(A.hurt[0]), d.position)
				env.mesaj(str(A.hurt[1]), true)
		for k in 6:
			oyun.parca(d.position + Vector2(0, -4), Vector2(randf_range(-25, 25), -20 - randf() * 25), 0.45, Color("#d8c89a"))
	elif g.tur == "agac":
		var ag = g.hedef
		var A: Dictionary = G.trees[ag.tur]
		var p: Vector2 = ag.position + Vector2(-6 if o.position.x < ag.position.x else 6, 0)
		dusur(str(A.wood), p)
		for e in A.extra:
			dusur(str(e[0]), p, int(e[1]))
		dusur("Dal", p)
		if A.fruit != null:
			dusur(str(A.fruit), p, 1 + (1 if randf() < 0.5 else 0))
		ag.vurulma()
		ag.kesim += 1
		if ag.kesim >= int(G.treeChops):
			oyun.agac_devrildi(ag)
	elif g.tur == "silkele":
		var ag = g.hedef
		var A: Dictionary = G.trees[ag.tur]
		ag.meyve_cd = float(G.fruitRe)
		ag.vurulma()
		for i in 2 + randi() % 2:
			dusur(str(A.fruit), ag.position + Vector2(randf_range(-8, 8), -2))
