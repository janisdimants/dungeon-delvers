/// @description Player death logic
function scr_dead_state() {

	if (global.game_speed <= 0) { exit; }

	scr_get_input();

	invincible = true;
}
