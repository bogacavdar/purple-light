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
	for a in ["sol", "sag", "yukari", "asagi", "kos", "vur", "atil", "kos_kol", "topla", "ye", "canta", "kemer1", "kemer2", "kemer3", "kemer4", "kemer5", "kemer_sonraki", "deneme_alet", "el_yapimi", "kitap", "mesale", "savus", "yetenek", "karakter", "insa", "bin", "kopek", "harita", "almanak", "kamp"]:
		if InputMap.has_action(a):
			InputMap.erase_action(a)
		InputMap.add_action(a, 0.3)
	# WASD / oklar: yürü
	_key("sol", [KEY_A, KEY_LEFT]); _key("sag", [KEY_D, KEY_RIGHT])
	_key("yukari", [KEY_W, KEY_UP]); _key("asagi", [KEY_S, KEY_DOWN])
	# Shift: koş · Q: vur (sol tık da vurur, tıklanan yöne) · Boşluk: atıl · F: topla/al · X: ye · I: çanta · 1–5: kemer · G: görevler · F9: deneme aletleri
	_key("kos", [KEY_SHIFT]); _key("vur", [KEY_Q]); _key("atil", [KEY_SPACE])
	_key("topla", [KEY_F]); _key("ye", [KEY_X]); _key("canta", [KEY_I]); _key("deneme_alet", [KEY_F9]); _key("el_yapimi", [KEY_TAB]); _key("kitap", [KEY_K]); _key("mesale", [KEY_QUOTELEFT]); _key("savus", [KEY_E]); _key("yetenek", [KEY_Y]); _key("karakter", [KEY_C]); _key("insa", [KEY_N]); _key("bin", [KEY_B]); _key("kopek", [KEY_R]); _key("harita", [KEY_M]); _key("almanak", [KEY_U]); _key("kamp", [KEY_V])
	_key("kemer1", [KEY_1]); _key("kemer2", [KEY_2]); _key("kemer3", [KEY_3]); _key("kemer4", [KEY_4]); _key("kemer5", [KEY_5])
	# kol: sol çubuk ve yön tuşları yürür, L3 koşuyu açar, X (PS □) ya da RT vurur, B (PS ○) atılır, A (PS ✕) toplar,
	# Y (PS △) kemerde sıradaki yuvaya geçer, LB yer, Select/Back çantayı açar
	_axis("sol", JOY_AXIS_LEFT_X, -1.0); _axis("sag", JOY_AXIS_LEFT_X, 1.0)
	_axis("yukari", JOY_AXIS_LEFT_Y, -1.0); _axis("asagi", JOY_AXIS_LEFT_Y, 1.0)
	_btn("sol", JOY_BUTTON_DPAD_LEFT); _btn("sag", JOY_BUTTON_DPAD_RIGHT)
	_btn("yukari", JOY_BUTTON_DPAD_UP); _btn("asagi", JOY_BUTTON_DPAD_DOWN)
	_btn("kos_kol", JOY_BUTTON_LEFT_STICK)
	_btn("vur", JOY_BUTTON_X); _axis("vur", JOY_AXIS_TRIGGER_RIGHT, 1.0)
	_btn("atil", JOY_BUTTON_B); _axis("savus", JOY_AXIS_TRIGGER_LEFT, 1.0)
	_btn("kemer_sonraki", JOY_BUTTON_Y); _btn("topla", JOY_BUTTON_A)
	_btn("ye", JOY_BUTTON_LEFT_SHOULDER); _btn("canta", JOY_BUTTON_BACK); _btn("el_yapimi", JOY_BUTTON_START)
