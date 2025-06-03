extends Camera2D

const MAX_ZOOM:float = 2
const MIN_ZOOM:float = 1
const ZOOM_STEP = 0.1

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("zoom_in"):
		zoom += Vector2(ZOOM_STEP, ZOOM_STEP)
	elif Input.is_action_just_pressed("zoom_out"):
		zoom -= Vector2(ZOOM_STEP, ZOOM_STEP)

	zoom.x = clamp(zoom.x, MIN_ZOOM, MAX_ZOOM)
	zoom.y = clamp(zoom.y, MIN_ZOOM, MAX_ZOOM)
