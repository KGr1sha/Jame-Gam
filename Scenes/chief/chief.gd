extends Area2D
onready var Text = $Dialogue/NinePatchRect/MarginContainer/VBoxContainer/Text
onready var Name = $Dialogue/NinePatchRect/MarginContainer/VBoxContainer/Name
var dialogue = []
var dialogue_id = -1
var bodyNearChief = false
export(String, FILE, "*.json") var d_file
var current_dialogue_id = -1
var dialogue_active = false


func _ready():
	pass


func _process(delta):
	if bodyNearChief and Input.is_action_just_pressed("use_items"):
		if Global.talkedWithChief == false:
			dialogue()
		elif dialogue_active == false:
			dialogue_after()
	
	if Input.is_action_just_pressed("left_mb_click") and dialogue_active \
	and Global.talkedWithChief == false:
		next_script()
	
	
	if bodyNearChief:
		if not dialogue_active:
			$Tip.show()
		else:
			$Tip.hide()
	else:
		$Tip.hide()
			
	
func _on_chief_body_entered(body):
	if body.name == 'Player':
		bodyNearChief = true


func _on_chief_body_exited(body):
	if body.name == 'Player':
		bodyNearChief = false


func dialogue():
	dialogue_active = true
	$Dialogue.show()
	dialogue = load_dialogue()
	next_script()


func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		current_dialogue_id = -1
		Global.talkedWithChief = true
		$Dialogue.hide()
		dialogue_active = false
	Text.text = dialogue[current_dialogue_id]['text']
	Name.text = dialogue[current_dialogue_id]['name']


func load_dialogue():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, File.READ)
		return parse_json(file.get_as_text())


func dialogue_after():
	dialogue_active = true
	Text.text = 'Good luck!'
	Name.text = "al' Pachino"
	$Dialogue.show()
	yield(get_tree().create_timer(3), "timeout")
	$Dialogue.hide()
	dialogue_active = false
