/// @description  Draw with height

scr_reset_to_default_shader();
draw_sprite_ext(
  sprite_index, image_index,
  x, y-height,
  1, 1, image_angle,
  c_white, 1
);

