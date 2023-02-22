extends Panel


var item_scene = preload("res://Scenes/Inventory/Item.tscn")
var item = null


func _ready():
	item = item_scene.instance()
	add_child(item)

