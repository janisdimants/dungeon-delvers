/// @description scr_to_menu();
function scr_to_menu() {
	if (room == rm_main_menu) {
		// noop if already in menu
		exit;
	}
	
	with(obj_wave_controller) {
		stage = 0;
		wave = 0;
	}

	scr_stop_ambient_audio();
	global.game_paused = false;
	room_goto(rm_main_menu);
}
