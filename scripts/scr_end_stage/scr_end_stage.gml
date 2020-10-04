/// @description scr_end_stage()
function scr_end_stage() {

	// TODO: Add ending animation/effect/sound ?

	// Go to break room
	scr_stop_ambient_audio();
	room_goto(rm_map);
}
