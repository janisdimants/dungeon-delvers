
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = vec4( 0.1, 0.1 , 0.1, v_vColour * 0.2) * texture2D( gm_BaseTexture, v_vTexcoord );
}

