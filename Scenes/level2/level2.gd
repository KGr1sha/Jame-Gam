extends Node2D


func _ready():
	$Player.jump_strength = -3


func _on_EntTrigger_body_entered(body):
	$Ent/Area2D.collision_layer = 1
	$SleepingEnt.hide()
	$Ent.show()
	$Ent.speed = 160


func Ent_catch(body):
	get_tree().reload_current_scene()
