extends Camera2D


func _on_player_moved(player_position: Vector2, direction: Vector2) -> void:
	self.position = player_position
