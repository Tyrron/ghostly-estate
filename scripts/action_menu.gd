extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.night_begin.connect(_on_night_begin)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_night_begin() -> void:
	print("night")
	var panel = $PanelContainer/Panel
	var theme = load("res://assets/theme/UiTheme-night.tres");
	panel.theme = theme
	pass # Replace with function body.
