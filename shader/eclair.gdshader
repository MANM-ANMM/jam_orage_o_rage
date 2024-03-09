shader_type canvas_item;

uniform vec4 color : source_color;
uniform vec2 point_source;
uniform vec2 point_fin;
uniform float remplissage: hint_range(0.0, 1.0, 0.01);

void fragment() {
	vec2 grad = point_fin - point_source;
	vec2 norm = vec2(grad.y, -grad.x);
	
	float dist = 0.0;
	
	for (float i=0.0; i<remplissage;i+=0.01) {
		vec2 pos_bout = point_source + grad*i+ norm * 0.1;
		dist += distance(UV, pos_bout);
	}
	dist /= 0.01/remplissage;
	
	float transformed_dist = clamp(dist*20.0, 0.0, 1.0);
	COLOR = color;
	COLOR.a *= 1.0-transformed_dist;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
