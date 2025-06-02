extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

var can_double_jump := false

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Reset double jump when on the floor
	if is_on_floor():
		can_double_jump = true

	# Handle jump
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif can_double_jump:
			velocity.y = JUMP_VELOCITY
			can_double_jump = false

	# Move right constantly
	var direction := 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
