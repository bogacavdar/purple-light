extends Node
## Sesler ve müzik (web audio: sesler oyunun kendi sentezinden, tools/disa_aktar_ses.js ile art/ses/'e döküldü; belge Sistemler › Ses).
## Müzik bölgeye göre (Çayır ada, Orman orman, Bataklık sis, Kayalık Dağ dağ, Kül Diyarı derinlik, Mor Kristal kristal; gece yurtta gece),
## geçişte yumuşakça değişir. Ortam döngüleri: Bataklık'ta kurbağa ve böcek, Kül Diyarı'nda kül, denize yakınken çok hafif dalga.
## Efektler: toplama, yeni şey, yapma, olmaz, seviye, Vio, büyü, savurma, isabet, acı, köpek, örs, gemi kornası, gıcırtı, sıçrama…

var oyun
var tampon := {}
var havuz: Array = []
var muz_a: AudioStreamPlayer
var muz_b: AudioStreamPlayer
var muz_ad := ""
var amb := {}            # ad → AudioStreamPlayer
var amb_t := 0.0
var son := {}            # ad → son çalış (sık tekrarı kes)
const BMUS := ["ada", "orman", "sis", "dag", "derinlik", "kristal"]
const AMB_SES := {"swamp": 0.55, "ash": 0.6, "surf": 0.12}
const ARA := {"pick": 0.06, "coin": 0.08, "hit": 0.05, "swing": 0.06, "bad": 0.25, "growl": 0.8, "ouch": 0.12, "found": 0.2}

func kur(o) -> void:
	oyun = o
	process_mode = Node.PROCESS_MODE_ALWAYS
	var d := DirAccess.open("res://art/ses")
	if d != null:
		for f in d.get_files():
			var f2 := f.replace(".import", "")
			if not (f2.ends_with(".wav") or f2.ends_with(".ogg")): continue
			var k := f2.get_basename()
			if tampon.has(k): continue
			var s = load("res://art/ses/" + f2)
			if s != null: tampon[k] = s
	for i in 10:
		var p := AudioStreamPlayer.new()
		p.bus = "Efekt"
		add_child(p)
		havuz.append(p)
	muz_a = AudioStreamPlayer.new(); muz_a.bus = "Muzik"; add_child(muz_a)
	muz_b = AudioStreamPlayer.new(); muz_b.bus = "Muzik"; add_child(muz_b)
	for k in AMB_SES:
		var a := AudioStreamPlayer.new()
		a.bus = "Efekt"
		a.volume_db = -80.0
		if tampon.has(k):
			var st = tampon[k].duplicate()
			if st is AudioStreamOggVorbis: st.loop = true
			elif st is AudioStreamWAV: st.loop_mode = AudioStreamWAV.LOOP_FORWARD; st.loop_end = st.data.size() / 2
			a.stream = st
		add_child(a)
		amb[k] = a

## kısa bir efekt (aynı ses çok sık çalınmaz)
func cal(k: String, vol := 1.0, perde := 1.0) -> void:
	if not tampon.has(k): return
	var t := Time.get_ticks_msec() / 1000.0
	if t - float(son.get(k, -10.0)) < float(ARA.get(k, 0.03)): return
	son[k] = t
	for p in havuz:
		if not p.playing:
			p.stream = tampon[k]
			p.volume_db = linear_to_db(maxf(0.001, vol))
			p.pitch_scale = perde
			p.play()
			return

func _muzik_sec() -> String:
	if oyun.basta: return "ada"
	if oyun.magara != null and oyun.magara.icinde: return "derinlik"
	var b: int = maxi(0, oyun.bio_at(oyun.oyuncu.position))
	if b <= 1 and oyun.zaman.gece_mi(): return "gece"
	return BMUS[b] if b < BMUS.size() else "ada"

func _process(dt: float) -> void:
	if oyun == null or oyun.oyuncu == null or oyun.zaman == null: return
	# müzik: bölgeye göre, 3 sn'de yumuşak geçiş
	var m := _muzik_sec()
	if m != muz_ad and tampon.has("mz_" + m):
		muz_ad = m
		var yeni := muz_b if muz_a.playing else muz_a
		var eski := muz_a if yeni == muz_b else muz_b
		var st = tampon["mz_" + m].duplicate()
		if st is AudioStreamOggVorbis: st.loop = true
		yeni.stream = st
		yeni.volume_db = -40.0
		yeni.play()
		var tw := create_tween()
		tw.set_parallel(true)
		tw.tween_property(yeni, "volume_db", 0.0, 3.0)
		tw.tween_property(eski, "volume_db", -60.0, 3.0)
		tw.chain().tween_callback(func(): eski.stop())
	# ortam döngüleri
	amb_t -= dt
	if amb_t > 0.0: return
	amb_t = 0.5
	var acik: bool = not oyun.basta and not oyun.cine.acik and not get_tree().paused and not (oyun.magara != null and oyun.magara.icinde)
	var b2: int = oyun.bio_at(oyun.oyuncu.position)
	var istek := {"swamp": acik and b2 == 2 and oyun.ada == 1, "ash": acik and b2 == 4 and oyun.ada == 1, "surf": acik and _deniz_yakin()}
	for k in amb:
		var a: AudioStreamPlayer = amb[k]
		if a.stream == null: continue
		var hedef: float = linear_to_db(float(AMB_SES[k])) if istek[k] else -80.0
		if istek[k] and not a.playing: a.play()
		a.volume_db = lerpf(a.volume_db, hedef, 0.4)
		if not istek[k] and a.volume_db < -60.0 and a.playing: a.stop()
	# bataklıkta ve külde müzik kısılır
	var ml := 0.45 if (acik and b2 == 4) else (0.7 if (acik and b2 == 2) else 1.0)
	var mi := AudioServer.get_bus_index("Muzik")
	if mi >= 0:
		var taban := linear_to_db(maxf(0.0001, Ayarlar.muzik / 100.0))
		AudioServer.set_bus_volume_db(mi, lerpf(AudioServer.get_bus_volume_db(mi), taban + linear_to_db(ml), 0.2))

func _deniz_yakin() -> bool:
	var P: Vector2 = oyun.oyuncu.position
	for dy in range(-6, 7, 2):
		for dx in range(-6, 7, 2):
			if oyun.tile_at(P + Vector2(dx * 16, dy * 16)) >= 4: return true
	return false
