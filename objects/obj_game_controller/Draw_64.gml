/// @description  Draw

if (global.debug == true) {
  draw_text(20, 140, string_hash_to_newline("width"+string(width)));
  draw_text(20, 160, string_hash_to_newline("height"+string(height)));
  
  draw_text(20, 190, string_hash_to_newline("x"+string(__view_get( e__VW.XView, 0 ))));
  draw_text(20, 210, string_hash_to_newline("y"+string(__view_get( e__VW.YView, 0 ))));
  draw_text(20, 230, string_hash_to_newline("w"+string(__view_get( e__VW.WView, 0 ))));
  draw_text(20, 250, string_hash_to_newline("h"+string(__view_get( e__VW.HView, 0 ))));
  draw_text(20, 290, string_hash_to_newline("room_speed"+string(room_speed)));
  draw_text(20, 310, string_hash_to_newline("fps_real"+string(fps_real)));
  draw_text(20, 330, string_hash_to_newline("game_speed"+string(global.game_speed)));
}

/// Draw game UI
if (player) {
	shader_reset();
	scr_draw_equipment();
	scr_draw_mana();
	scr_draw_health();
	scr_reset_to_default_shader();
}
