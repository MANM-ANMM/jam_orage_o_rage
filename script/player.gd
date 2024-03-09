extends Node2D

@export var speed := PI/15.0
@onready var area_nuages := $altitude/AreaNuages
@export var ciblage_foudre : CiblageFoudre

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Input.get_axis("move_left", "move_right")
	
	rotate(movement*delta*speed)

func _physics_process(delta):
	if Input.is_action_just_pressed("eclair"):
		ciblage_foudre.start_growing()
	if Input.is_action_just_released("eclair"):
		var cibles := ciblage_foudre.get_overlapping_bodies()
		var nuages = area_nuages.get_overlapping_areas().map(func(alt): return alt.get_parent())
		
		var nb : int = min(cibles.size(), nuages.size())
		
		cibles.sort_custom(func(c):return c.global_position.distance_squared_to(global_position))
		
		for i in range(nb):
			nuages[i].lancer_eclair(cibles[i].global_position)
		
		ciblage_foudre.stop_growing()
