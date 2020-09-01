///scr_limit_instance_count(limit?)
// Destroys instance if it's over the given limit

var _limit = argument0;

if (instance_number(object_index) > _limit) {
  instance_destroy();
}
