///scr_open_options(get?, direction)

var get_option = argument0;
var dir = argument1;

if (get_option) { exit; }

// Switches to options menu
if (dir == 0) {
  menu_index = OPTIONS_GFX;
}
