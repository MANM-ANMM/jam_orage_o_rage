extends Node


@export var personnage : Personnage
var global_speed := 1.5
@export var sprite : Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	personnage.direction = [-global_speed, global_speed].pick_random()
	sprite.flip_h = personnage.direction>0

