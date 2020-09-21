/// @description  Inherited Event
event_inherited();

/// Navigation button logic

increment = forward * 2 - 1;

// Disable based on if increment is out of index
var _value_cap = array_length(target.value_list) - 1;
var _disable = (
  target.value + increment > _value_cap ||
  target.value + increment < 0
)

selectable = !_disable;
image_index = forward * 2 + _disable;

if (increment < 0) {
  // Back button pressed - play close sound instead.
  action_snd = snd_menu_submenu_close;
}

