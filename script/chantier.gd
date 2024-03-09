extends StaticBody2D

class_name Chantier

@export var peuple : Types.Peuple
@export var batiment : PackedScene
var niveau_construction := 0 :
	set(val):
		niveau_construction = val
		if niveau_construction >= difficulte_construction:
			spawn_batiment()

@export var difficulte_construction := 4

func spawn_batiment():
	var bat := batiment.instantiate()
	bat.position = position
	bat.rotation = rotation
	add_sibling(bat)
	queue_free()

func _ready():
	var up_direction = (get_parent().global_position - global_position).normalized()
	rotation = up_direction.rotated(-PI/2).angle()
