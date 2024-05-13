extends Area2D

@export var player: Node2D




func _on_body_entered(body):
	if body.is_in_group("Player"):
		if player.speed > 200:
			player.speed -= 200
		else:
			pass
			
		queue_free()
