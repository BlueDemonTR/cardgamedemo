if(player.momentumDeckCount = 0){return;}
depth = 1;

if(momentumDeckPoint = -1){
	draw_sprite_stretched(spr_cardback, -1, obj_momentum_deck.momentum_deck_x-card_width/2, obj_momentum_deck.momentum_deck_y-card_height/2,card_width,card_height);
}else{
	draw_sprite_stretched(macros.sprite_array[player.momentum_deck[momentumDeckPoint,0],player.momentum_deck[momentumDeckPoint,1]], -1, obj_momentum_deck.momentum_deck_x-card_width/2, obj_momentum_deck.momentum_deck_y-card_height/2,card_width,card_height);	
}