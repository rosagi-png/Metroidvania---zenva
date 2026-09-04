extends Node2D

var bullet_scene = preload("res://scenes/bullets.tscn")

func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate()
	print(pos)
	print(direction) # Replace with function body.
