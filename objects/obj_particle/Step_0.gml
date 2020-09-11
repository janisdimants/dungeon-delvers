/// @description  Exit if attached
if (attached > 0) {
  exit;
}

script_execute(scr_frame_time,0,0,0,0,0);
/// Update height

if (velocity > 0) {
  velocity += grav * frame_time;
  
  height -= velocity * frame_time;
  
  if (height < ground_level) {
    height = ground_level;
    velocity *= -bounce;
    
    if (velocity > -0.1) {
      velocity = 0;
    }
  }
}

/// Update rotation

image_angle += rotation_speed * frame_time;
rotation_speed -= sign(rotation_speed) * rotation_dampen * frame_time;

/// Update movement

scr_move(len, dir);
var _new_len = len - (damp*frame_time)
len = max(0, _new_len);

/// Update animation

image_speed = (anim_speed/room_speed)*global.game_speed;

if (anim_speed > 0 && anim_damp > 0) {
  anim_speed = max(anim_speed - anim_damp * frame_time, 0);
} else if (anim_speed < 0 && anim_damp < 0) {
  anim_speed = min(anim_speed - anim_damp * frame_time, 0);
}

/// Update lifetime

if (lifetime > 0) {
  lifetime -= frame_time;
  if (lifetime <= 0) {
    instance_destroy();
  }
}

