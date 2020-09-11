/// @description  Inherit event
event_inherited();

/// Runtime variables

// Attack, spell, dodge
pointer_direction = 0;
active_equipment = noone;
invincible = false;

// Player animation
bob_amount = 0;
footstep_sound_played = false;


/// Player sprite variables

head = spr_player_head;

body_img_speed = 32;
body[RIGHT] = spr_base_right;
body[UP] = spr_base_down;
body[LEFT] = spr_base_left;
body[DOWN] = spr_base_down;

shadow = spr_shadow_small;

body_bob_height = 1;



/// Player stats
scr_get_equipment_mapping();

team = 1;
hp = 5;
max_hp = hp;
max_mana = 5;
mana = 2.6;
mana_restore_rate = .15;
move_speed = 100;

stun_chance = 0.2;
stun_time = 1;

move = scr_move_state;

// Active items
scr_init_equipment_slot(0);
scr_init_equipment_slot(1);
scr_init_equipment_slot(2);
scr_init_equipment_slot(3);

scr_roll(0, true);

scr_weapon_spear(1, true);

scr_spell_fire(2, true);

//special = scr_spell_groundbeam;
//equipment[3] = scr_spell_groundbeam;


// Runtime variables
state = scr_move_state;
dir = 270;
attack_direction = 270;
head_direction = 0;
face = 3;
move_percentage = 0;
move_speed_modifier = 1;


