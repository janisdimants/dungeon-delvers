// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_status_effects(){
	
	for (var i = 0; i < array_length(status_list); i++) {
		var _status = status_list[i];
		var _script = scr_get_status_script(_status);
		var _amount = scr_get_status_amount(_status);
		
		if (_amount > 0) {
			script_execute(_script, _status);
		}
	}
}