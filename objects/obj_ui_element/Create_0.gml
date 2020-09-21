/// @description  Initialise variables
scr_get_base_ui();
// settings
selected = false;
last_selected = false;
selectable = true;
action = undefined;
action_snd = snd_menu_submenu_open;
text = "";
select_padding = 1;
cooldown = 0.2;

// runtime
was_unselected = false;
input_cooldown = 0;
accept_cooldown = 0;
image_speed = 0;
depth = -10000;

