draw_set_color(c_black);


with(player){
	for(i = 0; i < deckCount; i++){
		card_sprite=spr_cardback;
		if(face_up) {
			card_sprite = macros.sprite_array[deck[i, 0],deck[i, 1]];
		}
		if(deck[i, 0] > 0){
			draw_sprite_stretched(card_sprite, -1, deck_x-card_width/2+deck_buffer_x*i, deck_y-card_height/2-deck_buffer_y*i,card_width,card_height);
		}
	}
}
draw_set_color(c_black);