// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_find_closest_selectable_element(search_above){
	// Find closest selectable UI element 
	var _closest = noone;
			
	for (var i = 0; i < instance_number(obj_ui_element); i++) {
		var _el = instance_find(obj_ui_element, i);
				
		// Ignore if not selectable
		if (!_el.selectable) {
			continue;	
		}
				
		// Is above us?
		if ((search_above && _el.y < y) || (!search_above && _el.y > y)) {
			// Is the first one found?
			if (_closest == noone) {
				_closest = _el;
				continue;
			}
					
			// Is the closest?
			if ((search_above && _el.y > _closest.y) || (!search_above && _el.y < _closest.y)) {
				_closest = _el;	
			}
		}
	}
	
	return _closest;
}