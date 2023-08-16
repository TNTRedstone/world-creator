extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://optionsMenu.tscn")


func _on_exit_pressed():
	get_tree().quit()
