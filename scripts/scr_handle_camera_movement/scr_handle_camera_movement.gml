// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_camera_movement(){
	view_x = __view_get( e__VW.XView, 0 );
	view_y = __view_get( e__VW.YView, 0 );
	view_w = __view_get( e__VW.WView, 0 );
	view_h = __view_get( e__VW.HView, 0 );

	if (player) {
	  cam_move_x = (player.x - (view_w/2)) - view_x;
	  cam_move_y = (player.y - (view_h/2)) - view_y;
  
	  __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (cam_move_x * camera_speed * global.frame_time) );
	  __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (cam_move_y * camera_speed * global.frame_time) );
	}
}