///scr_draw_healthbar()
// Draws healthbar including logic for checking settings

var hpbar_visible = false;
switch (global.show_healthbar_level)
{
      case 0:
        // None
        break;
      case 1:
        // Non-player
        hpbar_visible = (object_index != obj_player);
        break;
      case 2:
        // All
        hpbar_visible = true;
        break;
      default:
        // None
        break;
}

if (hpbar_visible) {
  var _hp_percentage = hp / max_hp;
  var _hp_sprite = spr_healthbar;
  var _hp_image_index = _hp_percentage * (sprite_get_number(_hp_sprite)-1);
  
  draw_sprite(_hp_sprite, _hp_image_index, x, y - sprite_height - 4);
}


