class_name DayManager
extends Node

@export var mob_scene: PackedScene
@export var tilemap : TileMapLayer


var timer_duration : int = 60;
var transition_duration : int = 3;
var night = false;

signal night_begin
signal night_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	var tiles = tilemap.get_used_cells_by_id(5);
	if tiles.size() == 0 && night == true:
		$MobSpawnTimer.stop(); 
		night = false;
		night_end.emit() 
	pass

func set_night(is_night: bool) -> void:
	night = is_night
	if is_night == true:
		night = true
		night_begin.emit()

func _on_night_timer_timeout() -> void:
	night = false
	night_end.emit()


func _on_action_menu_night_triggered(is_trigger: bool) -> void:
	set_night(true);
	pass # Replace with function body.


func _on_mob_spawn_timer_timeout() -> void:
	if night == true:
		var mob = mob_scene.instantiate()
	# Choose a random location on Path2D.
		var mob_spawn_location = $MobPath/MobSpawnLocation
		mob_spawn_location.progress_ratio = randf()
		randomize();
		mob.target_tile = get_all_crop_tile_position().pick_random();
		add_child(mob)
		pass # Replace with function body.


func get_all_crop_tile_position() -> Array[Vector2] : 
	var tiles = tilemap.get_used_cells_by_id(5);
	var vector2tiles: Array[Vector2] = []
	for tile in tiles : 
		vector2tiles.push_back(tilemap.map_to_local(tile));
	return vector2tiles;
	
