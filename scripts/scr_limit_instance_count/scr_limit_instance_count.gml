/// @description scr_limit_instance_count(limit?)
/// @param limit?
function scr_limit_instance_count(argument0) {
	// Destroys instance if it's over the given limit

	var _limit = argument0;

	if (instance_number(object_index) > _limit) {
	  instance_destroy();
	}



}
