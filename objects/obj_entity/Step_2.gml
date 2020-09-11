/// @description  Movement
scr_frame_time();

var _damp_amount = damp_amount;

// Calculates movement

// Counteracts damping for movement
var _move_amount = len * acceleration + (sign(len) * _damp_amount); // 300
var _total_speed = point_distance(0, 0, total_move_h, total_move_v); // 50

if (_total_speed > move_cap) {
  _move_amount = 0;
}

var _move_h = lengthdir_x(_move_amount, dir);
var _move_v = lengthdir_y(_move_amount, dir);

total_move_h += (_move_h + kb_h) * frame_time;
total_move_v += (_move_v + kb_v) * frame_time;

// Damping gets applied based on direction
var _total_dir = point_direction(0, 0, total_move_h, total_move_v);
var _total_speed = point_distance(0, 0, total_move_h, total_move_v);

damp_h = lengthdir_x(1, _total_dir) * _damp_amount * frame_time;
damp_v = lengthdir_y(1, _total_dir) * _damp_amount * frame_time;

if (abs(total_move_h) < abs(damp_h)) { damp_h = total_move_h; }
if (abs(total_move_v) < abs(damp_v)) { damp_v = total_move_v; }

total_move_h -= damp_h;
total_move_v -= damp_v;

// Limit the speed
if (_total_speed > max_speed) {
  total_move_h = lengthdir_x(max_speed, _total_dir);
  total_move_v = lengthdir_y(max_speed, _total_dir);
}

scr_move_entity(total_move_h, total_move_v);


/// Update timers

if (invinc_timer > 0) {
  invinc_timer -= frame_time;
  invinc_timer = max(0, invinc_timer);
}

if (hit_timer > 0) {
  hit_timer -= frame_time;
  hit_timer = max(0, hit_timer);
}

if (stun_timer > 0) {
  stun_timer -= frame_time;
  stun_timer = max(0, stun_timer);
}

if (burn_timer > 0) {
  burn_timer -= frame_time;
  
  // Apply burn
  hp -= frame_time * burn_damage;
  var _burn_interval = 0.25;
  
  if (burn_timer % _burn_interval < frame_time) {
     var _particle = scr_create_particle(
       random(10),
       random(360),
       -1,
       (sprite_height + random(sprite_height)) * 0.4
     );
       
     if (instance_exists(_particle)) {
       _particle.destroy_after_animation = true;
       _particle.grav = -25;
       _particle.anim_speed = 8;
       _particle.velocity = -10;
       _particle.sprite_index = spr_fire_projectile;
       _particle.draw_shadow = false;
     }
  }
}


