/// @description  Update room settings

if (room_speed != global.fps_cap) {
  room_speed = global.fps_cap;
}

// Safety measure, so when room loads, it initializes
// input variables based on mouse
global.mouse_moved = true;

// Update surface size
gibs_surf = surface_create(room_width, room_height);

