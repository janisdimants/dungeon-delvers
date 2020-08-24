///scr_melee_attack_target(target)

var _target = argument[0];

if (team == -1) { exit; }
if (_target.team == team) { exit; }

var _damage = damage;
var _knockback_dir = dir;
var _knockback_amount = knockback_amount;
var _stun_time = stun_time;

with (_target) {
  // Make sure player isn't invincible
  // or in middle of a roll
  if (invinc_timer <= 0 && !invincible) {
    hp -= _damage;
    global.hit_pause_timer = other.hit_pause;
    scr_apply_force(_knockback_amount, _knockback_dir);
    invinc_timer = invinc_time;
    stun_timer = _stun_time * stun_time_modifier;
    stun_time = stun_timer;
  }
}

// Add some logic for stagger/pause after attack?
return true;

