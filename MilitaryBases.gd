extends Control

var redProgress = false
var blueProgress = false
var tankPlacedRed = false
var tankPlacedBlue = false

func _input(_event):
	if GB.bordersDefined == true:
		if GB.militaryBasesDefined == false:
			if GB.turn == "red":
				if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
					if redProgress == false:
						GB.redMilitaryBase = get_local_mouse_position()
						redProgress = true
						if tankPlacedRed == false:
							var spriteRed = Sprite2D.new()
							spriteRed.texture = load("res://tank.png")
							spriteRed.scale = Vector2(0.01, 0.01)
							spriteRed.position = get_local_mouse_position()
							add_child(spriteRed)
							tankPlacedRed = true
			if GB.turn == "blue":
				if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
					if blueProgress == false:
						GB.blueMilitaryBase = get_local_mouse_position()
						blueProgress = true
						if tankPlacedBlue == false:
							var spriteBlue = Sprite2D.new()
							spriteBlue.texture = load("res://tank.png")
							spriteBlue.scale = Vector2(0.01, 0.01)
							spriteBlue.position = get_local_mouse_position()
							add_child(spriteBlue)
							tankPlacedBlue = true

	if redProgress == true and blueProgress == true:
		GB.militaryBasesDefined = true
