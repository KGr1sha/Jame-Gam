extends Node2D

var player_near_berry = false
var used = false


func _process(delta):
	if Input.is_action_just_pressed("use_items") and player_near_berry and !used:
		PlayerInventory.add_item('justberry')
		self.hide()
		used = true
	

func _on_Area2D_body_entered(body):
	player_near_berry = true

func _on_Area2D_body_exited(body):
	player_near_berry = false
