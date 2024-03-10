extends Node2D

class_name Nuage

@onready var timer_pluie := $TimerPluie
@onready var sprite := $altitude/Sprite2D
@onready var particule_pluie := $altitude/particule_pluie
var pluie_on := false
@export var eclair:Eclair
const hauteur_nuages := -900

var speed := PI/randf_range(80, 205)
var sens :float= [1].pick_random()

func _ready():
	sprite.frame_coords = Vector2i(randi_range(0, sprite.hframes-1), 0)
	
	var tween = get_tree().create_tween()
	
	var altitude :Node2D= $altitude
	var dest := Vector2(0, hauteur_nuages*(1+speed+randf_range(-0.01, 0.01)))
	tween.tween_property(altitude, "position", dest, 0.8)
	
	var scale_final := altitude.scale
	altitude.scale = Vector2.ZERO
	tween.parallel().tween_property(altitude, "scale", scale_final, 0.6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta*speed*sens)

func commencer_pluie():
	timer_pluie.start()
	sprite.frame_coords.y=1
	particule_pluie.emitting = true
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
