/// @description  Draw debug text

if (global.debug == false) { exit; }

draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_text(20, 20, string_hash_to_newline("head_direction "+string(head_direction)));
draw_text(20, 40, string_hash_to_newline("pointer_direction "+string(pointer_direction)));
draw_text(20, 60, string_hash_to_newline("global.controller_id "+string(global.controller_id)));

draw_text(220, 20, string_hash_to_newline("total_move_h "+string(total_move_h)));
draw_text(220, 40, string_hash_to_newline("total_move_v "+string(total_move_v)));
var total_speed = point_distance(0, 0, total_move_h, total_move_v);
draw_text(220, 60, string_hash_to_newline("total_speed "+string(total_speed)));

draw_text(220, 80, string_hash_to_newline("max_speed "+string(max_speed)));
draw_text(220, 100, string_hash_to_newline("len "+string(len)));
draw_text(220, 120, string_hash_to_newline("move_cap "+string(move_cap)));

draw_text(420, 20, string_hash_to_newline("state "+string(state)));
draw_text(420, 40, string_hash_to_newline("dash_key "+string(dash_key)));

