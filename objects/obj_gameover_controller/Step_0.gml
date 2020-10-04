/// @description Transition to game over screen on game over

scr_frame_time_independant();

if (!global.game_over || room == ROOM) {
	// Game still in progress or already ended
	exit;
}

fade_step += frame_time_indep;
var _step = fade_step;
var _fade_duration = FADE_DURATION;

with (fader) {
	image_alpha = _step / _fade_duration;
	draw_self();
}

if (fade_step >= FADE_DURATION) {
	scr_stop_ambient_audio();
	global.game_paused = false;
	fade_step = 0;
	room_goto(ROOM);
}
