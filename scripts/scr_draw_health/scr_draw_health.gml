/// @description scr_draw_health()
function scr_draw_health() {
	// Draw health

	var _sprite = spr_player_hp;
	var _max_hp = player.max_hp;
	var _hp = player.hp;
	var _x = -48 * scale_x;
	var _y = 0 * scale_y;

	var _hp_fill = (_hp/_max_hp) * (sprite_get_number(_sprite) - 1);

	// Draw hp point
	draw_sprite_ext(
	  _sprite,
	  _hp_fill,
	  width/2 + _x,
	  height - _y,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);



}
