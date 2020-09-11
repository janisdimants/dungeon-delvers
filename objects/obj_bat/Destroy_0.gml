/// @description  Create bat death particles

var _part_count = 2;

for (var i = 0; i < _part_count; i++) {
  var _particle = instance_create(x, y, obj_particle);
  var _dir = point_direction(0, 0, total_move_h, total_move_v);
  var _len = point_distance(0, 0, total_move_h, total_move_v);
  
  if (_len < 50) {
    _dir = random(360);
    _len = 50 + random(50);
  }
  
  _particle.rotation_speed = -90 + random(180);
  _particle.dir = _dir - 15 + random(30);
  _particle.len = _len - random(25);
  _particle.fall_speed = 0;
  
  if (i == 0) {
    _particle.sprite_index = spr_bat_head;
    _particle.height = 5;
  } else {
    _particle.sprite_index = spr_bat_wing;
    _particle.height = 6;
  }
}

