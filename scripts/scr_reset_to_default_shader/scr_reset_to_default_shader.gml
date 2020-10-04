// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reset_to_default_shader(){
	var _reset_shader = false;
	if (argument_count > 0) {
		_reset_shader = argument[0];
		
		if (_reset_shader) {
			shader_reset();
			exit;
		}
	}
	
	var _uniTime = shader_get_uniform(global.ingame_shader, "f_time");
	
	shader_set(global.ingame_shader);
	shader_set_uniform_f(_uniTime, global.time_of_day);
}