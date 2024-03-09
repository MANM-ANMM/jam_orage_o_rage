extends Node2D

class_name Nuage

@onready var timer_pluie := $TimerPluie
var pluie_on := false
@export var eclair:Eclair
const hauteur_nuages := -900

var speed := PI/randf_range(80, 205)
var sens :float= [1].pick_random()

func _ready():
	var tween = get_tree().create_tween()
	var dest := Vector2(0, hauteur_nuages*(1+speed+randf_range(-0.01, 0.01)))
	tween.tween_property($altitude, "position", dest, 0.8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta*speed*sens)

func commencer_pluie():
	timer_pluie.start()
	pluie_on = true
	speed /= 2

func _on_timer_debut_pluie_timeout():
	if not pluie_on:
		commencer_pluie()

func _on_timer_pluie_timeout():
	queue_free()

func lancer_eclair(gposition_end):
	eclair.start(gposition_end)
	if not pluie_on:
		commencer_pluie()
