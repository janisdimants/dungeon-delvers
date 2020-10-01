/// @description create particles and do the sound thing

script_execute(scr_create_skeleton_death_particles,0,0,0,0,0);
script_execute(scr_explode,0,0,0,0,0);

scr_play_rand_snd([
	snd_skeleton_bomb_attack_1,
	snd_skeleton_bomb_attack_2,
	snd_skeleton_bomb_attack_3,
])