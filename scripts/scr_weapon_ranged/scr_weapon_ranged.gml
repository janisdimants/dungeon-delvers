/// @description scr_weapon_ranged()
function scr_weapon_ranged(_slot) {

	// INPUT LOGIC
	if (!equipment[_slot, _eq_active] && equipment[_slot, _eq_input_down]) {
	  equipment[_slot, _eq_active] = true;
	}

	// "Ready" visual progress
	if (!equipment[_slot, _eq_active]) {
	  equipment[_slot, _eq_visual_progress] = 1;
	  exit;
	}
	
	// ATTACK LOGIC
	// Update progresses
	equipment[_slot, _eq_progress_time] += frame_time;
	equipment[_slot, _eq_visual_progress] = (equipment[_slot, _eq_progress_time] / equipment[_slot, _eq_time]);

	// Update sprite
	var _img_number = sprite_get_number(equipment[_slot, _eq_sprite]);
	var _forw_offset = 8;
	var _side_offset = 0;
	equipment[_slot, _eq_image_index] = (equipment[_slot, _eq_progress_time]/equipment[_slot, _eq_time]) * _img_number;

	focused_equipment = _slot;
	
	// Equipment control
	var release = equipment[_slot, _eq_input_up];

	if (equipment[_slot, _eq_progress_time] >= equipment[_slot, _eq_execution_time]) {
	  if (!equipment[_slot, _eq_executed] && !release) {
			// Not shot and not released shot
	    // Hold the shot in same position
	    equipment[_slot, _eq_progress_time] = equipment[_slot, _eq_execution_time];
	  }
	  if (!equipment[_slot, _eq_executed] && release) {
	    // Attack
	    equipment[_slot, _eq_executed] = true;
    
	    var _projectile = scr_create_inst_offset(
	      obj_arrow,
	      _forw_offset,
	      _side_offset,
	      attack_direction
	    );
	    _projectile.team = team;
	    _projectile.damage = equipment[_slot, _eq_damage];
	    _projectile.knockback_dir = attack_direction;
	    _projectile.knockback_amount = equipment[_slot, _eq_knockback];
	    _projectile.dir = attack_direction;
	    _projectile.spd = 140;
	    _projectile.height = equipment[_slot, _eq_height];
			
			// Apply modifiers
			_projectile.modifiers = equipment[_slot, _eq_modifiers];
    
	    // Play sound effect
	    audio_play_sound(snd_bow_shoot, 0, false);
	  }
	}
	
	// Combo timing
	if (equipment[_slot, _eq_combo_ready] && equipment[_slot, _eq_input_down]) {
	  equipment[_slot, _eq_combo_ready] = false;
	  equipment[_slot, _eq_executed] = false;
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_active] = true;
	}

	// Return to normal
	if (equipment[_slot, _eq_active] && equipment[_slot, _eq_progress_time] > equipment[_slot, _eq_time]) {
	  equipment[_slot, _eq_executed] = false;
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_combo_ready] = false;
	  equipment[_slot, _eq_active] = false;
	focused_equipment = -1;
	}



}
