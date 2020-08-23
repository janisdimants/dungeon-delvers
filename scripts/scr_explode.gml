///scr_explode()

/// Create explosion

// Create effects
// TODO: Play sound

// particle
scr_create_smoke_puff(x, y, 1);

var _explosion = instance_create(x, y, obj_particle);

_explosion.image_angle = irandom(4) * 90;
_explosion.height = 5;
_explosion.velocity = 0;
_explosion.grav = 0;
_explosion.sprite_index = spr_explosion;
_explosion.destroy_after_animation = true;
_explosion.anim_speed = 30;
_explosion.draw_shadow = false;


// Create damage object

var _damage = instance_create(x, y, obj_damage);

_damage.team = team;
_damage.damage = damage; // add modifiers in calculation here? maybe script?
_damage.knockback_amount = knockback_amount;
_damage.knockback_dir = 0; // TODO: Fix this
_damage.stun_time = stun_time;
_damage.lifetime = 0.01;

_damage.sprite_index = spr_col_circle;

