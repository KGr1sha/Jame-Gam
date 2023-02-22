extends Node2D

var beforeBridgeChecker = false
var beforeBridgeTalkedChecker = false
var level1FinishedChecker = false
var timerForCollectItems = 1
var items_collected = false
var near_bridge = false
var bridge_builded = false


func _ready():
	get_node("Bridge/Sprite").hide()


func _process(_delta):
	if near_bridge and items_collected and Input.is_action_just_pressed("use_items") and not bridge_builded:
		build()


func _on_beforeBridge_body_entered(body):
	near_bridge = true
	var inventory = PlayerInventory.inventory
	var needed_items = []
	for i in inventory:
		if not inventory[i][1]:
			needed_items.append(inventory[i][0])
	if needed_items:
		var s = ''
		for i in range(len(needed_items)):
			if i != len(needed_items) - 1:
				s += needed_items[i] + ', '
			else:
				s += needed_items[i]
		$Bridge/Tip.text = 'You need ' + s + ' to build the bridge'
		$Bridge/Tip.show()
	else:
		if bridge_builded == false:
			$Bridge/Tip.text = 'E - build the bridge'
			$Bridge/Tip.show()
			items_collected = true
		


func _on_beforeBridge_body_exited(body):
	near_bridge = false
	$Bridge/Tip.hide()
	
	
func build():
	$Bridge/Tip.hide()
	bridge_builded = true
	#Тут надо построить мост
	
	pass
	
	
