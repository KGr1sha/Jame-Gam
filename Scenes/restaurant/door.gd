extends Area2D


var bodyNearDoor = false

export(String, FILE) var next_scene_path = ""
export(Vector2) var spawnLocation = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	if bodyNearDoor and Input.is_action_just_pressed("use_items"):
		Global.bodyPosition = spawnLocation
		get_tree().change_scene(next_scene_path)


func _on_Door_body_entered(body):
	if body.name == "Player":
		bodyNearDoor = true
	pass


func _on_Door_body_exited(body):
	if body.name == "Player":
		bodyNearDoor = false
	pass
