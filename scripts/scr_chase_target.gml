///scr_chase_target(target, stop_distance?)
// Base movement state for enemies, with logic to chase their target
// Returns boolean of target_reached

var _target = argument[0];
var _stop_distance = 6;
if (argument_count > 1) {
  _stop_distance = argument[1];
}

// Check if target is reached
var _distance = point_distance(x, y, _target.x, _target.y);
var _target_reached = (_distance <= _stop_distance);

if (_target_reached) {
  return _target_reached;
}

// Move towards target
move_cap = move_speed;
dir = point_direction(x, y, _target.x, _target.y);
len = 1;

if (mirror_towards_enemy) {
  image_xscale = (_target.x > x)*2-1;
}

// Stop movement while stunned
if (stun_timer > 0) {
  len = 0;
}

return _target_reached;

