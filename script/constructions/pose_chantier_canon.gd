extends CharacterBody2D

@onready var planete : Node2D = get_parent()
const puissance_gravite := 100.0
@export var chantier : PackedScene

func _physics_process(delta):
	up_direction = (planete.global_position - global_position).normalized()
	
	velocity += up_direction * puissance_gravite

	var collision = move_and_collide(velocity*delta)
	if collision:
		spawn_chantier(collision.get_position())
		queue_free()

func spawn_chantier(pos):
		var c := chantier.instantiate()
		c.global_position = pos
		Nodes.node_batiments.add_child(c)
