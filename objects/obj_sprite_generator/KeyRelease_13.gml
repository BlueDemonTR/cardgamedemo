spr_newcard = sprite_create_from_surface(surface, 0, 0, 550, 800, false, false, 0, 0)
sprite_variable = sprite_duplicate(spr_newcard);
sprite_save(sprite_variable, -1, get_string("Enter filename", "spr_newcard.png"))