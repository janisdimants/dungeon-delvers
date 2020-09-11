/// @description scr_create_inst_offset(projectile object, forward offset, side offset, direction)
/// @param projectile object
/// @param  forward offset
/// @param  side offset
/// @param  direction
function scr_create_inst_offset(argument0, argument1, argument2, argument3) {
	// Creates a object with a offset relative to direction passed

	var _obj = argument0;
	var _forw_offset = argument1;
	var _side_offset = argument2;
	var _projectile_direction = argument3;

	var _projX = x+lengthdir_x(_forw_offset, _projectile_direction)+lengthdir_x(_side_offset, _projectile_direction-90);
	var _projY = y+lengthdir_y(_forw_offset, _projectile_direction)+lengthdir_y(_side_offset, _projectile_direction-90);

	var _projectile = instance_create(_projX, _projY, _obj);

	return _projectile;



}
