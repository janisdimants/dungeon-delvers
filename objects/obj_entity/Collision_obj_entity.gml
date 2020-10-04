/// @description  Push back entity from each other

var _dir = point_direction(x, y, other.x, other.y);
var _total_move_speed = point_distance(0, 0, total_move_h, total_move_v);
var _push_amount = (_total_move_speed + damp_amount) * global.frame_time;

with (other) {
  scr_apply_force(_push_amount, _dir);
}

