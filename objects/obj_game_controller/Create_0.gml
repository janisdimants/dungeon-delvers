/// @description  DEBUG Set display settings

var _w = 1280;
var _h = 720;

// RECORDING MODE
var recording = false;
if (recording) {
  var _w = 640;
  var _h = 360;
}

window_set_size(_w, _h);
global.center_window = true;

/// Game controller variables
game_paused = false;
player = instance_find(obj_player, 0);
camera_speed = 10; // Percent per second
gibs_surf = noone;
