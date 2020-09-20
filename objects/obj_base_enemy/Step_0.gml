/// @description  Check if dead

if (hp <= 0) {
  instance_destroy();
}

/// Update state

target = scr_find_target();

if (target) {
  var _finished = false;
  
  if (!target_reached) {
    target_reached = script_execute(move_state, target, range);
  } else {
    _finished = script_execute(attack_state, target);
  }
  
  if (_finished) {
    // Go back to move state after attack is done
    target_reached = false;
  }
}

/// Update sprite

depth = -y;

if (hit_timer <= 0 && scr_get_status_amount(scr_get_status(scr_stun_status)) <= 0) {
  sprite_index = move_sprite;
  image_speed = anim_speed / room_speed * global.game_speed;
} else if (hit_timer > 0) {
  sprite_index = hit_sprite;
  image_speed = 0;
  image_index = ((hit_time - hit_timer) / hit_time) * image_number;
}

