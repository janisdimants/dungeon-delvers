/// map(script_idx, arr)

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
