extends Node
## Köpek kamerası kayıtları (web v368kopek; belge ACT 3 › Köpek kamerası kayıtları): robot köpeklerin ACT 3 için tuttuğu gizli günlük.
## Oyunda hiç gösterilmez. Her kayıt en yeni 300 satırı (gün, saat, tür, yazı) ve her türün sayısını tutar:
## bayıl (sebep), basarim, reis, mağara boss'u (reis), ani, tanri. Arenada ve ana menüde yazılmaz. Kayıt alanı `dlog {e, c}`.

var oyun
var E: Array = []
var C := {}
var _base := true
var _reis := {}
var _ani := {}
var _mb := {}
var _tanri := false
var _t := 2.0

func kur(o) -> void:
	oyun = o

func _canli() -> bool:
	return oyun != null and not oyun.basta and oyun.arena == null and not oyun.uyanis.acik

func ekle(k: String, x: String) -> void:
	if not _canli(): return
	C[k] = int(C.get(k, 0)) + 1
	var m: int = int(oyun.zaman.dk)
	E.append([oyun.zaman.gun, "%02d:%02d" % [(m / 60) % 24, m % 60], k, x.substr(0, 80)])
	if E.size() > 300: E = E.slice(E.size() - 300)

## yeni başarı, yenilen reis ve mağara boss'u, dönen anı, tanrı modu: 2 sn'de bir kayıttakiyle karşılaştırılır
func _process(dt: float) -> void:
	if not _canli(): return
	_t -= dt
	if _t > 0.0: return
	_t = 2.0
	var R: Dictionary = oyun.reis.bd if oyun.reis != null else {}
	var A: Dictionary = oyun.ani.mems if oyun.ani != null else {}
	var MB := {}
	for c in oyun.magara.MAGS:
		if bool(c.get("boss", false)): MB[str(c.M.boss)] = true
	if _base:
		_base = false
		_reis = R.duplicate(); _ani = A.duplicate(); _mb = MB; _tanri = Hile.tanri
		return
	for k in R:
		if not _reis.has(k) and R[k]:
			_reis[k] = true
			ekle("reis", str(k))
	for k in MB:
		if not _mb.has(k):
			_mb[k] = true
			ekle("reis", k)
	for k in A:
		if not _ani.has(k):
			_ani[k] = true
			ekle("ani", str(k))
	if Hile.tanri and not _tanri and not C.has("tanri"): ekle("tanri", "tanrı modu açık")
	_tanri = Hile.tanri

func kayit() -> Dictionary:
	return {e = E.duplicate(), c = C.duplicate()}

func yukle(d) -> void:
	E = []; C = {}; _base = true
	if typeof(d) != TYPE_DICTIONARY: return
	var e = d.get("e", [])
	if typeof(e) == TYPE_ARRAY: E = e.slice(maxi(0, e.size() - 300))
	var c = d.get("c", {})
	if typeof(c) == TYPE_DICTIONARY: C = c.duplicate()
