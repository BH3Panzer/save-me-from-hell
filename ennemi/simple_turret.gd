extends CharacterBody2D

var rotationSpeed = 1
@export var Bullet : PackedScene
@onready var timer = $Timer
var rotationEnable = true
var life = 50

func _ready():
	timer.start()

func _physics_process(delta):
	if rotationEnable:
		rotation += rotationSpeed * delta

func _on_timer_timeout():
	shoot()
	timer.start()

func other_ready(x, y, activeRotate):
	position.x = x
	position.y = y
	rotationEnable = activeRotate
	if not rotationEnable:
		get_node("Timer").wait_time += 0.5

func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = $FrontCanon.global_transform
	b.scale.x = 1
	b.scale.y = 1

func damage(a):
	life -= a
	if life <= 0:
		died()

func died():
	var loot = randi() % 100
	queue_free()
