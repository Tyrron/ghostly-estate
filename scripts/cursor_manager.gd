extends Node2D

@export var map: TileMapLayer

func _on_player_moved(_position: Vector2, cursor_position: Vector2) -> void:
	#var map_local_position = map.to_local(position + cursor_position)
	#var local_cell_coordinate = map.local_to_map(map.to_local(position + cursor_position))
	#self.position = local_cell_coordinate * Globals.grid_size
	var target_position = Vector2(
		snappedi(_position.x + cursor_position.x, Globals.grid_size),
		snappedi(_position.y + cursor_position.y, Globals.grid_size)
	)
	position = target_position + Vector2(Globals.grid_size / 2, Globals.grid_size / 2)
