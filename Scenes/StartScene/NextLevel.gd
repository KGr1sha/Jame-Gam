extends Area2D


var bodyNearNextLevel1 = false
export (String, FILE) var next_scene = ""
export (Vector2) var SpawnLocation = Vector2.ZERO
func _ready():
	pass

func _process(delta):
	if bodyNearNextLevel1 and Global.talkedWithChief and \
	Input.is_action_just_pressed("use_items"):
		Global.bodyPosition = SpawnLocation
		get_tree().change_scene(next_scene)


func _on_NextLevel_body_exited(body):
	if body.name == 'Player':
		bodyNearNextLevel1 = false
	pass


func _on_NextLevel_body_entered(body):
	if body.name == 'Player':
		bodyNearNextLevel1 = true
	pass


