/// @description Vars and place player marker

// assign player position to the first
// city instance found. we'll change this later.
var _first = instance_find(obj_map_node, 0);
instance_create_depth(
	_first.x - _first.sprite_width / 2,
	_first.y - _first.sprite_height / 2,
	-10001,
	obj_map_player_marker
);
