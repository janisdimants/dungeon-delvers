//
// Sprite outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;
uniform vec4 outlineColor; 

void main()
{
  vec2 offsetx;
  offsetx.x = pixelW;
  vec2 offsety;
  offsety.y = pixelH;

  float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;

  alpha = ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx).a);
  alpha = ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx).a);
  alpha = ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsety).a);
  alpha = ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsety).a);

  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
  gl_FragColor.a = alpha;
}
