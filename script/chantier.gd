extends Area2D

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
