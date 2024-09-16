extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.night_begin.connect(_on_night_begin)
	GameManager.night_end.connect(_on_night_end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_night_begin() -> void:
	var all_tile_manor = get_used_cells_by_id(1);
	for i in all_tile_manor:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 3,atlas_cord,atlas_transform);
	# Replace objects texture
	var all_tile_objects = get_used_cells_by_id(2);
	for i in all_tile_objects:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 4,atlas_cord,atlas_transform);


func _on_night_end() -> void:
	var all_tile_manor = get_used_cells_by_id(3);
	for i in all_tile_manor:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 1,atlas_cord,atlas_transform);
	# Replace objects texture
	var all_tile_objects = get_used_cells_by_id(4);
	for i in all_tile_objects:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 2,atlas_cord,atlas_transform);
