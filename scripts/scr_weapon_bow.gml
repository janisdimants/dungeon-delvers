///scr_weapon_bow(equip?)

var equip = argument0;

if (equip) {
  weapon = scr_weapon_bow;
  weapon_sprite = spr_bow;
  weapon_icon_index = 2;
  attacked = false;
  weapon_attack_frame = 11;
  weapon_height = 6;
  weapon_length = .6; // Seconds
  weapon_damage = .35;
  weapon_stun = 0.2;
  weapon_knockback = 50;
  weapon_movement_modifier = 0.7;
  exit;
}

scr_weapon_ranged();

