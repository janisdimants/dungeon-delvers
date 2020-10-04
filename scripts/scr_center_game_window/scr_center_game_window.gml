// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_center_game_window(){
	if (global.center_window) {
	  global.center_window = false;
	  window_center();
	}
}