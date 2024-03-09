extends Area2D

@export var chantier : PackedScene
@onready var timer := $Timer

func poser_chantier():
	var c = chantier.instantiate()
	c.global_position = global_position
	Nodes.node_batiments.add_child(c)

func _on_area_entered(area):
	timer.paused = true

func _on_area_exited(area):
	timer.paused = false

func _on_body_entered(body):
	timer.paused = true

func _on_body_exited(body):
	timer.paused = false

func _on_timer_timeout():
	poser_chantier()


