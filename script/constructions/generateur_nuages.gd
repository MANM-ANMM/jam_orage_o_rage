extends Timer

@export var scene_nuage : PackedScene


func _on_timeout():
	var p := scene_nuage.instantiate()
	p.position = Vector2.ZERO
	p.rotation = (get_parent().global_position-Nodes.node_nuages.global_position).rotated(PI/2).angle()
	Nodes.node_nuages.add_child(p)
