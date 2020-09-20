/// @description scr_melee_attack_target(target)
/// @param target
function scr_melee_attack_target() {

	var _target = argument[0];

	if (team == -1) { exit; }
	if (_target.team == team) { exit; }

	var _damage = damage;
	var _knockback_dir = dir;
	var _knockback_amount = knockback_amount;
	
	var _modifiers = modifiers;

	with (_target) {
	  // Make sure player isn't invincible
	  if (!invincible) {
	    hp -= _damage;
	    global.hit_pause_timer = other.hit_pause;
	    scr_apply_force(_knockback_amount, _knockback_dir);
			scr_set_status_amount(scr_get_status(scr_invincible_status), invinc_time);
			scr_apply_modifiers(_modifiers);
	  }
	}

	//TODO: Add some logic inbetween state for a stagger/pause after an attack?
	
	return true;
}
