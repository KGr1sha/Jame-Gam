extends Area2D


var bodyNearDoor = false
var isPlayerInStartScene = true

func _ready():
	pass

func _process(delta):
	if bodyNearDoor and Input.is_action_just_pressed("testscene") \
	and isPlayerInStartScene:
		get_tree().change_scene("res://Scenes/Restaurant.tscn")
		isPlayerInStartScene = false
	elif bodyNearDoor and Input.is_action_just_pressed("testscene"):
		get_tree().change_scene("res://Scenes/StartScene/StartScene.tscn")

func _on_Door_body_entered(body):
	if body.name == "Player":
		bodyNearDoor = true
	pass


func _on_Door_body_exited(body):
	if body.name == "Player":
		bodyNearDoor = false
	pass
