if(!surface_exists(obj_player.targetSurface)){
	obj_player.targetSurface = surface_create(900, card_height + 40)
	surface_first_layer = true
}
surface_set_target(obj_player.targetSurface)
	if(surface_first_layer){
		draw_rectangle_color(0, 0, surface_get_width(obj_player.targetSurface), surface_get_height(obj_player.targetSurface), c_gray, c_gray, c_gray, c_gray, false)
	}
	draw_sprite_stretched(macros.sprite_array[cardNum,artNum],1,x-card_width/2,y-card_height/2,card_width,card_height);
surface_reset_target()

draw_sprite_stretched_ext(macros.sprite_array[cardNum,artNum],1,x-card_width/2,y-card_height/2,card_width,card_height, c_white, 0.1);