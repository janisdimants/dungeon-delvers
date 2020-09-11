/// @description scr_to_game();
function scr_to_game() {
	global.game_paused = false;
	audio_play_sound(snd_menu_close, 0, false);
	instance_destroy(obj_ui_element);



}
