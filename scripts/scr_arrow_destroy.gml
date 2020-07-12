///scr_arrow_destroy(instance_hit)

/// Create a particle
var _instance_hit = noone;
if (argument_count > 0) {
  _instance_hit = argument[0];
}
var _len = spd * .5;
var _dir = dir;
var _lifetime = room_speed * 3;
var _bounciness = 0.3;
scr_create_particle(_len, _dir, _lifetime, height, _bounciness, _instance_hit);
