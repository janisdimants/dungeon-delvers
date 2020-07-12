///scr_weapon_spear(equip?)

var equip = argument0;

if (equip) {
  weapon = scr_weapon_spear;
  weapon_sprite = spr_spear;
  weapon_collision_sprite = spr_col_spear;
  weapon_attack_object = obj_spear_slash;
  weapon_icon_index = 1;
  weapon_attacked = false;
  weapon_attack_frame = 2;
  weapon_height = 6;
  weapon_length = .7; // Seconds
  weapon_damage = 1;
  weapon_stun = .5;
  weapon_hit_pause = 0.03;
  weapon_knockback = 250;
  weapon_movement_modifier = 0.7;
  exit;
}

scr_weapon_melee();

