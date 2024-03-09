extends Node

@export var personnage : Personnage
@onready var timer := $Timer
var global_speed := 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	personnage.direction = [-global_speed, global_speed].pick_random()


func _on_timer_timeout():
	personnage.direction = [-global_speed, global_speed, personnage.direction, personnage.direction].pick_random()
