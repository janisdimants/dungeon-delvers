/// @description  Draw the player

// SHADOWS
shader_set(shd_shadow);

// Equipment shadow
for (var i = 0; i < array_height_2d(equipment); i++) {
  if (equipment[i, _eq_script] && equipment[i, _eq_sprite]) {
    draw_sprite_ext(
      equipment[i, _eq_sprite], equipment[i, _eq_image_index], x, y,
      1, 1, attack_direction, c_white, 1
    );
  }
}

// Body
scr_reset_to_default_shader();
draw_sprite(shadow, 0, x, y);

if (invincible) {
  shader_set(shd_white);
}

var body_bob = bob_amount * body_bob_height;

// Body
draw_sprite(sprite_index, image_index, x, y - body_bob);

// Equipment
for (var i = 0; i < array_height_2d(equipment); i++) {
	// Check if equipment needs to be drawn as other may be active
	var _draw_equipment = (focused_equipment == -1 || focused_equipment == i);
  if (_draw_equipment && equipment[i, _eq_script] && equipment[i, _eq_sprite]) {
    var _y = y - equipment[i, _eq_height] - body_bob;
    draw_sprite_ext(
      equipment[i, _eq_sprite], equipment[i, _eq_image_index], x, _y,
      1, 1, attack_direction, image_blend, 1
    );
  }
}

// Head
draw_sprite(head, head_direction, x, y - body_bob);

scr_reset_to_default_shader();

scr_draw_healthbar();

scr_draw_status_effects();
