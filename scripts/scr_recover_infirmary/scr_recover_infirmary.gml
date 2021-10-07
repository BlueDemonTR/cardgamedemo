function scr_recover_infirmary(player, infirmaryPos) {
	//Adds the card in player's infirmary with the position infirmaryPos to player's hand
	//Syntax:
	//player: either obj_player or obj_opponent, decides which player's card is affected
	//infirmaryPos: int
	//Rulings
	//If the hand is full the card is shuffled into the deck instead
	
	with(player){	
		var cardNum = infirmary[infirmaryPos,0];
		var artNum = infirmary[infirmaryPos,1];

		scr_remove_from_infirmary(player, infirmaryPos);
		
		if(player.handCount < handSizeLimit){
			scr_add_to_hand(player, [cardNum, artNum]);
		}else{
			with(player){
				deck[deckCount++] = [cardNum, artNum]
				scr_shuffle_deck(player)
				scr_decide_deck_change(player)
			}
		}
		
		
	}
}
