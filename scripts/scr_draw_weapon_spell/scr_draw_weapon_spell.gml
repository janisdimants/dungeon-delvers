/// @description scr_draw_weapon_spell()
function scr_draw_weapon_spell() {

	var _side_padding = 18 * scale_x;
	var _bottom_padding = 8 * scale_y;

	var _input_side_padding = 8 * scale_x;
	var _input_bottom_padding = 48 * scale_x;

	var _time = get_timer()*0.00001;
	var _bob = sin(_time*0.2) * 1 * scale_y;

	// Calculate background weapon timer animation including combo time
	var _non_combo_length = player.weapon_length - player.combo_time;
	var _non_combo_progress = player.weapon_progress / _non_combo_length;
	var _weapon_progress_index = _non_combo_progress * 10;

	if (player.weapon_progress > _non_combo_length) { 
	  _weapon_progress_index = 11;
	}

	// Draw Weapon
	// background
	draw_sprite_ext(
	  spr_equipment_column,
	  1,
	  _side_padding,
	  height,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);

	// icon
	var _dim_level = 0.3;
	var _weapon_level = (player.weapon_progress / player.weapon_length);
	var _icon_level = _dim_level + _weapon_level * (1 - _dim_level);
	var _weapon_color = make_colour_hsv(0, 0, _icon_level * 255);
	if (_weapon_level == 0) { _weapon_color = c_white; }
	draw_sprite_ext(
	  spr_weapon_icon,
	  player.weapon_icon_index,
	  _side_padding,
	  height - _bottom_padding - (_bob*-1),
	  scale_x,
	  scale_y,
	  0,
	  _weapon_color,
	  1
	);

	/*
	// input bg
	draw_sprite_ext(
	  spr_input_bg,
	  0,
	  _input_side_padding,
	  height - _input_bottom_padding,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);
	// input
	draw_sprite_ext(
	  weapon_input_sprite,
	  weapon_input_index,
	  _input_side_padding,
	  height - _input_bottom_padding,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);*/

	// Draw Spell
	// Calculate background spell timer animation
	var _spell_percentage = (player.spell_img_index/player.spell_img_number);
	var _spell_progress = _spell_percentage * player.spell_length;
	var _spell_progress_index = 1 + _spell_progress * 9;

	// background
	draw_sprite_ext(
	  spr_equipment_column,
	  _spell_progress_index,
	  width - _side_padding,
	  height,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);
	// icon
	draw_sprite_ext(
	  spr_spell_icon,
	  player.spell_icon_index,
	  width - _side_padding,
	  height - _bottom_padding - _bob,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);
	/*
	// input bg
	draw_sprite_ext(
	  spr_input_bg,
	  1,
	  width - _input_side_padding,
	  height - _input_bottom_padding,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);
	// input
	draw_sprite_ext(
	  spell_input_sprite,
	  spell_input_index,
	  width - _input_side_padding,
	  height - _input_bottom_padding,
	  scale_x,
	  scale_y,
	  0,
	  c_white,
	  1
	);*/

  



}
