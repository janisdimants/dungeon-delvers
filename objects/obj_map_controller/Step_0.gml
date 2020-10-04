/// @description Move player marker and load level
if (!player_in_transit || !player_target) {
	exit;
}

with (player_marker) {	
	var _trg_coords = scr_get_map_node_coords(other.player_target);
	var _trg_x = _trg_coords[0];
	var _trg_y = _trg_coords[1];

	if (x == _trg_x && y == _trg_y) {
		player_in_transit = false;
		other.player_target = noone;
		room_goto(rm_arena);
		return;
	}

	// TODO: Replace with smooth traversal
	x = _trg_x;
	y = _trg_y;
}