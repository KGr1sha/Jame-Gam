extends Node2D

export var item_name: String
var player_near_secret = false
var secret_founded = false

func _process(_delta):
	if Input.is_action_just_pressed("use_items") and player_near_secret and \
	!secret_founded:
		secret_founded = true
		PlayerInventory.add_item(item_name)
		Global.gems_collected += 1
		print(Global.gems_collected)
		self.hide()
	pass

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player_near_secret = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_near_secret = false
