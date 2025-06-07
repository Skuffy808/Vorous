extends Node2D

func _on_respawn_texture_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_menu_texture_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
