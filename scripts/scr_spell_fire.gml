///scr_spell_fire(equip?)

var equip = argument0;

if (equip) {
  spell = scr_spell_fire;
  spell_sprite = spr_fire_hand;
  spell_icon_index = 1;
  spell_height = 6;
  spell_damage = 1;
  spell_stun = 0;
  spell_length = .15; // animation length
  spell_distance = 50; // projectile distance
  spell_rate = 10; // cast rate
  spell_mana_drain = 1; // per second
  spell_rate_index = 0;
  spell_movement_modifier = 0.7;
  exit;
}

scr_get_head_direction();
attack_direction = pointer_direction;

var spell_img_number = sprite_get_number(spell_sprite);
var shoot_index = spell_img_number-1;
var forw_offset = 7;
var side_offset = -3;
var release = attack2_key_up;

if (!attacked) {
  spell_img_index +=  (spell_img_number/spell_length) * frame_time;
  
  // Arm extended to shoot
  if (spell_img_index > shoot_index) {
    spell_img_index = shoot_index;
    
    // Update spell rate, which projectile spawn rate is based on
    spell_rate_index += spell_rate * frame_time;
    
    // Drain mana
    mana -= spell_mana_drain * frame_time;
    if (mana <= 0) {
      mana = 0;
      release = true;
    }
    
    while (spell_rate_index > 1/spell_rate) {
      spell_rate_index -= 1/spell_rate;

      // Spawn fire projectile
      var projectile = scr_create_inst_offset(obj_fire_projectile, forw_offset, side_offset, attack_direction);
      
      var direction_offset = (random_range(-20, 20));
      
      projectile.team = team;
      projectile.damage = spell_damage;
      projectile.stun_time = spell_stun;
      
      // Creates rounder shape by decreasing distance on sides
      projectile.distance = spell_distance - abs(sin(degtorad(direction_offset))*20);
      projectile.dir = attack_direction + direction_offset;
      projectile.spd = random_range(70, 90);
      projectile.height = spell_height;
    }
  }
  
  // If player releases, return back
  attacked = release;
} else {
  spell_img_index -=  (spell_img_number/spell_length) * frame_time;
  
  if (spell_img_index < 0) {
    // Return to normal state
    spell_img_index = 0;
    active_attack = noone;
    attacked = false;
  }
}
