extends Area2D

@export var spawners : Array[Timer]
@export var seuil = 30

var compteur := 0:
	set(val):
		compteur = val
		
		for t in spawners:
			t.paused = compteur>seuil


func _on_body_entered(body):
	compteur+=1


func _on_body_exited(body):
	compteur-=1
