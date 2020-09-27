/// @description  Inherit event
event_inherited();

/// Set variables

text = "FULLSCREEN";
text_size = 8;

// Create switch showing value
var _value = instance_create(x + 220, y, obj_ui_value);
_value.value_list = ["WINDOWED", "BORDERLESS", "FULLSCREEN"];
_value.value = global.fullscreen;
_value.action = scr_set_fullscreen;

