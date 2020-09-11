/// @description  Inherit parent
event_inherited();

/// Update sprite

depth = -y;

if (stun_timer <= 0) {
  image_speed = 27 / room_speed * global.game_speed;
  sprite_index = spr_bat;
} else {
  sprite_index = spr_bat;
  image_speed = 0;
  image_index = ((stun_time - stun_timer) / stun_time) * image_number;
}

