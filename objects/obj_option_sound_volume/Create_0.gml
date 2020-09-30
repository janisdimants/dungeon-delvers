/// @description  Inherit event
event_inherited();

/// Set variables

text = "SFX VOLUME";
text_size = 8;

// Create switch showing value
var _value = instance_create(x + 220, y, obj_ui_value);
_value.value_list = ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"];
_value.value = floor(global.sfx_volume * 10);
_value.action = scr_set_sfx_volume;

