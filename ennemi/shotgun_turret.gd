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

func _ready():
	timer.start()

func _physics_process(delta):
	if turretType == "rotating":
		rotation += rotationSpeed * delta

func _on_timer_timeout():
	shoot()
	timer.start()

func other_ready(x, y, type, rotationValue = 0, roationDirection = null):
	position.x = x
	position.y = y
	turretType = type
	rotation = rotationValue
	if turretType != "rotating":
		get_node("Timer").wait_time += 0.5

func shoot():
	var bFL = Bullet.instantiate()
	var bSL = Bullet.instantiate()
	var bL = Bullet.instantiate()
	var bF = Bullet.instantiate()
	var bR = Bullet.instantiate()
	var bSR = Bullet.instantiate()
	var bFR = Bullet.instantiate()
	get_tree().root.add_child(bFL)
	get_tree().root.add_child(bSL)
	get_tree().root.add_child(bL)
	get_tree().root.add_child(bF)
	get_tree().root.add_child(bR)
	get_tree().root.add_child(bSR)
	get_tree().root.add_child(bFR)
	bFL.transform = $FullLeftCanon.global_transform
	bSL.transform = $SecondLeftCanon.global_transform
	bL.transform = $LeftCanon.global_transform
	bF.transform = $FrontCanon.global_transform
	bR.transform = $RightCanon.global_transform
	bSR.transform = $SecondRightCanon.global_transform
	bFR.transform = $FullRightCanon.global_transform
	bFL.scale.x = 1
	bFL.scale.y = 1
	bSL.scale.x = 1
	bSL.scale.y = 1
	bL.scale.x = 1
	bL.scale.y = 1
	bF.scale.x = 1
	bF.scale.y = 1
	bR.scale.x = 1
	bR.scale.y = 1
	bSR.scale.x = 1
	bSR.scale.y = 1
	bFR.scale.x = 1
	bFR.scale.y = 1

func damage(a):
	life -= a
	if life <= 0:
		died()

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
