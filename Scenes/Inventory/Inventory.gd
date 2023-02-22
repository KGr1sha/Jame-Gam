extends Control


var inventory = {}
onready var inventory_slots = $MarginContainer/VBoxContainer/HBoxContainer/GridContainer

func _process(delta):
	inventory = PlayerInventory.inventory
	var slots = inventory_slots.get_children()
	for i in (inventory):
		if inventory[i][1]:
			slots[i].add_item_to_slot(inventory[i][0])

	
