/// @description scr_update_ui_variables()
function scr_update_ui_variables() {
	// Updates UI position variables, so when
	// resolution is updated, they still match

	// Updates base variables
	scr_get_base_ui();

	// Updates view size to closest match in height
	// and updates width dynamically
	var ideal_height = 180;
	var view_scale = round(height / ideal_height);
	var view_h = height / view_scale;
	var view_w = view_h * aspect_ratio;

	__view_set( e__VW.WView, 0, view_h * aspect_ratio );
	__view_set( e__VW.HView, 0, view_h );

	// Center the view on player, to ensure after minimising
	// the view is in the right position
	var _player = instance_find(obj_player, 0);
	if (_player) {
	  __view_set( e__VW.XView, 0, _player.x - (__view_get( e__VW.WView, 0 )/2 ));
	  __view_set( e__VW.YView, 0, _player.y - (__view_get( e__VW.HView, 0 )/2 ));
	}

	// Resize application surface to match screen size,
	// Here we can also apply super-sampling by multiplying width/height values
	var _SS = global.super_sampling;
	if (width > 0 && height > 0) {
	  surface_resize(application_surface, width * _SS, height * _SS);
	}

	center_x = width/2;
	center_y = height/2;

	font_scale_x = scale_x/6;
	font_scale_y = scale_y/6;

	scr_initialise_fonts();
}
