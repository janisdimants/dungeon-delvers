///scr_draw_mana()
// Draw mana

var _max_mana = player.max_mana;
var _mana = player.mana;

for (var i = 0; i < _max_mana; i++) {
  var _mana_fill = 0;
  var _mana_x = mana_start_x + (mana_offset * i);
  
  if (i <= _mana) {
    _mana_fill = round((_mana%1)*10);
    
    if (i+1 <= _mana) {
      _mana_fill = 10;
    }
  }
  
  // Draw hp point
  draw_sprite_ext(
    spr_player_mana,
    _mana_fill,
    _mana_x,
    mana_start_y,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
}
