/// @description  Check if all enemies are dead

entity_count = instance_number(obj_entity);

if (entity_count == 1 && !door_open) {
  image_index = 1;
  door_open = true;
}

