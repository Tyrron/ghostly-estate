extends Node2D

var night: int = 0
var night_timer: Timer

signal night_begin
signal night_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	night_end.connect(_on_night_end)
	pass # Replace with function body.

func set_night(is_night: bool) -> void:
	if is_night == true:
		night = 1
		night_begin.emit()
		night_timer = Timer.new()
		night_timer.one_shot = true
		night_timer.autostart = false
		add_child(night_timer)
		night_timer.start(5)
		night_timer.timeout.connect(func(): night_end.emit())

func _on_night_end() -> void:
	night = 0
	night_timer.queue_free()
