/// @description scr_init_equipment_slot(slot);
/// @param slot
function scr_init_equipment_slot(argument0) {
	// Initialises equipment slot with default values

	var _slot = argument0;

	equipment[_slot, _eq_script]  = undefined;
	equipment[_slot, _eq_input_down] = false;
	equipment[_slot, _eq_input_up] = false;
	equipment[_slot, _eq_active] = false;
	equipment[_slot, _eq_progress_time] = 0;
	equipment[_slot, _eq_visual_progress] = 0;
	equipment[_slot, _eq_image_index] = 0;
	equipment[_slot, _eq_sprite] = spr_empty;
	equipment[_slot, _eq_collision_sprite] = spr_empty;
	equipment[_slot, _eq_particle_sprite] = spr_empty;
	equipment[_slot, _eq_hit_pause_time] = 0;
	equipment[_slot, _eq_icon_index] = 0;
	equipment[_slot, _eq_executed] = false; //attacked
	equipment[_slot, _eq_execution_time] = 0;
	equipment[_slot, _eq_height] = 0;
	equipment[_slot, _eq_time] = 0; // Seconds (length)
	equipment[_slot, _eq_combo_time] = 0;
	equipment[_slot, _eq_combo_ready] = false;
	equipment[_slot, _eq_damage] = 0;
	equipment[_slot, _eq_stun_time] = 0;
	equipment[_slot, _eq_knockback] = 0;
	equipment[_slot, _eq_active_movement_modifier] = 1;
	equipment[_slot, _eq_modifiers] = of();
	exit;



}
