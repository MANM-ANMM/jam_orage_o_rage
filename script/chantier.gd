extends StaticBody2D

class_name Chantier

@export var peuple : Types.Peuple
@export var animated_sprite : AnimatedSprite2D
@export var batiment : PackedScene
var niveau_construction := 0 :
	set(val):
		niveau_construction = val
		if niveau_construction >= difficulte_construction:
			spawn_batiment()
		elif niveau_construction<0:
			destruction()
		elif animated_sprite:
			animated_sprite.frame = val

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

func subir_degats(degats:int):
	niveau_construction -= degats


func destruction():
	queue_free()
