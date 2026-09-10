extends CharacterBody2D

var direction: Vector2
var speed := 50
var player: CharacterBody2D
var health := 3



func _on_player_detection_area_body_entered(body: Node2D) -> void:
	player = body
	
	 
func _on_player_detection_area_body_exited(_body: Node2D) -> void:
	player = null # Replace with function body.


func _physics_process(_delta: float) -> void:
	if player:
		var dir = (player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()
		
