/// @description scr_next_resolution(get?, dir)
/// @param get?
/// @param  dir
function scr_next_resolution(argument0, argument1) {

	var get_option = argument0;
	var dir = argument1;
	var value = obj_game_controller.menu_value[OPTIONS_GFX, 1];

	// Get option values
	if (get_option) {
	  option_sprite = spr_resolutions;
	  option_index = value;
	  exit;
	}

	var value_count = sprite_get_number(spr_resolutions);

	// Switches through resolution value
	value += dir;
	value = clamp(value, 0, value_count-1);
	obj_game_controller.menu_value[OPTIONS_GFX, 1] = value;





}
