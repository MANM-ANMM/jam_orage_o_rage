extends Node2D

@export var eclair:Eclair

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		eclair.start(get_global_mouse_position())
