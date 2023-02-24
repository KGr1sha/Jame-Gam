extends Node2D

export(PackedScene) var bridgesprite_scene

var beforeBridgeChecker = false
var beforeBridgeTalkedChecker = false
var level1FinishedChecker = false
var timerForCollectItems = 1
var items_collected = false
var near_bridge = false
var bridge_builded = false
var player_near_rope = false
var rope_used = false


func _ready():
	pass

func _process(_delta):
	if near_bridge and items_collected and Input.is_action_just_pressed("use_items") and not bridge_builded:
		build()
	if Input.is_action_just_pressed("test_input"):
		Global.talkedWithChief = true
		$Player/UI/Inventory.emit_signal("eat_berry")
		build()
	if Input.is_action_just_pressed("use_items") and player_near_rope and !rope_used:
		if PlayerInventory.free_slots != 0:
			PlayerInventory.add_item('rope')
			$Rope.hide()
			rope_used = true


func _on_beforeBridge_body_entered(body):
	Global.talked_to_bridge = true
	near_bridge = true
	var inventory = PlayerInventory.inventory
	var needed_items = ['nails', 'rope', 'sticks']
	var needed_string = ''
	var has_items = []
	for slot in inventory:
		var item = inventory[slot]
		if item in needed_items:
			needed_items.remove(needed_items.find(item))
	
	for n_item in range(len(needed_items)):
		if n_item != len(needed_items) - 1:
			needed_string += needed_items[n_item] + ', '
		else:
			needed_string += needed_items[n_item]
	
	if needed_items:
		$Bridge/Tip.text = 'You need ' + needed_string + ' to build the bridge'
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
	PlayerInventory.clear()
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
	$FirstSecret.show()
	$FirstSecret/Area2D.collision_layer = 3
	pass


func _on_Rope_body_entered(body):
	if not rope_used:
		$Rope/Tip.show()
		print($Rope/Tip.text)
		player_near_rope = true


func _on_Rope_body_exited(body):
	$Rope/Tip.hide()
	player_near_rope = false



