/// @description scr_roll(slot, equip?)
/// @param slot
/// @param  equip?
function scr_roll() {

	var _slot = argument[0];
	var _equip = false;
	if (argument_count > 1) {
	  _equip = argument[1];
	}

	if (_equip) {
	  equipment[_slot, _eq_script] = scr_roll;
	  equipment[_slot, _eq_active] = false;
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_time] = 0.5;
	  equipment[_slot, _eq_visual_progress] = 0;
	  equipment[_slot, _eq_image_index] = 0;
	  equipment[_slot, _eq_sprite] = 0; // no visual sprite
	  equipment[_slot, _eq_icon_index] = 1;
	  exit;
	}

	// INPUT LOGIC
	if (!equipment[_slot, _eq_active] && equipment[_slot, _eq_input_down]) {
	  equipment[_slot, _eq_active] = true;
	  state = scr_dodge_state;
	}

	if (!equipment[_slot, _eq_active]) {
	  equipment[_slot, _eq_visual_progress] = 1;
  
	  exit;
	}

	// DODGE LOGIC
	var _dodge_speed = 140;
	var _dodge_sprite;
	_dodge_sprite[RIGHT] = spr_roll_right;
	_dodge_sprite[UP] = spr_roll_up;
	_dodge_sprite[LEFT] = spr_roll_left;
	_dodge_sprite[DOWN] = spr_roll_down;
	var _img_number = sprite_get_number(_dodge_sprite[face]);

	// Update progress time
	equipment[_slot, _eq_progress_time] += global.frame_time;

	// Update progress bar
	equipment[_slot, _eq_visual_progress] = (equipment[_slot, _eq_progress_time] / equipment[_slot, _eq_time]);


	equipment[_slot, _eq_image_index] = (equipment[_slot, _eq_progress_time]/equipment[_slot, _eq_time]) * _img_number;

	// Acceleration
	len = 1.4;
	// Update movement cap
	move_cap = _dodge_speed * move_speed_modifier;

	// Slow down movement for last 2 animation frames
	var _dodge_stop = _img_number - 2;
	if (equipment[_slot, _eq_image_index] >= _dodge_stop) {
	    move_cap = _dodge_speed/4;
	}

	// Return to move state
	if (equipment[_slot, _eq_progress_time] > equipment[_slot, _eq_time]) {
	  equipment[_slot, _eq_active] = false;
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_image_index] = 0;
	  state = move;
	}



}
