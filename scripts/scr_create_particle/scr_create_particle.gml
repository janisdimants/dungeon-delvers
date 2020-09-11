/// @description scr_create_particle(len, dir, lifetime, height, bounce, attached)
/// @param len
/// @param  dir
/// @param  lifetime
/// @param  height
/// @param  bounce
/// @param  attached
function scr_create_particle() {
	// Creates an particle of current object
	// Used in projectiles to easily create identical particle
	var _particle = instance_create(x, y, obj_particle);

	// Set sprite properties
	if (instance_exists(_particle)) {
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
	    _particle.lifetime = _lifetime;
	  }
  
	  // Set height prop
	  if (argument_count > 3) {
	    var _height = argument[3];
	    _particle.height = _height;
	  }
  
	  // Set bounce prop
	  if (argument_count > 4) {
	    var _bounce = argument[4];
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
	}

	return _particle;



}
