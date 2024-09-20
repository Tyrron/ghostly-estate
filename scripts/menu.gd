extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_crops_label();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("select") : 
		if visible == true:
			visible = false
			owner.menu_open = false;
			return
		if visible == false:
			visible = true
			owner.menu_open = true;
			return
	if Globals.action_menu_selection != "PLANT" :
		$CropMenuContainer.visible = false;
		$Crop_Cursor.visible = false;
	else : 
		$CropMenuContainer.visible = true;
		$Crop_Cursor.visible = true;
		_update_crops_label();
	pass

func _update_crops_label() -> void: 
	$CropMenuContainer/Menu/VBoxContainer/Pumpkin.text = str(Globals.crops[0].label," ",Globals.crops[0].inPlayerInventory)
	$CropMenuContainer/Menu/VBoxContainer/Corn.text = str(Globals.crops[1].label," ",Globals.crops[1].inPlayerInventory)
	$CropMenuContainer/Menu/VBoxContainer/Potatoe.text = str(Globals.crops[2].label," ",Globals.crops[2].inPlayerInventory)
	pass


func _on_night_begin() -> void:
	var action_panel = $ActionMenuContainer/Menu
	var crop_panel = $CropMenuContainer/Menu
	change_cursor(true)
	var theme = load("res://assets/theme/UiTheme-night.tres");
	action_panel.theme = theme
	crop_panel.theme = theme
	pass # Replace with function body.


func _on_night_end() -> void:
	var action_panel = $ActionMenuContainer/Menu
	var crop_panel = $CropMenuContainer/Menu
	change_cursor(false)
	var theme = load("res://assets/theme/UiTheme.tres");
	action_panel.theme = theme
	crop_panel.theme = theme
	pass
	
	
func change_cursor(isNight : bool) -> void :
	if isNight : 
		var action_cursor = $Action_Cursor
		var action_texture : AtlasTexture = action_cursor.texture;
		action_texture.atlas = load("res://assets/aseprite/ui-tileset-night.png")
		var crop_cursor = $Crop_Cursor
		var crop_texture : AtlasTexture = crop_cursor.texture;
		crop_texture.atlas = load("res://assets/aseprite/ui-tileset-night.png")
	elif isNight == false : 
		var action_cursor = $Action_Cursor
		var action_texture : AtlasTexture = action_cursor.texture;
		action_texture.atlas = load("res://assets/aseprite/ui-tileset.png")
		var crop_cursor = $Crop_Cursor
		var crop_texture : AtlasTexture = crop_cursor.texture;
		crop_texture.atlas = load("res://assets/aseprite/ui-tileset.png")
