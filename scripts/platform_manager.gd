extends Node

@onready var platform_1: Node2D = $Platform1
@onready var player: CharacterBody2D = $"../Player"
const PLATFORM_1 = preload("res://scenes/Platforms/platform_1.tscn")

var spawn_new_pos := 640

func _process(delta):
	if player.position.x > spawn_new_pos:
		print("Hello, World!")
		var new_platform = PLATFORM_1.instantiate()
		new_platform.position.x = spawn_new_pos * 2
		add_child(new_platform)
		spawn_new_pos += 640
