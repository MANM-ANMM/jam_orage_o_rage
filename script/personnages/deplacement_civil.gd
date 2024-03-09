extends Node

@export var personnage : Personnage
@onready var timer := $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	personnage.direction = [-1, 1].pick_random()


func _on_timer_timeout():
	personnage.direction = [-1, 1, personnage.direction].pick_random()
