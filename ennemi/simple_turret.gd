extends CharacterBody2D

var rotationSpeed = 1
@export var SpeedBulletPowerUp : PackedScene
@export var SpeedBulletPowerDown : PackedScene
@export var SpeedMovePowerUp : PackedScene
@export var SpeedMovePowerDown : PackedScene
@export var BlasterPowerUp : PackedScene
@export var Bullet : PackedScene
@onready var timer = $Timer
var turretType = null
var life = 50
var rDirection = null

func _ready():
	timer.start()

func _physics_process(delta):
	if turretType == "rotating":
		rotation += rotationSpeed * delta * rDirection

func _on_timer_timeout():
	shoot()
	timer.start()

func other_ready(x, y, type, rotationValue, roationDirection):
	position.x = x
	position.y = y
	turretType = type
	rotation = deg_to_rad(rotationValue)
	rDirection = roationDirection
	if turretType != "rotating":
		get_node("Timer").wait_time += 0.5

func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = $FrontCanon.global_transform
	b.scale.x = 1
	b.scale.y = 1

func damage(a):
	$Sprite2D.modulate = Color(1, 0, 0)
	life -= a
	if life <= 0:
		died()
	$HitTimer.start()

func died():
	var loot = randi() % 100
	var bonus = null
	if loot >= 95 and loot <= 97:
		bonus = BlasterPowerUp.instantiate()
	elif loot >= 85 and loot < 95:
		bonus = SpeedBulletPowerUp.instantiate()
	elif loot >= 75 and loot < 85:
		bonus = SpeedBulletPowerDown.instantiate()
	elif loot >= 68 and loot < 75:
		bonus = SpeedMovePowerUp.instantiate()
	elif loot >= 61 and loot < 68:
		bonus = SpeedMovePowerDown.instantiate()
	if bonus != null:
		get_tree().root.add_child(bonus)
		bonus.position.x = position.x
		bonus.position.y = position.y
		bonus.scale.x = 1
		bonus.scale.y = 1
	queue_free()


func _on_hit_timer_timeout():
	$Sprite2D.modulate = Color(1, 1, 1)
