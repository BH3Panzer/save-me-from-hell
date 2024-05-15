extends CharacterBody2D


@export var Bullet : PackedScene
@onready var timer = $Timer

func _ready():
	timer.start()

func _on_timer_timeout():
	shoot()
	timer.start()

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $FrontCanon.global_transform
	b.scale.x = 1
	b.scale.y = 1
	var b2 = Bullet.instantiate()
	owner.add_child(b2)
	b2.transform = $BackCanon.global_transform
	b2.scale.x = 1
	b2.scale.y = 1
