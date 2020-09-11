/// @description scr_get_text_width(text, size, spacing)
/// @param text
/// @param  size
/// @param  spacing
function scr_get_text_width(argument0, argument1, argument2) {
	// Returns text total width based on font size

	var _text = argument0;
	var _size = argument1;
	var _spacing = argument2;

	var _width = 0;

	for (var i = 0; i < string_length(_text); i++) {
	  var _char_id = scr_get_char_index(string_char_at(_text, i+1));
	  _width += scr_get_char_width(_char_id, _size);
	  if (i < string_length(_text) - 1) {
	     _width += _spacing;
	  }
	}

	return _width;




}
