/// @description scr_weapon_sword(equip?)
/// @param equip?
function scr_weapon_sword(argument0) {

	var _slot = argument[0];
	var _equip = false;
	if (argument_count > 1) {
	  _equip = argument[1];
	}

	if (_equip) {
		scr_init_equipment_slot(_slot);
	  equipment[_slot, _eq_script] = scr_weapon_sword;
	  equipment[_slot, _eq_active] = false; // TODO: status = of(active, time)
	  equipment[_slot, _eq_sprite] = spr_sword;
	  equipment[_slot, _eq_collision_sprite] = spr_col_sword;
	  equipment[_slot, _eq_particle_sprite] = spr_sword_slash;
	  equipment[_slot, _eq_icon_index] = 2;
	  equipment[_slot, _eq_executed] = false;
	  equipment[_slot, _eq_execution_time] = .2;
	  equipment[_slot, _eq_height] = 6;
	  equipment[_slot, _eq_time] = .5; // Seconds (length)
	  equipment[_slot, _eq_combo_time] = 0.10; // TODO: combo = of(active, time)
	  equipment[_slot, _eq_damage] = .5;
	  equipment[_slot, _eq_hit_pause_time] = 0.03;
	  equipment[_slot, _eq_knockback] = 170;
	  equipment[_slot, _eq_active_movement_modifier] = 0.7;
	  exit;
	}

	scr_weapon_melee(_slot);


}
