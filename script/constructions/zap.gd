extends StaticBody2D

var charge := 1
@export var peuple : Types.Peuple
@onready var eclair := $Eclair
@onready var detection := $DetectAttaque


func subir_foudre(foudre:int):
	charge += 2*foudre
	var cibles :Array= detection.get_overlapping_areas() + detection.get_overlapping_bodies()
	cibles = cibles.filter(recognise)
	for c in cibles:
		zap.call_deferred(c.global_position)

func zap(pos:Vector2):
	print("zap")
	if charge > 0:
		eclair.start(pos)
		charge-=1

func _on_detect_attaque_body_entered(body):
	if recognise(body):
		zap.call_deferred(body.global_position)


func _on_detect_attaque_area_entered(area):
	print(area)
	if recognise(area):
		zap.call_deferred(area.global_position)

func recognise(b):
	return b != self and b.peuple != peuple
