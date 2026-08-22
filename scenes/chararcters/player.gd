extends CharacterBody2D

var direction_x: float
@export var speed := 120
var gravity = 400


func get_input():
	direction_x = Input.get_axis("left", "right")
	
	
func _physics_process(delta: float) -> void:
	get_input()
	velocity.x = direction_x * speed
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
