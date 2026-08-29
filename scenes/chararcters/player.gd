extends CharacterBody2D

var direction_x: float
@export var speed := 160
@export var acceleration := 600
@export var friction := 1000
var gravity = 600



func _physics_process(delta: float) -> void:
	get_input()
	move(delta)
	animation()
	move_and_slide()
	
	
func get_input(): 
	pass
	

func move(delta):	
	if direction_x:
		velocity.x = move_toward(velocity.x, direction_x * speed, acceleration * delta)
		$AnimationPlayer.play("run", -1, velocity.x/32 * direction_x)
		print("Velocity x:  ", (velocity.x ))
		
	else: 
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	if not is_on_floor():
		velocity.y += gravity * delta
	
	direction_x = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -250

func animation():
#legs
#if not facing left, direction_x = smaller than zero
	if direction_x != 1:
		$Sprites/LegSprite.flip_h = direction_x < 0
	print ("legsprite dir:" ,$Sprites/LegSprite.flip_h)
	
	if is_on_floor():
		$AnimationPlayer.current_animation = 'run' if direction_x else 'idle'
	else: 
		$AnimationPlayer.current_animation = 'jump'


	#print("Mouse_pos: ", get_local_mouse_position() )

#torso
#normalize raw vector (mouse position)
	var raw_dir = get_local_mouse_position().normalized()
	var adjusted_dir = Vector2i(round(raw_dir.x), round(raw_dir.y))
	$Sprites/TorsoSprite.frame = GUN_DIRECTIONS[adjusted_dir]
#mapping directionw to torso frames

const GUN_DIRECTIONS = {
	Vector2i(0,0):   0,
	Vector2i(1,0):   0,
	Vector2i(1,1):   1, 
	Vector2i(0,1):   2,
	Vector2i(-1,1):  3,
	Vector2i(-1,0):  4,
	Vector2i(-1,-1): 5,
	Vector2i(0,-1):  6,
	Vector2i(1,-1):  7,
}
