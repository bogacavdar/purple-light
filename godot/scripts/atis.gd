## Canlıların attığı dikenler ve tükürükler (web fireShot, tickShots, drawShots). Oyuncunun durduğu yere uçar; değerse hasar ve etki.
## Atılırken değmez; savuşturma penceresinde geri çevrilir (web v110), gard yumuşatır.
extends Node2D

var oyun
var liste: Array = []

func at(a) -> void:
	var D: Dictionary = a.D
	var R: Dictionary = D.ranged
	var n := int(R.get("n", 1))
	for i in n:
		var ang := atan2(a.hedef.y - (a.position.y - 6.0), a.hedef.x - a.position.x) + (i - (n - 1) / 2.0) * 0.22
		liste.append({p = a.position + Vector2(0, -6), v = Vector2(cos(ang), sin(ang)) * float(R.spd), l = float(R.range) / float(R.spd) + 0.35, c = Color(str(R.c)), dmg = int(D.dmg), fx = D.get("fx", null), k = a.tur})

func _process(dt: float) -> void:
	if oyun.ev.acik: return
	var P = oyun.oyuncu
	for i in range(liste.size() - 1, -1, -1):
		var s = liste[i]
		s.l -= dt
		s.p += s.v * dt
		if randf() < dt * 20.0: oyun.parca(s.p, Vector2(0, -6), 0.25, s.c)
		var d: float = (P.position + Vector2(0, -8)).distance_to(s.p)
		if P.pr_t > 0.0 and P.atilma <= 0.0 and P.dokunulmaz <= 0.0 and d < 13.0:
			liste.remove_at(i)
			P.savusturdu(null)
			continue
		if P.atilma <= 0.0 and P.dokunulmaz <= 0.0 and not P.bayildi and d < 7.0:
			liste.remove_at(i)
			P.isirildi(s.dmg, s.p, null, "n", 0.35)
			if s.fx != null and P.hp > 0.0: P.etki_ekle(str(s.fx[0]), float(s.fx[1]), float(s.fx[2]))
			continue
		if s.l <= 0.0: liste.remove_at(i)
	queue_redraw()

func _draw() -> void:
	for s in liste:
		var x := roundf(s.p.x); var y := roundf(s.p.y)
		draw_rect(Rect2(x - 1, y + 8, 3, 1), Color(0, 0, 0, 0.2))
		draw_rect(Rect2(x - 2, y - 2, 4, 4), s.c)
		draw_rect(Rect2(x - 1, y - 1, 1, 1), Color.WHITE)
