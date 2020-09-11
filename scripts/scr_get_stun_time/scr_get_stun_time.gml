/// @description scr_get_stun_time(base_time)
/// @param base_time
function scr_get_stun_time() {
	// Gets chance to stun and apply modifiers

	var _base_time = argument[0];

	var _apply_stun = chance(stun_chance);
	var _stun_length = _apply_stun * _base_time * stun_length_modifier;

	return _stun_length;



}
