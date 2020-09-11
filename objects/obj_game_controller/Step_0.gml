/// @description  Find player object
player = instance_find(obj_player, 0);

/// Update global input variables

// Check if mouse has been moved
var current_mouse_x = window_mouse_get_x();
var current_mouse_y = window_mouse_get_y();
if (last_mouse_x == current_mouse_x &&
    last_mouse_y == current_mouse_y) {
  global.mouse_moved = false;
} else {
  global.mouse_moved = true;
}
last_mouse_x = current_mouse_x;
last_mouse_y = current_mouse_y;

// Lock mouse in game window
if (window_get_fullscreen()) {
  window_mouse_set(
    clamp(window_mouse_get_x(),0,window_get_width()),
    clamp(window_mouse_get_y(),0,window_get_height())
  );
}

// Check if gamepad is connected
global.controller_id = -1;
for (var i = 0; i < 12; i++) {
  if (gamepad_is_connected(i)) {
    global.controller_id = i;
  }
}


/// Handle camera movement

scr_frame_time();
view_x = __view_get( e__VW.XView, 0 );
view_y = __view_get( e__VW.YView, 0 );
view_w = __view_get( e__VW.WView, 0 );
view_h = __view_get( e__VW.HView, 0 );

if (player) {
  cam_move_x = (player.x - (view_w/2)) - view_x;
  cam_move_y = (player.y - (view_h/2)) - view_y;
  
  __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (cam_move_x * camera_speed * frame_time) );
  __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (cam_move_y * camera_speed * frame_time) );
}
  

/// Update variables if window size has changed

var w = window_get_width();
var h = window_get_height();

if (w != width || h != height) {
  scr_update_ui_variables();
}

/// Handle game speed
scr_frame_time_independant()

var _hit_pause_timer = global.hit_pause_timer;

if (_hit_pause_timer > 0) {
  global.game_speed = 0;
  
  _hit_pause_timer -= frame_time_indep;
  _hit_pause_timer = max(_hit_pause_timer, 0);
  
  global.hit_pause_timer = _hit_pause_timer;
} else if (!global.game_paused) {
  global.game_speed = 1;
} else {
  global.game_speed = 0;
}

/// Handle game pausing
scr_get_input();

if (room == rm_arena) {
  if (!global.game_paused && menu_key) {
    audio_play_sound(snd_menu_open, 0, false);
    scr_to_pause();
  }
  
  // Pause on focus loss
  if (os_is_paused() && !global.game_paused) {
    audio_play_sound(snd_menu_open, 0, false);
    scr_to_pause();
  }
}

/// Center the game window

if (global.center_window) {
  global.center_window = false;
  window_center();
}

