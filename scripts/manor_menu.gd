extends Control


var seed_selected : int = 0;
var night_menu : int = 0;

signal night_button_pressed(value: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_seeds_labels()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if owner.manor_menu_open == true :
		if night_menu == 1:
			$ManorMenuContainer.visible = false;
		else: 
			$ManorMenuContainer.visible = true;
		if Input.is_action_just_pressed("action"):
			if night_menu == 1:
				night_menu = 0;
				owner.manor_menu_open = false;
				night_button_pressed.emit(true)
				return;
			if seed_selected == 3 :
				owner.manor_menu_open = false;
				return;
			else :
				buy_current_seed()
	_update_seeds_labels()
	pass
	
	
	
func _update_seeds_labels() -> void: 
	$ManorMenuContainer/Menu/Money.text = str("Money : ",Globals.money," $ ")
	$ManorMenuContainer/Menu/VBoxContainer/Pumpkin.text = str(Globals.crops[0].label," ",Globals.crops[0].priceToBuy," $ "," : ",Globals.crops[0].inPlayerInventory)
	$ManorMenuContainer/Menu/VBoxContainer/Corn.text = str(Globals.crops[1].label," ",Globals.crops[1].priceToBuy," $ "," : ",Globals.crops[1].inPlayerInventory)
	$ManorMenuContainer/Menu/VBoxContainer/Potatoe.text = str(Globals.crops[2].label," ",Globals.crops[2].priceToBuy," $ "," : ",Globals.crops[2].inPlayerInventory)
	pass
	
func buy_current_seed() -> void: 
	if Globals.money - Globals.crops[seed_selected].priceToBuy >= 0 : 
		Globals.money -= Globals.crops[seed_selected].priceToBuy;
		Globals.crops[seed_selected].inPlayerInventory += 1;
	_update_seeds_labels();
	
