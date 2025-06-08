extends Node2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var stopwatch: Node2D = $"../Stopwatch"
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func player_died():
	audio_stream_player.play()
	print("Hello, World!")
	Engine.time_scale = 0.1
	timer.start()
	player.collision_layer = 0
	player.collision_mask = 0

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/death.tscn")
