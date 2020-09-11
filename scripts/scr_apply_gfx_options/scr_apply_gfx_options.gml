/// @description scr_apply_gfx_options(get option, previous)
/// @param get option
/// @param  previous
function scr_apply_gfx_options(argument0, argument1) {

	var get_option = argument0;
	var dir = argument1;

	// Get option values
	if (get_option || dir != 0) {
	  exit;
	}

	// Applies all graphics options set earlier

	var fullscreen_selected = obj_game_controller.menu_value[OPTIONS_GFX, 0];
	window_set_fullscreen(fullscreen_selected);

	var resolution_selected = obj_game_controller.menu_value[OPTIONS_GFX, 1];
	width[0] = 640;
	height[0] = 360;
	width[1] = 1280;
	height[1] = 720;
	width[2] = 1600;
	height[2] = 900;
	width[3] = 1920;
	height[3] = 1080;
	width[4] = 1296;
	height[4] = 729;
	width[5] = 320;
	height[5] = 180;
	window_set_size(width[resolution_selected], height[resolution_selected]);
	global.center_window = true;

	var fps_cap_selected = obj_game_controller.menu_value[OPTIONS_GFX, 2];
	fps_cap[0] = 30;
	fps_cap[1] = 60;
	fps_cap[2] = 120;
	fps_cap[3] = 144;
	fps_cap[4] = 240;
	fps_cap[5] = 300;
	room_speed = fps_cap[fps_cap_selected];
	global.fps_cap = fps_cap[fps_cap_selected];


	// Updates all UI object window variables
	with(obj_ui_base) {
	  scr_update_ui_variables();
	}



}
