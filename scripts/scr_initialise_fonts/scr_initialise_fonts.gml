// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialise_fonts() {
	var _font_8 = font_add_sprite(spr_font_8, ord("!"), true, 2);
	
	draw_set_font(_font_8);
	global.font_8 = _font_8
	
	draw_set_color(c_white);
}