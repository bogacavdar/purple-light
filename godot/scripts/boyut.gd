class_name Boyut
extends RefCounted
## Pencereler kenarından büyütülür (belge Sistemler › Arayüz › Pencerelerin boyutu): farenin olduğu bilgisayarda açılır pencereler
## sol, sağ ve alt kenarından (ve alt köşelerinden) çekilerek büyür ya da küçülür; kenara gelince imleç çift ok olur. Pencere ekranın
## ortasında kalır, iki yana eşit büyür. Yazılar ve düğmeler büyümez, yalnız pencere genişler. En küçük 360 × 260, en büyük ekran kadar.
## Her pencere türünün boyutu oyun açık kaldığı sürece hatırlanır. Dokunmatik ekranda yoktur.

const KENAR := 7.0
static var hafiza := {}

## pencereyi büyütülebilir yap; ad: hatırlama anahtarı
static func bagla(p: Control, ad: String) -> void:
	if DisplayServer.is_touchscreen_available():
		# telefonda ve tablette pencere bütün ekranı kaplar, içerik kendi içinde kayar (belge Telefonda bütün pencereler)
		p.visibility_changed.connect(func():
			if not p.visible: return
			var V: Vector2 = p.get_viewport_rect().size
			p.custom_minimum_size = V - Vector2(8, 8)
			p.size = p.custom_minimum_size
			p.position = Vector2(4, 4)
			(func(): p.position = Vector2(4, 4)).call_deferred())
		return
	var D := {tut = "", bas = Vector2.ZERO, boy0 = Vector2.ZERO}
	if hafiza.has(ad): p.custom_minimum_size = hafiza[ad]
	p.gui_input.connect(func(e: InputEvent):
		if e is InputEventMouseMotion:
			if D.tut != "":
				var d: Vector2 = e.global_position - D.bas
				var y: Vector2 = D.boy0
				var V: Vector2 = p.get_viewport_rect().size
				if D.tut.contains("s"): y.x = D.boy0.x - 2.0 * d.x
				if D.tut.contains("r"): y.x = D.boy0.x + 2.0 * d.x
				if D.tut.contains("b"): y.y = D.boy0.y + d.y
				y = y.clamp(Vector2(360, 260), V - Vector2(8, 8))
				p.custom_minimum_size = y
				p.size = y
				p.position = Vector2(((V.x - y.x) / 2.0), clampf(p.position.y, 4.0, V.y - y.y - 4.0)).floor()
				hafiza[ad] = y
				p.accept_event()
			else:
				p.mouse_default_cursor_shape = _imlec(_kenar(p, e.position))
		elif e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_LEFT:
			if e.pressed:
				var k := _kenar(p, e.position)
				if k != "":
					D.tut = k; D.bas = e.global_position; D.boy0 = p.size
					p.accept_event()
			elif D.tut != "":
				D.tut = ""
				p.accept_event())

static func _kenar(p: Control, at: Vector2) -> String:
	var k := ""
	if at.y > p.size.y - KENAR: k += "b"
	if at.x < KENAR: k += "s"
	elif at.x > p.size.x - KENAR: k += "r"
	return k

static func _imlec(k: String) -> Control.CursorShape:
	if k == "": return Control.CURSOR_ARROW
	if k == "b": return Control.CURSOR_VSIZE
	if k == "s" or k == "r": return Control.CURSOR_HSIZE
	return Control.CURSOR_FDIAGSIZE if k == "br" else Control.CURSOR_BDIAGSIZE
