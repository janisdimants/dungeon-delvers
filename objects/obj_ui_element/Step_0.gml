/// @description  Selection and navigation

var _trigger_sound = false;

if (!selectable) { exit; }

// Reselect if it's last selected
if (!selected && last_selected) {
  scr_get_input();
  
  if (input_y != 0) {
    selected = true;
    input_cooldown = cooldown;
    _trigger_sound = true;
  }
}

// Update last_selected
if (selected && !last_selected) {
  obj_ui_element.last_selected = false;
  last_selected = true;
}

// Mouse selection
scr_get_base_ui();
if (global.mouse_moved) {
  var _mx = window_mouse_get_x();
  var _my = window_mouse_get_y();
  
  selected = (_mx > x * scale_x &&
      _mx < (x+element_width) * scale_x &&
      _my > y * scale_y &&
      _my < (y+element_height) * scale_y
  );
  
  if (selected && !was_unselected) {
    was_unselected = true;
    _trigger_sound = true;
  }
  
  if (!selected && was_unselected) {
    was_unselected = false;
  }
}

// Update cooldowns
scr_frame_time_independant();
if (input_cooldown > 0) {
  input_cooldown -= frame_time_indep;
}
if (accept_cooldown > 0) {
  accept_cooldown -= frame_time_indep;
}


// Keyboard input
if (selected) {
  scr_get_input();
  
  // Action
  if (accept_key && accept_cooldown <= 0 && action) {
    script_execute(action);
    
    if (action_snd) {
        audio_play_sound(action_snd, 0, false);
    }

    accept_cooldown = cooldown;
    /// Debug - clear mouse for HTML5 specific input bug
    mouse_clear(mb_any); 
  }
  
  if (input_cooldown <= 0) {
    // Navigate up
    if (input_y < 0 && previous) {
      previous.selected = true;
      previous.input_cooldown = cooldown;
      selected = false;
      _trigger_sound = true; 
    }
    
    // Navigate down
    if (input_y > 0 && next) {
      next.selected = true;
      next.input_cooldown = cooldown;
      selected = false;
      _trigger_sound = true;
    }
  }
}

if (_trigger_sound) {
    audio_play_sound(snd_menu_hover, 0, false);
}

