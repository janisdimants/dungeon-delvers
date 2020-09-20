/// @description scr_spell_fire(slot, equip?)
/// @param slot
/// @param  equip?
function scr_spell_fire(argument0, argument1) {

	var _slot = argument0;
	var _equip = argument1;

	scr_get_equipment_mapping();

	if (_equip) {
	  equipment[_slot, _eq_script] = scr_spell_fire;
	  equipment[_slot, _eq_active] = false;
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_image_index] = 0;
	  equipment[_slot, _eq_sprite] = spr_fire_hand;
	  equipment[_slot, _eq_icon_index] = 3;
	  equipment[_slot, _eq_height] = 6;
	  equipment[_slot, _eq_damage] = 0.5;
	  equipment[_slot, _eq_knockback] = 30;
	  equipment[_slot, _eq_time] = .15; // animation length
	  equipment[_slot, _eq_executed] = false; //equipment[_slot, _eq_executed]
	  equipment[_slot, _eq_execution_time] = .15;
	  equipment[_slot, _eq_active_movement_modifier] = 0.7;
	  equipment[_slot, _eq_modifiers] = of(
			// Status, Chance, Amount
			of(scr_fire_status, 1, 0.2)
		);
	  exit;
	}

	// INPUT LOGIC
	if (!equipment[_slot, _eq_active] && equipment[_slot, _eq_input_down]) {
	  equipment[_slot, _eq_active] = true;
	}

	if (!equipment[_slot, _eq_active]) {
	  equipment[_slot, _eq_visual_progress] = 1;
	  exit;
	}

	// ATTACK LOGIC

	// Private variables
	var _spell_distance = 50; // projectile distance
	var _cast_rate = 80; // cast rate
	var _cast_time = 1/_cast_rate;
	var _mana_drain_per_second = 1;
	var _projectile_fwd_offset = 8;
	var _projectile_side_offset = -3;
	var _snd = snd_fire;
	var _fade = 100;
  
	scr_get_head_direction();
	attack_direction = pointer_direction;

	var spell_img_number = sprite_get_number(equipment[_slot, _eq_sprite]);
	var release = equipment[_slot, _eq_input_up];

	if (!equipment[_slot, _eq_executed]) {
	  // Update progress time
	  equipment[_slot, _eq_progress_time] += frame_time;
    
	  equipment[_slot, _eq_visual_progress] = 1 - min(equipment[_slot, _eq_progress_time]/(equipment[_slot, _eq_time]-_cast_time), 1);
  
	  // Stop mana regeneration by reverse updating it
	  mana -= mana_restore_rate * frame_time;

	  // Arm extended to shoot
	  if (equipment[_slot, _eq_progress_time] > equipment[_slot, _eq_execution_time]) {
	    // Get projectile count
	    var _progress_amount = equipment[_slot, _eq_progress_time] - equipment[_slot, _eq_execution_time];
	    var _projectile_count = ceil(_progress_amount/_cast_time);
  
	    // Update progress timer, for next shot
	    equipment[_slot, _eq_progress_time] -= _cast_time * _projectile_count;
    
	    if (_progress_amount * _mana_drain_per_second > mana) {
	        // Mana drain is more than available mana
	        _progress_amount -= _cast_time;
	        _projectile_count -= 1;
	        release = true;
	    }
    
	    // Drain mana
	    mana -= _mana_drain_per_second * _progress_amount;
    
	    // Play Sound
	    if (!audio_is_playing(_snd)) {
	      // Only play sound if not already playing
	      audio_play_sound(_snd, 0, true);
	      audio_sound_gain(_snd, 0, 0);
	      audio_sound_gain(_snd, 1, _fade);
	    } else if (audio_is_playing(_snd) && audio_sound_get_gain(_snd) == 0) {
	      // Sound was faded out, so, just set gain back to 1 over time
	      audio_sound_gain(_snd, 1, _fade);
	    }

    
	    // Spawn fire projectiles
	    for (var i = 0; i < _projectile_count; i++) {
	      var projectile = scr_create_inst_offset(obj_fire_projectile, _projectile_fwd_offset, _projectile_side_offset, attack_direction);
      
	      var direction_offset = (random_range(-20, 20));
      
	      projectile.team = team;
	      //projectile.damage = equipment[_slot, _eq_damage];
	      projectile.modifiers = equipment[_slot, _eq_modifiers];
	      projectile.knockback = equipment[_slot, _eq_knockback];
	      projectile.piercing = true;
      
      
	      // Creates rounder shape by decreasing distance on sides
	      projectile.distance = _spell_distance - abs(sin(degtorad(direction_offset))*20);
	      projectile.dir = attack_direction + direction_offset;
	      projectile.spd = random_range(70, 90);
	      projectile.height = equipment[_slot, _eq_height] + 0.5;
	    }
	  }
  
	  // If player releases, return back
	  equipment[_slot, _eq_executed] = release;
	  if (release) {
	    var _projectile_lifespan_in_ms = (_spell_distance-15)/85 * 1000;
	    audio_sound_gain(snd_fire, 0, _projectile_lifespan_in_ms);
	  }
	} else {
	  equipment[_slot, _eq_progress_time] -= frame_time;
	  equipment[_slot, _eq_visual_progress] = 1 - max(equipment[_slot, _eq_progress_time]/equipment[_slot, _eq_time], 0);
  
	  if (equipment[_slot, _eq_progress_time] < 0) {
	    // Return to normal state
	    equipment[_slot, _eq_progress_time] = 0;
	    equipment[_slot, _eq_executed] = false;
	    equipment[_slot, _eq_active] = false;
	  }
	}

	// Update sprite
	equipment[_slot, _eq_image_index] = (equipment[_slot, _eq_progress_time]/equipment[_slot, _eq_time]) * spell_img_number;



}
