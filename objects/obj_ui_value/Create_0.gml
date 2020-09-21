/// @description  Inherited Event
event_inherited();

/// Initialise value element variables

value = 0;
selectable = false;
value_list = ["VALUE"];
text = value_list[value];

// Initialise navigation arrows
nav_arrow_padding = 4;
var _text_width = string_width(text);

right_arrow = instance_create(x + _text_width + nav_arrow_padding, y, obj_ui_arrow);
right_arrow.forward = true;
right_arrow.target = self;


left_arrow = instance_create(x - right_arrow.sprite_width - nav_arrow_padding, y, obj_ui_arrow);
left_arrow.forward = false;
left_arrow.target = self;

// In 1 frame, create arrows, delay is intentional
// so that sprite width is set when we create arrows
alarm[0] = 1;

