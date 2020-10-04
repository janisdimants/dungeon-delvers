/// @description  Draw surfaces

if (surface_exists(gibs_surf)) {
	scr_reset_to_default_shader();
  draw_surface(gibs_surf, 0, 0);
} else {
  gibs_surf = surface_create(room_width, room_height);
}
