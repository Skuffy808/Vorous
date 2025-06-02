extends Node

@onready var label: Label = $Label

var time := 0.0
var stopped := false

func _process(delta: float) -> void:
	if stopped:
		return
	time += delta
	label.text = format_time(time)

func reset():
	time = 0.0
	label.text = format_time(time)

func format_time(t: float) -> String:
	var minutes := int(t) / 60
	var seconds := int(t) % 60
	var centiseconds := int((t - int(t)) * 100)
	return "%02d:%02d.%02d" % [minutes, seconds, centiseconds]
