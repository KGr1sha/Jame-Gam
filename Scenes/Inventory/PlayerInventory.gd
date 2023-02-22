extends Node


var inventory = {
	 0: '',
	 1: '',
	 2: ''
}
var free_slots = 3

func add_item(item_name):
	for i in range(3):
		if inventory[i] == '' and item_name:
			inventory[i] = item_name
			free_slots -= 1
			break
