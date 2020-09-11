/// @description  Update width and height variables
if (string_length(text) > 0) {
  element_width = scr_get_text_width(text, text_size, text_spacing);
  element_height = text_size;
} else {
  element_width = sprite_width;
  element_height = sprite_height;
}

