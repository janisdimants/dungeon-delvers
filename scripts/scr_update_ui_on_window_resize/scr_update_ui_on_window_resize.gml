// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_ui_on_window_resize(){
	var w = window_get_width();
	var h = window_get_height();

	if (w != width || h != height) {
	  scr_update_ui_variables();
	}
}