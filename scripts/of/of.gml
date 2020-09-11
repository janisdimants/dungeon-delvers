/// @description of(*args);
/// @param *args
function of() {

	/*
	Creates a new array instance from a variable number of arguments,
	regardless of number or type of the arguments.

	```
	var some_array = of(1, 2, 3); // { { 1,2,3 },  }
	```
	*/

	var arr;
	for (var i = 0; i < argument_count; i += 1) {
	    arr[i] = argument[i];
	}

	return arr;



}
