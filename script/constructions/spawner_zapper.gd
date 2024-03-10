extends StaticBody2D

signal spawn_zapper(pos)

func subir_foudre(foudre:int):
	spawn_zapper.emit(global_position)
