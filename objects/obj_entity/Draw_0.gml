/// @description  Draw entity

if (invincible) {
  shader_set(shd_white);
}

var _fire_amount = scr_get_status_amount(scr_get_status(scr_fire_status));
if (_fire_amount > 0) {
  image_blend = c_orange;
} else {
  image_blend = c_white;
}

draw_self();

shader_reset();

scr_draw_healthbar();
scr_draw_stun_effect();
scr_draw_status_effects();
