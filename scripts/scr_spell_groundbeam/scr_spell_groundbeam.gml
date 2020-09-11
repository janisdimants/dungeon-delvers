/// @description scr_spell_groundbeam(equip?)
/// @param equip?
function scr_spell_groundbeam(argument0) {

	var equip = argument0;

	if (equip) {
	  spell = scr_spell_groundbeam;
	  spell_sprite = spr_ground_beam_hand;
	  spell_icon_index = 2;
	  spell_height = 7;
	  spell_damage = .5;
	  spell_stun = 0.3;
	  spell_length = .4;
	  spell_rate = 10;
	  spell_mana_drain = 1; 
	  spell_movement_modifier = 0;
	  exit;
	}

	// Ensure there's enough mana
	if (mana < spell_mana_drain) {
	  active_attack = noone;
	  spell_img_index = 0;
	  attacked = false;
	  // TODO: Display that there's not enough mana
	}

	scr_get_head_direction();
	attack_direction = pointer_direction;

	var _spell_img_number = sprite_get_number(spell_sprite);
	var _attack_frame = _spell_img_number-1;
	var _forw_offset = 7;
	var _side_offset = -3;
	var _release = attack2_key_up;

	spell_img_index += (_spell_img_number/spell_length) * frame_time;

	if (spell_img_index > _attack_frame) {
	  if (!attacked && !_release) {
	    // Hold the spell
	    spell_img_index = _attack_frame;
	  }
	  if (!attacked && _release) {
	    // Cast
	    attacked = true;
	    mana -= spell_mana_drain;
    
	    var _projectile = scr_create_inst_offset(
	      obj_ground_beam_projectile,
	      _forw_offset,
	      _side_offset,
	      attack_direction
	    );
    
	    _projectile.team = team;
	    _projectile.damage = spell_damage;
	    _projectile.stun_time = spell_stun;
    
	    _projectile.dir = attack_direction;
	  }
	}

	if (spell_img_index > _spell_img_number) {
	  // Return to normal state
	  spell_img_index = 0;
	  active_attack = noone;
	  attacked = false;
	}




}
