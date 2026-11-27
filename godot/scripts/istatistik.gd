extends Node
## İstatistikler ve oyun süresi (web P4 stats, v3.65; belge Sistemler › İstatistikler ve oyun süresi).
## Karakter penceresinin (C) İstatistikler sekmesi. Oyun süresi gerçek saatle iki ayrı sayılır: aktif (dünya akarken; konuşma dahil)
## ve menüde (bir menü ya da pencere açıkken). Ana menü, karakter yaratma, açılış ve arka plandaki sekme sayılmaz; bir adımda en çok 2 sn.

var oyun
var aktif := 0.0
var menu := 0.0
var yol := 0.0          # yürünen piksel
var yapilan := 0
var kazanilan := 0
var harcanan := 0
var toplanan := 0
var son_p := Vector2.INF
var son_t := 0

func kur(o) -> void:
	oyun = o
	process_mode = Node.PROCESS_MODE_ALWAYS
	son_t = Time.get_ticks_msec()

func _process(_dt: float) -> void:
	if oyun == null: return
	var t := Time.get_ticks_msec()
	var d := minf(2.0, (t - son_t) / 1000.0)
	son_t = t
	if oyun.basta or oyun.arena != null or oyun.cine.acik or oyun.uyanis.acik or not DisplayServer.window_is_focused(): return
	var mn: bool = get_tree().paused and not oyun.konusma.visible
	if not mn and oyun.pencere_acik() and not oyun.konusma.visible: mn = true
	if mn: menu += d
	else: aktif += d
	var p: Vector2 = oyun.oyuncu.position
	if son_p != Vector2.INF:
		var m := p.distance_to(son_p)
		if m < 40.0 and not get_tree().paused: yol += m
	son_p = p

func vio(n: int) -> void:
	if oyun.arena != null: return
	if n > 0: kazanilan += n
	elif n < 0: harcanan -= n

static func sure_yaz(s: float) -> String:
	var x := int(s)
	var h := x / 3600
	var m := (x % 3600) / 60
	return ("%d sa %d dk" % [h, m]) if h > 0 else (("%d dk" % m) if m > 0 else ("%d sn" % x))

static func yol_yaz(px: float) -> String:
	var m := px / 16.0
	return ("%s km" % String.num(m / 1000.0, 1).replace(".", ",")) if m >= 1000.0 else ("%d m" % int(m))

func kayit() -> Dictionary:
	return {a = roundi(aktif), m = roundi(menu), d = roundi(yol), c = yapilan, ce = kazanilan, cs = harcanan, g = toplanan}

func yukle(d: Dictionary) -> void:
	aktif = float(d.get("a", 0)); menu = float(d.get("m", 0)); yol = float(d.get("d", 0))
	yapilan = int(d.get("c", 0)); kazanilan = int(d.get("ce", 0)); harcanan = int(d.get("cs", 0)); toplanan = int(d.get("g", 0))
	son_p = Vector2.INF
