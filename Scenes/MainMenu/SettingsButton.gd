extends Button


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/Settings/Settings.tscn")


func _on_StartButton_pressed():
	Global.freeze(0)
	get_tree().change_scene("res://Scenes/StartScene/StartScene.tscn")


func _on_ControlsButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/Controls.tscn")
