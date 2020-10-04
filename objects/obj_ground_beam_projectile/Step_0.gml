/// @description  Inherit projectile movement
event_inherited();


/// Create ground beams

beam_timer += global.frame_time;

if (beam_timer > beam_cooldown) {
  beam_timer -= beam_cooldown;
  
  var _beam = instance_create(x, y, obj_ground_beam);
  _beam.damage = damage;
  _beam.team = team;
}

