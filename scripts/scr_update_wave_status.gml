///scr_update_wave_status()

if (room != rm_arena) { exit; }

scr_frame_time();

if (!wave_active) {
  // Pause section between waves
  wave_cooldown_timer -= frame_time;

  // Begin the next wave
  if (wave_cooldown_timer <= 0) {
    wave += 1;
    
    if (wave > 5) {
      scr_start_next_stage();
      exit;
    }
    
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
  }
}

