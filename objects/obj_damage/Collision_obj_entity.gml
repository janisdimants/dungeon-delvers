/// @description  Damage logic

if (team == -1) { exit; }
if (other.team == team) { exit; }

var _damage = damage;
var _knockback_dir = knockback_dir;
var _knockback_amount = knockback_amount;
var _stun_time = stun_time;
var _burn_amount = burn_amount;

with (other) {
  if (invinc_timer <= 0) {
    hp -= _damage;
    global.hit_pause_timer = other.hit_pause;
    scr_apply_force(_knockback_amount, _knockback_dir);
    invinc_timer = invinc_time;
    
    // EFFECTS
    // Set hitstun time
    hit_timer = hit_time;
    
    // Set stun
    stun_timer = _stun_time;
    
    // Add burn
    burn_timer += _burn_amount;
         
    scr_play_rand_snd(of(
      snd_damage_1,
      snd_damage_2,
      snd_damage_3,
    ));

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

