extends CharacterBody2D


const SPEED = 300.0
var forward_speed = 50
@export var Bullet : PackedScene
@onready var timer = $Timer
var is_shooting := false
func _ready():
	$AnimationPlayer.play("idle")
	is_shooting = false

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

func _input(event):
	if event.is_action_pressed("shoot") && timer.is_stopped():
		is_shooting = true
		shoot()
		timer.start()
	elif event.is_action_released("shoot"):
		timer.stop()
		is_shooting = false


func _on_timer_timeout():
	shoot()
	is_shooting = false

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $FrontCanon.global_transform
	b.scale.x = 1
	b.scale.y = 1
