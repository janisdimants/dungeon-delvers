/// @description scr_calculate_stage_spawn_rate(stage);
/// @param stage
function scr_calculate_stage_spawn_rate() {
	// Returns spawn rate for given stage

	var _stage = argument[0];

	var _spawn_rate = 2 + _stage / 2;

	return _spawn_rate;



}
