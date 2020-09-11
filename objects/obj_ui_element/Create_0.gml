/// @description  Initialise variables
scr_get_base_ui();
// settings
selected = false;
last_selected = false;
selectable = true;
previous = undefined;
next = undefined;
action = undefined;
action_snd = snd_menu_submenu_open;
text = "";
text_size = 10;
text_spacing = 1;
select_padding = 0;
cooldown = 0.2;

// These two get set automatically within alarm 0
alarm[0] = 1;
element_width = 0;
element_height = 0;

// runtime
was_unselected = false;
input_cooldown = 0;
accept_cooldown = 0;
image_speed = 0;
depth = -10000;

