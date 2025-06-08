extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var head_sprite_2d: Sprite2D = $HeadSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed = 100.0  # Start speed
const MAX_SPEED = 200.0
const SPEED_INCREMENT = 10.0  # How much speed increases per second

const FOLLOW_SPEED = 1.0
const ROTATE_SPEED = 0.1

func _physics_process(delta: float) -> void:
	# Increase speed gradually, but clamp max to 300
	speed = clamp(speed + SPEED_INCREMENT * delta, 0, MAX_SPEED)

	position.x += speed * delta

	if player.position.y > 0 and player.position.y < 360:
		position.y = lerp(position.y, player.position.y, FOLLOW_SPEED * delta)
