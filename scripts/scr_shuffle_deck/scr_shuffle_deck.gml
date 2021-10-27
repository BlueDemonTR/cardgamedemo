function scr_shuffle_deck(player) {
	var numShuffle = random_range(80,120);
	//if(macros.test_mode){return}
	//if no cards in deck
	with(player){
		if (deckCount == 0){return}

		for (var j = 0; j < numShuffle; j++){
			//shuffle
			for (i = 0; i < deckCount; i++){
				var temp_1 = irandom_range(0, deckCount-1);
				if(deck[i, 0] > 0 && deck[temp_1, 0] > 0){
					var temp_cardArray = deck[i];
					deck[i] = deck[temp_1];
					deck[temp_1] = temp_cardArray; 
				}
			}
		}
	}
	scr_decide_deck_change(player)
}
