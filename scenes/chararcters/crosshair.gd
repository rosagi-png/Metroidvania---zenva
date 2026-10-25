extends Sprite2D

func update(direction: Vector2, distance):
	position = direction * distance
