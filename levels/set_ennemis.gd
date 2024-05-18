extends Node2D

@export var SimpleTurret : PackedScene
@export var DoubleTurret : PackedScene
@export var TripleTurret : PackedScene
@export var QuadrupleTurret : PackedScene

#[name, pos_x, pos_y, activeRotate]
var allEnnemies = [
	["simple_turret", -75, -375, true],
	["simple_turret", 75, -375, false],
	["simple_turret", -350, -1000, true],
	["simple_turret", -250, -1000, false],
	["double_turret", -150, -1000, true],
	["double_turret", -50, -1000, false],
	["triple_turret", 50, -1000, true],
	["triple_turret", 150, -1000, false],
	["quadruple_turret", 250, -1000, true],
	["quadruple_turret", 350, -1000, false]
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
		get_tree().root.add_child(ennemie)
		ennemie.other_ready(i[1], i[2], i[3])

