/// @description  Exit if attached
if (attached > 0) {
  exit;
}

/// Update height
if (velocity > 0) {
  velocity += grav * global.frame_time;
  
  height -= velocity * global.frame_time;
  
  if (height < ground_level) {
    height = ground_level;
    velocity *= -bounce;
		
    if (velocity > -0.1) {
      velocity = 0;
    }
  }
}

/// Update rotation

image_angle += rotation_speed * global.frame_time;
rotation_speed -= sign(rotation_speed) * rotation_dampen * global.frame_time;

/// Update movement

scr_move(len, dir);
var _new_len = len - (damp*global.frame_time)
len = max(0, _new_len);

/// Update animation

image_speed = (anim_speed/fps_real)*global.game_speed;

if (anim_speed > 0 && anim_damp > 0) {
  anim_speed = max(anim_speed - anim_damp * global.frame_time, 0);
} else if (anim_speed < 0 && anim_damp < 0) {
  anim_speed = min(anim_speed - anim_damp * global.frame_time, 0);
}

/// Update lifetime

if (lifetime > 0) {
  lifetime -= global.frame_time;
  if (lifetime <= 0) {
    instance_destroy();
  }
}

