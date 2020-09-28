/// @description scr_weapon_ranged()
function scr_weapon_ranged(_slot) {

	// INPUT LOGIC
	if (!equipment[_slot, _eq_active] && equipment[_slot, _eq_input_down]) {
	  equipment[_slot, _eq_active] = true;
	}

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

	// Equipment control
	var release = equipment[_slot, _eq_input_up];
	show_spell = false;

	if (equipment[_slot, _eq_progress_time] >  equipment[_slot, _eq_execution_time]) {
	  if (!attacked && !release) {
	    // Hold the bow
	    weapon_img_index = weapon_attack_frame;
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
	    _projectile.damage = weapon_damage;
	    _projectile.knockback_dir = attack_direction;
	    _projectile.knockback_amount = weapon_knockback;
	    _projectile.stun_time = weapon_stun;
	    _projectile.dir = attack_direction;
	    _projectile.spd = 140;
	    _projectile.height = weapon_height;
    
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
		show_spell = true;
	}



}
