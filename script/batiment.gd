extends Node2D

@export var peuple : Types.Peuple

@export var niveau_construction := 4 :
	set(val):
		niveau_construction = val
		if niveau_construction<=0:
			destruction()


func subir_degats(degats:int):
	niveau_construction -= degats

func destruction():
	queue_free()
