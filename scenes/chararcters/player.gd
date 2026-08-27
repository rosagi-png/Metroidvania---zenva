extends CharacterBody2D

var direction_x: float
@export var speed := 120
var gravity = 600



func _physics_process(delta: float) -> void:
	get_input()
	move(delta)
	animation()
	move_and_slide()
	
	
func get_input(): 
	pass
	

func move(delta):
	velocity.x = direction_x * speed
	if not is_on_floor():
		velocity.y += gravity * delta
	
	direction_x = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -250

func animation():
#legs
#if not facing left, face left
	if direction_x != 0:
		$Sprites/LegSprite.flip_h = direction_x < 0
