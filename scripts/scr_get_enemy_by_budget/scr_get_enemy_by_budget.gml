/// @description scr_get_enemy_by_budget(budget)
/// @param budget
function scr_get_enemy_by_budget() {
	// Returns enemy object by the given budget

	var _budget = argument[0]

	// Mob list
	mobs_with_cost = scr_get_enemy_list();

	var _filtered_mobs = filter(scr_filter_mobs_by_budget, mobs_with_cost, _budget);

	var _filtered_mob_count = array_length_1d(_filtered_mobs);
	var _filtered_mob_max_index = _filtered_mob_count - 1;
	var _random_mob_index = irandom(_filtered_mob_max_index);

	return _filtered_mobs[_random_mob_index];



}
