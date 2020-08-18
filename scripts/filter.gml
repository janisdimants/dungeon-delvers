/// filter(predicate_script_idx, arr)

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

var script = argument0;
var arr = argument1;
var new_arr = array_create(0);

for (var i = 0; i < array_length_1d(arr); i += 1) {
    var item = arr[i];
    if (script_execute(script, item, i)) {
        new_arr[array_length_1d(new_arr)] = item;
    }
}

return new_arr;
