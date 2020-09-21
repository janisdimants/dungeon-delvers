/// @description scr_create_skeleton_death_particles(helmet?)
/// @param helmet?
function scr_create_skeleton_death_particles() {

	var _helmet = false;
	if (argument_count > 0) {
	  _helmet = argument[0];
	}

	// Helmet
	if (_helmet) {
	  var _particle = instance_create(x, y, obj_particle);
  
	  if (!instance_exists(_particle)) { exit; }
  
	  var _dir = point_direction(0, 0, total_move_h, total_move_v);
	  var _len = point_distance(0, 0, total_move_h, total_move_v);
    
	  if (_len < 50) {
	    _dir = random(360);
	    _len = 50 + random(50);
	  }
    
	  _particle.rotation_speed = -90 + random(180);
	  _particle.dir = _dir - 15 + random(30);
	  _particle.len = _len - random(25);
	  _particle.velocity = 0.1 + random(1) * 0.3;
	  _particle.anim_speed = 12;
	  _particle.anim_damp = 4;
  
	  _particle.sprite_index = spr_helmet;
	  _particle.height = 10;
  
	  // Create regular skeleton and update it's velocity to match current
  
	  var _skeleton = instance_create(x, y, obj_skeleton);
	  _skeleton.total_move_h = total_move_h;
	  _skeleton.total_move_v = total_move_v;
  
	  exit;
	}

	// Skeleton head and bones
	var _bone_count = 3 + irandom(2);

	for (var _i = 0; _i < _bone_count; _i++) {
	  var _particle = instance_create(x, y, obj_particle);
	  if (!instance_exists(_particle)) {
	    break;
	  }
	  var _dir = point_direction(0, 0, total_move_h, total_move_v);
	  var _len = point_distance(0, 0, total_move_h, total_move_v);
  
	  // Control particle speed
	  if (_len < 50) {
	    _dir = random(360);
	    _len = 30 + random(20);
	  } else if (_len > 140) {
	    _len -= (_len-140)*0.8;
	  }
  
	  _particle.rotation_speed = -90 + random(180);
	  _particle.dir = _dir - 15 + random(30);
	  _particle.len = _len + random(15);
	  _particle.velocity = 0.1 + random(1) * 0.3;
	  _particle.bounce = 0.5;
	  _particle.damp = 130;
  
	  if (_i == 0) {
	    _particle.sprite_index = spr_skeleton_head;
	    _particle.anim_speed = 14 * (_len / 100);
	    _particle.anim_damp = 8;
	    _particle.damp = 90;
	    _particle.height = 10;
	    _particle.rotation_speed = 0;
	    _particle.image_angle = _dir;
	    _particle.image_index = random(10);
	    _particle.image_yscale = irandom(1)*2 - 1;
	    _particle.mirror_animation_on_wall = true;
	  } else {
	    _particle.sprite_index = spr_skeleton_bone;
	    _particle.height = 4 + random(6);
	  }
	}



}
