extends Node2D


var night = 0
@onready var ground = $Ground;
@onready var buildings = $Buildings;
@onready var player_sprite = $Player.animatedSprite;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_enter_manor(inManor : bool) -> void:
	if inManor == true:  
		manage_time();
	pass # Replace with function body.


func manage_time() -> void : 
	if night == 0 : 
		night = 1
	else :
		night = 1
	change_textures(night);
	pass
		
func change_textures(isNight : int) -> void :
	print(isNight);
	if isNight == 1:
		player_sprite.play("idle_night");
		# Replace ground texture
		var all_tile_ground = ground.get_used_cells_by_id(3);
		for i in all_tile_ground:
			var atlas_cord = ground.get_cell_atlas_coords(i);
			var atlas_transform = ground.get_cell_alternative_tile(i);
			ground.set_cell(i, 6,atlas_cord,atlas_transform);
		# Replace crops
		var all_tile_crops = ground.get_used_cells_by_id(4);
		for i in all_tile_crops:
			var atlas_cord = ground.get_cell_atlas_coords(i);
			var atlas_transform = ground.get_cell_alternative_tile(i);
			ground.set_cell(i, 5,atlas_cord,atlas_transform);
		# Replace manor texture
		var all_tile_manor = buildings.get_used_cells_by_id(1);
		for i in all_tile_manor:
			var atlas_cord = buildings.get_cell_atlas_coords(i);
			var atlas_transform = buildings.get_cell_alternative_tile(i);
			buildings.set_cell(i, 3,atlas_cord,atlas_transform);
		# Replace objects texture
		var all_tile_objects = buildings.get_used_cells_by_id(2);
		for i in all_tile_objects:
			var atlas_cord = buildings.get_cell_atlas_coords(i);
			var atlas_transform = buildings.get_cell_alternative_tile(i);
			buildings.set_cell(i, 4,atlas_cord,atlas_transform);
	pass
	
	
