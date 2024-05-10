extends CharacterBody2D


const SPEED = 300.0
var forward_speed = 100

func _ready():
	$AnimationPlayer.play("idle")
func _physics_process(delta):
	position.y -= forward_speed * delta
	if Input.is_action_pressed("right"):
		position.x += SPEED * delta
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("down"):
		position.y += SPEED * delta
	if global_position.x >= 853/2 - 16 :
		position.x -= SPEED * delta
	if global_position.x <= -853/2 + 16 :
		position.x += SPEED * delta
