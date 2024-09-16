extends Node2D

var night = false;
var menu_open = false;
var action_selected = null;

signal night_begin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_night(is_night: bool) -> void:
	night = is_night
	if is_night:
		night_begin.emit()

func get_night() -> bool: 
	return night;
	
