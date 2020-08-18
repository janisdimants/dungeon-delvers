/// for_each(script_idx, arr)

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

