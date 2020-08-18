/// Global Game Settings and runtime variables

global.debug = false;

// Game variables
global.game_speed = 1;
global.controller_id = -1;
global.mouse_moved = true;
global.wave = 1;
last_mouse_x = window_mouse_get_x();
last_mouse_y = window_mouse_get_y();

// Settings
global.show_damage_numbers = false;
global.fps_cap = 250;
global.deadzone = 0.3;

// Runtime
global.center_window = true;
global.game_paused = false;
global.hit_pause_timer = 0;

