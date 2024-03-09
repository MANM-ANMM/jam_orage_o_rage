extends Area2D

class_name CiblageFoudre

var do_grow:=false
@export var grow_speed := 10.0
@export var max_grow := 20.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	if do_grow and scale.x<max_grow:
		scale.x+=delta*grow_speed*log(scale.x*10+0.01)
		scale.y = scale.x

func stop_growing():
	do_grow = false
	scale = Vector2.ONE

func start_growing():
	do_grow = true
