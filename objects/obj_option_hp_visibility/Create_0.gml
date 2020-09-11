/// @description  Inherit event
event_inherited();

/// Set variables

text = "Healthbars";
text_size = 8;

// Create switch showing value
var _value = instance_create(x + 220, y, obj_ui_value);
_value.sprite_index = spr_hp_visibility;
_value.value = global.show_healthbar_level;
_value.action = scr_set_hp_visibility;

