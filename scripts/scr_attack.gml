///scr_attack_state()

var weapon_img_number = sprite_get_number(weapon);

weapon_img_index +=  (weapon_img_number/weapon_speed) * frame_time;

if (weapon_img_index > weapon_img_number) {
  weapon_img_index = 0;
  attacking = false;
}
