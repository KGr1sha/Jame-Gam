extends Control

signal eat_berry
var inventory = {}
const SlotClass = preload("res://Scenes/Inventory/Slot.gd")
onready var slots = $MarginContainer/VBoxContainer/HBoxContainer/GridContainer.get_children()

func _process(delta):
	inventory = PlayerInventory.inventory
	update_inventory()

	
func _input(event):
	if event.is_action_pressed("slot_3") and PlayerInventory.inventory.has(2) and PlayerInventory.inventory[2] == 'STANGEBERRY':
		emit_signal("eat_berry")
		PlayerInventory.remove_item(2)


func update_inventory():
	for i in range(3):
		if inventory.has(i):
			slots[i].initialize_item(inventory[i])
		else:
			slots[i].initialize_item('')
