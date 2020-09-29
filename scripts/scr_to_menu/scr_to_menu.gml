/// @description scr_to_menu();
function scr_to_menu() {
	// Stop ambience sound
	var _amb_snd_idx = global.ambience_snd_idx;
	if (_amb_snd_idx) {
		audio_stop_sound(_amb_snd_idx);
		global.ambience_snd_idx = 0;
	}

	global.game_paused = false;
	room_goto(rm_main_menu);
}
