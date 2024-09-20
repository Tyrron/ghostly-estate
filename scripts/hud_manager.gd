extends CanvasLayer

signal night_begin
signal night_end
signal menu_toggle(is_open: bool)
signal manor_menu_toggle(is_open: bool)
signal night_triggered(is_trigger : bool)

var selected_action = null
var menu_open = false:
	set(value):
		menu_open = value
		menu_toggle.emit(value)
var manor_menu_open = false:
	set(value):
		manor_menu_open = value;
		manor_menu_toggle.emit(value);
		update_manor_menu_visibility(value)

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


func _on_player_enter_manor(inManor: bool) -> void:
	manor_menu_open = inManor;
	pass # Replace with function body.
	
func update_manor_menu_visibility(value : bool) -> void:
	$ManorMenu.visible = value;
	pass

func _on_manor_menu_night_button_pressed(value: bool) -> void:
	night_triggered.emit(value)
	pass # Replace with function body.
