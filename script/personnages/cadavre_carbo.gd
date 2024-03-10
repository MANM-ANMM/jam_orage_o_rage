extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween := get_tree().create_tween()
	tween.tween_interval(0.5)
	var modu_disparaitre = modulate
	modu_disparaitre.a = 0
	tween.tween_property(self, "modulate", modu_disparaitre, 0.3)
	tween.tween_callback(queue_free)
