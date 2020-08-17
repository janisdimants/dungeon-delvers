///scr_move_state();

if (global.game_speed <= 0) { exit; }


// Check for action inputs
/*if (!active_attack) {
  if (attack1_key_down) { active_attack = weapon; }
  if (attack2_key_down) { active_attack = spell; }
  if (dash_key && len != 0) { state = dodge; }
}*/
// Execute equipment
scr_get_input();
scr_get_equipment_mapping();

for (var i = 0; i < array_height_2d(equipment); i++) {
  if (equipment[i, _eq_script]) {
    switch (i)
    {
        case 1:
          equipment[i, _eq_input_down] = attack1_key_down;
          equipment[i, _eq_input_up] = attack1_key_up;
          break;
    }
     
    // Update equipment inputs
    
    // Execute
    script_execute(equipment[i, _eq_script], i, false);
  }
}

// Calculate input direction and amount
dir = point_direction(0, 0, input_x, input_y);
move_percentage = min(point_distance(0, 0, input_x, input_y), 1);

// Apply move speed modifiers
move_speed_modifier = 1;

// Get movement speed
if (abs(input_x) < global.deadzone && abs(input_y) < global.deadzone) {
  len = 0;
  image_index = 0;
} else {
  len = move_percentage;
  scr_get_face();
}

// Update movement cap
move_cap = move_speed * move_speed_modifier;

//if (!active_attack) {
  scr_get_head_direction();
  attack_direction = pointer_direction;
//} else {
//  script_execute(active_attack, false);
//}

// Updates bobbing movement based on current image
var bob_value = (image_index/image_number) * pi * 2;
bob_amount = abs(sin(bob_value));

// Play footstep sound if player is landing from bob
if (bob_amount < .1) {
  if (!footstep_sound_played) {
    var _footstep_sounds;
    _footstep_sounds[0] = snd_footstep_1;
    _footstep_sounds[1] = snd_footstep_2;
    _footstep_sounds[2] = snd_footstep_3;
    _footstep_sounds[3] = snd_footstep_4;
    _footstep_sounds[4] = snd_footstep_5;
    
    var _sound_to_play = irandom_range(0, 4);
    
    audio_play_sound(_footstep_sounds[_sound_to_play], 0, false);
    footstep_sound_played = true;
  }
} else if (bob_amount > .7) {
  // Player is up high enough to create new footstep sound
  footstep_sound_played = false;
}
