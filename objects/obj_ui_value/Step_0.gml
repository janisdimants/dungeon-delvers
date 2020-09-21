/// @description  Update sprite based on value

//image_index = value;

//TODO: Refactor this on value change only
text = value_list[value];

// Update arrow positions
var _text_width = string_width(text);

right_arrow.x = x + _text_width + nav_arrow_padding;
left_arrow.x = x - right_arrow.sprite_width - nav_arrow_padding;

/// Inherited Event
event_inherited();

