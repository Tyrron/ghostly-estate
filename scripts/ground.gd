class_name Ground
extends TileMapLayer

const HOED_GROUND_TILE_COORD = Vector2i(0,0)
const OUTDOOR_DAY_SOURCE_ID = 3
const CROPS_DAY_SOURCE_ID = 4
const OUTDOOR_NIGHT_SOURCE_ID = 6
const CROPS_NIGHT_SOURCE_ID = 5

signal player_hoed(cell_position: Vector2i)
signal player_planted(cell_position: Vector2i)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass 

func is_cell_farmable(cell_position: Vector2i) -> bool:
	return get_cell_tile_data(cell_position).get_custom_data("hoeable") or get_cell_tile_data(cell_position).get_custom_data("farmable")

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

func _on_player_action(_position: Vector2, cell_position: Vector2i) -> void:
	var cellData = get_cell_tile_data(cell_position)
	if %DayManager.night == 1:
		return

	if cellData.get_custom_data("hoeable") == true :
		set_cell(cell_position, OUTDOOR_DAY_SOURCE_ID, HOED_GROUND_TILE_COORD);
		player_hoed.emit(cell_position)
		return;
	if cellData.get_custom_data("hoeable") == false && cellData.get_custom_data("farmable") == true :
		set_cell(cell_position, CROPS_DAY_SOURCE_ID, HOED_GROUND_TILE_COORD);
		player_planted.emit(cell_position)
		return;
