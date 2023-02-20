extends Area2D


var bodyNearChief = false

func _ready():
	pass

func _process(delta):
	if bodyNearChief and Input.is_action_just_pressed("use_items"):
		dialog()
		pass
	
func _on_chief_body_entered(body):
	if body.name == 'Player':
		bodyNearChief = true


func _on_chief_body_exited(body):
	if body.name == 'Player':
		bodyNearChief = false


func dialog():
	Global.talkedWithChief = true
	pass
