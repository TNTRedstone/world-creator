extends Button

func _on_pressed():
	if GB.turn == "red":
		GB.turn = "blue"
	elif GB.turn == "blue":
		GB.turn = "red"
