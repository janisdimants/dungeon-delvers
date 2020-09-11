/// @description  scr_set_group_gain(group)
/// @param group
function scr_set_group_gain(argument0) {

	/*
	Sets audio gain for groups of sounds, respecting the master volume.
	A group is an array of 2-item tuples where the first item is a sound
	index and the 2nd one is the volume, e.g. [snd_menu_open, 1.0]
	*/

	var group = argument0;
	for(var i=0; i < array_length_1d(group); i += 1) {
	    var entry = group[i];
	    audio_sound_gain(entry[0], global.sfx_volume * entry[1], 0)
	}



}
