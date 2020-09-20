// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_apply_modifiers(modifiers){
	for (var i = 0; i < array_length(modifiers); i++) {
			var _modifier = modifiers[i];
			
			var _status_script = _modifier[0];
			var _chance = _modifier[1];
			var _amount = _modifier[2];
			
			if (chance(_chance)) {
				var _modifier_status = scr_get_status(_status_script);
				var _status_amount = scr_get_status_amount(_modifier_status);
				scr_set_status_amount(_modifier_status, _status_amount + _amount);
			}
	}
}