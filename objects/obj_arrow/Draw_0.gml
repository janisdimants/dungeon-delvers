/// @description  Draw with height

shader_set(shd_shadow);
draw_sprite_ext(
  sprite_index, image_index,
  x, y,
  1, 1, image_angle,
  c_white, 1
);

event_inherited();
