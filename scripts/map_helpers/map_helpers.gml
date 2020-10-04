/// @description Helper to get the proper coordinates for placing the player marker
function scr_get_map_node_coords(_trg) {
	return [
		_trg.x - _trg.sprite_width / 2,
		_trg.y - _trg.sprite_height / 2,
	];
}