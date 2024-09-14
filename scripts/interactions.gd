extends TileMapLayer

@onready var player = get_parent().get_node("Player");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(player);
	print("Position : " , player.position);
	var farmable_land = get_used_cells_by_id(1);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_cell = local_to_map(to_local(Vector2i(player.position)))
	var cellData = get_cell_tile_data(player_cell)
	print("cellData : " , cellData)
	if cellData:
		print(cellData.get_custom_data("farmable"));
	pass
