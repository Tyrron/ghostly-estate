extends Camera2D


func _on_player_moved(player_position: Vector2, _cursor_position: Vector2) -> void:
	self.position = player_position
