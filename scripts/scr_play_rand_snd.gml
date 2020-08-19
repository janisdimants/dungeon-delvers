/// scr_play_rand_snd(snd_array)

// Plays a random sound out of a given array of sounds
var _snd_array = argument0;
audio_play_sound(
  _snd_array[irandom_range(0, array_length_1d(_snd_array) - 1)],
  0,
  false
);

