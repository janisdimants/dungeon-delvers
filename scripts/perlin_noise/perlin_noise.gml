/// @description  Generate a 2D grid for generating perlin noise. 
function generate_vector_grid(argument0, argument1) {

	// Generate a perlin grid of a given size with random vectors
	// Optionally seed the RNG beforehand

	// grid doesn't have to be a square,
	// but for the same of simplicity ...
	var width = argument0;
	var height = argument1;

	var sqroot2 = sqrt(2);

	// define the possible vectors
	var availVectors = of(
	    of(0, sqroot2), // N
	    of(sqroot2, 0), // E
	    of(-sqroot2, 0), // E
	    of(0, -sqroot2), // S
	    of(1, 1), // NE
	    of(-1, 1), // NW
	    of(1, -1), // SE
	    of(-1, -1), // SW
	);

	// build a grid of random vectors and return it
	var grid = array_create(height);
	for (var i = 0; i < height; i += 1) {
	    var row = array_create(width);
	    for (var j = 0; j < width; j += 1) {
	        var idx = round(random_range(0, array_length_1d(availVectors) - 1));
	        var vec = availVectors[idx];
	        row[j] = vec;
	    }
    
	    grid[i] = row;
	}

	return grid;
}

/// @description  dot_grid_gradient(intX, intY, floatX, floatY, gradientGrid)
function dot_grid_gradient(argument0, argument1, argument2, argument3, argument4) {

	/*
	Calculate the dot product for coordinates x,y by
	computing the dot product of the distance and gradient
	vectors for both - X and Y axes.

	intX and intY are integer versions of x and y,
	basically, coordinates used as indexes for accessing
	values in grid_gradient_vectors.

	floatX and floatY are the actual coordinates.
	*/

	// The arguments, being ported from python,
	// could probably use better names.
	var intX = argument0;
	var intY = argument1;
	var floatX = argument2;
	var floatY = argument3;

	// Get with generate_vector_grid()
	var gradientGrid = argument4;

	// Compute the distance vector,
	var dx = floatX - intX;
	var dy = floatY - intY;
    
	// Compute the dot-product
	var gradientGridRow = gradientGrid[intY];
	var gradientVector = gradientGridRow[intX];

	return dx * gradientVector[0] + dy * gradientVector[1];
}

/// @description fractal_perlin(octaves)
function fractal_perlin(argument0, argument1, argument2, argument3) {

	/*
	Generate fractal (1/f) noise,
	also known as pink noise.

	Implementation shamelessly stolen from:
	https://github.com/Lapz/perlin_noise/blob/master/src/perlin.rs

	Get the gradient grid with generate_vector_grid().

	Octaves is basically the amount of iterations, a good number is 4,
	since that would mean that the given grid is divided into 2**4 parts
	for the last iteration.
	*/

	var _x = argument0;
	var _y = argument1;
	var gradientGrid = argument2;
	var octaves = argument3;

	// The effect of the noise on the sum
	effect = 1.0;

	// The current octave (power of 2)
	k = 1.0;

	// The coefficient by which the effect is decreased
	// per octave
	fallout = 0.5;

	// the final sum
	total = 0;

	for (var i = 0; i < octaves; i += 1) {
	    effect *= fallout;
    
	    total += effect * ((1.0 + perlin(k * _x, k * _y, gradientGrid)) / 2.0);
    
	    k *= 2.0
	}

	return total;
}

/// @description  scale(val, fromMin, fromMax, toMin, toMax)
function scale(argument0, argument1, argument2, argument3, argument4) {

	/*
	Scale the given value from the scale of from* to the scale of to*.
	e.g, given a from scale -1 to 1 and a destination scale:

	* -1 will map to 0
	* 0 will map to 127.5
	* 1 will map to 255.

	*/

	var val = argument0;
	var fromMin = argument1;
	var fromMax = argument2;
	var toMin = argument3;
	var toMax = argument4;

	return ((val - fromMin) / (fromMax-fromMin)) * (toMax-toMin) + toMin;



}

/// @description  perlin_value(x, y, gradientGrid)
function perlin_value(argument0, argument1, argument2) {

	/*
	Get the perlin noise value (range from -1 to 1) for the given coordinates.

	Coordinates need to have fractional values or the dot-products
	will return 0 which is probably not desired.

	Given x and y coordinates cannot exceed the gradientGrid dimensions.
	*/

	var _x = argument0;
	var _y = argument1;
	var gradientGrid = argument2;

	// Determine grid cell coordinates - the points "surrounding" our coordinate,
	// but mapped to our grid, which is very possibly smaller than our perlin grid
	var x0 = floor(_x);
	var x1 = x0 + 1;
	var y0 = floor(_y);
	var y1 = y0 + 1;

	// Determine interpolation weights
	// using smoothstep.
	// Could also use a linear curve,
	// e.g.
	// sx = x - x0;
	// sy = y - y0;
	var sx = power(3 * (_x - x0), 2) - power(2 * (_x - x0), 3);
	var sy = power(3 * (_y - y0), 2) - power(2 * (_y - y0), 3);

	// Calculate dot products and interpolate between grid point gradients
	var n0 = dot_grid_gradient(x0, y0, _x, _y, gradientGrid);
	var n1 = dot_grid_gradient(x1, y0, _x, _y, gradientGrid);
	var ix0 = lerp(n0, n1, sx);

	var n0 = dot_grid_gradient(x0, y1, _x, _y, gradientGrid);
	var n1 = dot_grid_gradient(x1, y1, _x, _y, gradientGrid);
	var ix1 = lerp(n0, n1, sx);

	var value = lerp(ix0, ix1, sy);
	return value;
}

/// @description  perlin(x, y, gradientGrid)
function perlin(argument0, argument1, argument2) {

	// generate a scaled 2D perlin noise value (-1 to 1) for the given
	// x and y coordinates and the given gradientGrid (generated with generate_vector_grid)
	var _x = argument0;
	var _y = argument1;
	var gradientGrid = argument2;

	// Scale, so we don't go out of bounds of
	// the perlin grid
	fx = _x / array_length_2d(gradientGrid, 0);
	fy = _y / array_length_1d(gradientGrid);
	return perlin_value(fx, fy, gradientGrid);
}