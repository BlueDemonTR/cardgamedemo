function scr_recover_infirmary(player, infirmaryPos) {
	with(player){	
		var cardNum = infirmary[infirmaryPos,0];
		var artNum = infirmary[infirmaryPos,1];

		scr_remove_from_infirmary(infirmaryPos);
		if(player.handCount < handSizeLimit){
			scr_add_to_hand(player, cardNum, artNum);
		}else{
			with(player){
				deck[deckCount,0] = cardNum
				deck[deckCount++,1] = artNum
				if(player = obj_player){
					scr_message_deck_change()
				}else{
					scr_message_opponent_deck_change()
				}
			}
		}
		
		
	}
}
