extends TextureRect

@onready var parent_menu : VBoxContainer = get_parent().get_node('CropMenuContainer/Menu/VBoxContainer')
@export var cursor_offset : Vector2

var cursor_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if owner.menu_open == true :
		var input := Vector2.ZERO;
		if Input.is_action_just_pressed("up") :
			input.y -= 1
		if Input.is_action_just_pressed("down") : 
			input.y += 1
		set_cursor_from_index(cursor_index + input.y);
		set_crop_selected(cursor_index);
	pass


func get_menu_item_at_index(index : int) -> Control:
	if parent_menu == null:
		return null;
	if index >= parent_menu.get_child_count() or index < 0:
		return null;
	return parent_menu.get_child(index) as Control;
	
	
func set_cursor_from_index(index : int ) -> void: 
	var menu_item := get_menu_item_at_index(index);
	if menu_item == null:
		return 
	
	var position = menu_item.global_position;
	
	global_position = Vector2(position.x,position.y + size.y / 2.0) - ( size / 2.0 ) - cursor_offset;
	cursor_index = index;


func set_crop_selected(index: int) -> void:
	Globals.crop_menu_selection = index;
