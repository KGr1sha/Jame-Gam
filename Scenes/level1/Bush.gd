extends Area2D

var isBodyNearBush = false
var timerItemsFromBush = 1
var localCnt = 0


func _ready():
	pass


func _process(_delta):
	if isBodyNearBush and Input.is_action_just_pressed("use_items") and \
	localCnt < 1:
		$AnimatedSprite.play() #loop off
		localCnt += 1
		Global.cntLevel1 += 1
	elif isBodyNearBush and Input.is_action_just_pressed("use_items") and \
	localCnt == 1:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play()
	
	if Global.cntLevel1 == 2:
		# show a message about finding sticks
		Global.freezed = true
		yield(get_tree().create_timer(timerItemsFromBush), "timeout")
		Global.freezed = false
		pass
	
	if Global.cntLevel1 == 5:
		# show a massage about finding ropes
		Global.freezed = true
		yield(get_tree().create_timer(timerItemsFromBush), "timeout")
		Global.freezed = false
		pass
	
	if Global.cntLevel1 == 6:
		# show a massage about finding berries
		Global.freezed = true
		yield(get_tree().create_timer(timerItemsFromBush), "timeout")
		Global.freezed = false
		pass
	
	if Global.cntLevel1 == 8:
		# show a massage about finding nails (ГВОЗДИ БЛЯТЬ)
		Global.freezed = true
		yield(get_tree().create_timer(timerItemsFromBush), "timeout")
		Global.freezed = false
	
	if isBodyNearBush:
		$Tip.show()
	else:
		$Tip.hide()


func _on_Area2D_body_entered(body):
	isBodyNearBush = true
	pass


func _on_Area2D_body_exited(body):
	isBodyNearBush = false
	pass
