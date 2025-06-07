extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var speed = 200.0
const JUMP_VELOCITY = -300.0
var jumped = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if jumped:
			animated_sprite_2d.play("jump")
		audio_stream_player.stop()
	else:
		if jumped:
			jumped = false
		animated_sprite_2d.play("run")
		if not audio_stream_player.playing:
			audio_stream_player.play()

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true

	velocity.x = speed
	move_and_slide()
