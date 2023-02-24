extends Control


func _ready():
	BackGroundMusic.stream = load("res://Scenes/Music/LVL3.mp3")
	BackGroundMusic.play()


