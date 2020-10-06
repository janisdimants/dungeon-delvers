/// @description Initialise variables
// You can write your code in this editor

// Inherit UI element event
event_inherited();

image_speed = 0;

// Set one of random icons, this should prob be set to one
image_index = 1 + irandom(1);

// Generate camps around
var _camp_count = 2 + irandom(2);

for (var i = 0; i < _camp_count; i++) {
		// Get random position around the camp
		var _min_distance = 10;
		var _max_distance = 50;
		
		var _direction = random(360);
		var _distance = _min_distance + (random(1) * (_max_distance - _min_distance));
		
		var _camp_x = x + lengthdir_x(_distance, _direction);
		var _camp_y = y + lengthdir_y(_distance, _direction);
		
		// Create a camp
		instance_create(_camp_x, _camp_y, obj_camp);
}

