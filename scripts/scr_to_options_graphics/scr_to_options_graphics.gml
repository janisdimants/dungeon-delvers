/// @description scr_to_options_graphics()
function scr_to_options_graphics() {
	// Switch to options menu
	global.game_paused = true;

	// Clear before drawing
	instance_destroy(obj_ui_element);

	instance_create(0, 0, obj_ui_dark_layer);
	instance_create(16, 16, obj_ui_paused);
	var _s = instance_create(16, 48, obj_option_fullscreen);
	instance_create(16, 64, obj_option_resolution);
	instance_create(16, 112, obj_ui_apply_values);
	instance_create(16, 128, obj_options_back_to_options);

	_s.selected = true



}
