///scr_draw_health()
// Draw health

var _max_hp = player.max_hp;
var _hp = player.hp;

for (var i = 0; i < _max_hp; i++) {
  var _hp_fill = 0;
  var _hp_x = hp_start_x + (hp_offset * i);
  
  if (i <= _hp) {
    _hp_fill = round((_hp%1)*10);
    
    if (i+1 <= _hp) {
      _hp_fill = 10;
    }
  }
  
  // Draw hp point
  draw_sprite_ext(
    spr_player_hp,
    _hp_fill,
    _hp_x,
    hp_start_y,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
}
