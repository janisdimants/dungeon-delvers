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

	    hp = max(hp - _damage, 0);

	    global.hit_pause_timer = other.hit_pause;
			
		// This is probably the least appropriate place to put audio logic
		var _trg_x = _target.x;
		var _trg_y = _target.y;
		
		// player pain
		if (hp) {
			scr_play_rand_snd_at([
				snd_player_pain_1,
				snd_player_pain_2,
				snd_player_pain_3,
				snd_player_pain_4,
				snd_player_pain_5,
				snd_player_pain_6,
			], _trg_x, _trg_y, false, 99);
		}
		
		// attacker attack sound, if any defined.
		scr_play_rand_snd_at(other.attack_sounds, _trg_x, _trg_y, false, 1);
		
	    scr_apply_force(_knockback_amount, _knockback_dir);
		scr_set_status_amount(scr_get_status(scr_invincible_status), invinc_time);
		scr_apply_modifiers(_modifiers);
		
		if (!hp) {
			state = scr_dead_state;
			global.game_over = true;
			exit;
		}
	  }
	}

	//TODO: Add some logic inbetween state for a stagger/pause after an attack?
	
	return true;
}
