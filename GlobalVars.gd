extends Node2D

var turn = "red"
var bordersDefined = false
var militaryBasesDefined = false
var redMilitaryBase : Vector2
var blueMilitaryBase : Vector2
var blueCoverage
var redCoverage

func _process(_delta):
	var window_size = DisplayServer.window_get_size(0)
