extends Area2D
class_name Boulet

var vitesse : Vector2
@onready var planete : Node2D = get_parent()
@export var peuple : Types.Peuple

func _physics_process(delta):
	vitesse += (planete.global_position-global_position).normalized()*900.0*delta
	position += vitesse*delta


func _on_body_entered(body):
	if body.has_method("subir_degats") and body.peuple == peuple:
		body.subir_degats(1)
	queue_free()
	

func subir_foudre(foudre:int):
	queue_free()
