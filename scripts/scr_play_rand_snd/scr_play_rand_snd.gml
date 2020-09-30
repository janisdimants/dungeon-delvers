/// @description  scr_play_rand_snd(snd_array)
/// @param snd_array
function scr_play_rand_snd(argument0) {
	// Plays a random sound out of a given array of sounds
	var _snd_array = argument0;
	var _arr_len = array_length_1d(_snd_array);
	
	if (!_arr_len) {
		return;
	}

	return audio_play_sound(
	  _snd_array[irandom_range(0, _arr_len - 1)],
	  0,
	  false
	);
}
