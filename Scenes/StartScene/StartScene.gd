extends Node2D


func _ready():
	if Global.talkedWithChief == true:
		$CLOSED/CollisionShape2D.disabled = true
	pass

func _process(delta):
	pass
