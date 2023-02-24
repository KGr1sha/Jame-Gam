extends Node2D

var time = 0.0
var pizdex_started = false
var lighting_up = false
var global_dark = false


func _ready():
	$Player.speak("I have a really strange feeling after all those berries")
	yield(get_tree().create_timer(4), "timeout")
	pizdex_started = true
	yield(get_tree().create_timer(2), "timeout")
	#dark
	time = 0
	pizdex_started = false
	$BloodyEnt.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$BloodyEnt.hide()
	lighting_up = true
	pizdex_started = true
	yield(get_tree().create_timer(2), "timeout")
	$Player.speak('What the ...')
	#light
	time = 0
	lighting_up = false
	yield(get_tree().create_timer(2), "timeout")
	#dark
	pizdex_started = false
	$BloodyChef.show()
	yield(get_tree().create_timer(1.5), "timeout")
	pizdex_started = true
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Scenes/level3/level3.tscn")


func _process(delta):
	if pizdex_started and !lighting_up:
		time += delta
		$SubLight.energy = 0.1 + 0.4 * time
	
	elif pizdex_started and lighting_up:
		time += delta
		$SubLight.energy = 0.5 - 0.2 * time

