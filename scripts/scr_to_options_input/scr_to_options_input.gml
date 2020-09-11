/// @description scr_to_options_input()
function scr_to_options_input() {
	// Switch to options menu
	global.game_paused = true;

	// Clear before drawing
	instance_destroy(obj_ui_element);

	instance_create(0, 0, obj_ui_dark_layer);
	instance_create(16, 16, obj_ui_paused);
	var _s = instance_create(16, 48, obj_options_gameplay);
	instance_create(16, 64, obj_options_graphics);
	instance_create(16, 80, obj_options_audio);
	instance_create(16, 96, obj_options_input);
	instance_create(16, 112, obj_options_back_to_menu);

	_s.selected = true



}
