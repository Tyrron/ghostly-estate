extends AudioStreamPlayer

@export var day_music : AudioStream
@export var night_music : AudioStream
@export var night_music_loop_start_position : float

var is_day: bool
var is_in_transition: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_day = true
	set_stream(day_music)
	play()
	pass 


func _process(delta: float) -> void:
	if !is_in_transition and !is_playing() and stream != null:
		if is_day:
			play()
			pass
		else:
			play()
			seek(night_music_loop_start_position)
			pass
	pass

func _on_day_manager_night_begin() -> void:
	is_in_transition = true
	stop()
	pass # Replace with function body.


func _on_day_manager_night_end() -> void:
	is_in_transition = true
	stop()
	pass # Replace with function body.


func _on_action_menu_transition_finished(is_day_starting: bool) -> void:
	if is_day_starting:
		is_day = true
		set_stream(day_music)
		play()
	else:
		is_day = false
		set_stream(night_music)
		play()
		pass
	is_in_transition = false
	pass # Replace with function body.
