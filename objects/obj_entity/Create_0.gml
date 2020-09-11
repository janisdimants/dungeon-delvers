/// @description  Entity variables
hp = 1;
max_hp = hp;

// Movement
move_cap = 100;
acceleration = 800;
max_speed = 250;
damp_amount = 500;
len = 0;
dir = 0;

team = 0;

scr_initialise_stats();

// TIMERS
invinc_timer = .02;
invinc_time = .2;
invincible = false;

// Timer for stun when getting hit. This is seperate from stun time
hit_timer = 0;
hit_time = 0;

hit_pause = 0;

// RUNTIME
move_h = 0;
move_v = 0;
kb_h = 0
kb_v = 0;
total_move_h = 0;
total_move_v = 0;

