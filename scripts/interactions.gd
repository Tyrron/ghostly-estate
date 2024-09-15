extends TileMapLayer

@onready var cursor = get_parent().get_node("Cursor");

var gameManager = get_parent();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var farmable_land = get_used_cells_by_id(1);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_cell = local_to_map(to_local(Vector2i(cursor.position)))
	var cellData = get_cell_tile_data(player_cell)
	if Input.is_action_just_pressed("action"):
		if( gameManager.time == "day") :
			if cellData.get_custom_data("hoeable") == true :
				set_cell(player_cell,3,Vector2i(0,0));
				return;
			if cellData.get_custom_data("hoeable") == false && cellData.get_custom_data("farmable") == true :
				set_cell(player_cell,4,Vector2i(0,0));
				return;
	pass
