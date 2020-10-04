// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_global_mouse_moved(){
	var current_mouse_x = window_mouse_get_x();
	var current_mouse_y = window_mouse_get_y();
	if (last_mouse_x == current_mouse_x &&
	    last_mouse_y == current_mouse_y) {
	  global.mouse_moved = false;
	} else {
	  global.mouse_moved = true;
	}
	last_mouse_x = current_mouse_x;
	last_mouse_y = current_mouse_y;
}