// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_status_effects(){
	return;
	scale_x = .5;
	scale_y = .5;
	
	var status_string = "";
	
	for (var i = 0; i < array_length(status_list); i++) {
		var _status = status_list[i];
		var _amount = scr_get_status_amount(_status);
		status_string += string(_amount) + " ";
	}
	
	scr_draw_text(x, y + 16, 6, status_string, true);
	
}