extends Node


var inventory = {}
var free_slots = 3


func add_item(item_name):
	for i in range(3):
		if inventory.has(i) == false:
			inventory[i] = item_name
			free_slots -= 1
			break


func remove_item(slot_index):
	inventory.erase(slot_index)
	free_slots += 1
	print(inventory)

		
func clear():
	for i in range(3):
		remove_item(i)
