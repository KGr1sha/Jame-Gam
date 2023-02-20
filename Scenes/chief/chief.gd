extends Area2D


var bodyNearChief = false


func _ready():
	pass

func _procces(delta):
	pass
	
func _on_chief_body_entered(body):
	bodyNearChief = true


func _on_chief_body_exited(body):
	bodyNearChief = false
