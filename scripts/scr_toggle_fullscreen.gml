///scr_toggle_fullscreen(get?, direction)

var get_option = argument0;
var dir = argument1;
var value = obj_game_controller.menu_value[OPTIONS_GFX, 0];

// Get option values
if (get_option) {
  option_sprite = spr_toggle_button;
  option_index = value;
  exit;
}

var value_count = sprite_get_number(spr_toggle_button);

// Toggles fullscreen option value
value += dir;
value = clamp(value, 0, value_count-1);
menu_value[OPTIONS_GFX, 0] = value;

window_set_fullscreen(value);
