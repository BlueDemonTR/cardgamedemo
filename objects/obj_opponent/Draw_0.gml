draw_set_font(fnt_default)
for (i=0; i< deckCount; i++){
draw_sprite_ext(spr_cardback,-1,(deck_x-deck_buffer_x*i),(deck_y-deck_buffer_x*i),sprite_to_small,card_height/800,180,c_white,1);

}
for (i = 0; i < handCount; i++){
	card_sprite=spr_cardback;
	card_x =room_width/2 -handCount/2*(card_width+3) + 7*card_width/8+i*(card_width+3);
	draw_sprite_stretched(card_sprite, -1, card_x-card_width/2, 0,card_width, card_height);
}

for(i=0; i <infirmaryCount; i++){
	card_sprite = macros.sprite_array[infirmary[i,0],infirmary[i,1]];
	if(infirmary[i,0] > 0){
		draw_sprite_ext(card_sprite,-1,infirmary_x,infirmary_y,sprite_to_small,card_height/800,180,c_white,1);
	}
}
for(i=0;i<momentumDeckCount; i++){
	draw_sprite_ext(spr_cardback,-1,(momentum_deck_x-deck_buffer_x*i),(momentum_deck_y-deck_buffer_x*i),sprite_to_small,card_height/800,180,c_white,1);
}

draw_text_transformed_color(395,440,string(mana),5,5,0,c_purple,c_purple,c_fuchsia,c_fuchsia,1);
draw_set_color(c_black);
draw_text(525, 325,string(playerHP)+"/"+string(playerMaxHP));


