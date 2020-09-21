/// @description scr_target_increment(target, increment)
/// @param target
/// @param  increment
function scr_target_increment() {
	// Increments target instance's value

	var _value_cap = array_length(target.value_list) - 1;
	var _disable = (
	  target.value + increment > _value_cap ||
	  target.value + increment < 0
	)

	if (!_disable) {
	  target.value += increment;
  
	  var _disable_after = (
	    target.value + increment > _value_cap ||
	    target.value + increment < 0
	  )
  
	  if (_disable_after) {
	    selected = false;
	  }
	}



}
