extends Control

func _process(_delta):
	self.visible = GB.gamePaused
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		GB.gamePaused = !GB.gamePaused


func _on_button_2_pressed():
	get_tree().quit()
	get_tree().paused = false

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://optionsMenuCopy.tscn")
	get_tree().paused = false
