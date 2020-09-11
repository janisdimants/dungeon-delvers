/// @description  Movement and rotation
scr_frame_time();
// Calculate extra speed in beggining of lifespan for animation
var movement = spd + ((1 - image_index/image_number) * spd);
collided = scr_move(movement, dir);
depth = -y;

/// Rotation and lifetime control

var lifespan = distance/spd;
image_index += (1/lifespan) * image_number * frame_time;
image_angle += rotation_spd * frame_time;

if (image_index > image_number - 1) {
  instance_destroy();
}

