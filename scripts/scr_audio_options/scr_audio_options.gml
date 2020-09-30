// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_sfx_volume(value) {
	global.sfx_volume = value * 0.1;
	
	scr_audio_mixer();
	
	// TODO: Any extra audio logic here to update with it??
	
	
}

function scr_set_music_volume(value) {
	global.music_volume = value * 0.1;
	
	scr_audio_mixer();
	
	// TODO: Any extra audio logic here to update with it??
	
}