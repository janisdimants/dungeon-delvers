// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_controller_id() {
	global.controller_id = -1;
	for (var i = 0; i < 12; i++) {
	  if (gamepad_is_connected(i)) {
	    global.controller_id = i;
	  }
	}
}