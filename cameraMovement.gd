extends Camera2D

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position -= event.relative / zoom

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.075
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom /= 1.075
