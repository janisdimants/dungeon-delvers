with (other) {
/// Move forward
event_inherited();

image_angle = dir;
image_speed = 12 / room_speed * global.game_speed;

vspd -= 80 * global.frame_time;

height += vspd * global.frame_time;

if (height <= 0 || collided) {
  script_execute(on_death);
  instance_destroy();
}

}
