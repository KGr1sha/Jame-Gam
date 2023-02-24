extends Node2D

var player_near_secret = false
export(String, FILE) var secret_scene = ""

func _process(_delta):
	if Input.is_action_just_pressed("use_items") and player_near_secret and Global.gems_collected == 3:
		get_tree().change_scene(secret_scene)
		PlayerInventory.clear()


func _on_SecretTrigger_body_entered(body):
	player_near_secret = true
	$Tip.show()


func _on_SecretTrigger_body_exited(body):
	player_near_secret = false
	$Tip.hide()
