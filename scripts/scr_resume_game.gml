///scr_resume_game(get?, direction)

var get_option = argument0;
var dir = argument1;

if (get_option) { exit; }

// Resumes game
if (dir == 0) {
  scr_toggle_pause();
}
