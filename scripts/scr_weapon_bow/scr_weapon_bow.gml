/// @description scr_weapon_bow(equip?)
/// @param equip?
function scr_weapon_bow(argument0) {

	var _slot = argument[0];
	var _equip = false;
	if (argument_count > 1) {
	  _equip = argument[1];
	}

	if (_equip) {
		scr_init_equipment_slot(_slot);
	  equipment[_slot, _eq_script] = scr_weapon_bow;
	  equipment[_slot, _eq_active] = false; // TODO: status = of(active, time)
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_visual_progress] = 0;
	  equipment[_slot, _eq_sprite] = spr_bow;
	  equipment[_slot, _eq_icon_index] = 4;
	  equipment[_slot, _eq_executed] = false;
	  equipment[_slot, _eq_execution_time] = .2;
	  equipment[_slot, _eq_height] = 6;
	  equipment[_slot, _eq_time] = .6; // Seconds
	  equipment[_slot, _eq_combo_time] = 0.25; // TODO: combo = of(active, time)
	  equipment[_slot, _eq_combo_ready] = false;
	  equipment[_slot, _eq_damage] = .5;
	  equipment[_slot, _eq_stun_time] = 0.2;
	  equipment[_slot, _eq_knockback] = 50;
	  equipment[_slot, _eq_active_movement_modifier] = 0.7;
	  exit;
	}

	scr_weapon_ranged(_slot);




}
