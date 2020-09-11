/// @description  Update lifetime

scr_frame_time();

lifetime_index += frame_time / lifetime;

if (lifetime_index > 1) {
  instance_destroy();
}

