/// @description scr_start_next_stage()
function scr_start_next_stage() {

	if (room != rm_arena) { exit; }

	stage += 1;
	wave = 0;

	// Update enemy spawn rate
	enemy_spawn_rate = scr_calculate_stage_spawn_rate(stage);
	enemy_spawn_timer = 0;

	// Start countdown for first wave
	wave_cooldown_timer = wave_cooldown;



}
