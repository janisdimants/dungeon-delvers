/// @description scr_wiggle_text(x, y, string);
/// @param x
/// @param  y
/// @param  string
function scr_wavy_text(argument0, argument1, argument2) {

	var _x = argument0;
	var _y = argument1;
	var _string = argument2;

	var _total_dist = 0;
	for (var i = 0; i < string_length(_string); i++ ) {
	    var _letter = _string[i];
	    draw_text(
	        _x + _total_dist,
	        _y + sin((frame + (i*0.2) ) * 6) * 2,
	        string_hash_to_newline(_string[i])
	    );
	    _total_dist += string_width(string_hash_to_newline(_letter))-1;
	}



}
