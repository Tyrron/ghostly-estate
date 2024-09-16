extends TileMapLayer

const HOED_GROUND_TILE_COORD = Vector2i(0,0)
const OUTDOOR_DAY_SOURCE_ID = 3
const CROPS_DAY_SOURCE_ID = 4
const OUTDOOR_NIGHT_SOURCE_ID = 6
const CROPS_NIGHT_SOURCE_ID = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.night_begin.connect(_on_night_begin)
	GameManager.night_end.connect(_on_night_end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var targeted_cell = %Cursor.cell_position
	var cellData = get_cell_tile_data(targeted_cell)
	if Input.is_action_just_pressed("action") and GameManager.night == false:
		if cellData.get_custom_data("hoeable") == true :
			set_cell(targeted_cell, OUTDOOR_DAY_SOURCE_ID, HOED_GROUND_TILE_COORD);
			return;
		if cellData.get_custom_data("hoeable") == false && cellData.get_custom_data("farmable") == true :
			set_cell(targeted_cell, 4, HOED_GROUND_TILE_COORD);
			return;

func _on_night_begin() -> void:
	# Replace ground texture
	var all_tile_ground = get_used_cells_by_id(OUTDOOR_DAY_SOURCE_ID);
	for i in all_tile_ground:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, OUTDOOR_NIGHT_SOURCE_ID, atlas_cord,atlas_transform);
	# Replace crops
	var all_tile_crops = get_used_cells_by_id(CROPS_DAY_SOURCE_ID);
	for i in all_tile_crops:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, CROPS_NIGHT_SOURCE_ID, atlas_cord,atlas_transform);

func _on_night_end() -> void:
	# Replace ground texture
	var all_tile_ground = get_used_cells_by_id(OUTDOOR_NIGHT_SOURCE_ID);
	for i in all_tile_ground:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, OUTDOOR_DAY_SOURCE_ID, atlas_cord,atlas_transform);
	# Replace crops
	var all_tile_crops = get_used_cells_by_id(CROPS_NIGHT_SOURCE_ID);
	for i in all_tile_crops:
		var atlas_cord = get_cell_atlas_coords(i);
		var atlas_transform = get_cell_alternative_tile(i);
		set_cell(i, CROPS_DAY_SOURCE_ID, atlas_cord,atlas_transform);
