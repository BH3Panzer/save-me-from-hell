extends Area2D

@export var player: Node2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player.get_node("Timer").wait_time += 0.1
		queue_free()
