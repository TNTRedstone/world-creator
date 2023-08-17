extends Button

var changedRed = false
var changedBlue = false

func _on_pressed():
	if GB.turn == "red":
		GB.turn = "blue"
		changedRed = true
	elif GB.turn == "blue":
		GB.turn = "red"
		changedBlue = true
	if changedBlue == true and changedRed == true:
		GB.bordersDefined = true
