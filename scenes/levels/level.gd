extends Node2D

var bullet_scene = preload("res://scenes/bullets/bullet.tscn")
var explosion_Scene = preload("res://scenes/bullets/explosion.tscn")

func _ready() -> void:
	for drone in get_tree().get_nodes_in_group('Drones'):
		drone.connect('explode', create_explosion)

func create_explosion(pos: Vector2):
	print(pos)


func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate()
	$Entities/Bullets.add_child(bullet)
	bullet.setup(pos,dir)
	print(pos)
	
