extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var head_sprite_2d: Sprite2D = $HeadSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const FOLLOW_SPEED = 1.0
const ROTATE_SPEED = 0.1

func _physics_process(delta: float) -> void:
	position.x += SPEED * delta

	if player.position.y > 0 and player.position.y < 360:
		position.y = lerp(position.y, player.position.y, FOLLOW_SPEED * delta)
	
	
