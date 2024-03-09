extends Node


@export var personnage : Personnage
# Called when the node enters the scene tree for the first time.
func _ready():
	personnage.direction = [-1, 1].pick_random()

