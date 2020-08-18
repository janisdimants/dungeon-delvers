///scr_draw_equipment();
// Draw player equipment

scr_get_equipment_mapping();

var _progress_sprite = spr_equipment_progress;
var _combo_progress_sprite = spr_equipment_combo_progress;
var _equipment = player.equipment;
var _hp = player.hp;
var _start_x = width/2 - (24 * scale_x);
var _offset = 16 * scale_x;
var _y = height - 0 * scale_y;
var _icon_y = height - 14 * scale_y;

for (var i = 0; i <= 3; i++) {
  var _current_progress_sprite = _progress_sprite;
  var _progress = _equipment[i, _eq_visual_progress];
  if (_equipment[i, _eq_combo_ready]) {
    _current_progress_sprite = _combo_progress_sprite;
  }
  
  var _progress_fill = (1-_progress) * (sprite_get_number(_progress_sprite) - 1);
  var _x = _start_x + (_offset*i);
  
  // Draw equipment background
  draw_sprite_ext(
    spr_equipment_column,
    0,
    _x,
    _y,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
  
  // Draw equipment icon
  draw_sprite_ext(
    spr_equipment_icon,
    _equipment[i, _eq_icon_index],
    _x,
    _icon_y,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
  
  // Draw equipment progress
  draw_sprite_ext(
    _current_progress_sprite,
    _progress_fill,
    _x,
    _icon_y,
    scale_x,
    scale_y,
    0,
    c_white,
    1
  );
  
  // Draw equipment time
  if (global.debug) {
    draw_text(_x, _icon_y, string(_progress));
  }
}
