extends Area2D


var bodyNearNextLevel1 = false
export (String, FILE) var next_scene = ""
export (Vector2) var SpawnLocation = Vector2.ZERO


func _on_NextLevel_body_exited(body):
	bodyNearNextLevel1 = false
	get_parent().get_node("Player/UI/PlayerSpeak/CenterContainer/Label").text = ''
	

func _on_NextLevel_body_entered(body):
	bodyNearNextLevel1 = true
	if bodyNearNextLevel1 and Global.talkedWithChief:
		Global.bodyPosition = SpawnLocation
		get_tree().change_scene(next_scene)
	elif !Global.talked_to_bridge:
		get_parent().get_node("Player/UI/PlayerSpeak").show()
		var player_speak = get_parent().get_node("Player/UI/PlayerSpeak/CenterContainer/Label")
		var s = ["I'm hungry", "I'd better eat something before going there"]
		var end_print = s[randi() % 2]
		for i in range(len(end_print)):
			if bodyNearNextLevel1 == false:
				break
			player_speak.text += end_print[i]
			yield(get_tree().create_timer(0.04), "timeout")
		yield(get_tree().create_timer(1), 'timeout')
		player_speak.text = ''
		get_parent().get_node("Player/UI/PlayerSpeak").hide()


