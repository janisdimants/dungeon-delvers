/// @description scr_target_increment(target, increment)
/// @param target
/// @param  increment
function scr_target_increment() {
	// Increments target instance's value

	var _disable = (
	  target.value + increment > target.image_number - 1 ||
	  target.value + increment < 0
	)

	if (!_disable) {
	  target.value += increment;
  
	  var _disable_after = (
	    target.value + increment > target.image_number - 1 ||
	    target.value + increment < 0
	  )
  
	  if (_disable_after) {
	    selected = false;
	  }
	}



}
