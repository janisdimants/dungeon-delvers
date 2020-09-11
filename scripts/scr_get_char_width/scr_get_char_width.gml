/// @description scr_get_char_width(char_id, size)
/// @param char_id
/// @param  size
function scr_get_char_width(argument0, argument1) {
	// Returns char width based on font size

	var _char_id = argument0;
	var _size = argument1;

	var _width = 6;

	switch (_char_id)
	{
	  case "a":
	    break;
	  case "b":
	    break;
	  case "c":
	    break;
	  case "d":
	    break;
	  case "e":
	    break;
	  case "f":
	    break;
	  case "g":
	    break;
	  case "h":
	    break;
	  case "i":
	    _width = 2;
	    break;
	  case "j":
	    break;
	  case "k":
	    break;
	  case "l":
	    break;
	  case "m":
	    _width = 8;
	    break;
	  case "n":
	    break;
	  case "o":
	    break;
	  case "p":
	    break;
	  case "q":
	    break;
	  case "r":
	    break;
	  case "s":
	    break;
	  case "t":
	    break;
	  case "u":
	    break;
	  case "v":
	    break;
	  case "w":
	    _width = 8;
	    break;
	  case "x":
	    break;
	  case "y":
	    break;
	  case "z":
	    break;
	  case "1":
	    break;
	  case "2":
	    break;
	  case "3":
	    break;
	  case "4":
	    break;
	  case "5":
	    break;
	  case "6":
	    break;
	  case "7":
	    break;
	  case "8":
	    break;
	  case "9":
	    break;
	  case "0":
	    break;
	  case ":":
	    _width = 2;
	    break;
	  case "/":
	    break;
	  case "-":
	    break;
	  case ".":
	    _width = 2;
	    if (_size <= 6) {
	    _width = 1;
	    }
	    break;
	  default:
	    break;
	}

	return _width;




}
