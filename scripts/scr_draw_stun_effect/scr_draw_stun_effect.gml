/// @description scr_draw_stun_effect()
function scr_draw_stun_effect() {
	
	var _stun_timer = scr_get_status_amount(scr_get_status(scr_stun_status));
	if (_stun_timer > 0) {
	  var _anim_speed = 14;
	  var _frame = -_stun_timer * _anim_speed;
	  draw_sprite(spr_stunned, _frame, x, y-16);
	}



}
