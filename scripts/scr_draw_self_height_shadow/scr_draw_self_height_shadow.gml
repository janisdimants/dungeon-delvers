/// @description scr_draw_self_height_shadow()
function scr_draw_self_height_shadow() {
	// Draw with height and shadow
	var _reset_shader = false;
	if (argument_count > 0) {
		_reset_shader = argument[0];	
	}

	if (draw_shadow) {
	  shader_set(shd_shadow);
	  draw_sprite_ext(
	    sprite_index, image_index,
	    x, y,
	    image_xscale, image_yscale,
	    image_angle, image_blend,
	    1
	  );
	}

	scr_reset_to_default_shader(_reset_shader);
	draw_sprite_ext(
	  sprite_index, image_index,
	  x, y - height,
	  image_xscale, image_yscale,
	  image_angle, image_blend,
	  1
	);



}
