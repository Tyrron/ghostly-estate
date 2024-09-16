extends Node

var grid_size = 16
var window_scale = 5

func _ready() -> void:
	var window = get_window()
	window.size *= window_scale
	
