extends Button




func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/Settings/Settings.tscn")


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/StartScene/StartScene.tscn")
