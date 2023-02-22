extends Control


var inventory = {}
const SlotClass = preload("res://Scenes/Inventory/Slot.gd")
onready var inventory_slots = $MarginContainer/VBoxContainer/HBoxContainer/GridContainer

func _process(delta):
	inventory = PlayerInventory.inventory
	var slots = inventory_slots.get_children()
	for i in (inventory):
		if inventory.has(i) and inventory[i] != '':
			if inventory[i]:
				slots[i].add_item_to_slot(inventory[i])
		else:
			slots[i].remove_item()
	
func _input(event):
	if event.is_action_pressed('slot_3'):
		inventory_slots.get_children()[0].use_item(inventory.get(2))

	
