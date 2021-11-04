function scr_check_card_3_copies(argument0) {
	var temp = argument0,
	cards_in_deck = 0;

	if (main.deckCount >= 3){
		for (var i=0; i < main.deckCount; i++){
			if(main.deck[i, 0] = temp){
				cards_in_deck++
			}
		}
	}
	if (main.momentumDeckCount>= 3){
	
		for (var i=0; i < main.momentumDeckCount; i++){
			if(main.momentumDeck[i, 0]=temp){
				cards_in_deck++	
			}
		}
	}
	if (cards_in_deck < 3){
		return true;
	}else{
		return false;
	}


}
