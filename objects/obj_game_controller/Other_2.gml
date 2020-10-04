/// @description  Initialise settings and variables

cursor_sprite = spr_cursor;
window_set_cursor(cr_none);

scr_settings_and_vars();

scr_update_ui_variables();

instance_create(0, 0, obj_audio_controller)
instance_create(0, 0, obj_wave_controller);
instance_create(0, 0, obj_gameover_controller);

