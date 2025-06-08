extends Node2D

@onready var player = $"../Player"

var platforms = []
var spawn_x = 1152  # This is the X position where the next platform will spawn

const PLATFORM_WIDTH = 1152
const PLATFORM_Y = 0  # Fixed vertical position for all platforms

func _ready():
	# Load all platform scenes from the folder
	var dir = DirAccess.open("res://scenes/Platforms")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".tscn"):
				platforms.append(load("res://scenes/Platforms/" + file_name))
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("Failed to open platforms directory!")

	spawn_platform()  # Spawn the first platform at spawn_x = 0

func spawn_platform():
	if platforms.size() == 0:
		print("No platforms loaded!")
		return

	var idx = randi() % platforms.size()
	var platform_instance = platforms[idx].instantiate()

	# **Here is where the spawn position is set:**
	platform_instance.position = Vector2(spawn_x, PLATFORM_Y)
	add_child(platform_instance)

	spawn_x += PLATFORM_WIDTH  # Move spawn_x right for next platform

func _process(delta):
	# If player is close to the edge, spawn another platform
	if player.position.x > spawn_x - PLATFORM_WIDTH * 2:
		spawn_platform()
