extends Area2D


var bodyNearDoor = false


func _ready():
	pass

func _process(delta):
	if bodyNearDoor and Input.is_action_just_pressed("use_items") \
	and Global.isPlayerInStartScene:
		get_tree().change_scene("res://Scenes/restaurant/Restaurant.tscn")
		Global.isPlayerInStartScene = false
		Global.isPlayerInRestaurant = true
	elif bodyNearDoor and Input.is_action_just_pressed("use_items"):
		get_tree().change_scene("res://Scenes/StartScene/StartScene.tscn")
		Global.isPlayerInStartScene = true
		Global.isPlayerInRestaurant = false

func _on_Door_body_entered(body):
	if body.name == "Player":
		bodyNearDoor = true
	pass


func _on_Door_body_exited(body):
	if body.name == "Player":
		bodyNearDoor = false
	pass
