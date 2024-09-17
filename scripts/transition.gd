extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_night_begin() -> void:
	var transiDayNight = $TransiDayNight;
	transiDayNight.visible = true;
	transiDayNight.play("default");
	pass # Replace with function body.


func _on_night_end() -> void:
	var transiDayNight = $TransiNightDay;
	transiDayNight.visible = true;
	transiDayNight.play("default");
	pass


func _on_transi_day_night_animation_finished() -> void:
	print('finished')
	var transiDayNight = $TransiDayNight;
	transiDayNight.visible = false;
	pass # Replace with function body.


func _on_transi_night_day_animation_finished() -> void:
	print('finished')
	var transiNightDay = $TransiNightDay;
	transiNightDay.visible = false;
	pass # Replace with function body.
