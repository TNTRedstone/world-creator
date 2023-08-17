extends Button

var progress = 0

func _on_pressed():
	if GB.turn == "red":
		GB.turn = "blue"
	elif GB.turn == "blue":
		GB.turn = "red"
	progress += 1
	if progress == 2:
		GB.bordersDefined = true
