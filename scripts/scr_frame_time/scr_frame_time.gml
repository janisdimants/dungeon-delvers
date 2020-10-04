/// @description scr_frame_time()
function scr_frame_time() {
	// Updates global frame_time variable
	// Gets time duration passed in seconds
	global.frame_time = (delta_time * 0.000001) * global.game_speed;




}
