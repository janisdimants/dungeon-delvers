/// @description scr_calculate_budget(stage, wave)
/// @param stage
/// @param  wave
function scr_calculate_budget() {
	// Returns budget based on the wave and stage
	var _stage = argument[0];
	var _wave = argument[1];

	var _stage_waves = (_stage-1) * 5;

	_wave += _stage_waves;

	var _budget = 9 + _wave * _wave;

	return _budget



}
