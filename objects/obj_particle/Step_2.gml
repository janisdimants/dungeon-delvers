/// @description  Follow attached instance

if (attached > 0) {
  if (!instance_exists(attached)) {
    attached = noone;
    exit;
  }
  x = attached.x + attach_offset_x;
  y = attached.y + attach_offset_y;
  show_debug_message("x" + string(attach_offset_x));
}

/// Update depth

var _depth_offset = attach_offset_y + 2;

depth = -y + _depth_offset;

/// Optimise particle
// checks that particle has stopped moving
// if so, optimises it to static surface

if (attached > 0 || len > 0 || velocity > 0 || anim_speed > 0) {
  exit;
}

// draw static sprite on gibs surface
var _surf = obj_game_controller.gibs_surf;

if surface_exists(_surf) {
  surface_set_target(_surf);
  scr_draw_self_height_shadow();
  surface_reset_target();
}

// Destroy self
instance_destroy();

