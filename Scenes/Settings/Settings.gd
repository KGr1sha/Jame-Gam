extends Control

onready var music = get_node('/root/BackGroundMusic')

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")


func _on_Volume_down_pressed():
	music.volume_db -= 5


func _on_Volume_up_pressed():
	if music.volume_db < 10 or music.volume_db >= 10:
		music.volume_db += 5

