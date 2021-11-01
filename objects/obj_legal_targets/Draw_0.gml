if(!surface_exists(obj_player.targetSurface) && !obj_player.surfaceClean){
	obj_player.targetSurface = surface_create(900, card_height + 40)
	obj_player.surfaceClean = false
	surface_first_layer = true
}
surface_set_target(obj_player.targetSurface)
	if(surface_first_layer){
		draw_sprite_ext(spr_base_white, -1, 0, 0, 1, 1, 0, $c49d35, 1)
	}
	var surface_margin_x = sprite_get_width(spr_base_white)/2 - room_width/2, 
	surface_margin_y = sprite_get_height(spr_base_white)/2 - room_height/2;
	draw_sprite_stretched(macros.sprite_array[cardNum,artNum],1,surface_margin_x + x - card_width/2, surface_margin_y + y - card_height/2,card_width,card_height);
surface_reset_target()