/// @description Transition to game over screen on game over

scr_frame_time_independant();

if (!global.game_over || room == ROOM) {
	// Game still in progress or already ended
	exit;
}

fade_step += frame_time_indep;

with (fader) {
	image_alpha = other.fade_step / other.FADE_DURATION;
}

if (fade_step >= FADE_DURATION) {
	scr_stop_ambient_audio();
	global.game_paused = false;
	fade_step = 0;
	room_goto(ROOM);
}
