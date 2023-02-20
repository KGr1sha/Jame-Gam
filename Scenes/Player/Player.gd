extends KinematicBody2D


var nearChief = false
var gravity = Vector2.DOWN * 1.5
var jump_velocity = 0.0
var JUMP_STRENGTH = -3
var speed = 150


func _ready():
	$AnimatedSprite.play("idle2")
	pass

func _physics_process(delta):
	
	var move_direction = gravity

	if Input.is_action_pressed("move_left"):
		move_direction.x = -1
	if Input.is_action_pressed("move_right"):
		move_direction.x = 1
	if Input.is_action_pressed("jump") and is_on_floor() and \
	Global.isPlayerInRestaurant == false:
		jump_velocity = JUMP_STRENGTH
	
	if jump_velocity < 0.0:
		jump_velocity += gravity.y * delta * 4
		move_direction.y = jump_velocity
	
	move_and_slide(move_direction * speed, Vector2.UP)

func _animations(animation):
	pass
