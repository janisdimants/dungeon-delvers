// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_status_amount(status, amount){
	var _index = scr_get_status_index(status);
	
	array_set(status_list[_index], 1, amount);
}