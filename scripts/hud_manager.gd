extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%NightTimer.visible = false
	GameManager.night_begin.connect(_on_night_begin)
	GameManager.night_end.connect(_on_night_end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GameManager.night == 1 && GameManager.night_timer != null:
		%NightTimer.text = str(GameManager.night_timer.time_left).pad_decimals(1)

func _on_night_begin() -> void:
	%NightTimer.visible = true

func _on_night_end() -> void:
	%NightTimer.visible = false
