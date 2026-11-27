extends Node
## Eylem ipucu (web updatePrompt + v405prompt; belge Sistemler › Arayüz › Eylem ipucu): F'ye basınca ne olacağını kemerin hemen
## üstünde tek satırla söyler (topla, kaz, kes, silkele, konuş, kazana/örse bak, ateşte pişir, halata asıl, mağaraya gir, balık tut…).
## Yapılamıyorsa (kazma yetmez, balta yok) sarı uyarı olarak yazar. Yakında saldırgan varsa Q: vur · hasarı. Pencere açıkken gizlenir.

var oyun
var yazi: Label
var _t := 0.0

func kur(o) -> void:
	oyun = o
	yazi = Label.new()
	yazi.add_theme_font_size_override("font_size", 13)
	yazi.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	yazi.set_anchors_preset(Control.PRESET_TOP_LEFT)
	yazi.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.05, 0.06, 0.05, 0.72)
	sb.set_corner_radius_all(4)
	sb.content_margin_left = 8; sb.content_margin_right = 8; sb.content_margin_top = 2; sb.content_margin_bottom = 2
	yazi.add_theme_stylebox_override("normal", sb)
	yazi.visible = false
	oyun.hud.add_child(yazi)

func _k(a: String) -> String:
	return Ayarlar.tus_adi(a).split(",")[0]

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null: return
	_t -= dt
	if _t > 0.0: return
	_t = 0.12
	var r := _hesapla()
	var txt: String = r[0]
	yazi.visible = txt != "" and not oyun.pencere_acik() and not oyun.konusma.visible and not oyun.sahne.acik and not oyun.oyuncu.bayildi and not oyun.basta
	if not yazi.visible: return
	if yazi.text != txt:
		yazi.text = txt
		yazi.reset_size()
	yazi.add_theme_color_override("font_color", Color("#ffd27a") if r[1] else Color("#f4f0e0"))
	# kemerin hemen üstünde
	yazi.reset_size()
	var V: Vector2 = yazi.get_viewport_rect().size
	var ust := V.y - 62.0
	if oyun.env.kemer_kutu != null and oyun.env.kemer_kutu.visible: ust = oyun.env.kemer_kutu.get_global_rect().position.y
	yazi.position = Vector2((V.x - yazi.size.x) / 2.0, ust - yazi.size.y - 8.0)

func _hesapla() -> Array:
	var F := _k("topla")
	var o = oyun.oyuncu
	var p: Vector2 = o.position
	var T = oyun.toplama
	var env = oyun.env
	if oyun.balik.aktif(): return ["%s · Oltayı çek" % F, false]
	for d in T.dusenler:
		if d.node.position.distance_to(p + Vector2(0, -2)) < float(T.G.pickR): return ["%s · Al: %s" % [F, d.n], false]
	# mağara, halat, ateş, köprü
	var M = oyun.magara
	if not M.kapali and not M.icinde:
		for C in M.MAGS:
			if p.distance_to(Vector2(C.M.kapi.x, float(C.M.kapi.y) + 14.0)) < 40.0: return ["%s · %s" % [F, str(C.M.get("ad", "Mağara"))], false]
	if M.icinde and M.cikis != null and p.distance_to(M.cikis.position) < 56.0: return ["%s · Mağaradan çık" % F, false]
	var h: String = env.elde()
	var tur: String = env.elde_tur()
	# balta: ağaç
	if tur == "axe":
		var ag = T._en_yakin_agac(22.0)
		if ag != null:
			var A: Dictionary = T.G.trees[ag.tur]
			if A.noCut: return ["%s · %s ağacını silkele" % [F, ag.tur], false]
			if int(T.G.tools[h].tier) < int(A.tier): return ["%s ağacı · daha iyi bir balta gerekli (%d. kademe)" % [ag.tur, int(A.tier)], true]
			return ["%s · %s ağacını kes · %s" % [F, ag.tur, h], false]
	# düğüm
	var en = null
	var bd: float = float(T.G.reach) * (1.5 if oyun.sk("H4") else 1.0)
	var maden_uyari := ""
	for d in oyun.dugumler:
		if not d.canli: continue
		var A: Dictionary = T.G.nodes.get(d.ad, {})
		var mine: bool = A.get("mine", false)
		var dist: float = d.position.distance_to(p) - (13.0 if mine else 0.0)
		if mine and tur != "pick":
			if dist < bd and maden_uyari == "": maden_uyari = "%s · kazmak için elinde kazma olmalı" % A.get("ad", d.ad)
			continue
		if dist < bd:
			bd = dist
			en = d
	if en != null:
		var A2: Dictionary = T.G.nodes[en.ad]
		if A2.get("mine", false):
			if int(T.G.tools[h].tier) < int(A2.tier): return ["%s · %s yetmez, daha iyi bir kazma gerekli" % [A2.ad, h], true]
			return ["%s · %s kaz · %s" % [F, A2.ad, h], false]
		return ["%s · %s topla" % [F, en.ad], false]
	var ag2 = T._en_yakin_agac(22.0)
	if ag2 != null and T.G.trees[ag2.tur].fruit != null and (T.G.trees[ag2.tur].noCut or tur != "axe"):
		if ag2.meyve_cd > 0.0: return ["%s ağacı · meyveler olgunlaşıyor" % ag2.tur, true]
		return ["%s · %s ağacını silkele · %s" % [F, ag2.tur, T.G.trees[ag2.tur].fruit], false]
	# balık
	if tur == "fish" and h != "Balık kapanı" and oyun.balik.su_onde() != null: return ["%s · Balık tut · %s" % [F, h], false]
	# kişiler ve istasyonlar
	var yakin = null
	for n in oyun.kisiler:
		if n.visible and p.distance_to(n.position) < 30.0 and (yakin == null or p.distance_to(n.position) < p.distance_to(yakin.position)): yakin = n
	var I: Dictionary = oyun.toplama_veri.istasyon
	if yakin != null: return ["%s · %s ile konuş" % [F, yakin.K.ad], false]
	if p.distance_to(Vector2(I.kazan.x, I.kazan.y)) < 26.0: return ["%s · Kazana bak" % F, false]
	if p.distance_to(Vector2(I.ors.x, I.ors.y)) < 20.0 or p.distance_to(Vector2(I.ors2.x, I.ors2.y)) < 18.0: return ["%s · Örse bak" % F, false]
	if oyun.kamp != null:
		for c in oyun.kamp.camps:
			if c.t > 0.0 and p.distance_to(c.p) < 22.0: return ["%s · Kamp ateşi · odun at ya da pişir" % F, false]
		for Fa in oyun.kamp.kisi_ates:
			if p.distance_to(Fa.p) < 18.0 and (not oyun.kamp._cig().is_empty() or not oyun.kamp._ates_tarifleri().is_empty()): return ["%s · Ateşte pişir" % F, false]
	if oyun.halat != null:
		for i in 3:
			if not oyun.halat.kurulu(i): continue
			for k in 2:
				if p.distance_to(oyun.halat._uc(i, k) + Vector2(0, 4)) < 24.0: return ["%s · Halata asıl · %s" % [F, oyun.halat.V.ad[i]], false]
	var b = oyun.kopru.yakin() if not oyun.kopru.kapali else null
	if b != null: return ["Kırık köprü", true]
	var ev: String = oyun.evcil.ipucu()
	if ev != "": return [ev.replace("F ·", F + " ·"), false]
	if maden_uyari != "": return [maden_uyari, true]
	if ag2 != null and tur != "axe": return ["%s ağacı · kesmek için elinde balta olmalı" % ag2.tur, true]
	# yakındaki canavar
	var w = o.silah_v()
	var yk = null
	var yd := 40.0
	for a in oyun.canlilari_ver():
		if a.olu >= 0.0 or a.has_meta("evcil"): continue
		var dd: float = a.position.distance_to(p)
		if dd < yd:
			yd = dd
			yk = a
	if yk != null:
		var tm := str(yk.D.get("temper", ""))
		return ["%s · vur · %s (%s) · %s %d hasar" % [_k("vur"), yk.tur, tm, str(w.get("n", "yumruk")) if w.get("n", "") != "" else ("meşale" if w.get("torch", false) else "yumruk"), int(round(float(w.dmg) * oyun.stat("dmg")))], tm == "saldırgan"]
	return ["", false]
