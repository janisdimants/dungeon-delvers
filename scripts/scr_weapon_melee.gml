///scr_weapon_melee()

// Attack
var weapon_img_number = sprite_get_number(weapon_sprite);

weapon_img_index +=  (weapon_img_number/weapon_length) * frame_time;

move_speed_modifier = weapon_movement_modifier;

// Turn towards pointer
scr_get_head_direction();
attack_direction = pointer_direction;

if (weapon_img_index >= weapon_attack_frame && !weapon_attacked) {
  weapon_attacked = true;
  var _damage_obj = scr_create_inst_offset(obj_damage, 0, 0, attack_direction);
  
  _damage_obj.team = team;
  _damage_obj.damage = weapon_damage;
  _damage_obj.knockback_amount = weapon_knockback;
  _damage_obj.knockback_dir = attack_direction;
  _damage_obj.stun_time = weapon_stun;
  _damage_obj.lifetime = 0.01;
  _damage_obj.hit_pause = weapon_hit_pause;
  
  _damage_obj.sprite_index = weapon_collision_sprite;
  _damage_obj.image_angle = attack_direction;
  _damage_obj.height = weapon_height;
  
  var _slash_particle = instance_create(x, y, weapon_attack_object);
  _slash_particle.height = weapon_height;
  _slash_particle.image_angle = attack_direction;
}

// Return to normal
if (weapon_img_index > weapon_img_number) {
  active_attack = noone;
  weapon_attacked = false;
  weapon_img_index = 0;
}
