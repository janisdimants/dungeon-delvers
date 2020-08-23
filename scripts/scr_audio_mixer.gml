/// Sound effects mixer

var _max = 1.0;

// contains arrays of 2-element tuples of (snd_index, volume)

// UI
var _volume_ui = _max;
scr_set_group_gain(of(
    of(snd_menu_open, _max * _volume_ui),
    of(snd_menu_close, _max * _volume_ui),
    of(snd_menu_hover, _max * _volume_ui),
    of(snd_menu_submenu_open, _max * _volume_ui),
));

// Movement
var _volume_movement = _max;
scr_set_group_gain(of(
    of(snd_footstep_1, _max * _volume_movement),
    of(snd_footstep_2, _max * _volume_movement),
    of(snd_footstep_3, _max * _volume_movement),
    of(snd_footstep_4, _max * _volume_movement),
    of(snd_footstep_5, _max * _volume_movement),
));

// Weapons
var _volume_weapons = _max;
scr_set_group_gain(of(
    of(snd_bow_shoot, _volume_weapons),  
    of(snd_fire, _volume_weapons), 
    of(snd_damage_1, _volume_weapons), 
    of(snd_damage_2, _volume_weapons),
    of(snd_damage_3, _volume_weapons),  
));

// Spear
var _volume_spear = _max;
scr_set_group_gain(of(
    of(snd_spear_swing_1, _volume_spear),  
    of(snd_spear_swing_2, _volume_spear), 
    of(snd_spear_swing_3, _volume_spear),
    of(snd_spear_swing_4, _volume_spear),  
));

// Waves
var _volume_waves = _max;
scr_set_group_gain(of(
    of(snd_wave_start, _volume_waves),  
    of(snd_wave_end, _volume_waves),
));

