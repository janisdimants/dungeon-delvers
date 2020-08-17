///scr_draw_health()
// Draw health

var _max_hp = player.max_hp;
var _hp = player.hp;
var _start_x = 42 * scale_x;
var _bottom_padding = 2 * scale_y;
var _offset = 13 * scale_x;

for (var i = 0; i < _max_hp; i++) {
  var _hp_fill = 0;
  var _hp_x = _start_x + (_offset * i);
  
  if (i <= _hp) {
    _hp_fill = round((_hp%1)*10);
    
    if (i+1 <= _hp) {
      _hp_fill = 10;
    }
  }
  
  // Draw hp point background
  draw_sprite_ext(
    spr_hp_column,
    0,
    _hp_x,
    height,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
  // Draw hp point
  draw_sprite_ext(
    spr_player_hp,
    _hp_fill,
    _hp_x,
    height - _bottom_padding,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
}
