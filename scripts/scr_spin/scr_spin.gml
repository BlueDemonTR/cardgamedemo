function scr_spin(player, position) {
	var cardNum = player.field[position,0],
	artNum = player.field[position,1];
	
	if(macros.card_type[cardNum] != TypeMomentum){
		deck[deckCount,0] = cardNum;
		deck[deckCount++,1] = artNum;
		scr_shuffle_deck();
		if(player=obj_player){
			scr_message_deck_change();
		}else{
			scr_message_opponent_deck_change()
		}
	}
	else{
		momentum_deck[momentumDeckCount,0] = cardNum;
		momentum_deck[momentumDeckCount++,1] = artNum;
		if(player == obj_player){
			scr_message_momentum_deck();
		}else{
			scr_message_opponent_momentum_deck();
		}
	}
	with(player.fieldCard[position]){
		if(player=obj_opponent){
			scr_message_opponent_field(field_location,0,0,"spin")
		}
		instance_destroy();
	}


	



}
