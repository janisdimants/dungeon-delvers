// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_status(status_script){
	var _status_index = ds_map_find_value(status_script_to_index_map, status_script);
	
	var _status = status_list[_status_index];
	
	return _status;
}