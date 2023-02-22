extends Area2D

var isBodyNearBush = false
var timerItemsFromBush = 1
var used = false



func _process(_delta):
	if isBodyNearBush and Input.is_action_just_pressed("use_items") and used == false:
		Global.cntLevel1 += 1
		$AnimatedSprite.play()
		used = true
		drop_item()
	elif isBodyNearBush and Input.is_action_just_pressed("use_items") and used:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play()
	
	if isBodyNearBush:
		$Tip.show()
	else:
		$Tip.hide()


func drop_item():
	var item_name
	Global.freeze(1)
	if Global.cntLevel1 == 2:
		item_name = 'nails'
	elif Global.cntLevel1 == 3:
		item_name = 'sticks'
	elif Global.cntLevel1 == 4:
		item_name = 'rope'
			
	PlayerInventory.add_item(item_name)
	
	if item_name:
		$Tip/Label.text = 'You found ' + item_name
		yield(get_tree().create_timer(1), 'timeout')
		$Tip/Label.text = 'E - fumble'


func _on_Area2D_body_entered(body):
	isBodyNearBush = true
	pass


func _on_Area2D_body_exited(body):
	isBodyNearBush = false
	pass
