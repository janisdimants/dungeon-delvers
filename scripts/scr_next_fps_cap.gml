///scr_next_fps_cap(get?, direction)

var get_option = argument0;
var dir = argument1;
var value = obj_game_controller.menu_value[OPTIONS_GFX, 2];

// Get option values
if (get_option) {
  option_sprite = spr_fps_caps;
  option_index = value;
  exit;
}

var value_count = sprite_get_number(spr_fps_caps);

// Switches through resolution values
value += dir;
value = clamp(value, 0, value_count-1);
obj_game_controller.menu_value[OPTIONS_GFX, 2] = value;
