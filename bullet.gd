extends Area2D

var direction: Vector2
var speed: int = 200
const OFFSET = 10

func _physics_process(delta: float) -> void:
	position += (direction) * speed * delta
	#print (direction)
	
	var snapped_x = snappedf(direction.x, 0.1)
	var snapped_y = snappedf(direction.y, 0.1)
	var snap_direction = Vector2(snapped_x, snapped_y)
	#print (snap_direction)
	
	#singel line ver
	var snap_dir = direction.snapped(direction * 0.1)
	print (snap_dir)
	
func setup(pos: Vector2, dir: Vector2):
		
		position = pos + dir * OFFSET
		direction = dir
		

#normalize raw vector (mouse position)
var raw_dir = get_local_mouse_position().normalized()
var adjusted_dir = Vector2i(round(raw_dir.x), round(raw_dir.y))

		


func _on_body_entered(body: Node2D) -> void:
	if 'hit' in body:
		body.hit()
		queue_free()
