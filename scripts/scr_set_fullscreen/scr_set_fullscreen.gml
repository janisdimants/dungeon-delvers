// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_fullscreen(){
	global.fullscreen = value;
	
	// Set fullscreen based on value
	// value_list = ["WINDOWED", "BORDERLESS", "FULLSCREEN"];

	var _set_fullscreen = !!value;
	var _current_state = window_get_fullscreen();
	
	if (_current_state != _set_fullscreen) {
		window_set_fullscreen(_set_fullscreen);
	}
}