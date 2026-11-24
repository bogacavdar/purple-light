## Yerdeki toplanabilir (web nodes): toplanınca kaybolur, respawn saniye sonra yine çıkar; böğürtlen çalısı ve maden kayası birkaç kez verir.
extends Sprite2D

var ad := ""
var canli := true
var kalan := 1
var bekle := 0.0
var bas_kalan := 1

func oldur(sure: float) -> void:
	canli = false
	visible = false
	bekle = sure
	set_process(true)

func _process(dt: float) -> void:
	if canli:
		set_process(false)
		return
	bekle -= dt
	if bekle <= 0.0:
		canli = true
		visible = true
		kalan = bas_kalan
