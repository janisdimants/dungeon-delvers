// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_status_amount(status){
	return status[1];
	/* OLD
	var status_script = status[0];
	
	var _index = scr_get_status_index(status);

	if (is_numeric(_index)) {
		var _status_amount = array_get(status_list[_index], 1);
		return _status_amount;
	}
	return -1;*/
}