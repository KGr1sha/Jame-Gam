extends Control

signal eat_berry
signal eat_just_berry
var inventory = {}
const SlotClass = preload("res://Scenes/Inventory/Slot.gd")
onready var slots = $MarginContainer/VBoxContainer/HBoxContainer/GridContainer.get_children()

func _process(delta):
	inventory = PlayerInventory.inventory
	update_inventory()

	
func _input(event):
	var using_item = ''
	var item_index: int
	if event.is_action_pressed("slot_1") and PlayerInventory.inventory.has(0):
		using_item = inventory[0]
		item_index = 0
	elif event.is_action_pressed("slot_2") and PlayerInventory.inventory.has(1):
		using_item = inventory[1]
		item_index = 1
	elif event.is_action_pressed("slot_3") and PlayerInventory.inventory.has(2):
		using_item = inventory[2]
		item_index = 2
	if using_item == 'STANGEBERRY':
		emit_signal('eat_berry')
		PlayerInventory.remove_item(item_index)
	elif using_item == 'justberry':
		emit_signal('eat_just_berry')
		PlayerInventory.remove_item(item_index)
		

func update_inventory():
	for i in range(3):
		if inventory.has(i):
			slots[i].initialize_item(inventory[i])
		else:
			slots[i].initialize_item('')
