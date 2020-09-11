/// @description scr_find_target()
function scr_find_target() {
	// Returns target

	if (!instance_exists(obj_player)) {
	  return undefined;
	} else {
	  return instance_find(obj_player, 0);
	}




}
