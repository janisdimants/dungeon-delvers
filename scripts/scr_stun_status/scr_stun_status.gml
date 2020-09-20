// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stun_status(status){
	var _amount = scr_get_status_amount(status);

	if (_amount > 0) {
	  _amount -= frame_time;
	}

	scr_set_status_amount(status, _amount);
}