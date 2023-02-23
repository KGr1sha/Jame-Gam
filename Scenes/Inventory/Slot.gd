extends Panel


var item_scene = preload("res://Scenes/Inventory/Item.tscn")
var item = null


func initialize_item(item_name):
	if item == null:
		item = item_scene.instance()
		add_child(item)
		item.set_item(item_name)
	else:
		item.set_item(item_name)

