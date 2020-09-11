/// @description  Inherit event
event_inherited();

/// Set variables

text = "Damage pop-up";
text_size = 8;

// Create switch showing value
var _value = instance_create(x + 220, y, obj_ui_value);
_value.sprite_index = spr_visibility_toggle;
_value.value = global.show_damage_numbers;
_value.action = scr_set_dmg_number_visibility;

