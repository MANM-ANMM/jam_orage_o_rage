extends Area2D

@export var scene_boulet : PackedScene

@export var peuple : Types.Peuple
@onready var timer := $Timer

var compteur := 0:
	set(val):
		compteur = val
		timer.paused = compteur==0


func _on_body_entered(body):
	if body.peuple != peuple:
		compteur+=1


func _on_body_exited(body):
	if body.peuple != peuple:
		compteur-=1

func tirer():
	var b :Boulet= scene_boulet.instantiate()
	b.global_position = global_position
	var cibles = get_cibles()
	if cibles.is_empty(): return
	var cible :Node2D= cibles.front()
	var distance := cible.global_position.distance_to(global_position)
	var puissance = 0.8855*distance+192.19
	# 305 461
	# 460 600
	# 224.383636474609 391.753890962646
	print(distance," ", puissance)
	b.vitesse = Vector2.from_angle(rotation)*puissance
	Nodes.node_personnages.add_child(b)

func _on_timer_timeout():
	tirer()

func get_cibles():
	var cibles := get_overlapping_bodies().filter(func(b): return b.peuple != peuple)
	cibles.sort_custom(compare_cibles)
	return cibles

func compare_cibles(a, b):
	var da = a.global_position.distance_squared_to(global_position)
	var db = b.global_position.distance_squared_to(global_position)
	return da<db
