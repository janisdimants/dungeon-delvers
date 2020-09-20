/// @description scr_get_stun_time(base_time)
/// @param base_time
function scr_get_burn_amount() {
	// Gets chance to stun and apply modifiers

	var _base_amount = argument[0];

	var _apply_burn = chance(burn_chance);
	var _burn_amount = _apply_burn * _base_time * burn_amount_modifier;

	return _burn_amount;
}
