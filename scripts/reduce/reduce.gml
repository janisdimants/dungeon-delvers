/// @description  reduce(script_idx, arr, initial_value)
/// @param script_idx
/// @param  arr
/// @param  initial_value
function reduce(argument0, argument1, argument2) {

	/*
	Executes a reducer script on each element of the array,
	resulting in single output value.

	e.g. define a script "product" with the contents

	```
	var accumulator = argument0;
	var current_value = argument1;
	var index = argument2;

	return accumulator * current_value;
	```

	```
	var test_array = of(1, 2, 3, 4);
	var reduced = reduce(product, test_array, 1); // 24
	```
	*/

	var script = argument0;
	var arr = argument1;
	var accumulator = argument2;

	for (var i = 0; i < array_length_1d(arr); i += 1) {
	    accumulator = script_execute(script, accumulator, arr[i], i);
	}

	return accumulator;



}
