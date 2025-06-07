extends Area2D

@onready var timer: Timer = $Timer
@onready var death_menu: Node2D = $"../CanvasLayer/DeathMenu"
@onready var stopwatch: Node2D = $"../CanvasLayer/Stopwatch"
@onready var player: CharacterBody2D = $"../Player"

func _on_body_entered(body: Node2D) -> void:
	stopwatch.visible = false
	Engine.time_scale = 0.1
	timer.start()
	player.collision_layer = 0
	player.collision_mask = 0

	
func _on_timer_timeout() -> void:
	death_menu.visible = true

	
