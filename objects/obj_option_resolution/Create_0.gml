/// @description  Inherit event
event_inherited();

/// Set variables

text = "RESOLUTION";
text_size = 8;

// Create switch showing value
var _value = instance_create(x + 220, y, obj_ui_value);
_value.value_list = ["320x180 (native)", "640x360", "960x540", "1280x720", "1600x900", "1920x1080", "2240x1260", "2560x1440", "3840x2160"];
_value.value = global.resolution_option;
_value.action = scr_set_resolution;

