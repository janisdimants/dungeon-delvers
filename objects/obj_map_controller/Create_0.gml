/// @description Vars and place player marker

// assign player position to the first
// city instance found. we'll change this later.
var _first = instance_find(obj_map_node, 0);
_first.player_is_here = true;
var _first_coords = scr_get_map_node_coords(_first);

player_marker = instance_create_depth(
	_first_coords[0],
	_first_coords[1],
	-10001,
	obj_map_player_marker
);

PLAYER_MARKER_TRANSIT_SPEED = 0.3;
player_in_transit = false;
player_target = noone;