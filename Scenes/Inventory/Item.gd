extends Control


func set_item(name):
	if name != '':
		$CenterContainer/TextureRect.texture = load('res://Scenes/Inventory/ItemIcons/' + name + '.png')
	else:
		$CenterContainer/TextureRect.texture = null

