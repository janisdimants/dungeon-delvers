/// @description scr_filter_mobs_by_budget(mob, index, budget)
/// @param mob
/// @param  index
/// @param  budget
function scr_filter_mobs_by_budget() {

	var _mob = argument[0];
	var _index = argument[1];
	var _budget = argument[2];

	return _mob[1] <= _budget;



}
