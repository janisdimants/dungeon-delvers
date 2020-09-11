/// @description  Draw with height

shader_reset();
draw_sprite_ext(
  sprite_index, image_index,
  x, y-height,
  1, 1, image_angle,
  c_white, 1
);

