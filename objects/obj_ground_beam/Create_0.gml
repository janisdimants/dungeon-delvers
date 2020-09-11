/// @description  Init damage variables
event_inherited();


/// Init groundbeam variables

depth = -y;
groundbeam_img_speed = 20;

/// Create particle effects

var _particle_count = 2 + irandom(2);

for (var _i = 0; _i < _particle_count; _i++) {
  var _particle = instance_create(x, y, obj_particle);
  
  _dir = random(360);
  _len = 30 + random(50);
    
  _particle.rotation_speed = -90 + random(180);
  _particle.dir = _dir;
  _particle.len = _len;
  _particle.velocity = 0.2 + random(1) * 0.2;
  
  _particle.sprite_index = spr_ground_beam_projectile;
  _particle.height = 0;
  _particle.bounce = 0.7;
  _particle.damp = 150;
}

