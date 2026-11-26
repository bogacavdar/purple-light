## ACT 2 adasının ustaları (web v76–v81). Şimdilik Gökbilimci Yıldız (Yüzen Kayalar): teleskobu, konuşması, kazanı (ACT 2'de tarifler
## onun yanındaki kazanda öğrenilir) ve son işinden sonra açılan portallar. Görevleri (gk1–gk3) gorev.gd'de, data/ada2/ustalar.json'dan.
extends Node

var oyun
var U: Dictionary = {}          # data/ada2/ustalar.json

func kur(o) -> void:
	oyun = o
	U = o._json("res://data/ada2/ustalar.json")

## ikinci adada kişi listesine girecek ustalar (şimdilik Yıldız)
func kisiler() -> Array:
	var out := []
	for k in U.kisiler:
		if k.k == "gok":
			var d: Dictionary = k.duplicate(true)
			d.rol = "gk"
			out.append(d)
	return out

func usta(k: String) -> Dictionary:
	for x in U.kisiler:
		if x.k == k: return x
	return {}

## Yıldız'ın teleskobu (web drawScope): kişinin sağında, göğe dönük
func teleskop_kur(n) -> void:
	var t := Node2D.new()
	t.position = n.position + Vector2(16, 0)
	t.draw.connect(func():
		t.draw_rect(Rect2(-1, -14, 2, 14), Color("#4a3a2a"))
		t.draw_rect(Rect2(-6, -1, 3, 2), Color("#4a3a2a"))
		t.draw_rect(Rect2(4, -1, 3, 2), Color("#4a3a2a"))
		t.draw_set_transform(Vector2(0, -15), -0.6, Vector2.ONE)
		t.draw_rect(Rect2(-3, -14, 6, 16), Color("#8a7a5a"))
		t.draw_rect(Rect2(-4, -16, 8, 3), Color("#c8a868"))
		t.draw_rect(Rect2(-2, -16, 4, 1), Color("#bfe8ff"))
		t.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE))
	oyun.nesneler.add_child(t)

func _soyle(n, metin: String, secs: Array) -> void:
	oyun.konusma.ac(n.K.ad, load(n.K.portre) if n.K.get("portre", null) != null else null, metin, secs)

## web talkGok
func yildiz(n) -> void:
	var K = oyun.kuzen
	if not K.tanis.has("gok"):
		K.tanis["gok"] = true
		_soyle(n, "[i](teleskobunun başında, gözünü ayırmadan)[/i] Bir gemi daha… ve içinden çıkan bir yolcu. Hoş geldin evlat, ben [b]Yıldız[/b]. Kırk yıldır gökyüzünü izlerim. Seni buraya getiren denizci değil, o mor ışık; bunu gözlerinden okuyorum. Otur biraz. Anlatacak çok şeyim var, ama önce yardımına ihtiyacım var.",
			[{t = "Mor ışık nedir?", f = func(): _soyle(n, "Bir yıldız değil, onu söyleyeyim. Yıldızlar titrer; o bakar. Gerisini, sen bana yardım ettikçe anlatırım.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])}, {t = "Hoşça kal", kapat = true}])
		return
	if oyun.gorev.bitti("gk3"):
		_soyle(n, "Portallar çalışıyor. Yıldızsız Ada'daki her dostunun yanında bir kapı var; buradaki iki kapı da seni oraya götürür. Gökyüzü sabırsızlanıyor evlat.", [{t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])
		return
	var L := ["Gökyüzü bu gece berrak. İyi işaret.", "Teleskop hiç yalan söylemez; gözler söyler.", "Bu kayalar havada durur, biliyor musun? Ben de nedenini kırk yıldır bilmiyorum."]
	_soyle(n, L[randi() % L.size()], [{t = "Kazana bak", f = func(): oyun.istasyon.ac("kazan")}, {t = "Hoşça kal", kapat = true}, {t = "Tamam", pri = true}])
