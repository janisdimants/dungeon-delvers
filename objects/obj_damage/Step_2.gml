/// @description  Update lifetime

lifetime_index += global.frame_time / lifetime;

if (lifetime_index > 1) {
  instance_destroy();
}

