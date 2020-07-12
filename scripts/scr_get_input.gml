///scr_get_input()

// Mouse and keyboard
var up_key = keyboard_check(ord('W'));
var left_key = keyboard_check(ord('A'));
var down_key = keyboard_check(ord('S'));
var right_key = keyboard_check(ord('D'));

var kb_input_x = right_key - left_key;
var kb_input_y = down_key - up_key;

var kb_attack1_key_down = mouse_check_button(mb_left);
var kb_attack1_key_up = mouse_check_button_released(mb_left);
var kb_attack2_key_down = mouse_check_button(mb_right);
var kb_attack2_key_up = mouse_check_button_released(mb_right);
var kb_dash_key = keyboard_check_pressed(vk_space);

var kb_interact_key = keyboard_check_pressed(ord('E'));
var kb_back_key = keyboard_check_pressed(vk_escape);

var kb_pointer_direction = point_direction(x, y, mouse_x, mouse_y);

// Gamepad
var left_stick_x = gamepad_axis_value(global.controller_id, gp_axislh);
var left_stick_y = gamepad_axis_value(global.controller_id, gp_axislv);
var right_stick_x = gamepad_axis_value(global.controller_id, gp_axisrh);
var right_stick_y = gamepad_axis_value(global.controller_id, gp_axisrv);
var left_stick_amount = point_distance(0, 0, left_stick_x, left_stick_y);
var right_stick_amount = point_distance(0, 0, right_stick_x, right_stick_y);

var gp_input_x = gamepad_axis_value(global.controller_id, gp_axislh);
var gp_input_y = gamepad_axis_value(global.controller_id, gp_axislv);

var gp_attack1_key_down = gamepad_button_check_pressed(global.controller_id, gp_shoulderrb);
var gp_attack1_key_up = gamepad_button_check_released(global.controller_id, gp_shoulderrb);
var gp_attack2_key_down = gamepad_button_check_pressed(global.controller_id, gp_shoulderlb);
var gp_attack2_key_up = gamepad_button_check_released(global.controller_id, gp_shoulderlb);
var gp_dash_key = gamepad_button_check_pressed(global.controller_id, gp_face1);

var gp_interact_key = gamepad_button_check_pressed(global.controller_id, gp_face3);
var gp_back_key = gamepad_button_check_pressed(global.controller_id, gp_start);

var gp_pointer_direction = point_direction(0, 0, right_stick_x, right_stick_y);

// Set input variables 
attack1_key_down = kb_attack1_key_down || gp_attack1_key_down;
attack1_key_up = kb_attack1_key_up || gp_attack1_key_up;
attack2_key_down = kb_attack2_key_down || gp_attack2_key_down;
attack2_key_up = kb_attack2_key_up || gp_attack2_key_up;
dash_key = kb_dash_key || gp_dash_key;

interact_key = kb_interact_key || gp_interact_key;
back_key = kb_back_key || gp_back_key;

input_x = kb_input_x;
input_y = kb_input_y;
if (left_stick_amount > global.deadzone) {
  input_x = gp_input_x;
  input_y = gp_input_y;
}

if (global.mouse_moved) {
  pointer_direction = kb_pointer_direction;
} else if (right_stick_amount > global.deadzone) {
  pointer_direction = gp_pointer_direction;
}


