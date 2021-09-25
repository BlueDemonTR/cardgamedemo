function scr_spin(position) {
	
	var player = self.player;
	with(player){
		var shuffled_cardNum = field[field_location,0];
		var shuffled_artNum = field[field_location,1];
		scr_message_last_action(macros.name[shuffled_cardNum] + " gets sent to the deck");
		scr_last_action(macros.name[shuffled_cardNum]+" gets sent to the deck");
		if(card_type[shuffled_cardNum] != "momentum"){
			fieldCard[field_location].animationType = "spin"
			deck[deckCount++,0] = shuffled_cardNum;
			deck[deckCount++,1] = shuffled_artNum;
			scr_shuffle_deck();
			if(player=obj_player){
				scr_message_deck_change();
			}
			else{
				scr_message_opponent_deck_change()
			}
		}
		else{
			momentum_deck[momentumDeckCount++,0] = shuffled_cardNum;
			momentum_deck[momentumDeckCount++,1] = shuffled_artNum;
			if(player=obj_player){
				scr_message_momentum_deck();
			}else{
				scr_message_opponent_momentum_deck();
			}
		}
		with(fieldCard[field_location]){
			instance_destroy();
		}
		if(player=obj_opponent){
			scr_message_opponent_field(field_location,0,0,"spin")
		}

	}



}
