///scr_draw_mana()
// Draw mana

var _sprite = spr_player_mana;
var _max_mana = player.max_mana;
var _mana = player.mana;
var _x = 48 * scale_x;
var _y = 0 * scale_y;

var _hp_fill = (_mana/_max_mana) * (sprite_get_number(_sprite) - 1);

// Draw hp point
draw_sprite_ext(
  _sprite,
  _hp_fill,
  width/2 + _x,
  height - _y,
  scale_x,
  scale_y,
  0,
  c_white,
  1
);
