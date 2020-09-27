// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_resolution(){
	global.resolution_option = value;
	
	// Set resolution based on value
	// value_list = ["320x180 (native)", "640x360", "960x540", "1280x720", "1600x900", "1920x1080", "2240x1260", "2560x1440", "3840x2160"];
	
	var _resolution_list = [[320,180], [640,360], [960,540], [1280,720], [1600,900], [1920,1080], [2240,1260], [2560,1440], [3840,2160]];

	var _resolution = _resolution_list[value];
	
	window_set_size(_resolution[0], _resolution[1]);
	global.center_window = true;
}