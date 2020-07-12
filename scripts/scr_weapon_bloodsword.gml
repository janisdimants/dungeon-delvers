///scr_weapon_sword(equip?)

var equip = argument0;

if (equip) {
  weapon = scr_weapon_bloodsword;
  weapon_sprite = spr_bloodsword;
  weapon_collision_sprite = spr_col_sword;
  weapon_attack_object = obj_sword_slash;
  weapon_icon_index = 1;
  weapon_attacked = false;
  weapon_attack_frame = 3;
  weapon_height = 7;
  weapon_length = .5; // Seconds
  weapon_damage = 1;
  weapon_stun = .5;
  weapon_hit_pause = 0.03;
  weapon_knockback = 200;
  weapon_movement_modifier = 0.7;
  exit;
}

scr_weapon_melee();

