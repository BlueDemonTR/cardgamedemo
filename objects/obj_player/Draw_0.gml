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

if(test_mode){
	draw_set_color(c_purple)
	if(instance_exists(obj_opponent)){
		draw_set_font(fnt_default)
		draw_text(100,260,"Main Phase:" + string(main_phase))
		draw_text(100,280,"Start Turn:" + string(start_turn))
		draw_text(100,200,hand)
		draw_text(100,170,handCount)
		draw_text(100,230,handCard)
		draw_text(1500,120,resolutionPile)
		draw_text(1500,140,resolutionPileCount)
		draw_text(1500,160,resolvingPile)
		draw_text(1500,180,resolvingPileCount)
		draw_text(1500,200, string(open_game_state) + string(!opponent_response_left) + string(!player_response_left))
	}
}
