// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire_status(status){
	var _amount = scr_get_status_amount(status);

	if (_amount > 0) {
	  _amount -= global.frame_time;
  
	  // Apply burn
	  hp -= global.frame_time * .5;
		
		// Create burn particle effects
	  var _burn_interval = 0.25;
  
		if (_amount % _burn_interval < global.frame_time) {
			var _particle = scr_create_particle(
				random(10),
				random(360),
				-1,
				(sprite_height + random(sprite_height)) * 0.4
			);
       
			if (instance_exists(_particle)) {
				_particle.destroy_after_animation = true;
				_particle.grav = -25;
				_particle.anim_speed = 14;
				_particle.velocity = -10;
				_particle.sprite_index = spr_fire_projectile;
				_particle.draw_shadow = false;
			}
		}
	}
	
	scr_set_status_amount(status, _amount);
}