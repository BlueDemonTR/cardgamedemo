if(!surface_exists(obj_player.targetSurface) && !obj_player.surfaceClean){
	obj_player.targetSurface = surface_create(900, room_height - 200)
	obj_player.surfaceType = SurfaceInfirmary;
	obj_player.surfaceClean = false
	surface_first_layer = true
}
surface_set_target(obj_player.targetSurface)
	if(surface_first_layer){
		draw_sprite_ext(spr_base_big_white, -1, 0, 0, 1, 1, 0, $c49d35, 1)
	}
	var surface_margin_x = 900/2 - room_width/2, 
	surface_margin_y = 880/2 - room_height/2;
	draw_sprite_stretched(macros.sprite_array[cardNum, artNum] , -1, surface_margin_x + x - card_width/2, surface_margin_y + y - card_height/2,card_width,card_height);
	draw_set_color(c_yellow)
	draw_text(surface_margin_x + x - string_width(macros.sendTypeName[destroyType])/2,y + 10, macros.sendTypeName[destroyType])
surface_reset_target()