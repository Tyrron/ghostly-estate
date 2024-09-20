class_name DayManager
extends Node

var timer_duration : int = 60;
var transition_duration : int = 3;
var night = false;

signal night_begin
signal night_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_night(is_night: bool) -> void:
	night = is_night
	if is_night == true:
		night = true
		night_begin.emit()

func _on_night_timer_timeout() -> void:
	night = false
	night_end.emit()


func _on_action_menu_night_triggered(is_trigger: bool) -> void:
	set_night(true);
	pass # Replace with function body.
