///scr_update_ui_variables()
// Updates UI position variables, so when
// resolution is updated, they still match

// Updates base variables
scr_get_base_ui();

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
if (player) {
  view_xview[0] = player.x - (view_wview[0]/2);
  view_yview[0] = player.y - (view_hview[0]/2);
}

// Resize application surface 4 times larger,
// to make subpixel movements smoother
if (width > 0 && height > 0) {
  surface_resize(application_surface, width, height);
}


center_x = width/2;
center_y = height/2;

font_scale_x = scale_x/6;
font_scale_y = scale_y/6;

