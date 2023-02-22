extends Panel


var item_scene = preload("res://Scenes/Inventory/Item.tscn")
var item = null


func add_item_to_slot(item_name):
	item = item_scene.instance()
	item.set_item(item_name)
	add_child(item)


	
func remove_item():
	var items = get_children()
	if items:
		for item in items:
			item.remove_item()

func use_item(item_name):
	if item_name == 'STANGEBERRY':
		remove_child(item)
		print('whynotwork')
		Global.jump_strength = -7
		
		for item in PlayerInventory.inventory:
			if PlayerInventory.inventory[item] == item_name:
				PlayerInventory.inventory[item] = ''
				PlayerInventory.free_slots += 1
