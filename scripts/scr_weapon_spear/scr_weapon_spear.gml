/// @description scr_weapon_spear(slot, equip?)
/// @param slot
/// @param  equip?
function scr_weapon_spear() {

	var _slot = argument[0];
	var _equip = false;
	if (argument_count > 1) {
	  _equip = argument[1];
	}

	scr_get_equipment_mapping();

	if (_equip) {
	  equipment[_slot, _eq_script] = scr_weapon_spear;
	  equipment[_slot, _eq_active] = false; // TODO: status = of(active, time)
	  equipment[_slot, _eq_progress_time] = 0;
	  equipment[_slot, _eq_visual_progress] = 0;
	  equipment[_slot, _eq_image_index] = 0;
	  equipment[_slot, _eq_sprite] = spr_spear;
	  equipment[_slot, _eq_collision_sprite] = spr_col_spear; // TODO: sprite = of(on_player, collision, particle)
	  equipment[_slot, _eq_particle_sprite] = spr_spear_slash;
	  equipment[_slot, _eq_hit_pause_time] = 0.03;
	  equipment[_slot, _eq_icon_index] = 3;
	  equipment[_slot, _eq_executed] = false; //attacked
	  equipment[_slot, _eq_execution_time] = .15;
	  equipment[_slot, _eq_height] = 6;
	  equipment[_slot, _eq_time] = .7; // Seconds (length)
	  equipment[_slot, _eq_combo_time] = 0.25; // TODO: combo = of(active, time)
	  equipment[_slot, _eq_combo_ready] = false;
	  equipment[_slot, _eq_damage] = .4;
	  equipment[_slot, _eq_knockback] = 240;
	  equipment[_slot, _eq_active_movement_modifier] = 0.7;
		equipment[_slot, _eq_sounds] = [
		    snd_spear_swing_1,
		    snd_spear_swing_2,
		    snd_spear_swing_3,
		    snd_spear_swing_4,
		  ];
	  exit;
	}

	scr_weapon_melee(_slot);




}
