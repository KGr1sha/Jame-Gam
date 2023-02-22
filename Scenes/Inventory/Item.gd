extends Control


func set_item(name):
	$CenterContainer/TextureRect.texture = load('res://Scenes/Inventory/ItemIcons/' + name + '.png')
