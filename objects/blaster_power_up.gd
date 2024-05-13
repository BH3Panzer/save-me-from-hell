extends Area2D

@export var player: Node2D

func _ready():
	$AnimationPlayer.play("idle")
	



func _on_body_entered(body):
	if body.is_in_group("Player"):
		player.have_blaster = true
		queue_free()
