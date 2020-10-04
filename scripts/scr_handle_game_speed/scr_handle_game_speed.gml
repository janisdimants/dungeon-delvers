// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_game_speed(){
	scr_frame_time_independant()

	var _hit_pause_timer = global.hit_pause_timer;

	if (_hit_pause_timer > 0) {
	  global.game_speed = 0;
  
	  _hit_pause_timer -= frame_time_indep;
	  _hit_pause_timer = max(_hit_pause_timer, 0);
  
	  global.hit_pause_timer = _hit_pause_timer;
	} else if (!global.game_paused) {
	  global.game_speed = 1;
	} else {
	  global.game_speed = 0;
	}
}