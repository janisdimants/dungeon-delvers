// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_game_pausing(){
	scr_get_input();
	
	var _unpausable_rooms = [
		rm_main_menu,
		rm_death,
	];

	if (array_find(room, _unpausable_rooms)) {
		exit;
	}
	
	if (!global.game_paused && menu_key) {
		audio_play_sound(snd_menu_open, 0, false);
		scr_to_pause();
		exit;
	}
  
	// Pause on focus loss
	if (os_is_paused() && !global.game_paused) {
		audio_play_sound(snd_menu_open, 0, false);
		scr_to_pause();
		exit;
	}
}