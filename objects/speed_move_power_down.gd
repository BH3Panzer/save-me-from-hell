extends Area2D

@export var player: Node2D




func _on_body_entered(body):
	if body.is_in_group("Player"):
		if body.speed > 200:
			body.speed -= 200
		else:
			pass
			
		queue_free()
