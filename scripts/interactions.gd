extends TileMapLayer

@onready var cursor = get_parent().get_node("Cursor");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var farmable_land = get_used_cells_by_id(1);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_cell = local_to_map(to_local(Vector2i(cursor.position)))
	var cellData = get_cell_tile_data(player_cell)
	if Input.is_action_just_pressed("action"):
		print("cellData : " , cellData)
		print(cellData.get_custom_data("mowable"));
		print(cellData.get_custom_data("farmable"))
		if cellData.get_custom_data("mowable") == true :
			var cellId = get_cell_source_id(player_cell);
			print(cellId);
			set_cell(player_cell,3,Vector2i(0,0));
			return;
		if cellData.get_custom_data("mowable") == false && cellData.get_custom_data("farmable") == true :
			var cellId = get_cell_source_id(player_cell);
			set_cell(player_cell,0,Vector2i(0,0));
			return;
	pass
