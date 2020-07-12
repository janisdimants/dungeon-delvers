///scr_menu_game(draw?)
var _draw = argument[0]; 

// Navigation
if (!_draw) {
  // Pause game logic
  if (back_key) {
    scr_to_pause();
  }
  exit;
}

// Draw
scr_draw_mana();
scr_draw_health();
scr_draw_weapon_spell();
