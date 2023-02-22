extends Node2D

var item_name: String


func _ready():
	if Global.talkedWithChief == true:
		$CLOSED/CollisionShape2D.disabled = true
	pass

func _process(delta):
	pass
