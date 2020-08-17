///scr_spell_fire(slot, equip?)

var _slot = argument0;
var _equip = argument1;

scr_get_equipment_mapping();

if (_equip) {
  equipment[_slot, _eq_script] = scr_spell_fire;
  equipment[_slot, _eq_active] = false;
  equipment[_slot, _eq_progress_time] = 0;
  equipment[_slot, _eq_image_index] = 0;
  equipment[_slot, _eq_sprite] = spr_fire_hand;
  equipment[_slot, _eq_icon_index] = 3;
  equipment[_slot, _eq_height] = 6;
  equipment[_slot, _eq_damage] = 0.2;
  equipment[_slot, _eq_stun_time] = 0;
  equipment[_slot, _eq_time] = .15; // animation length
  equipment[_slot, _eq_executed] = false; //equipment[_slot, _eq_executed]
  equipment[_slot, _eq_execution_time] = .15;
  equipment[_slot, _eq_active_movement_modifier] = 0.7;
  exit;
}

// Private variables
var _spell_distance = 50; // projectile distance
var _spell_rate = 10; // cast rate
var _spell_rate_index = 0;
var _spell_mana_drain = 1; // per second
  
scr_get_head_direction();
attack_direction = pointer_direction;

var spell_img_number = sprite_get_number(equipment[_slot, _eq_sprite]);
var shoot_index = equipment[_slot, _eq_execution_time];
var _projectile_fwd_offset = 7;
var _projectile_side_offset = -3;
var release = equipment[_slot, _eq_input_up];

if (!equipment[_slot, _eq_executed]) {
  equipment[_slot, _eq_image_index] +=  (spell_img_number/spell_length) * frame_time;
  
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
      projectile.piercing = true;
      
      
      // Creates rounder shape by decreasing distance on sides
      projectile.distance = spell_distance - abs(sin(degtorad(direction_offset))*20);
      projectile.dir = attack_direction + direction_offset;
      projectile.spd = random_range(70, 90);
      projectile.height = spell_height;
    }
  }
  
  // If player releases, return back
  equipment[_slot, _eq_executed] = release;
} else {
  spell_img_index -=  (spell_img_number/spell_length) * frame_time;
  
  if (spell_img_index < 0) {
    // Return to normal state
    spell_img_index = 0;
    active_attack = noone;
    equipment[_slot, _eq_executed] = false;
  }
}
