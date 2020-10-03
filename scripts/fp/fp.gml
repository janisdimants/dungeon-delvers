/// @description of(*args);
/// @param *args
function of() {

	/*
	Creates a new array instance from a variable number of arguments,
	regardless of number or type of the arguments.
	
	```
	var some_array = of(1, 2, 3); // { { 1,2,3 },  }
	*/

	var arr = array_create(0);
	for (var i = 0; i < argument_count; i += 1) {
	    arr[i] = argument[i];
	}

	return arr;
}

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

/// @function array_choose(array)
/// @param {array} input Input array
function array_choose(_input) {
	/// @description Like regular "choose", but pick
	/// from an array instead of multiple values.
	
	var _arr_len = array_length_1d(_input);
	
	if (!_arr_len) {
		return undefined;
	}
	
	return _input[irandom_range(0, _arr_len - 1)];
}

/// @description  filter(predicate_script_idx, arr, data?)
/// @param predicate_script_idx
/// @param  arr
/// @param  data?
function filter() {

	/*
	Return a filtered array based on a predicate script.

	e.g. define a script is_even with the contents

	```
	return argument0 % 2 == 0;
	```

	and then, using the included "of" script:

	```
	var test_array = of(1, 2, 3, 4);
	var new_array = filter(is_even, test_array); // { { 2,4 }, }
	```
	*/

	var script = argument[0];
	var arr = argument[1];
	var data = undefined;

	if (argument_count > 2) {
	  data = argument[2];
	}

	var new_arr = array_create(0);

	for (var i = 0; i < array_length_1d(arr); i += 1) {
	    var item = arr[i];
	    if (script_execute(script, item, i, data)) {
	        new_arr[array_length_1d(new_arr)] = item;
	    }
	}

	return new_arr;
}

/// @description  for_each(script_idx, arr)
/// @param script_idx
/// @param  arr
function for_each(argument0, argument1) {

	/*
	Execute a side effect on each element of an array.

	e.g. define a script logger with the contents

	```
	log(argument0)
	```

	and then, using the included "of" script:

	```
	var test_array = of(1, 2, 3);
	var new_array = for_each(logger, test_array);

	// prints:
	// 1
	// 2
	// 3
	```

	*/

	var script = argument0;
	var arr = argument1;

	for (var i = 0; i < array_length_1d(arr); i += 1) {
	    script_execute(script, arr[i], i);
	}
}

/// @description  map(script_idx, arr)
/// @param script_idx
/// @param  arr
function map(argument0, argument1) {

	/*
	Execute a script on each element of an array
	and return the resulting array.

	e.g. define a script map_test with the contents

	```
	return 'I: ' + string(argument0) + '/' + string(argument1);
	```

	and then, using the included "of" script:

	```
	var test_array = of(1, 2, 3);
	var new_array = map(map_test, test_array); // { { I: 1/0,I: 2/1,I: 3/2 },  }
	```

	*/

	var script = argument0;
	var arr = argument1;

	var arr_len = array_length_1d(arr);
	var new_arr = array_create(arr_len);

	for (var i = 0; i < arr_len; i += 1) {
	    new_arr[i] = script_execute(script, arr[i], i);
	}

	return new_arr;
}

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
