/// @description  Update room settings

if (game_get_speed(gamespeed_fps) != global.fps_cap) {
  game_set_speed(global.fps_cap, gamespeed_fps);
}

// Safety measure, so when room loads, it initializes
// input variables based on mouse
global.mouse_moved = true;

// Update surface size
gibs_surf = surface_create(room_width, room_height);
lightning_surf = surface_create(room_width, room_height);

// Needed for gameover_controller
global.game_over = false;
