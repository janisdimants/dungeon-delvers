///scr_apply_values();
// Executes action on all obj_ui_value objects
// these actions are non-available directly, but rather called
// through this script, causing settings update

// Call action on all value objects
with (obj_ui_value) {
  if (action) {
    script_execute(action);
  }
}

