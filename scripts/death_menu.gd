extends Node2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var stopwatch: Node2D = $"../Stopwatch"
@onready var timer: Timer = $Timer
@onready var death_menu: Node2D = $"."
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_respawn_texture_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func _on_menu_texture_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func player_died():
	audio_stream_player.play()
	print("Hello, World!")
	stopwatch.visible = false
	Engine.time_scale = 0.1
	timer.start()
	player.collision_layer = 0
	player.collision_mask = 0

func _on_timer_timeout() -> void:
	death_menu.visible = true
