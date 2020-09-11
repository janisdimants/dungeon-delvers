/// @description scr_draw_stun_effect()
function scr_draw_stun_effect() {

	if (stun_timer > 0) {
	  var _anim_speed = 14;
	  var _frame = -stun_timer * _anim_speed;
	  draw_sprite(spr_stunned, _frame, x, y-16);
	}



}
