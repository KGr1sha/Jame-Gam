extends KinematicBody2D


var speed = 0

func _physics_process(delta):
	var move_direction = Vector2(1, 0)
	move_and_slide(move_direction * speed, Vector2.UP)
	
