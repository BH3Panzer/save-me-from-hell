extends Node2D

@export var SimpleTurret : PackedScene
@export var DoubleTurret : PackedScene
@export var TripleTurret : PackedScene
@export var QuadrupleTurret : PackedScene
@export var ShotgunTurret : PackedScene

#[name, pos_x, pos_y, type of turret, rotation, rotation direction (if type==rotating)]
var allEnnemies = [
	["simple_turret", -200, -375, "normal", -45, null],
	["simple_turret", 200, -375, "normal", 45, null],
	["double_turret", 0, -500, "rotating", 0, 1],
	
	["simple_turret", -400, -700, "rotating", -20, 1],
	["simple_turret", -200, -800, "rotating", 180, -1],
	["simple_turret", 200, -800, "rotating", 180, -1],
	["simple_turret", 400, -700, "rotating", 20, 1],
	
	["shotgun_turret", 0, -1100, "normal", 0, null],
	["simple_turret", -100, -1120, "normal", 10, null],
	["simple_turret", 100, -1120, "normal", -10, null],
	["simple_turret", -150, -1140, "normal", 30, null],
	["simple_turret", 150, -1140, "normal", -30, null],
	
	["simple_turret", -400, -1300, "normal", 0, null],
	["simple_turret", -360, -1300, "normal", -45, null],
	["simple_turret", -360, -1340, "normal", -90, null],
	["simple_turret", 400, -1300, "normal", 0, null],
	["simple_turret", 360, -1300, "normal", 45, null],
	["simple_turret", 360, -1340, "normal", 90, null],
	["simple_turret", -20, -1380, "rotating", -45, 1],
	["simple_turret", 20, -1380, "rotating", 45, -1],
	
	["quadruple_turret", -200, -1700, "rotating", -45, 1],
	["quadruple_turret", 200, -1700, "rotating", 45, -1],
	
	["double_turret", -300, -1900, "normal", 90, null],
	["double_turret", -270, -1900, "normal", 90, null],
	["double_turret", -100, -1900, "normal", 90, null],
	["double_turret", -70, -1900, "normal", 90, null],
	["double_turret", 70, -1900, "normal", 90, null],
	["double_turret", 100, -1900, "normal", 90, null],
	["double_turret", 270, -1900, "normal", 90, null],
	["double_turret", 300, -1900, "normal", 90, null],
	
	["triple_turret", -300, -2300, "normal", -75, null],
	["triple_turret", 300, -2300, "normal", 75, null],
	["shotgun_turret", 0, -2400, "normal", 0, null],
	
	["shotgun_turret", -400, -2600, "normal", -30, null],
	["shotgun_turret", 400, -2600, "normal", 30, null],
	
	["double_turret", -310, -2900, "rotating", 90, 1],
	["double_turret", -270, 2900, "rotating", 90, -1],
	["double_turret", -110, -2900, "rotating", 90, 1],
	["double_turret", -70, -2900, "rotating", 90, -1],
	["double_turret", 70, -2900, "rotating", 90, 1],
	["double_turret", 110, -2900, "rotating", 90, -1],
	["double_turret", 270, -2900, "rotating", 90, 1],
	["double_turret", 310, -2900, "rotating", 90, -1]
	]

func _ready():
	for i in allEnnemies:
		var ennemie = null
		if i[0] == "simple_turret":
			ennemie = SimpleTurret.instantiate()
		elif i[0] == "double_turret":
			ennemie = DoubleTurret.instantiate()
		elif i[0] == "triple_turret":
			ennemie = TripleTurret.instantiate()
		elif i[0] == "quadruple_turret":
			ennemie = QuadrupleTurret.instantiate()
		elif i[0] == "shotgun_turret":
			ennemie = ShotgunTurret.instantiate()
		get_tree().root.add_child(ennemie)
		ennemie.other_ready(i[1], i[2], i[3], i[4], i[5])

