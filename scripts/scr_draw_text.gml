///scr_draw_text(x, y, size, text)
// Requires scale_x and scale_y set

var _x = argument0;
var _y = argument1;
var _text = argument3;
var _size = argument2;

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

var _x_movement = 0;
var _offset = 1;

for (var i = 0; i < string_length(_text); i++) {
  var _char_id = scr_get_char_index(string_char_at(_text, i+1));
  draw_sprite(_font_sprite, _char_id, _x + _x_movement, _y);
  _x_movement += scr_get_char_width(_char_id, _size) + _offset;
}


