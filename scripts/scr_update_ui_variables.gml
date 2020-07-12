///scr_update_ui_variables()
// Updates UI position variables, so when
// resolution is updated, they still match

// Updates base variables

width = window_get_width();
height = window_get_height();
aspect_ratio = width/height;

// Updates view size to closest match in height
// and updates width dynamically
var ideal_height = 180;
var view_scale = round(height / ideal_height);
var view_h = height / view_scale;
var view_w = view_h * aspect_ratio;

view_wview[0] = view_h * aspect_ratio;
view_hview[0] = view_h;

// Center the view on player, to ensure after minimising
// the view is in the right position
view_xview[0] = player.x - (view_wview[0]/2);
view_yview[0] = player.y - (view_hview[0]/2);


// Resize application surface 4 times larger,
// to make subpixel movements smoother
if (width > 0 && height > 0) {
  surface_resize(application_surface, width, height);
}

// Base UI variables
scale_x = width/view_wview[0];
scale_y = height/view_hview[0];

center_x = width/2;
center_y = height/2;

font_scale_x = scale_x/6;
font_scale_y = scale_y/6;

// Game UI variables
hp_start_x = 42 * scale_x;
hp_start_y = height - (6 * scale_y);
hp_offset = 14 * scale_x;

mana_start_x = width - hp_start_x;
mana_start_y = hp_start_y;
mana_offset = -hp_offset;

// Menu positioning
header_y = 42 * scale_y;
pause_item_start = header_y + (36 * scale_y);
pause_item_offset = 30 * scale_y;

options_item_start = header_y + (25 * scale_y);
options_item_offset = 14 * scale_y;


