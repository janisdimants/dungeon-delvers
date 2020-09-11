/// @description scr_blocked_state()
function scr_dodge_state() {

	if (global.game_speed <= 0) { exit; }

	scr_get_input();
	var _slot = 0;
	script_execute(equipment[_slot, _eq_script], _slot);




}
