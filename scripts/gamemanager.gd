extends Node2D

var night = 0

signal night_begin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_night(is_night: bool) -> void:
	if is_night:
		night = 1
		night_begin.emit()
