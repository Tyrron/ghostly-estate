extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%NightTimerPanel.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if %DayManager.night == true && %DayManager.night_timer != null:
		%NightTimer.text = str(%DayManager.night_timer.time_left).pad_decimals(1)

func _on_night_begin() -> void:
	%NightTimerPanel.visible = true

func _on_night_end() -> void:
	%NightTimerPanel.visible = false
