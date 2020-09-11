/// @description  Set mouse cursor

cursor_sprite = spr_cursor;
window_set_cursor(cr_none);

script_execute(scr_settings_and_vars,0,0,0,0,0);
/// Init audio controller
instance_create(0, 0, obj_audio_controller)

/// Init wave controller
instance_create(0, 0, obj_wave_controller);

