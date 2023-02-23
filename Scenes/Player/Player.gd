extends KinematicBody2D


var gravity = Vector2.DOWN * 1.5
var jump_velocity = 0.0
var speed = 200 #150
var jump_strength = -3


func _ready():
	self.global_position = Global.bodyPosition
	pass

func _physics_process(delta):
	var move_direction = gravity

	if Input.is_action_pressed("move_left") and Global.freezed == false:
		move_direction.x = -1
	if Input.is_action_pressed("move_right") and Global.freezed == false:
		move_direction.x = 1
	if Input.is_action_pressed("jump") and is_on_floor() and \
	Global.isPlayerInRestaurant == false and Global.freezed == false:
		jump_velocity = jump_strength
	
	_play_move_animation(move_direction)
	
	if jump_velocity < 0.0:
		jump_velocity += gravity.y * delta * 4
		move_direction.y = jump_velocity
	if jump_velocity >= 0.0 and not is_on_floor():
		jump_velocity += gravity.y * delta * 4
		move_direction.y = jump_velocity
	
	move_and_slide(move_direction * speed, Vector2.UP)
	
	if is_on_floor() or is_on_ceiling():
		jump_velocity = 0
	

func _play_move_animation(move_direction):
	if move_direction == gravity and is_on_floor():
		$AnimatedSprite.play("idle")
	elif move_direction.x != 0 and is_on_floor():
		$AnimatedSprite.play("run")
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		
	if move_direction.x > 0:
		$AnimatedSprite.flip_h = false
	elif move_direction.x < 0:
		$AnimatedSprite.flip_h = true


func _on_Inventory_eat_berry():
	var end_print = 'Feels kinda strange in my legs'
	$UI/PlayerSpeak.show()
	for i in range(len(end_print)):
		$UI/PlayerSpeak/CenterContainer/Label.text += end_print[i]
		yield(get_tree().create_timer(0.04), "timeout")
	yield(get_tree().create_timer(1), "timeout")
	jump_strength = -7
	$UI/PlayerSpeak.hide()
	$UI/PlayerSpeak/CenterContainer/Label.text = ''



