// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_time_of_day() {
	var _day_length_in_seconds = 5; 
	var _new_time = global.time_of_day + global.frame_time / (_day_length_in_seconds * 2);
	
	global.time_of_day = _new_time % 1;
}