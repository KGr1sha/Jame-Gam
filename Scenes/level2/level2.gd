extends Node2D


func _ready():
	$Player.jump_strength = -3


func _on_EntTrigger_body_entered(body):
	pass 
