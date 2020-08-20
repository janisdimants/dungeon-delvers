///scr_draw_text(x, y, size, text, centered?)
// Requires scale_x and scale_y variables to be set on instance for drawing

var _x = argument[0];
var _y = argument[1];
var _text = argument[3];
var _size = argument[2];
var _centered = false;

if (argument_count > 4) {
  _centered = argument[4];
}

var _font_sprite;

switch (_size) {
  case 12:
    _font_sprite = spr_font_12;
    break;
  case 10:
    _font_sprite = spr_font_10;
    break;
  case 8:
    _font_sprite = spr_font_8;
    break;
  case 6:
    _font_sprite = spr_font_6;
    break;
}

var _spacing = 1;


// Character base offset within sprite
_x -= 2 * scale_x;
_y -= (16-_size) * 0.5 * scale_y;

if (_centered) {
  _x -= scr_get_text_width(_text, _size, _spacing)/2;
}

for (var i = 0; i < string_length(_text); i++) {
  var _char = string_char_at(_text, i+1)
  var _char_id = scr_get_char_index(_char);
  
  draw_sprite_ext(
    _font_sprite,
    _char_id,
    _x,
    _y,
    scale_x,
    scale_y,
    0,
    image_blend,
    1
  );
    
  _x += (scr_get_char_width(_char, _size) + _spacing) * scale_x;
}


