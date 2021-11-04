draw_text(1670,670,obj_player.infirmaryCount)
for(var i = 0; i < infirmaryShownCount; i++){
	var cardNum = infirmaryShown[i,0];
	if(cardNum != 0){
		draw_sprite_stretched(
			macros.sprite_array[cardNum,infirmaryShown[i,1]], -1, 
			obj_player.infirmary_x + (obj_player.deck_buffer_x*i) - card_width/2,
			obj_player.infirmary_y - (obj_player.deck_buffer_y*i) - card_height/2,
			card_width,card_height
		);
		
		if(macros.card_type[cardNum] != TypeSpell){
			draw_set_color(c_red)
			draw_text(
				obj_player.infirmary_x - 62, obj_player.infirmary_y - 76, 
				string(scr_get_stat_orig(cardNum, StatATK))
			);

			draw_set_color(macros.card_type[cardNum] == TypeMonster ? $18742d : $0c3f18)
			draw_text(
				obj_player.infirmary_x + 50, obj_player.infirmary_y - 76, 
				string(scr_get_stat_orig(cardNum, StatMaxHP))
			);
		}	
	}
}
