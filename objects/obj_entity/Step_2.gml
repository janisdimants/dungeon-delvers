/// @description  Movement

var _damp_amount = damp_amount;

// Calculates movement

// Counteracts damping for movement
var _move_amount = len * acceleration + (sign(len) * _damp_amount); // 300
var _total_speed = point_distance(0, 0, total_move_h, total_move_v); // 50

if (_total_speed > move_cap) {
  _move_amount = 0;
}

var _move_h = lengthdir_x(_move_amount, dir);
var _move_v = lengthdir_y(_move_amount, dir);

total_move_h += (_move_h + kb_h) * global.frame_time;
total_move_v += (_move_v + kb_v) * global.frame_time;

// Damping gets applied based on direction
var _total_dir = point_direction(0, 0, total_move_h, total_move_v);
var _total_speed = point_distance(0, 0, total_move_h, total_move_v);

damp_h = lengthdir_x(1, _total_dir) * _damp_amount * global.frame_time;
damp_v = lengthdir_y(1, _total_dir) * _damp_amount * global.frame_time;

if (abs(total_move_h) < abs(damp_h)) { damp_h = total_move_h; }
if (abs(total_move_v) < abs(damp_v)) { damp_v = total_move_v; }

total_move_h -= damp_h;
total_move_v -= damp_v;

// Limit the speed
if (_total_speed > max_speed) {
  total_move_h = lengthdir_x(max_speed, _total_dir);
  total_move_v = lengthdir_y(max_speed, _total_dir);
}

scr_move_entity(total_move_h, total_move_v);

// Status effects
scr_update_status_effects();

