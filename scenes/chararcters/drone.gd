extends CharacterBody2D

var direction: Vector2
var speed := 50
var player: CharacterBody2D
var health := 3:
	set(value):
		health = value
		if health <= 0:
			explode.emit(position)
			queue_free()
signal explode(pos: Vector2)



func _on_player_detection_area_body_entered(body: Node2D) -> void:
	player = body
	
	 
func _on_player_detection_area_body_exited(_body: Node2D) -> void:
	player = null # Replace with function body.


func _physics_process(_delta: float) -> void:
	if player:
		var dir = (player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()
		
func hit():
	print('drone was hit')
	health -= 1
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D.material, 'shader_parameter/Progress', 1.0, 0.1)
	tween.tween_property($AnimatedSprite2D.material, 'shader_parameter/Progress', 0.0, 0.3)
		


func _on_collision_shape_2d_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	explode.emit(position)
	queue_free()
	'explode'
