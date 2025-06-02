extends Node

@onready var player: CharacterBody2D = $"../Player"

const PLATFORM_1 = preload("res://scenes/Platforms/platform_1.tscn")
const PLATFORM_2 = preload("res://scenes/Platforms/platform_2.tscn")

var spawn_new_pos := 640

func spawn_random_platform():
	var platformRNG = randi_range(1, 10)
	if platformRNG >= 6:
		var new_platform = PLATFORM_1.instantiate()
		new_platform.position.x = spawn_new_pos * 2
		add_child(new_platform)
	elif platformRNG <= 5:
		var new_platform = PLATFORM_2.instantiate()
		new_platform.position.x = spawn_new_pos * 2
		add_child(new_platform)
	else:
		print("WHAT IN THE ACTUAL FUCK HAPPENED")
		
func _process(delta):
	if player.position.x > spawn_new_pos:
		spawn_random_platform()
		spawn_new_pos += 640
