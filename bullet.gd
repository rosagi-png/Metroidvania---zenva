extends Area2D

var direction: Vector2
var speed: int = 200

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
