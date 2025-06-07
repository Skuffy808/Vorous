extends Area2D


@onready var death_menu = get_tree().get_root().get_node("Game/CanvasLayer/DeathMenu")



func _on_body_entered(body: Node2D) -> void:
	death_menu.player_died()
	
