extends Control

func _on_play_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")


func _on_credits_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_controls_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/controls.tscn")
