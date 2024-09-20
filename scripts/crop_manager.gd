extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ground_player_planted(cell_position: Vector2i) -> void:
	Globals.crops[Globals.crop_menu_selection].inPlayerInventory -= 1;
	pass # Replace with function body.


func _on_ground_player_gathered(cell_position: Vector2i, cropType: int) -> void:
	print( Globals.crops[cropType].priceToSell)
	print( Globals.money)

	Globals.crops[cropType].gatheredThisDay += 1;
	Globals.money += Globals.crops[cropType].priceToSell;
	pass # Replace with function body.


func _on_day_manager_night_begin() -> void:
	
	Globals._reset_crop_counter();
	pass # Replace with function body.


func _on_day_manager_night_end() -> void:
	pass # Replace with function body.
	
