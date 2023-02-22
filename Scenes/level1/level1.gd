extends Node2D

var beforeBridgeChecker = false
var beforeBridgeTalkedChecker = false
var level1FinishedChecker = false
var timerForCollectItems = 1

func _ready():
	get_node("Bridge/Sprite").hide()


func _process(_delta):
	if Global.cntLevel1 == 8 and level1FinishedChecker == false:
		get_node("Bridge/CollisionShape2D").disabled = false
		get_node("Bridge/Sprite").show()
		get_node("CLOSED/CollisionShape2D").disabled = true
		level1FinishedChecker = true


func _on_beforeBridge_body_entered(body):
	if Global.cntLevel1 == 8:
		yield(get_tree().create_timer(5), "timeout")
		beforeBridgeChecker = true
		get_node("beforeBridge/CollisionShape2D").disabled = true
	elif Global.cntLevel1 >= 5:
		# show massage about the player did not find one item
		yield(get_tree().create_timer(timerForCollectItems), "timeout")
	elif Global.cntLevel1 >= 2:
		# the player did not find two item
		yield(get_tree().create_timer(timerForCollectItems), "timeout")
	elif Global.cntLevel1 >= 0:
		if beforeBridgeTalkedChecker:
			# the player did not find anything
			yield(get_tree().create_timer(timerForCollectItems), "timeout")
		else:
			beforeBridgeTalkedChecker = true
			# show massage about quest on this level with timer on 5 secs
			yield(get_tree().create_timer(timerForCollectItems), "timeout")
