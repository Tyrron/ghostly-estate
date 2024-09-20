extends Node

var grid_size = 16
var window_scale = 5
var action_menu_selection = "DIG";
var crop_menu_selection = 0;

var money = 10

var crops = [
	{
		"name" : "PUMPKIN",
		"label" : "Pumpkin",
		"daysToGrow" : 2,
		"priceToBuy" : 2,
		"priceToSell" : 4,
		"mobPriority" : 3,
		"inPlayerInventory" : 0,
		"gatheredThisDay" : 0,
		"atlasOriginCoord" : Vector2i(0,0)
	}, 
	{
		"name" : "CORN",
		"label" : "Corn",
		"daysToGrow" : 3,
		"priceToBuy" : 3,
		"priceToSell" : 8,
		"mobPriority" : 2,
		"inPlayerInventory" : 0,
		"gatheredThisDay" : 0,
		"atlasOriginCoord" : Vector2i(0,1)
	},
	{
		"name" : "POTATOE",
		"label" : "Potatoe",
		"daysToGrow" : 4,
		"priceToBuy" : 4,
		"priceToSell" : 12,
		"mobPriority" : 1,
		"inPlayerInventory" : 0,
		"gatheredThisDay" : 0,
		"atlasOriginCoord" : Vector2i(0,2)
	}
]



func _ready() -> void:
	var window = get_window()
	window.size *= window_scale
	
	
func _reset_crop_counter() -> void : 
	for x in crops: 
		x.gatheredThisDay = 0;
