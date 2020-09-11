/// @description scr_apply_force(strength, direction)
/// @param strength
/// @param  direction
function scr_apply_force(argument0, argument1) {
	// Applies force to an entity

	var _strength = argument0;
	var _dir = argument1;

	var _move_h = lengthdir_x(_strength, _dir);
	var _move_v = lengthdir_y(_strength, _dir);

	total_move_h += _move_h;
	total_move_v += _move_v;



}
