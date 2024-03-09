extends CharacterBody2D

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
	up_direction = (planete.global_position - global_position).normalized()
	var left_direction := up_direction.rotated(PI/2.0)
	
	if direction:
		velocity = left_direction * direction * speed
	else:
		velocity.x = move_toward(velocity.x, left_direction.x*direction, speed)
		velocity.y = move_toward(velocity.y, left_direction.y*direction, speed)

	velocity += up_direction * puissance_gravite
	
	move_and_slide()

func subir_degats(degats:int):
	vie -= degats

func subir_foudre(foudre:int):
	vie -= foudre

func mourrir():
	queue_free()
