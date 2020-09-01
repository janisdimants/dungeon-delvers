///scr_create_smoke_puff(x, y, size_multiplier?)
// Creates a smoke particle cloud with variable size
var _x = argument[0];
var _y = argument[1];
var _size = 1;

if (argument_count > 2) {
  _size = argument[2];
}

// Create smoke particle effect
var _count = 8 * _size + irandom(4);

for (var _i = 0; _i < _count; _i++) {
  var _particle = instance_create(_x, _y, obj_particle);
  
  if (instance_exists(_particle)) {
    _particle.image_angle = irandom(4) * 90;
    _particle.rotation_speed = -90 + random(180);
    _particle.dir = random(360);
    _particle.len = 40 + random(20) * _size;
    _particle.height = 2 + random(2) * _size;
    _particle.velocity = -5 + random(6) * _size;
    _particle.grav = 2;
    _particle.sprite_index = spr_smoke;
    _particle.destroy_after_animation = true;
    _particle.anim_speed = 10+random(6);
    _particle.draw_shadow = false;
  }
}
