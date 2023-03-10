extends Node2D

var player_finished_talking = false

func _ready():
	BackGroundMusic.stream = load("res://Scenes/Music/LVL1.mp3")
	BackGroundMusic.play()
	$Player.jump_strength = -3
	Global.freeze(5)
	$Player.speak('Wow')
	yield(get_tree().create_timer(2), "timeout")
	$Player.speak('How did I get there?')
	yield(get_tree().create_timer(2), "timeout")
	$Player.speak('Was this all ... a dream?')
	yield(get_tree().create_timer(3), "timeout")
	$Player.speak('I think the butter chicken is close. I can smell it.')
	yield(get_tree().create_timer(3), "timeout")
	player_finished_talking = true
	
	


func _on_Area2D_body_entered(body):
	if player_finished_talking:
		$Player.speak("I think it's bad idea to go there.")
		player_finished_talking = false
		yield(get_tree().create_timer(3), "timeout")
		player_finished_talking = true


func _on_StandArea_body_entered(body):
	$StandArea/AnimationPlayer.play("cutscene")
	Global.freezed = true
	yield(get_tree().create_timer(1), "timeout")


