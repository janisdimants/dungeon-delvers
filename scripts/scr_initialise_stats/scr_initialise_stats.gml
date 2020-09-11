/// @description scr_initialise_stats()
function scr_initialise_stats() {
	// Initialises all variables of base stats

	// Stuns
	// self
	stun_timer = 0; 
	// attack
	stun_chance = 0;
	stun_length = 1; // currently only enemy
	stun_length_modifier = 1;

	// Burn
	// self
	burn_timer = 0;
	burn_damage = .5; // taken per second
	// attack
	burn_chance = 0;
	burn_amount = 1;
	burn_amount_modifier = 1;





}
