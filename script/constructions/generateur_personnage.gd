extends Timer

@export var scene_personnage : PackedScene


func _on_timeout():
	var p := scene_personnage.instantiate()
	p.global_position = get_parent().global_position
	Nodes.node_personnages.add_child(p)
