extends CharacterBody2D

var direction_x: float
@export var speed := 120
var gravity = 600


func get_input():
	direction_x = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -250
	
func _physics_process(delta: float) -> void:
	get_input()
	velocity.x = direction_x * speed
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
