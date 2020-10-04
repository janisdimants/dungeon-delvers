function scr_update_time_of_day() {
	var _day_length_in_seconds = 60;
	var _new_time = global.time_of_day + global.frame_time / (_day_length_in_seconds * 2);
	
	global.time_of_day = _new_time % 1;
}