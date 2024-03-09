extends Node2D

@export var speed:=PI/15.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Input.get_axis("move_left", "move_right")
	
	rotate(movement*delta*speed)
