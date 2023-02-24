extends CanvasLayer

var pause_state = false

func _input(event):
	if event.is_action_pressed("pause"):
		pause_state = !get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state
		


func _on_VolumeDown_pressed():
	BackGroundMusic.volume_db -= 5


func _on_VolumeUp_pressed():
	BackGroundMusic.volume_db += 5


func _on_Resume_pressed():
	pause_state = !get_tree().paused
	get_tree().paused = pause_state
	visible = pause_state
