/// @description  Inherit entity Variables
event_inherited();

/// Base enemy variables

// States
move_state = scr_chase_target;
attack_state = scr_melee_attack_target;

// Sprites
move_sprite = spr_empty;
hit_sprite = spr_empty;

team = 2;
move_speed = 30;
invinc_time = .2;
knockback_amount = 150;
damage = .5;
range = 7;
modifiers = of();


mirror_towards_enemy = true;

// Runtime
target = undefined;
target_reached = false;


