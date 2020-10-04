//
// Base lightning fragment shader
//
#define M_PI 3.1415926535897932384626433832795
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float f_time;

// All components are in the range [0…1], including hue.
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

// All components are in the range [0…1], including hue.
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
		vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord);
		
		// Lightning system
		float sunset_and_rise_light_level = 0.6;
		float ambient = cos(f_time * 2.0 * M_PI) * (1.0 - sunset_and_rise_light_level) + sunset_and_rise_light_level;
		
		// TODO: Read shadow + light data from surface and add as part of light level calculation
		// Illumination [0...1];
		float illumination = ambient;
		float inverse_illumination = (1.0-illumination);
		
		// Define lighting max properties
		float saturation_and_value_shift_percentage = 0.6;
		float hue_shift_percentage = 0.04;
		
		// Get lighted pixel colour
		vec3 hsv = rgb2hsv(texColor.rgb);
		
		float hue = mod(hsv.r + (hue_shift_percentage * inverse_illumination), 1.0);
		float saturation = hsv.g * ((1.0-saturation_and_value_shift_percentage) * illumination + saturation_and_value_shift_percentage);
		float value = hsv.b * ((1.0-saturation_and_value_shift_percentage) * illumination + saturation_and_value_shift_percentage);
		
		vec3 new_rgb = hsv2rgb(vec3(hue, saturation, value));
		
		vec4 new_Colour = vec4(new_rgb.r, new_rgb.g, new_rgb.b, texColor.a);
		
    gl_FragColor = new_Colour;
}