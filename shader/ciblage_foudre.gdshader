shader_type canvas_item;

uniform sampler2D rand1;
uniform float level;

const float seuil_min = 0.5;
const float fourchette = 0.3;
const float frequence_base = 50.0;

uniform vec2[10] origines_deformations;
uniform int nb_deformations;
uniform float[10] rayons_deformations;

void vertex() {
	// Called for every vertex the material is visible on.
}

vec2 attirance(vec2 pos, vec2 origine_attirance, float rayon, float force) {
	float dist = distance(pos, origine_attirance);
	if (dist>=rayon) {
		return pos;
	}
	
	vec2 dir_centre = normalize(origine_attirance-pos);
	
	return pos + dir_centre*(dist-rayon)*force;
}

void fragment() {
	vec2 position = UV;
	for (int i=0; i<nb_deformations; ++i) {
		position = attirance(position, origines_deformations[i], rayons_deformations[i], level);
	}
	
	COLOR = texture(TEXTURE, position);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
