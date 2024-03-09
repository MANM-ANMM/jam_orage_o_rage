extends CharacterBody2D

class_name Personnage

@export var peuple : Types.Peuple
@onready var planete : Node2D = get_parent()
const puissance_gravite := 100.0
@export var speed := 10.0
@export var vie := 1 :
	set(val):
		vie = val
		if vie <= 0:
			mourrir()

var direction : float = -1.0

func _process(delta):
	rotation = up_direction.rotated(-PI/2).angle()

func _physics_process(delta):
	var left_direction = compute_directions()
	
	if direction:
		velocity = left_direction * direction * speed
	else:
		velocity = Vector2.ZERO

	velocity += up_direction * puissance_gravite
	
	move_and_slide()

func compute_directions():
	up_direction = (planete.global_position - global_position).normalized()
	return up_direction.rotated(PI/2.0)

func subir_degats(degats:int):
	vie -= degats

func subir_foudre(foudre:int):
	vie -= foudre

func mourrir():
	queue_free()


func _on_timer_mort_timeout():
	mourrir()
