extends Node2D

@export var map: TileMapLayer
var last_direction = Vector2.ZERO
var cell_position = Vector2i(0,0)

signal cursor_moved(position: Vector2, cell_position: Vector2i)

func _process(delta: float) -> void:
	if %DayManager.night == true:
		visible = false;
	else : 
		visible = true;
	pass

func _on_player_moved(_position: Vector2, direction: Vector2) -> void:
	if direction.x != 0:
		last_direction.x = direction.x
		last_direction.y = 0
	if direction.y != 0:
		last_direction.y = direction.y
		last_direction.x = 0

	cell_position = map.local_to_map(_position + Vector2(
		last_direction.x * Globals.grid_size, last_direction.y * Globals.grid_size
	))

	position = map.map_to_local(cell_position)

	cursor_moved.emit(position, cell_position)
