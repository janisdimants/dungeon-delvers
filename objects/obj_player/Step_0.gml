/// @description  Control the logic
script_execute(state);

/// Update Sprite
var _total_move_speed = point_distance(0, 0, total_move_h, total_move_v);
var _move_speed_percentage = _total_move_speed / 100;

sprite_index = body[face];
image_speed = (body_img_speed/room_speed)*_move_speed_percentage*global.game_speed;

depth = -y;


/// Stat update (Restore mana)

mana += mana_restore_rate * global.frame_time;

if (mana > max_mana) {
  mana = max_mana;
}

