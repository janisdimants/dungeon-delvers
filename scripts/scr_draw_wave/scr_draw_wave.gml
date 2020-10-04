/// @description scr_draw_wave()
function scr_draw_wave() {
	scr_update_ui_on_window_resize();

	// Draw wave ui
	draw_sprite_ext(
	  spr_wave,
	  wave,
	  width/2,
	  0,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);



}
