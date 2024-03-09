extends Area2D

var chantier_ref : WeakRef = null
@onready var timer := $Timer
@export var peuple : Types.Peuple

func _on_area_entered(area):
	if area.peuple != peuple:
		return
	chantier_ref = weakref(area)
	timer.start()

func _on_area_exited(area):
	if area.peuple != peuple:
		return
	chantier_ref = null
	timer.stop()


func _on_timer_timeout():
	var chantier : Chantier = chantier_ref.get_ref()
	if not chantier:
		timer.stop()
		return
	
	chantier.niveau_construction += 1
