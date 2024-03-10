extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	Nodes.node_personnages = $Planete/personnages
	Nodes.node_batiments = $Planete/batiments
	Nodes.node_nuages = $Planete/nuages
	Nodes.node_orbit = $Planete/orbit
