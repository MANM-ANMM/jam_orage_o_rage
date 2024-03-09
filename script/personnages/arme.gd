extends Area2D

@export var speed := PI/2
@export var degats := 1
@export var peuple : Types.Peuple

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotate(speed*delta)

func _on_timer_timeout():
	infliger_degats()

func infliger_degats():
	for b in get_overlapping_bodies().filter(func(b): return b.peuple!=peuple):
		b.subir_degats(degats)
