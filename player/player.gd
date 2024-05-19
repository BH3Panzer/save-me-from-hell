extends CharacterBody2D

var speed = 300.0
var forward_speed = 50
@export var Bullet : PackedScene
@export var Blaster : PackedScene
@onready var timer = $Timer
@onready var timer_blaster = $TimerBlaster
var life = 3
var is_shooting := false
var is_shooting_blaster := false
var have_blaster := false
var slowDown = false
func _ready():
	is_shooting = false
	is_shooting_blaster = false

func _physics_process(delta):
	position.y -= forward_speed * delta
	var tempSpeed = speed
	if slowDown:
		tempSpeed /= 2
	if Input.is_action_pressed("right"):
		position.x += tempSpeed * delta
	if Input.is_action_pressed("left"):
		position.x -= tempSpeed * delta
	if Input.is_action_pressed("up"):
		position.y -= tempSpeed * delta
	if Input.is_action_pressed("down"):
		position.y += tempSpeed * delta

	if global_position.x >= 853/2 - 16 :
		position.x -= speed * delta
	if global_position.x <= -853/2 + 16 :
		position.x += speed * delta

func _input(event):
	if event.is_action_pressed("shoot") && timer.is_stopped():
		is_shooting = true
		shoot()
		timer.start()
	elif event.is_action_released("shoot"):
		timer.stop()
		timer_blaster.stop()
		is_shooting = false
		is_shooting_blaster = false
	if event.is_action_pressed("shoot") && timer_blaster.is_stopped() && have_blaster:
		is_shooting_blaster = true
		shoot_blaster()
		timer_blaster.start()
	if event.is_action_pressed("slowDown"):
		slowDown = true
	elif event.is_action_released("slowDown"):
		slowDown = false

func _on_timer_timeout():
	shoot()
	is_shooting = false

func _on_timer_blaster_timeout():
	shoot_blaster()

func shoot_blaster():
	var bla = Blaster.instantiate()
	var bla2 = Blaster.instantiate()
	owner.add_child(bla)
	owner.add_child(bla2)
	bla.transform = $LeftCanon.global_transform
	bla2.transform = $RightCanon.global_transform
	bla.scale.x = 1
	bla.scale.y = 1
	bla2.scale.x = 1
	bla2.scale.y = 1

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $FrontCanon.global_transform
	b.scale.x = 1
	b.scale.y = 1

func damage(a):
	life -= a
	if life <= 0:
		queue_free()
