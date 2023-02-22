extends Panel


var item_scene = preload("res://Scenes/Inventory/Item.tscn")
var item = null


func add_item_to_slot(item_name):
	item = item_scene.instance()
	item.set_item(item_name)
	add_child(item)
	
