/// @description scr_get_head_direction();
function scr_get_head_direction() {

	if (is_undefined(pointer_direction)) {
	  exit;
	}

	head_direction = round(pointer_direction/45);
	if (face == 8) head_direction = RIGHT;



}
