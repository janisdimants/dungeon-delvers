/// @description Init audio system

// Set default global ambience sound index.
global.ambience_snd_idx = 0;

// Set initial volumes
// In time these will prolly be taken from settings and initialized somwhat differently.
scr_audio_mixer();

// Mob grunting
grunt_timer = 0;
GRUNT_INTERVAL_BASE = 6.66;