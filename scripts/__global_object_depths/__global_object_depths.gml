function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_audio_controller
	global.__objectDepths[1] = 9000; // obj_game_controller
	global.__objectDepths[2] = 0; // obj_wave_controller
	global.__objectDepths[3] = 0; // obj_damage
	global.__objectDepths[4] = 0; // obj_base_projectile
	global.__objectDepths[5] = 0; // obj_arrow
	global.__objectDepths[6] = 0; // obj_fire_projectile
	global.__objectDepths[7] = 0; // obj_ground_beam_projectile
	global.__objectDepths[8] = 0; // obj_ground_beam
	global.__objectDepths[9] = 0; // obj_wall
	global.__objectDepths[10] = 0; // obj_wall_shadow
	global.__objectDepths[11] = 0; // obj_door
	global.__objectDepths[12] = 0; // obj_spawner
	global.__objectDepths[13] = 10000; // obj_arena
	global.__objectDepths[14] = 0; // obj_player
	global.__objectDepths[15] = 0; // obj_entity
	global.__objectDepths[16] = 0; // obj_base_enemy
	global.__objectDepths[17] = 0; // obj_skeleton
	global.__objectDepths[18] = 0; // obj_skeleton_bomb
	global.__objectDepths[19] = 0; // obj_skeleton_helmet
	global.__objectDepths[20] = 0; // obj_bat
	global.__objectDepths[21] = 0; // obj_sword_slash
	global.__objectDepths[22] = 0; // obj_spear_slash
	global.__objectDepths[23] = 0; // obj_explosion
	global.__objectDepths[24] = 0; // obj_particle
	global.__objectDepths[25] = 0; // obj_particle_static
	global.__objectDepths[26] = 0; // obj_ui_element
	global.__objectDepths[27] = 0; // obj_play
	global.__objectDepths[28] = 0; // obj_exit
	global.__objectDepths[29] = 0; // obj_ui_paused
	global.__objectDepths[30] = 0; // obj_ui_dark_layer
	global.__objectDepths[31] = 0; // obj_ui_resume
	global.__objectDepths[32] = 0; // obj_ui_options
	global.__objectDepths[33] = 0; // obj_ui_to_menu
	global.__objectDepths[34] = 0; // obj_options_gameplay
	global.__objectDepths[35] = 0; // obj_option_dmg_numbers
	global.__objectDepths[36] = 0; // obj_option_hp_visibility
	global.__objectDepths[37] = 0; // obj_options_graphics
	global.__objectDepths[38] = 0; // obj_options_audio
	global.__objectDepths[39] = 0; // obj_options_input
	global.__objectDepths[40] = 0; // obj_options_back_to_menu
	global.__objectDepths[41] = 0; // obj_options_back_to_options
	global.__objectDepths[42] = 0; // obj_ui_value
	global.__objectDepths[43] = 0; // obj_ui_apply_values
	global.__objectDepths[44] = 0; // obj_ui_arrow
	global.__objectDepths[45] = 0; // obj_home
	global.__objectDepths[46] = 0; // obj_shop


	global.__objectNames[0] = "obj_audio_controller";
	global.__objectNames[1] = "obj_game_controller";
	global.__objectNames[2] = "obj_wave_controller";
	global.__objectNames[3] = "obj_damage";
	global.__objectNames[4] = "obj_base_projectile";
	global.__objectNames[5] = "obj_arrow";
	global.__objectNames[6] = "obj_fire_projectile";
	global.__objectNames[7] = "obj_ground_beam_projectile";
	global.__objectNames[8] = "obj_ground_beam";
	global.__objectNames[9] = "obj_wall";
	global.__objectNames[10] = "obj_wall_shadow";
	global.__objectNames[11] = "obj_door";
	global.__objectNames[12] = "obj_spawner";
	global.__objectNames[13] = "obj_arena";
	global.__objectNames[14] = "obj_player";
	global.__objectNames[15] = "obj_entity";
	global.__objectNames[16] = "obj_base_enemy";
	global.__objectNames[17] = "obj_skeleton";
	global.__objectNames[18] = "obj_skeleton_bomb";
	global.__objectNames[19] = "obj_skeleton_helmet";
	global.__objectNames[20] = "obj_bat";
	global.__objectNames[21] = "obj_sword_slash";
	global.__objectNames[22] = "obj_spear_slash";
	global.__objectNames[23] = "obj_explosion";
	global.__objectNames[24] = "obj_particle";
	global.__objectNames[25] = "obj_particle_static";
	global.__objectNames[26] = "obj_ui_element";
	global.__objectNames[27] = "obj_play";
	global.__objectNames[28] = "obj_exit";
	global.__objectNames[29] = "obj_ui_paused";
	global.__objectNames[30] = "obj_ui_dark_layer";
	global.__objectNames[31] = "obj_ui_resume";
	global.__objectNames[32] = "obj_ui_options";
	global.__objectNames[33] = "obj_ui_to_menu";
	global.__objectNames[34] = "obj_options_gameplay";
	global.__objectNames[35] = "obj_option_dmg_numbers";
	global.__objectNames[36] = "obj_option_hp_visibility";
	global.__objectNames[37] = "obj_options_graphics";
	global.__objectNames[38] = "obj_options_audio";
	global.__objectNames[39] = "obj_options_input";
	global.__objectNames[40] = "obj_options_back_to_menu";
	global.__objectNames[41] = "obj_options_back_to_options";
	global.__objectNames[42] = "obj_ui_value";
	global.__objectNames[43] = "obj_ui_apply_values";
	global.__objectNames[44] = "obj_ui_arrow";
	global.__objectNames[45] = "obj_home";
	global.__objectNames[46] = "obj_shop";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
