extends Area2D

@export var player: Node2D

func _ready():
	$AnimationPlayer.play("idle")


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if player.get_node("Timer").wait_time > 0:
			player.get_node("Timer").wait_time -= 0.05
		queue_free()
