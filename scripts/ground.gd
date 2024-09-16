extends TileMapLayer

@onready var cursor = get_parent().get_node("Cursor");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.night_begin.connect(_on_night_begin)
	GameManager.night_end.connect(_on_night_end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var player_cell = local_to_map(to_local(Vector2i(cursor.position)))
	var cellData = get_cell_tile_data(player_cell)
	if Input.is_action_just_pressed("action") and GameManager.night == 0:
		if cellData.get_custom_data("hoeable") == true :
			set_cell(player_cell,3,Vector2i(0,0));
			return;
		if cellData.get_custom_data("hoeable") == false && cellData.get_custom_data("farmable") == true :
			set_cell(player_cell,4,Vector2i(0,0));
			return;
	pass

func is_tile_hoeable(tile_position: Vector2) -> bool:
	var player_cell = local_to_map(to_local(tile_position))
	var cellData = get_cell_tile_data(player_cell)
	if cellData.get_custom_data("hoeable") == true :
		return true
	return false

func _on_night_begin() -> void:
	# Replace ground texture
	var all_tile_ground = get_used_cells_by_id(3);
	for i in all_tile_ground:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 6,atlas_cord,atlas_transform);
	# Replace crops
	var all_tile_crops = get_used_cells_by_id(4);
	for i in all_tile_crops:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 5,atlas_cord,atlas_transform);

func _on_night_end() -> void:
	# Replace ground texture
	var all_tile_ground = get_used_cells_by_id(6);
	for i in all_tile_ground:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 3, atlas_cord,atlas_transform);
	# Replace crops
	var all_tile_crops = get_used_cells_by_id(5);
	for i in all_tile_crops:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, 4, atlas_cord,atlas_transform);
