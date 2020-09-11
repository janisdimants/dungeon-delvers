/// @description scr_get_enemy_count()
function scr_get_enemy_count() {
	// Returns total count of enemies on the map

	var _enemy_list = scr_get_enemy_list();

	var _enemy_count = 0;

	for (var i = 0; i < array_length_1d(_enemy_list); i += 1) {
	    var _mob_with_cost = _enemy_list[i];
	    var _enemy_obj = _mob_with_cost[0];
    
	    _enemy_count += instance_number(_enemy_obj);
	}

	return _enemy_count;



}
