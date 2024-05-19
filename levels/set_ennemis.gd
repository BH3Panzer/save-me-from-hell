extends Node2D

@export var SimpleTurret : PackedScene
@export var DoubleTurret : PackedScene
@export var TripleTurret : PackedScene
@export var QuadrupleTurret : PackedScene
@export var ShotgunTurret : PackedScene

#[name, pos_x, pos_y, type of turret, rotation, rotation direction (if type==rotating)]
var allEnnemies = [
	["simple_turret", -75, -375, "rotating"],
	["simple_turret", 75, -375, "normal"],
	["shotgun_turret", -300, -800, "rotating"],
	["shotgun_turret", 300, -800, "normal"],
	["simple_turret", -350, -1500, "rotating"],
	["simple_turret", -250, -1500, "normal"],
	["double_turret", -150, -1500, "rotating"],
	["double_turret", -50, -1500, "normal"],
	["triple_turret", 50, -1500, "rotating"],
	["triple_turret", 150, -1500, "normal"],
	["quadruple_turret", 250, -1500, "rotating"],
	["quadruple_turret", 350, -1500, "normal"]
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
		ennemie.other_ready(i[1], i[2], i[3])

