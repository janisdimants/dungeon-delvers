script_execute(scr_limit_instance_count,100,0,0,0,0);
/// Init variables
// This object is used for various small particles
// with height, bounce, and rotation properties

// Default Settings
destroy_after_animation = false;
mirror_animation_on_wall = false;
draw_shadow = true;
height = 0;
velocity = 0;
bounce = 0.85;
grav = 98;
len = 0;
dir = 0;
damp = 200;
rotation_speed = 0;
rotation_dampen = 30;
anim_speed = 0;
anim_damp = 0; // Animation speed lost per second
image_speed = 0;
lifetime = -1;
attached = noone;
attach_offset_x = 0;
attach_offset_y = 0;
image_angle = random(360);
ground_level = 1;


