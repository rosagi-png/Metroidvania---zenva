extends Area2D

var direction: Vector2
var speed: int = 200
const OFFSET = 16

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
func setup(pos: Vector2, dir: Vector2):
		position = pos + dir * OFFSET
		direction = dir
		
#normalize raw vector (mouse position)
var raw_dir = get_local_mouse_position().normalized()
var adjusted_dir = Vector2i(round(raw_dir.x), round(raw_dir.y))
