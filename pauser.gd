extends Node2D

func _process(_delta):
	get_tree().paused = GB.gamePaused
