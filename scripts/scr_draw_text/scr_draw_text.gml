/// @description scr_draw_text(x, y, size, text, centered?)
/// @param x
/// @param  y
/// @param  size
/// @param  text
/// @param  centered?
function scr_draw_text() {
	// Requires scale_x and scale_y variables to be set on instance for drawing

	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[3];
	var _size = argument[2];
	var _centered = false;

	if (argument_count > 4) {
	  _centered = argument[4];
	}
	
	if (_centered) {
	  draw_set_halign(fa_center);
	} else {
	  draw_set_halign(fa_left);
	}
	
	draw_text_transformed(_x, _y, _text, scale_x, scale_y, 0);
}
