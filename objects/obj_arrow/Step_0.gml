with (other) {
/// Move forward
event_inherited();

image_angle = dir;
image_speed = 12 / room_speed * global.game_speed;

vspd -= 80 * frame_time;

height += vspd * frame_time;

if (height <= 0 || collided) {
  script_execute(on_death);
  instance_destroy();
}

}
