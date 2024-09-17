extends CanvasLayer

signal night_begin
signal night_end
signal menu_toggle(is_open: bool)

var selected_action = null
var menu_open = false:
	set(value):
		menu_open = value
		menu_toggle.emit(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%NightTimerPanel.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if %DayManager.night == true:
		%NightTimer.text = str(%DayManager/NightTimer.time_left).pad_decimals(1)

func _on_night_begin() -> void:
	night_begin.emit()
	%NightTimerPanel.visible = true

func _on_night_end() -> void:
	night_end.emit()
	%NightTimerPanel.visible = false
