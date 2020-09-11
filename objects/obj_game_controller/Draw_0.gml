/// @description  Draw gibs surface

if surface_exists(gibs_surf) {
  draw_surface(gibs_surf, 0, 0);
} else {
  gibs_surf = surface_create(room_width, room_height);
}

