extends Node2D

export(PackedScene) var bridgesprite_scene

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
	if Input.is_action_just_pressed("test_input"):
		build()


func _on_beforeBridge_body_entered(body):
	near_bridge = true
	var inventory = PlayerInventory.inventory
	var needed_items = ['nails', 'rope', 'sticks']
	var needed_string = ''
	var has_items = []
	for slot in inventory:
		var item = inventory[slot]
		if item in needed_items:
			needed_items.remove(needed_items.find(item))
	for n_item in needed_items:
		needed_string += n_item 
	if needed_items:
		$Bridge/Tip.text = 'You need ' + needed_string + ' to build the bridge'
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
	PlayerInventory.inventory = {
	 0: '',
	 1: '',
	 2: ''
	}
	PlayerInventory.free_slots = 3
	var firstX = 2957
	Global.freeze(5)
	bridge_builded = true
	for i in range(24):
		var bridgeSprite = bridgesprite_scene.instance()
		bridgeSprite.offset.x = firstX
		bridgeSprite.offset.y = 176
		add_child(bridgeSprite)
		firstX += 32
		yield(get_tree().create_timer(0.21), "timeout")
	$Bridge/CollisionShape2D.disabled = false
	$CLOSED/CollisionShape2D.disabled = true
	
