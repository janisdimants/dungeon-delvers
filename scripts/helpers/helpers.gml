/// @description Plays a random sound out of a given array of sounds
/// @param {array} snd_array An array of sound indexes
/// @return {index} Sound ID
function scr_play_rand_snd(snd_array) {
	var _rand_snd = array_choose(snd_array);
	
	if (!_rand_snd) {
		return;
	}

	return audio_play_sound(
	  _rand_snd,
	  0,
	  false
	);
}

/// @description Emit a random sound relative to camera center from an array of sounds
/// @param {array} snd_array An array of sound indexes
/// @param {int} _x The x position.
/// @param {int} _y The y position.
/// @param {bool} loop Flags the sound as looping or not.
/// @param {int} priority Set the channel priority for the sound.
/// @return {index} Sound ID
function scr_play_rand_snd_at(
	snd_array, _x, _y, loop, priority
) {
	var _rand_snd = array_choose(snd_array);
	
	if (!_rand_snd) {
		return;
	}

	return scr_play_snd_at(
	  _rand_snd, _x, _y, loop, priority
	);
}

/// @description Emit sound for given object relative to camera center
/// @param {index} _snd_idx Sound index
/// @param {int} _x The x position.
/// @param {int} _y The y position.
/// @param {bool} loop Flags the sound as looping or not.
/// @param {int} priority Set the channel priority for the sound.
/// @return {index} Sound ID
function scr_play_snd_at(_snd_idx, _x, _y, loop, priority) {
	// for now presume that we'll work with only one view
	var _view = view_camera[0];
	
	// get camera center room coords
	var _view_cx = camera_get_view_x(_view) + (camera_get_view_width(_view) / 2);
	var _view_cy = camera_get_view_y(_view) + (camera_get_view_height(_view) / 2);
	
	// get relative coords to target x and y
	// assuming that the listener position is at the center - {0, 0}
	var _rel_x = _view_cx - _x;
	var _rel_y = _view_cy - _y;
	
	audio_play_sound_at(
		_snd_idx,
		_rel_x,
		_rel_y,
		0,
		
		// Falloff params should probably be refined
		// but we'll leave them as this for now.
		100,
		300,
		1,

		loop,
		priority,
	);
}