/// @description  Create arrows

var _nav_arrow_padding = 4;

var _r = instance_create(x + sprite_width + _nav_arrow_padding, y, obj_ui_arrow);
_r.forward = true;
_r.target = self;


var _l = instance_create(x - _r.sprite_width - _nav_arrow_padding, y, obj_ui_arrow);
_l.forward = false;
_l.target = self;

