///scr_weapon_melee(_slot)
var _slot = argument0;
scr_get_equipment_mapping();

// INPUT LOGIC
if (!equipment[_slot, _eq_active] && equipment[_slot, _eq_input_down]) {
  equipment[_slot, _eq_active] = true;
}

if (!equipment[_slot, _eq_active]) {
  equipment[_slot, _eq_visual_progress] = 1;
  exit;
}

// ATTACK LOGIC
// Update progress time
equipment[_slot, _eq_progress_time] += frame_time;

// Update progress bar
equipment[_slot, _eq_visual_progress] = (equipment[_slot, _eq_progress_time] / equipment[_slot, _eq_time]);

// Update sprite
var _img_number = sprite_get_number(equipment[_slot, _eq_sprite]);
equipment[_slot, _eq_image_index] = (equipment[_slot, _eq_progress_time]/equipment[_slot, _eq_time]) * _img_number;

move_speed_modifier = equipment[_slot, _eq_active_movement_modifier]; //TODO: rework this so we don't manually update it?

var _non_combo_length = equipment[_slot, _eq_time] - equipment[_slot, _eq_combo_time];
equipment[_slot, _eq_combo_ready] = equipment[_slot, _eq_progress_time] > _non_combo_length;

// Turn towards pointer
scr_get_head_direction();
attack_direction = pointer_direction;

if (equipment[_slot, _eq_progress_time] >= equipment[_slot, _eq_execution_time] && !equipment[_slot, _eq_executed]) {
  equipment[_slot, _eq_executed] = true;
  
  var _damage_obj = scr_create_inst_offset(obj_damage, 0, 0, attack_direction);
  
  _damage_obj.team = team;
  _damage_obj.damage = equipment[_slot, _eq_damage]; // add modifiers in calculation here? maybe script?
  _damage_obj.knockback_amount = equipment[_slot, _eq_knockback];
  _damage_obj.knockback_dir = attack_direction;
  _damage_obj.stun_time = equipment[_slot, _eq_stun_time];
  _damage_obj.lifetime = 0.01;
  _damage_obj.hit_pause = equipment[_slot, _eq_hit_pause_time];
  
  _damage_obj.sprite_index = equipment[_slot, _eq_collision_sprite];
  _damage_obj.image_angle = attack_direction;
  
  var _slash_particle = instance_create(x, y, obj_particle);
  _slash_particle.image_angle = attack_direction;
  _slash_particle.sprite_index = equipment[_slot, _eq_particle_sprite];
  _slash_particle.anim_speed = 72;
  _slash_particle.height = equipment[_slot, _eq_height];
  _slash_particle.dir = attack_direction;
  _slash_particle.len = 100;
  _slash_particle.destroy_after_animation = true;
  _slash_particle.draw_shadow = false;
  
}
// Combo timing
if (equipment[_slot, _eq_combo_ready] && equipment[_slot, _eq_input_down]) {
  equipment[_slot, _eq_combo_ready] = false;
  equipment[_slot, _eq_executed] = false;
  equipment[_slot, _eq_progress_time] = 0;
  equipment[_slot, _eq_active] = true;
}

// Return to normal
if (equipment[_slot, _eq_active] && equipment[_slot, _eq_progress_time] > equipment[_slot, _eq_time]) {
  equipment[_slot, _eq_executed] = false;
  equipment[_slot, _eq_progress_time] = 0;
  equipment[_slot, _eq_combo_ready] = false;
  equipment[_slot, _eq_active] = false;
}
