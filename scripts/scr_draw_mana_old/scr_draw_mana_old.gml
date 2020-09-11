/// @description scr_draw_mana()
function scr_draw_mana_old() {
	// Draw mana

	var _max_mana = player.max_mana;
	var _mana = player.mana;
	var _start_x = width - (42 * scale_x);
	var _bottom_padding = 2 * scale_y;
	var _offset = -13 * scale_x;

	for (var i = 0; i < _max_mana; i++) {
	  var _mana_fill = 0;
	  var _mana_x = _start_x + (_offset * i);
  
	  if (i <= _mana) {
	    _mana_fill = round((_mana%1)*10);
    
	    if (i+1 <= _mana) {
	      _mana_fill = 10;
	    }
	  }
  
	  // Draw mana point background
	  draw_sprite_ext(
	    spr_hp_column,
	    0,
	    _mana_x,
	    height,
	    scale_x,
	    scale_y,
	    0,
	    c_white,
	    1
	  );
	  // Draw mana point
	  draw_sprite_ext(
	    spr_player_mana,
	    _mana_fill,
	    _mana_x,
	    height - _bottom_padding,
	    scale_x,
	    scale_y,
	    0,
	    c_white,
	    1
	  );
	}



}
