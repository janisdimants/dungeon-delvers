// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_go_to_node(){
	with (obj_map_node) {
		player_is_here = false;	
	}
	player_is_here = true;
	
	room_goto(rm_arena);
}