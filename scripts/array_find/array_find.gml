/// @description  array_find(value, arr)
/// @param value
/// @param  arr
function array_find(argument0, argument1) {

	/*
	Returns true or false depending on if element
	is present in given array.
	*/

	var value = argument0;
	var arr = argument1;

	for (var i = 0; i < array_length_1d(arr); i+= 1) {
	    if (arr[i] == value) {
	        return true;
	    }
	}

	return false;



}
