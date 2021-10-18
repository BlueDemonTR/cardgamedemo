draw_text(1670,670,obj_player.infirmaryCount)
for(var i = 0; i < infirmaryShownCount; i++){
	if(infirmaryShown[i,0] != 0){
		draw_sprite_stretched(macros.sprite_array[infirmaryShown[i,0],infirmaryShown[i,1]],-1,obj_player.infirmary_x+(obj_player.deck_buffer_x*i)-card_width/2,obj_player.infirmary_y-(obj_player.deck_buffer_y*i)-card_height/2,card_width,card_height);
	}
}
