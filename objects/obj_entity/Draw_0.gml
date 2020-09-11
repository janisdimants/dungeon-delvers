/// @description  Draw entity

if (invinc_timer > 0) {
  shader_set(shd_white);
}

if (burn_timer > 0) {
  image_blend = c_orange;
} else {
  image_blend = c_white;
}

draw_self();

shader_reset();

script_execute(scr_draw_healthbar,0,0,0,0,0);
script_execute(scr_draw_stun_effect,0,0,0,0,0);
