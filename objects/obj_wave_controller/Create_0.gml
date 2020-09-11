/// @description  Initialise Wave Controller
scr_get_base_ui();

stage = 0;
wave = 0;
wave_active = false;
wave_cooldown = 3;
min_enemy_count = 4;

// Runtime
wave_cooldown_timer = 0;
active_enemies = 0;
wave_budget = 0;
budget = 0;


