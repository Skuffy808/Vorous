extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed = 200.0
const JUMP_VELOCITY = -300.0
var jumped = false

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		if jumped:
			animated_sprite_2d.play("jump")
	else:
		if jumped:
			jumped = false
		animated_sprite_2d.play("run")

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true

	velocity.x = speed
	move_and_slide()
