/// @description  Draw game UI
if (room = rm_arena) {
  scr_draw_wave();
  
  // Debug
  scr_draw_text(20, 16, 6, "timer " + string(scr_round_to_decimal(wave_cooldown_timer, 0.1)));
  scr_draw_text(20, 48, 6, "enemies " + string(scr_get_enemy_count()));
  scr_draw_text(20, 80, 6, "stage " + string(stage));
}



