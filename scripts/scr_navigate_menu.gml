///scr_navigate_menu(menu_item_count)
// Executes logic for menu navigation
// accepts input for menu item count
var menu_item_count = argument[0];

// Menu navigation with keys
if (abs(input_y) >= global.deadzone) {
  if (menu_navigation_timer <= 0) {
    menu_navigation_timer = 1;
    menu_position += sign(input_y);
    
    // Loop navigation around
    if (menu_position > menu_item_count-1) {
      menu_position = 0;
    } else if (menu_position < 0) {
      menu_position = menu_item_count-1;
    }
  }
}

// Countdown navigation timer, for using joysticks
if (menu_navigation_timer > 0) {
  menu_navigation_timer -= menu_navigation_rate * frame_time_indep;
}

/* OLD MENU ACCEPT INPUT
// Accept key input
if (dash_key && menu_index > 0) {
  script_execute(menu_action[menu_index, menu_position], false, 0);
}

// Horizontal input
if (abs(input_x) >= global.deadzone) {
  if (menu_navigation_timer <= 0) {
    menu_navigation_timer = 1;
    var dir = sign(input_x);
    
    script_execute(menu_action[menu_index, menu_position], false, dir);
  }
}
*/
