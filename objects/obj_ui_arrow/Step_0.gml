/// @description  Inherited Event
event_inherited();

/// Navigation button logic

increment = forward * 2 - 1;

// Disable based on if increment is out of index
var _disable = (
  target.value + increment > target.image_number - 1 ||
  target.value + increment < 0
)

selectable = !_disable;
image_index = forward * 2 + _disable;

if (increment < 0) {
  // Back button pressed - play close sound instead.
  action_snd = snd_menu_submenu_close;
}

