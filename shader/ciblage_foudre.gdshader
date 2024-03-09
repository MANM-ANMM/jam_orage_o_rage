shader_type canvas_item;

uniform sampler2D rand1;
uniform float level;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 r1 = texture(rand1, UV);
	COLOR += pow(r1, vec4(1.5));
	
	if (COLOR.r+COLOR.b+COLOR.g < level) {
		COLOR.a = 0.0;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
