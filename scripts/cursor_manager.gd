extends Node2D

@export var map: TileMapLayer

func _on_player_moved(_position: Vector2, direction: Vector2) -> void:
	var target_position = Vector2(
		snappedi(_position.x + (direction.x * Globals.grid_size), Globals.grid_size),
		snappedi(_position.y + (direction.y * Globals.grid_size), Globals.grid_size)
	)
	position = target_position + Vector2(
			(-1 if direction.x == -1 else 1) * Globals.grid_size / 2,
			(-1 if direction.y == -1 else 1) * Globals.grid_size / 2
		)
