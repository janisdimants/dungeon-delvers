///scr_menu_paused()
var _draw = argument[0]; 

// Logic
if (!_draw) {
  // Navigation
  scr_navigate_menu(3);
  if (global.mouse_moved) {
    // Menu navigation with mouse
    
  }
  
  if (menu_position > -1 && dash_key) {
    switch (menu_position) {
      case 0: 
        scr_to_game();
        break;
      case 1: 
        scr_to_options();
        break;
      case 2: 
        scr_exit_to_desktop();
        break;
    }
  }
  
  // Return to game
  if (back_key) {
    scr_to_game();
  }
  
  exit;
}

// Draw
draw_sprite_ext(spr_menu_headers, 1, center_x, header_y, scale_x, scale_y, 0, c_white, bg_fade_amount);
for (var i = 0; i < 3; i++) {
  var color = unselected_color;
  var item_value = spr_pause_items;
  
  // Change color and draw underline for selected item
  if (menu_position == i) { 
    color = selected_color;
    draw_sprite_ext(
      spr_pause_item_selection, 0,
      center_x, pause_item_start + (pause_item_offset * i),
      scale_x, scale_y, 0, 
      color, bg_fade_amount
    );
  }
  
  // Draw menu item
  draw_sprite_ext(
    spr_pause_items, i,
    center_x, pause_item_start + (pause_item_offset * i),
    scale_x, scale_y, 0, 
    color, bg_fade_amount
  );
}
