// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lock_mouse_to_window(){
	if (window_get_fullscreen()) {
	  window_mouse_set(
	    clamp(window_mouse_get_x(),0,window_get_width()),
	    clamp(window_mouse_get_y(),0,window_get_height())
	  );
	}
}