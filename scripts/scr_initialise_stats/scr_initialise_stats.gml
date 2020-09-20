/// @description scr_initialise_stats()
function scr_initialise_stats() {
	var _status_script_list = scr_get_status_script_list()
	
	status_script_to_index_map = ds_map_create();
	status_list = map(scr_map_status_list, _status_script_list);
	
	show_debug_message("INIT STATUS LIST" + string(status_list));
}

function scr_map_status_list(status_script, index) {
	ds_map_add(status_script_to_index_map, status_script, index);
	
	var _default_amount = 0;
	var _default_data = array_create(1);
	
	return of(status_script, _default_amount, index, _default_data);
}
