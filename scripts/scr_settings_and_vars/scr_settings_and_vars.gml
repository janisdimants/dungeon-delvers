/// @description  Global Game Settings and runtime variables
function scr_settings_and_vars() {

	global.debug = true;

	// Game variables
	global.ingame_shader = shd_base_lightning;
	global.time_of_day = 0; 
	global.game_speed = 1;
	global.controller_id = -1;
	global.mouse_moved = true;
	global.wave = 1;
	last_mouse_x = window_mouse_get_x();
	last_mouse_y = window_mouse_get_y();

	// Settings
	// Gameplay
	global.show_damage_numbers = false;
	global.show_healthbar_level = 0;

	// Graphics
	global.fullscreen = 0;
	global.resolution_option = 3;
	global.super_sampling = 1;
	global.fps_cap = 9999;

	// Controls
	global.deadzone = 0.3;

	// Audio settings
	global.sfx_volume = 1.0;
	global.music_volume = 1.0;

	// Runtime
	global.center_window = true;
	global.game_paused = false;
	global.hit_pause_timer = 0;
	
	scr_frame_time();
}
