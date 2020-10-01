/// @description scr_update_wave_status()
function scr_update_wave_status() {

	if (room != rm_arena) { exit; }

	scr_frame_time();

	var _waves_total = 5
	
	if (global.debug) {
		_waves_total = 1;	
	}

	if (!wave_active) {
	  // Pause section between waves
	  wave_cooldown_timer -= frame_time;

	  // Begin the next wave
	  if (wave_cooldown_timer <= 0) {
	    wave += 1;
    
	    if (wave > _waves_total) {
	      scr_end_stage();
	      exit;
	    }
    
	    audio_play_sound(snd_wave_start, 0, false);
    
	    wave_budget = scr_calculate_budget(stage, wave);
	    budget = wave_budget;
	    wave_active = true;
	  }
	} else {
	  if (budget >= 1) {
	    enemy_spawn_timer -= frame_time;

	    // Spawn enemy from remaining budget
	    if (enemy_spawn_timer < 0) {
	      var _max_enemy_budget = wave_budget/min_enemy_count;
	      var _enemy_budget = min(_max_enemy_budget, budget);
      
	      var _enemy = scr_get_enemy_by_budget(budget);
		  
		  if (_enemy == noone) {
			  // Can't "afford" more enemies
			  // end wave
			  budget = 0;
			  exit;
		  }
		  
	      var _enemy_obj = _enemy[0];
	      var _enemy_cost = _enemy[1];
		  budget -= _enemy_cost;
		  
	      instance_create(640, 480, _enemy_obj);
      
	      // Reset spawn timer
	      enemy_spawn_timer = 1/enemy_spawn_rate;
	    }
        
	    exit;
	  }

	  // Check if next wave needs to be started
	  active_enemies = scr_get_enemy_count();
  
	  if (active_enemies == 0) {
	    wave_cooldown_timer = wave_cooldown;
	    wave_active = false;
    
	    if (wave < _waves_total) {
	      // Play audio cue unless last wave end
	      audio_play_sound(snd_wave_end, 0, false);
	    } else {
	      // Play stage end sound
	      audio_play_sound(snd_stage_end, 0, false);
	    }
	  }
	}





}
