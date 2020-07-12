///scr_roll(equip?)

var equip = argument0;

if (equip) {
  dodge = scr_roll;
  dodge_speed = 140;
  dodge_length = .5; // Seconds
  dodge_sprite[RIGHT] = spr_roll_right;
  dodge_sprite[UP] = spr_roll_up;
  dodge_sprite[LEFT] = spr_roll_left;
  dodge_sprite[DOWN] = spr_roll_down;
  exit;
}

var _dodge_img_number = sprite_get_number(dodge_sprite[face]);
dodge_img_index += (_dodge_img_number/dodge_length) * frame_time;

// Acceleration
len = 1.4;
// Update movement cap
move_cap = dodge_speed * move_speed_modifier;

// Slow down movement for last 2 animation frames
var _dodge_stop = _dodge_img_number - 2;
if (dodge_img_index >= _dodge_stop) {
    move_cap = dodge_speed/4;
}

// Return to move state
if (dodge_img_index > _dodge_img_number) {
  dodge_img_index = 0;
  state = move;
}
