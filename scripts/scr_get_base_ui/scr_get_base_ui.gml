/// @description scr_get_base_ui()
function scr_get_base_ui() {
	// Sets base UI variables
	width = window_get_width();
	height = window_get_height();
	aspect_ratio = width/height;
	scale_x = width/__view_get( e__VW.WView, 0 );
	scale_y = height/__view_get( e__VW.HView, 0 );



}
