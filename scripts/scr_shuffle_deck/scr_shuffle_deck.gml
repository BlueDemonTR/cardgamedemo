function scr_shuffle_deck(player) {
	var numShuffle = random_range(80,120);

	//if no cards in deck
	with(player){
		if (deckCount == 0){
			return;
		}

		for (j = 0; j < numShuffle; j++){
			//shuffle
			for (i = 0; i < deckCount; i++){
				var temp_1 = irandom_range(0, deckCount-1);
				if(deck[i,0] > 0 && deck[temp_1,0] > 0){
					var temp_cardNum = deck[i,0];
					var temp_artNum = deck[i,1];
					deck[i,0] = deck[temp_1,0];
					deck[i,1] = deck[temp_1,1];
					deck[temp_1,0] = temp_cardNum; 
					deck[temp_1,1] = temp_artNum; 
				}
			}
		}
	}
	scr_decide_deck_change(player)
}
