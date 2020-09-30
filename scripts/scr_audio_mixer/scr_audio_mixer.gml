/// @description  Sound effects mixer
function scr_audio_mixer() {
	// contains arrays of 2-element tuples of snd_index, volume)

	// UI
	var _volume_ui = global.sfx_volume;
	scr_set_group_gain([
	    [snd_menu_open, _volume_ui],
	    [snd_menu_close, _volume_ui],
	    [snd_menu_hover, _volume_ui],
	    [snd_menu_submenu_open, _volume_ui],
	]);

	// Movement
	var _volume_movement = global.sfx_volume;
	scr_set_group_gain([
	    [snd_footstep_1, _volume_movement],
	    [snd_footstep_2, _volume_movement],
	    [snd_footstep_3, _volume_movement],
	    [snd_footstep_4, _volume_movement],
	    [snd_footstep_5, _volume_movement],
	]);
	
	// Ambience
	var _volume_ambience = global.sfx_volume * 0.05;
	scr_set_group_gain([
	    [snd_ambience_calm_wind, _volume_ambience],
	]);

	// Weapons
	var _volume_weapons = global.sfx_volume;
	scr_set_group_gain([
	    [snd_bow_shoot, _volume_weapons],
	    [snd_fire, _volume_weapons],
	    [snd_damage_1, _volume_weapons],
	    [snd_damage_2, _volume_weapons],
	    [snd_damage_3, _volume_weapons],
	]);

	// Spear
	var _volume_spear = global.sfx_volume;
	scr_set_group_gain([
	    [snd_spear_swing_1, _volume_spear],
	    [snd_spear_swing_2, _volume_spear],
	    [snd_spear_swing_3, _volume_spear],
	    [snd_spear_swing_4, _volume_spear],

		[snd_sword_swing_1, _volume_spear],
		[snd_sword_swing_2, _volume_spear],
		[snd_sword_swing_3, _volume_spear],
		[snd_sword_swing_4, _volume_spear],
	]);

	// Waves
	var _volume_waves = global.sfx_volume;
	scr_set_group_gain([
	    [snd_wave_start, _volume_waves],
	    [snd_wave_end, _volume_waves],
	]);
	
	// Mobs
	var _volume_mobs = global.sfx_volume;
	scr_set_group_gain([
	    [snd_skeleton_attack_1, _volume_mobs],
		[snd_skeleton_attack_2, _volume_mobs],
		[snd_skeleton_attack_3, _volume_mobs],
		
		[snd_skeleton_grunt_1, _volume_mobs],
		[snd_skeleton_grunt_1, _volume_mobs],
		[snd_skeleton_grunt_1, _volume_mobs],
		[snd_skeleton_grunt_1, _volume_mobs],
	]);
}
