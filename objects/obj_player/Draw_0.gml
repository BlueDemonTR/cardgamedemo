draw_set_font(fnt_default);
draw_set_color(c_black)
draw_text_transformed_color(1450,525,string(getStat(PlayerMana)),5,5,0,c_purple,c_purple,c_fuchsia,c_fuchsia,1);
draw_text(1335, 735,string(getStat(PlayerHP))+"/"+string(getStat(PlayerMaxHP)));
if(obj_player.own_turn){
	if(!open_game_state){
		draw_rectangle_color(1200,room_height/2-75,1350,room_height/2+75,c_orange,c_orange,c_orange,c_orange,false)
		draw_text(1210,room_height/2-16,"Closed State")
	}else{
		draw_rectangle_color(1200,room_height/2-75,1350,room_height/2+75,c_green,c_green,c_green,c_green,false)
		draw_text(1210,room_height/2-16,"Your Turn")
	
	}
}

if(!instance_exists(obj_opponent)){
	draw_set_color(c_black)
	draw_text(room_width/2 - 100, 100, "Waiting for an opponent...");
}

if(surface_exists(targetSurface)){
	surface_set_target(targetSurface)
		draw_sprite_ext(spr_base_white, -1, -850, 0, 1, 1, 0, $e43b93, 1)
		draw_sprite(spr_legal_overlay, -1, 0, 0);
		if(surfaceClean){
			draw_clear_alpha(c_black, 0)
		}
	surface_reset_target()
	draw_surface(targetSurface, room_width/2 - surface_get_width(targetSurface)/2, room_height/2 - surface_get_height(targetSurface)/2)
	if(surfaceClean){
		targetSurface = noone
		surfaceClean = false
	}	
}

if(obj_infirmary.infirmaryListOpened){
	depth = -50
	draw_sprite_ext(spr_infirmaryListBG,-1,room_width/2,room_height/2,1,1,0,c_white,0.8)
}

draw_set_font(fnt_big)
if(victory_state == 1){
	depth = -1000
	draw_rectangle_color(room_width/2-200,room_height/2-20,room_width/2+200,room_height/2+40,c_gray,c_gray,c_gray,c_gray,false)
	draw_set_color(c_black)
	draw_text(x-string_width("YOU WON"),room_height/2-15,"YOU WON")
}

if(victory_state == -1){
	depth = -1000
	draw_rectangle_color(room_width/2-200,room_height/2-20,room_width/2+200,room_height/2+40,c_gray,c_gray,c_gray,c_gray,false)
	draw_set_color(c_black)
	draw_text(x-string_width("YOU LOST"),room_height/2-15,"YOU LOST")
}

if(impactSummoning){
	draw_set_color($182a47)
	draw_set_font(fnt_upheaval_s18)
	draw_sprite_ext(spr_impact_info_display_bg, -1, 68, impact_bar_y, 1, 1, 0, c_white, 1)
	var margin = 30
	//TODO: Do this better for the future
	if(variable_struct_exists(materialDisplay, InfoLevel)){
		draw_text_ext_color(10, impact_bar_y + margin, "Level Required", 15, 110, color, color, color, color, 1)
		margin += string_height_ext("Level Required", 15, 110)
		draw_text_color(10, impact_bar_y + margin, string(materialDisplay.infoLevel[0]) + "/" + string(materialDisplay.infoLevel[1]),color, color, color, color, 1)
		margin += 60
	}
	if(variable_struct_exists(materialDisplay, InfoKeyMonster)){
		draw_text_ext_color(10, impact_bar_y + margin, "Key Monster Count", 15, 110, color, color, color, color, 1)
		margin += string_height_ext("Key Monster Count", 15, 110)
		draw_text_color(10, impact_bar_y + margin, string(materialDisplay.infoKeyMonster[0]) + "/" + string(materialDisplay.infoKeyMonster[1]),color, color, color, color, 1)
		margin += 60
	}
	if(variable_struct_exists(materialDisplay, InfoMainMonsterCount)){
		draw_text_ext_color(10, impact_bar_y + margin, "Main Material Count", 15, 110, color, color, color, color, 1)
		margin += string_height_ext("Main Material Count", 15, 110)
		draw_text_color(10, impact_bar_y + margin, string(materialDisplay.infoMainMonsterCount[0]) + "/" + string(materialDisplay.infoMainMonsterCount[1]),color, color, color, color, 1)
		margin += 60
	}
	if(impact_bar_y > 0){
		impact_bar_y -= (impact_bar_y_origin)/10
	}else{
		
	}
}else if(impact_bar_y != impact_bar_y_origin){
	impact_bar_y += (impact_bar_y_origin - impact_bar_y)/20
}


if(test_mode){
	draw_set_color(c_purple)
	if(instance_exists(obj_opponent)){
		draw_set_font(fnt_default)
		draw_text(100,260,"Main Phase:" + string(main_phase))
		draw_text(100,280,"Start Turn:" + string(start_turn))
		draw_text(100,200,hand)
		draw_text(100,170,handCount)
		if(impactSummoning){
			draw_text(100,230,materialDisplay)
		}
		draw_text(1500,120,resolutionPile)
		draw_text(1500,140,resolutionPileCount)
		draw_text(1500,160,resolvingPile)
		draw_text(1500,180,resolvingPileCount)
		draw_text(1500,200, string(open_game_state) + string(!opponent_response_left) + string(!player_response_left))
	}
}
