/// @description scr_to_menu();
function scr_to_menu() {
	scr_stop_ambient_audio();
	global.game_paused = false;
	room_goto(rm_main_menu);
}
