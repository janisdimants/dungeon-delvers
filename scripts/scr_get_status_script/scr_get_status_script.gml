// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_status_script(status) {
	return status[0];
	
	/* OLD INCASE NEW DOESNT WORK
	var _statuses = scr_get_status_script_list();
	
	for(var i = 0; i < array_length(_statuses); i++) { 
		if (array_get(_statuses, i) == status) {
			return i;
		}
	}
	
	show_debug_message("STATUS INDEX NOT FOUND, STATUS: " + string(status));
 */
}