/// @description  Damage logic

if (team == -1) { exit; }
if (other.team == team) { exit; }

var _damage = damage;
var _knockback_dir = knockback_dir;
var _knockback_amount = knockback_amount;
var _modifiers = modifiers;

with (other) {
  if (!invincible) {
    hp -= _damage;
    global.hit_pause_timer = other.hit_pause;
    scr_apply_force(_knockback_amount, _knockback_dir);
		
		scr_set_status_amount(scr_get_status(scr_invincible_status), invinc_time);
		
	      
	var _snd = scr_play_rand_snd(of(
	    snd_damage_1,
	    snd_damage_2,
	    snd_damage_3,
	));

	if(audio_is_playing(snd_damage_1) && audio_is_playing(snd_damage_2) && audio_is_playing(snd_damage_3)) {
		// To prevent hardcore clipping when AOE a lot of mobs,
		// reduce gain of additional hitsounds.
		audio_sound_gain(_snd, 0.1, 0);
	}
    
    // EFFECTS
    // Set hitstun time
    hit_timer = hit_time;
    
    scr_apply_modifiers(_modifiers);

    if (global.show_damage_numbers) {
      // Create damage popup
      var _popup = instance_create(x, y, obj_particle);
      _popup.sprite_index = spr_numbers_small;
      _popup.image_angle = 0;
      _popup.image_blend = c_red;
      _popup.image_index = (_damage*10);
      _popup.anim_speed = 0;
      _popup.height = 10;
      _popup.velocity = -25;
      _popup.len = 10;
      _popup.dir = random(360);
      _popup.grav = 25;
      _popup.lifetime = 1;
      _popup.draw_shadow = false;
    }
  }
}

