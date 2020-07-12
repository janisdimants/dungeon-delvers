///scr_draw_weapon_spell()
// Draw weapon and spell icons

draw_sprite_ext(
  spr_weapon_icon,
  player.weapon_icon_index,
  4 * scale_x,
  height - (4 * scale_y),
  scale_x,
  scale_y,
  0,
  c_white,
  1
);

draw_sprite_ext(
  spr_spell_icon,
  player.spell_icon_index,
  width - (4 * scale_x),
  height - (4 * scale_y),
  scale_x,
  scale_y,
  0,
  c_white,
  1
);

  
