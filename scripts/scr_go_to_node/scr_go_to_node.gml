/// @description 
function scr_go_to_node(){
	if (player_is_here) {
		return;
	}
	
	with (obj_map_controller) {
		player_in_transit = true;
		player_target = other.id;
	}
}