extends Node2D
class_name OrbitalLauncher

@export var scene_orbit : PackedScene

var package_to_drop := false
@export var peuple : Types.Peuple

func drop_package(pos):
	package_to_drop = false
	var so :Node2D= scene_orbit.instantiate()
	so.global_position = pos*2
	Nodes.node_orbit.add_child(so)

func landing_point(pos : Vector2):
	if package_to_drop:
		drop_package(pos)

func start_launch_procedure():
	package_to_drop = true
	EventBus.ask_landing_point.emit(self)
