extends Area2D
# array setup for explosion damage radius
var targets: Array

func setup(pos: Vector2):
	position = pos


func _on_body_entered(body: Node2D) -> void:
	targets.append(body)
	
func hurt_targets():
	for target in targets:
		target.hit()
