///scr_draw_self_height_shadow()
// Draw with height and shadow

if (draw_shadow) {
  shader_set(shd_shadow);
  draw_sprite_ext(
    sprite_index, image_index,
    x, y,
    image_xscale, image_yscale,
    image_angle, image_blend,
    1
  );
}

shader_reset();
draw_sprite_ext(
  sprite_index, image_index,
  x, y - height,
  image_xscale, image_yscale,
  image_angle, image_blend,
  1
);
