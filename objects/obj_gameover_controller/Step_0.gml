/// @description Transition to game over screen on game over

if (!global.game_over || room == rm_death) {
	// Game still in progress or already ended
	exit;
}

fade_step += 1;

if (fade_step >= FADE_DURATION) {
	scr_stop_ambient_audio();
	global.game_paused = false;
	fade_step = 0;
	room_goto(rm_death);
}