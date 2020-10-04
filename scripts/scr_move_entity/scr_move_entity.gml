/// @description scr_move_entity(h, v);
/// @param h
/// @param  v
function scr_move_entity(argument0, argument1) {
	// Moves the entity and updates movement variables

	var h = argument0;
	var v = argument1;

	var collided = false;
	var move_offset_check_distance = 4;
	var move_offset_move_distance = 100;

	// Get move speed
	var hspd = h * global.frame_time;
	var vspd = v * global.frame_time;

	// Checks for collisions and updates base variables

	if (!place_free(x + hspd, y)) {
	  var move_yoffset = 0;
	  if (place_free(x + hspd, y-move_offset_check_distance)) {
	    move_yoffset = -1;
	  }
	  if (place_free(x + hspd, y+move_offset_check_distance)) {
	    move_yoffset = +1;
	  }
	  if (hspd > 0) { move_contact_solid(0, hspd); }
	  if (hspd < 0) { move_contact_solid(180, hspd); }
	  hspd = 0;
	  vspd += move_yoffset * move_offset_move_distance * global.frame_time;
	  total_move_h = 0;
	  collided = true;
	}

	if (!place_free(x, y + vspd)) {
	  var move_xoffset = 0;
	  if (place_free(x-move_offset_check_distance, y + vspd)) {
	    move_xoffset = -1;
	  }
	  if (place_free(x+move_offset_check_distance, y + vspd)) {
	    move_xoffset = +1;
	  }
	  if (vspd > 0) { move_contact_solid(270, vspd); }
	  if (vspd < 0) { move_contact_solid(90, vspd); }
	  hspd += move_xoffset * move_offset_move_distance * global.frame_time;
	  vspd = 0;
	  total_move_v = 0;
	  collided = true;
	}

	x += hspd;
	y += vspd;

	return collided;



}
