extends Node2D


var dialogue = []
var dialogue_id = -1
export(String, FILE, "*.json") var dialogue_file
var current_dialogue_id = -1
var dialogue_active = false
var player_near_chef = false
onready var chef_text = $Chef/NinePatchRect/MarginContainer/VBoxContainer/Talk


func _process(_delta):
	if Input.is_action_just_pressed("use_items") and player_near_chef:
		$Chef/Tip.hide()
		$Chef/NinePatchRect.show()
		









func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		current_dialogue_id = -1
		Global.talkedWithChief = true
		$Dialogue.hide()
		dialogue_active = false
	chef_text.text = dialogue[current_dialogue_id]['text']




func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, File.READ)
		return parse_json(file.get_as_text())


func _on_Area2D_body_entered(body):
	$Chef/Tip.show()
	player_near_chef = true



func _on_Area2D_body_exited(body):
	$Chef/Tip.hide()
	player_near_chef = false

