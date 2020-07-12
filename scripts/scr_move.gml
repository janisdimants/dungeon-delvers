///scr_move(speed, direction);

var len = argument0;
var dir = argument1;

scr_frame_time();

var collided = false;
var move_offset_check_distance = 2;
var move_offset_move_distance = 2;

// Get move speed
var hspd = lengthdir_x(len, dir) * frame_time;
var vspd = lengthdir_y(len, dir) * frame_time;

if (!place_free(x + hspd, y)) {
  if (hspd > 0) { move_contact_solid(0, hspd); }
  if (hspd < 0) { move_contact_solid(180, hspd); }
  hspd = 0;
  collided = true;
}

if (!place_free(x, y + vspd)) {
  if (vspd > 0) { move_contact_solid(270, vspd); }
  if (vspd < 0) { move_contact_solid(90, vspd); }
  vspd = 0;
  collided = true;
}

x += hspd;
y += vspd;

return collided;
