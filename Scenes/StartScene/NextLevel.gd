extends Area2D


var bodyNearNextLevel1 = false

func _ready():
	pass

func _process(delta):
	if bodyNearNextLevel1 and Global.talkedWithChief and \
	Input.is_action_just_pressed("use_items"):
		get_tree().change_scene("res://Scenes/level1/level1.tscn")


func _on_NextLevel_body_exited(body):
	if body.name == 'Player':
		bodyNearNextLevel1 = false
	pass


func _on_NextLevel_body_entered(body):
	if body.name == 'Player':
		bodyNearNextLevel1 = true
	pass


