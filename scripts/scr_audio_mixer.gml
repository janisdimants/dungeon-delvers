/// Sound effects mixer

var _max = 1.0;

// contains arrays of 2-element tuples of (snd_index, volume)

// UI
scr_set_group_gain(of(
    of(snd_menu_open, _max),  
));

// Movement
scr_set_group_gain(of(
    of(snd_footstep_1, _max),
    of(snd_footstep_2, _max),
    of(snd_footstep_3, _max),
    of(snd_footstep_4, _max),
    of(snd_footstep_5, _max),
));

// Weapons
scr_set_group_gain(of(
    of(snd_bow_shoot, _max),  
));

