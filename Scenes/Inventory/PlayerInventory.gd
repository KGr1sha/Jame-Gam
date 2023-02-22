extends Node


var inventory = {
	 0: ['sticks', false],
	 1: ['nails', false],
	 2: ['rope', false]
}

func add_item(item_name):
	for i in inventory:
		if inventory[i][0] == item_name:
			inventory[i][1] = true

