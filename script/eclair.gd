extends Line2D

class_name Eclair

@export_range(0.45,0.75) var ratio = 0.6
@onready var collision_shape_foudre := $ZoneFoudre/CollisionShape2D

func _ready():
	visible = false

func start(gpos):
	var end_point = (gpos - global_position).rotated(-global_rotation) / scale.x
	collision_shape_foudre.position = end_point
	collision_shape_foudre.disabled = false
	
	visible = true
	points[0] = Vector2.ZERO
	points[3] = end_point
	var dir = end_point
	var angle := PI / randf_range(10.0,18.0)
	var signe :float= sign(end_point.x)
	
	points[1] = dir.rotated(angle*signe) * ratio
	points[2] = end_point - dir.rotated(angle*signe) * ratio
	
	gradient.offsets = [0.0, 0.2]
	var tween := get_tree().create_tween()
	var new_offsets : PackedFloat32Array = [0.99, 1.0]
	tween.tween_property(gradient, "offsets", new_offsets, 0.1)
	tween.tween_interval(0.1)
	tween.tween_callback(func(): visible=false)
	tween.tween_callback(func(): collision_shape_foudre.disabled = true)


func _on_zone_foudre_body_entered(body):
	if visible:
		body.subir_foudre(1)


func _on_zone_foudre_area_entered(area):
	if visible:
		area.subir_foudre(1)
