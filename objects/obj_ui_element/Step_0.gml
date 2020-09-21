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
	
	var _element_width = string_width(text);
	var _element_height = string_height(text);

	if (sprite_width > _element_width) { _element_width = sprite_width; }
	if (sprite_height > _element_height) { _element_height = sprite_height; }

  
  selected = (_mx > (x - select_padding) * scale_x &&
      _mx < (x + _element_width + select_padding) * scale_x &&
      _my > (y - select_padding) * scale_y &&
      _my < (y + _element_height + select_padding) * scale_y
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
  }
  
  if (input_cooldown <= 0) {
    // Navigate up
    if (abs(input_y) > global.deadzone) {
			// Find closest selectable UI element above this one
			var _search_above = input_y < 0;
			var _element = scr_find_closest_selectable_element(_search_above);
			
			if (_element != noone) {
	      _element.selected = true;
	      _element.input_cooldown = cooldown;
	      selected = false;
				
				_trigger_sound = true;
			}
    }
  }
}

if (_trigger_sound) {
	audio_play_sound(snd_menu_hover, 0, false);
}

