///scr_to_pause()
// Pause the game and initialise pause menu elements
global.game_paused = true;

// Clear before drawing
instance_destroy(obj_ui_element);

instance_create(0, 0, obj_ui_dark_layer);
instance_create(16, 16, obj_ui_paused);
var _s = instance_create(16, 48, obj_ui_resume);
instance_create(16, 64, obj_ui_options);
instance_create(16, 80, obj_ui_to_menu);

_s.selected = true
