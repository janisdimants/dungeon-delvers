/// @description Mob grunt logic

// Count frame time
scr_frame_time()
grunt_timer += global.frame_time;

// Play a random mobs grunt sound once every GRUNT_INTERVAL_BASE seconds or so.
var _mob_count = instance_number(obj_base_enemy);
var _mob = instance_find(obj_base_enemy, irandom(_mob_count));

if (grunt_timer < GRUNT_INTERVAL_BASE + random(5) || !_mob_count || !_mob) {
	exit;
}

scr_play_rand_snd_at(
	_mob.grunt_sounds,
	_mob.x,
	_mob.y,
	false,
	1,
);
grunt_timer = 0;