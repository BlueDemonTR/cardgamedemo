function scr_mill_from_top(millCount){
	if(deckCount < millCount){
		return;
	}
	with(player){

		for (var i = 0; i < millCount; i++){
			var cardNum = deck[deckCount-1,0];
			var artNum = deck[deckCount-1,1];
			deck[deckCount-1,0] = 0;
			deck[deckCount-1,1] = 0;
			deckCount--;
			if(player=obj_player){ 
				cardsenttoInfirmary[i]= instance_create_depth(deck_x,deck_y,-1,card_animations);
				with(cardsenttoInfirmary[i]){
					angle=0
					scr_message_last_action("Opponent sends " +obj_player.name[cardNum]+ " from their deck to the Infirmary")
					scr_last_action("You sent " +obj_player.name[cardNum]+ " from your deck to the Infirmary")					
					targetX = obj_player.infirmary_x
					targetY = obj_player.infirmary_y
					activation_mode = "fieldToPlayerInfirmary"
					self.cardNum =cardNum;
					self.artNum =artNum;
				}
				scr_card_sent_to_infirmary(cardNum);
				obj_player.infirmary[obj_player.infirmaryCount++,0] = cardNum;
				obj_player.infirmary[obj_player.infirmaryCount++,1] = artNum;
			}else{
				scr_message_last_action("Opponent sends " +macros.name[cardNum]+ " from your deck to the Infirmary")
				scr_last_action("You sent " +macros.name[cardNum]+ " from their deck to the Infirmary")				
				infirmary[obj_player.infirmaryCount++,0] = cardNum;
				infirmary[obj_player.infirmaryCount++,1] = artNum;
			}			

		}
	}
	if(player=obj_player){ 
		scr_message_deck_change();
		scr_message_infirmary()
	}else{
		scr_message_opponent_deck_change();
		scr_message_opponent_infirmary()
	}

}
