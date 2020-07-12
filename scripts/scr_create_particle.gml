///scr_create_particle(len, dir, lifetime, height, bounce, attached)
// Creates an particle of current object
var _particle = instance_create(x, y, obj_particle);

// Set sprite properties
_particle.sprite_index = sprite_index;
_particle.image_index = image_index;
_particle.image_angle = image_angle;
_particle.image_xscale = image_xscale;
_particle.image_yscale = image_yscale;
_particle.image_speed = 0;
_particle.image_alpha = image_alpha;
_particle.depth = depth;

// Set movement length and direction
if (argument_count > 1) {
  var _len = argument[0];
  var _dir = argument[1];
  _particle.len = _len;
  _particle.dir = _dir;
}
// Set particle lifetime
if (argument_count > 2) {
  var _lifetime = argument[2];
  _particle.alarm[0] = _lifetime;
}

// Set physics props
if (argument_count > 4) {
  var _height = argument[3];
  var _bounce = argument[4];
  _particle.height = _height;
  _particle.bounce = _bounce;
}

// Set physics props
if (argument_count > 5) {
  var _attached = argument[5];
  if (_attached > 0) {
    _particle.attached = _attached;
    _particle.attach_offset_x = (x - _attached.x) * 0.4;
    _particle.attach_offset_y = (y - _attached.y) * 0.4;
  }
}
