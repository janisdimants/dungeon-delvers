/// @description scr_explode()
function scr_explode() {
	// Explode instance, dealing damage around
	// Required instance var: range

	var _scale = range/8;

	// Create effects
	// TODO: Play sound

	// particles
	var _explosion = instance_create(x, y, obj_particle);

	if (instance_exists(_explosion)) {
	  _explosion.image_angle = irandom(4) * 90;
	  _explosion.height = 5;
	  _explosion.velocity = 0;
	  _explosion.grav = 0;
	  _explosion.sprite_index = spr_explosion;
	  _explosion.destroy_after_animation = true;
	  _explosion.anim_speed = 30;
	  _explosion.draw_shadow = false;
	}

	scr_create_smoke_puff(x, y, _scale);

	// Create damage object
	var _damage = instance_create(x, y, obj_damage);

	_damage.team = team;
	_damage.damage = damage; // add modifiers in calculation here? maybe script?
	_damage.knockback_amount = knockback_amount;
	_damage.knockback_dir = 0; // TODO: Fix this
	_damage.modifiers = modifiers;
	_damage.lifetime = 0.01;

	_damage.sprite_index = spr_col_circle;
	_damage.image_xscale = _scale;
	_damage.image_yscale = _scale;

	// Destroy self
	instance_destroy();




}
