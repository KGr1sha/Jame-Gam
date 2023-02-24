extends Node2D


func _ready():
	BackGroundMusic.stream = load("res://Scenes/Music/LVL2 CHASE INTRO.mp3")
	BackGroundMusic.play()
	if Global.catched:
		$Player.speak('It IS possible. I know it')
	$Player.jump_strength = -2

func _on_EntTrigger_body_entered(body):
	BackGroundMusic.stream = load("res://Scenes/Music/LVL2 CHASE MAIN PART.mp3")
	BackGroundMusic.play()
	$Ent/Area2D.collision_layer = 1
	$SleepingEnt.hide()
	$Ent.show()
	$Ent.speed = 160
	$Player.tired = true
	$Player.speak('My legs hurt after those berries')

func Ent_catch(body):
	Global.catched = true
	get_tree().reload_current_scene()
	


func _on_Area2D_body_entered(body):
	Global.freeze(2)
	$Player.speak("The butter chicken is not this way")
