function scr_target_deck_name(player, cardNum) {
	//Finds any specific cardNum in the deck and returns it's position
	with(player){
		for (var i = 0; i < deckCount; i++){
			if (deck[i, 0] == cardNum){
				return i;
			}
		}
	}
	resolutionPile[resolutionPileCount-1,2] = 97
	return -1;
}
