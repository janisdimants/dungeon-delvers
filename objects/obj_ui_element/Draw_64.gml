/// @description  Draw UI element on GUI layer
scr_get_base_ui();

// Draw selection under sprite

/*if (selected) {
  draw_set_colour(image_blend);
  draw_set_alpha(0.3);
  
	var _element_width = string_width(text);
	var _element_height = string_height(text);

	if (sprite_width > _element_width) { _element_width = sprite_width; }
	if (sprite_height > _element_height) { _element_height = sprite_height; }
	
  draw_rectangle(
    (x-select_padding) * scale_x,
    (y-select_padding) * scale_y,
    (x+_element_width+select_padding) * scale_x,
    (y+_element_height+select_padding) * scale_y,
    0
  );
  
  draw_set_colour($fff);
  draw_set_alpha(1);
}*/

shader_reset();

var _selected_color = c_white;
var _col = $dddddd;

image_blend = _col;

if (!selectable || selected) {
  image_blend = _selected_color;
}

var _x = x * scale_x;
var _y = y * scale_y;

if (sprite_index > -1) {
  draw_sprite_ext(
    sprite_index,
    image_index,
    _x,
    _y,
    (image_xscale) * scale_x,
    (image_yscale) * scale_y,
    image_angle,
    image_blend,
    image_alpha
  );
}

if (string_length(text) > 0) {
	draw_set_color(image_blend);
  scr_draw_text(_x, _y, 8, text, false);
}


/* */
/*  */
