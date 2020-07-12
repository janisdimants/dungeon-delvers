///scr_weapon_ranged()

// Turn weapon
scr_get_head_direction();
attack_direction = pointer_direction;

var weapon_img_number = sprite_get_number(weapon_sprite);
var forw_offset = 8;
var side_offset = 0;
var release = attack1_key_up;
show_spell = false;

weapon_img_index += (weapon_img_number/weapon_length) * frame_time;

if (weapon_img_index > weapon_attack_frame) {
  if (!attacked && !release) {
    // Hold the bow
    weapon_img_index = weapon_attack_frame;
  }
  if (!attacked && release) {
    // Attack
    attacked = true;
    
    var _projectile = scr_create_inst_offset(
      obj_arrow,
      forw_offset,
      side_offset,
      attack_direction
    );
    _projectile.team = team;
    _projectile.damage = weapon_damage;
    _projectile.knockback_dir = attack_direction;
    _projectile.knockback_amount = weapon_knockback;
    _projectile.stun_time = weapon_stun;
    _projectile.dir = attack_direction;
    _projectile.spd = 140;
    _projectile.height = weapon_height;
    
    // Play sound effect
    audio_play_sound(snd_bow_shoot, 0, false);
  }
}

if (weapon_img_index > weapon_img_number) {
  active_attack = noone;
  attacked = false;
  weapon_img_index = 0;
  show_spell = true;
}
