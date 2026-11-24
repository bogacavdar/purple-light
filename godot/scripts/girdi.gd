## Tuşlar ve oyun kolu (belge: Sistemler › Kontroller ve › Oyun kolu). Web'deki varsayılan tuşların aynısı.
class_name Girdi

static func _key(a: String, codes: Array) -> void:
	for c in codes:
		var e := InputEventKey.new()
		e.physical_keycode = c
		InputMap.action_add_event(a, e)

static func _btn(a: String, b: int) -> void:
	var e := InputEventJoypadButton.new()
	e.button_index = b
	InputMap.action_add_event(a, e)

static func _axis(a: String, ax: int, v: float) -> void:
	var e := InputEventJoypadMotion.new()
	e.axis = ax
	e.axis_value = v
	InputMap.action_add_event(a, e)

static func kur() -> void:
	for a in ["sol", "sag", "yukari", "asagi", "kos", "vur", "atil", "kos_kol", "silah"]:
		if InputMap.has_action(a):
			InputMap.erase_action(a)
		InputMap.add_action(a, 0.3)
	# WASD / oklar: yürü
	_key("sol", [KEY_A, KEY_LEFT]); _key("sag", [KEY_D, KEY_RIGHT])
	_key("yukari", [KEY_W, KEY_UP]); _key("asagi", [KEY_S, KEY_DOWN])
	# Shift: koş · Q: vur (sol tık da vurur, tıklanan yöne) · Boşluk: atıl · 1: el boş / Taş kılıç (deneme)
	_key("kos", [KEY_SHIFT]); _key("vur", [KEY_Q]); _key("atil", [KEY_SPACE]); _key("silah", [KEY_1])
	# kol: sol çubuk ve yön tuşları yürür, L3 koşuyu açar, X (PS □) ya da RT vurur, B (PS ○) atılır, Y silahı değiştirir
	_axis("sol", JOY_AXIS_LEFT_X, -1.0); _axis("sag", JOY_AXIS_LEFT_X, 1.0)
	_axis("yukari", JOY_AXIS_LEFT_Y, -1.0); _axis("asagi", JOY_AXIS_LEFT_Y, 1.0)
	_btn("sol", JOY_BUTTON_DPAD_LEFT); _btn("sag", JOY_BUTTON_DPAD_RIGHT)
	_btn("yukari", JOY_BUTTON_DPAD_UP); _btn("asagi", JOY_BUTTON_DPAD_DOWN)
	_btn("kos_kol", JOY_BUTTON_LEFT_STICK)
	_btn("vur", JOY_BUTTON_X); _axis("vur", JOY_AXIS_TRIGGER_RIGHT, 1.0)
	_btn("atil", JOY_BUTTON_B)
	_btn("silah", JOY_BUTTON_Y)
