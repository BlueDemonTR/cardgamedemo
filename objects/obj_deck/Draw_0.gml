draw_set_color(c_black);


with(player){
	if(face_up !=1){
			for(i = 0; i < deckCount; i++){
				card_sprite=spr_cardback;
				if(face_up) {
					card_sprite = macros.sprite_array[deck[i,0],deck[i,1]];
				}
				if(deck[i,0] > 0){
					draw_sprite_stretched(card_sprite, -1, deck_x-card_width/2+deck_buffer_x*i, deck_y-card_height/2-deck_buffer_y*i,card_width,card_height);
				}
			}
	}
	else {
		for(i = 0; i < deckCount; i++){
			if(deck[i,0] > 0 && !(deck_x_2 < (deck_x - (deckCount -1 - i)*(card_width+10) + i*deck_buffer_x))){
				draw_sprite_stretched(spr_cardback, -1, deck_x-card_width/2 + i*deck_buffer_x, deck_y-card_height/2 - i*deck_buffer_y,card_width,card_height);
			}
		}
		for(i = deckCount-1; i >= 0; i--){
			if (deck[i,0] >0 && deck_x_2 < (deck_x - (deckCount - 1 - i)*(card_width + 10)+ i*deck_buffer_x)){
				card_sprite = macros.sprite_array[deck[i,0],deck[i,1]];
				draw_sprite_stretched(card_sprite, -1, deck_x_2-card_width/2+(deckCount -1 -i)*(card_width+10) + i* deck_buffer_x, expandy-i*deck_buffer_y-card_height/2,card_width,card_height);
			}
		}
	}
}
draw_set_color(c_black);