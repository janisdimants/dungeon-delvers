/// @description  Update player reference, Input control, camera control, handle game state

player = instance_find(obj_player, 0);

scr_frame_time();

scr_update_global_mouse_moved();

scr_lock_mouse_to_window();

scr_update_controller_id();

scr_handle_camera_movement();

scr_update_ui_on_window_resize();

scr_handle_game_speed();

scr_handle_game_pausing();

scr_center_game_window();

scr_update_time_of_day();
