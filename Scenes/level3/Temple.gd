extends Node2D


var dialogue = []
var dialogue_id = -1
export(String, FILE, "*.json") var dialogue_file
var current_dialogue_id = -1
var dialogue_active = false
var player_near_chef = false
onready var chef_text = $Chef/NinePatchRect/MarginContainer/VBoxContainer/Talk
var end = false


func _ready():
	$Player.position = Vector2(-520, -3)

func _process(_delta):
	if Input.is_action_just_pressed("use_items") and player_near_chef and not end:
		$Chef/Tip.hide()
		$Chef/NinePatchRect.show()
		dialogue()
	if Input.is_action_just_pressed("left_mb_click") and dialogue_active \
	and Global.talkedWithChief == false:
		next_script()
		



func dialogue():
	dialogue_active = true
	dialogue = load_dialogue()
	next_script()


func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		current_dialogue_id = -1
		dialogue_active = false
		end = true
		$Chef/NinePatchRect.hide()
		
	chef_text.text = dialogue[current_dialogue_id]['text']


func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, File.READ)
		return parse_json(file.get_as_text())


func _on_Area2D_body_entered(body):
	if not dialogue_active and not end:
		$Chef/Tip.show()
	player_near_chef = true



func _on_Area2D_body_exited(body):
	$Chef/Tip.hide()
	player_near_chef = false

