extends Area2D

var speed = 900

var damage = 5

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("Enemies"):
		body.damage(damage)
	queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
