extends Node2D

var talkedWithChief = false
var isPlayerInStartScene = true
var isPlayerInRestaurant = false
var bodyPosition = Vector2(418, 861)
var freezed
var cntLevel1 = 0

func _ready():
	pass

func freeze(time):
	freezed = true
	yield(get_tree().create_timer(time), "timeout")
	freezed = false

