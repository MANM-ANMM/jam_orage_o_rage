extends Node2D

@export var eclair:Eclair

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		eclair.end_point = get_global_mouse_position() - eclair.global_position
		eclair.start()
