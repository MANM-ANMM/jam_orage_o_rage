extends Area2D

@export_file var chantier_path : String
@onready var chantier := load(chantier_path)
@onready var timer := $Timer
var counter := 0 :
	set(val):
		counter = val
		timer.paused = counter > 0

func poser_chantier():
	var c = chantier.instantiate()
	c.global_position = global_position
	Nodes.node_batiments.add_child(c)

func _on_area_entered(area):
	counter += 1

func _on_area_exited(area):
	counter -= 1

func _on_body_entered(body):
	counter += 1

func _on_body_exited(body):
	counter -= 1

func _on_timer_timeout():
	poser_chantier()


