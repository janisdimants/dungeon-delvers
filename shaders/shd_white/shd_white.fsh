
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    col.r += .9;
    col.g += .9;
    col.b += .9;
    gl_FragColor = col;
}

